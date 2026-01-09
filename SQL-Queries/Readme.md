# SQL Testing & Performance Suite

This directory contains a collection of advanced SQL scripts designed for **Quality Assurance (QA)** and **Vulnerability Remediation** workflows. These scripts move beyond basic CRUD operations to audit the database for data integrity and system performance.

## 📂 Files in this Suite

### 1. `data_validation.sql`
**Goal:** Defensive Testing & Data Integrity.
* **Orphaned Record Detection:** Uses `LEFT JOIN` logic to find child records missing parent associations (Referential Integrity).
* **Duplicate Auditing:** Identifies "Sybil" accounts or duplicate entries using `GROUP BY` and `HAVING` clauses.
* **Business Logic Checks:** Validates complex rules, such as ensuring transaction totals align with user balances.

### 2. `database_performance_tests.sql`
**Goal:** Non-Functional Testing & Bottleneck Identification.
* **Index Audit:** Identifies "Full Table Scans" that cause high latency in the UI.
* **Query Latency:** Detects long-running queries that could lead to API timeouts or "504 Gateway" errors.
* **Lock Contention:** Identifies database deadlocks where multiple processes are competing for the same resource, causing application hangs.

---

## 🛠️ Testing Methodology

As a **Technical Tester**, I utilize these scripts during the **Regression Testing** phase of a release:
1. **Pre-Migration Audit:** Run validation scripts to establish a "Known Good" baseline.
2. **Patch Deployment:** Apply the database update or software patch.
3. **Post-Migration Validation:** Re-run the suite to ensure no data was corrupted and that performance remains within defined **SLA (Service Level Agreement)** limits.

## 🚀 Impact
By integrating these SQL audits into the testing lifecycle, I have successfully reduced **Defect Leakage** by catching backend anomalies that are often invisible to standard Selenium or manual UI tests.
