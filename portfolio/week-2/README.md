# DACA Week 2: SQL Data Cleaning — UrbanStyle Case Study

#### Business Problem
UrbanStyle's database was in "chaos," containing duplicate rows, missing (NULL) values, and inconsistent formatting. These issues led to a **€1.4 million error** in quarterly sales reports, where €4.2 million was reported instead of the actual €2.8 million.

#### Approach
The project followed a strict workflow: **Identify, Document, Test, and then Fix**. 
*   **Duplicates:** Identified using `GROUP BY + HAVING` logic and isolated using the `ROW_NUMBER()` window function to distinguish "originals" from copies.
*   **NULL Values:** Detected using `IS NULL` and managed with `COALESCE()` to provide default replacements for missing data.
*   **Standardization:** Unified text fields with `TRIM()` and `INITCAP()` to fix casing and spacing, while date formats were unified using `TO_CHAR()`.

#### Key Findings
*   **Financial Impact:** Duplicates inflated sales figures by approximately **33%**, highlighting the critical need for data integrity.
*   **Data Completeness:** A significant number of customer records lacked names or contact info, which hindered effective marketing efforts.
*   **Regional Fragmentation:** Inconsistent city entries (e.g., "Tallinn" vs. "tallinn") caused regional sales reports to be split incorrectly.

#### Technical Stack
*   **SQL (PostgreSQL):** The core tool used for auditing and data transformation.
*   **Supabase:** The project environment for executing SQL queries against the UrbanStyle database.

#### How to Run
1.  Log into the **Supabase** project and navigate to the **SQL Editor**.
2.  Run diagnostic scripts to identify current data anomalies, such as duplicates and NULL values.
3.  **Important:** Always create a backup table using `CREATE TABLE ... AS SELECT` before performing any `DELETE` or `UPDATE` operations, as these changes are irreversible.

#### Lessons Learned
*   **The Danger of NULLs:** Any arithmetic operation involving a NULL value results in NULL (e.g., `100 + NULL = NULL`), which can compromise the accuracy of an entire financial report.
*   **Safety Protocols:** There is no "undo" button in SQL production environments; thorough documentation and testing on copies are mandatory professional steps.

#### AI Usage
AI was utilized to refine the complex `ROW_NUMBER() OVER (PARTITION BY ...)` syntax and to troubleshoot text-cleaning logic for handling inconsistent regional entries.

---

# Group Work

## Quality Control and Cross-Validation

**Role:** Data Quality Analyst

I verified data integrity across the `sales`, `customers`, and `products` tables. A positive finding was that no broken relationships were found; all sales records are consistent. 

However, I uncovered 664 price discrepancies and 604 inactive records (592 customers who have never made a purchase and 12 products that have never been sold). From a business perspective, this indicates that our pricing strategy might be flawed, and we are maintaining customers and products that do not generate revenue.

---

## Cross-Validation Summary Table (Step 6)

| Category | Issues Found | Description |
| :--- | :---: | :--- |
| **Orphaned Customers** | 0 | Sale references a non-existent customer (Resolved) |
| **Orphaned Products** | 0 | Sale references a non-existent product (Resolved) |
| **Price Discrepancies** | 664 | Sale price does not match product price (Critical) |
| **Ghost Customers** | 592 | Customer has never made a purchase (Marketing opportunity) |
| **Ghost Products** | 12 | Product has never been sold (Inventory risk) |
| **TOTAL** | **1268** | **Total number of identified discrepancies** |

---

## Expert Recommendation to Toomas

The most critical issue is the 664 price discrepancies, as they directly impact company revenue and the accuracy of financial reporting.
