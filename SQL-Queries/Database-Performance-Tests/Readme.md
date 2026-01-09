# Database Performance & Scalability Testing Suite

This repository contains advanced SQL scripts used for **Non-Functional Testing (NFT)**. While functional testing ensures data is correct, these scripts are designed to audit the "health" of the database engine to ensure the system remains responsive under heavy load.

## 📂 Performance Audit Scripts

### 1. Index Efficiency Analysis (`missing_indexes.sql`)
**Goal:** Identifying Full Table Scans.
* **Logic:** Scans system statistics to find tables with high `seq_scan` (sequential scans) relative to `idx_scan` (index scans).
* **Impact:** Prevents UI lag and high CPU usage caused by the database searching millions of rows manually instead of using optimized pointers.

### 2. Latency & Bottleneck Detection (`long_running_queries.sql`)
**Goal:** Identifying slow-performing API endpoints.
* **Logic:** Filters active system processes for queries exceeding a 5-second execution threshold.
* **Impact:** Essential for debugging **504 Gateway Timeouts** and identifying unoptimized logic in the backend services.

### 3. Concurrency & Deadlock Audit (`lock_contention.sql`)
**Goal:** Resolving Application "Hangs."
* **Logic:** Maps blocked Process IDs (PIDs) against blocking PIDs to visualize resource competition.
* **Impact:** Critical for testing multi-user environments where concurrent writes might "lock" a table, effectively freezing the application for other users.

---

## 🛠️ Performance Testing Workflow

I utilize these scripts during **Load and Stress Testing** cycles:
1. **Baseline Measurement:** Run scripts under normal traffic to establish "Expected Performance."
2. **Stress Execution:** Use tools like JMeter to simulate high user concurrency.
3. **Bottleneck Analysis:** Execute these SQL scripts during the stress test to pinpoint exactly which query or table is failing under pressure.
4. **Optimization:** Recommend indexing or query refactoring based on the script outputs.

## 🚀 Key Takeaway
By focusing on **Non-Functional Requirements (NFRs)**, I ensure that the software is not only "bug-free" but also "performant" and "scalable," directly improving the end-user experience (UX).
