/* ==========================================================================
   PERFORMANCE & LOAD TESTING QUERIES
   Author: Moyo Hicks
   Purpose: Identifying bottlenecks, missing indexes, and long-running queries.
   ========================================================================== */

-- 1. IDENTIFYING MISSING INDEXES (Performance Testing)
-- Scenario: Finding tables that are performing "Full Table Scans" because 
-- they lack proper indexing, causing UI lag.

SELECT 
    relname AS table_name, 
    seq_scan AS full_table_scans, 
    seq_tup_read AS rows_read_without_index
FROM pg_stat_user_tables
WHERE seq_scan > 0
ORDER BY seq_tup_read DESC;


-- 2. DETECTING LONG-RUNNING QUERIES (Latency Audit)
-- Scenario: Identifying "Heavy" queries that might be timing out the API.

SELECT 
    pid, 
    now() - query_start AS duration, 
    query, 
    state 
FROM pg_stat_activity 
WHERE state != 'idle' 
AND (now() - query_start) > interval '5 seconds';


-- 3. TESTING DATABASE CONCURRENCY (Lock Contention)
-- Scenario: Finding if multiple processes are "locking" the same table, 
-- which causes the application to hang during peak load.

SELECT 
    blocked_locks.pid AS blocked_pid,
    blocking_locks.pid AS blocking_pid,
    blocked_activity.query AS blocked_statement,
    blocking_activity.query AS current_statement_in_blocking_process
FROM pg_catalog.pg_locks blocked_locks
JOIN pg_catalog.pg_stat_activity blocked_activity ON blocked_locks.pid = blocked_activity.pid
JOIN pg_catalog.pg_locks blocking_locks 
    ON blocking_locks.locktype = blocked_locks.locktype
    AND blocking_locks.database IS NOT DISTINCT FROM blocked_locks.database
    AND blocking_locks.relation IS NOT DISTINCT FROM blocked_locks.relation
JOIN pg_catalog.pg_stat_activity blocking_activity ON blocking_locks.pid = blocking_activity.pid
WHERE NOT blocked_locks.granted;
