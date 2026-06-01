# DACA Week 1: SQL Fundamentals — UrbanStyle Data Landscape Audit

#### Business Problem
UrbanStyle has grown by 150% over the last two years, but IT Director Toomas Kask has lost trust in the company's reporting. Initial checks suggested over 5,000 duplicate records in the sales table. The goal of this project is to perform a comprehensive "Read-Only" audit of the database to quantify duplicates, identify missing (NULL) values, and map the overall data landscape before any fixes are attempted.

#### Approach
The audit was conducted using a systematic data exploration workflow:
*   **Data Retrieval:** Used `SELECT` and `FROM` to isolate key columns and `LIMIT` to safely preview large tables.
*   **Filtering & Auditing:** Applied `WHERE` clauses with comparison operators and `IS NULL` logic to find suspicious rows (e.g., total price ≤ 0).
*   **Uniqueness Testing:** Used `COUNT(*)` vs. `COUNT(DISTINCT)` to mathematically prove the existence of data integrity leaks.
*   **Collaborative Auditing:** Distributed the audit across four data domains: Sales Transactions, Customer Profiles, Product Catalog, and Sales Channels/Locations.

#### Key Insights
*   **The Duplicate Crisis:** Confirmed exactly **5,116 duplicate rows** in the sales table (15,234 total rows vs. 10,118 unique `sale_id` entries).
*   **Financial Anomalies:** Identified "kahtlane" (suspicious) records where the `total_price` was 0 or negative.
*   **Data Connectivity Gaps:** Found several orders where the `customer_id` was missing (`NULL`), which compromises customer-lifetime-value tracking.
*   **Regional Footprint:** The audit mapped eight distinct cities in the customer base, with Tallinn being the primary hub (42% of orders).
*   **Inventory Quality:** Identified products with missing price data in the catalog, affecting the ability to calculate potential revenue.

#### Technical Stack
*   **SQL (PostgreSQL):** Used for all data auditing, filtering, and aggregation.
*   **Supabase:** The primary database platform used for table schema setup and query execution.
*   **Google Drive:** Source for the UrbanStyle CSV datasets.

#### How to Run
1.  **Schema Creation:** Run the `urbanstyle_schema.sql` script in the Supabase SQL Editor to establish the table structures.
2.  **Ordered Data Import:** Import the CSV files in the mandatory sequence: `products` -> `customers` -> `sales` (to avoid Foreign Key constraint violations).
3.  **Date Normalization:** For the sales table, use the `sales_import` staging table and a `CASE` statement to convert mixed date formats (DD/MM/YYYY and YYYY-MM-DD) into a unified DATE type.
4.  **Audit Execution:** Run the provided diagnostic queries (e.g., `SELECT COUNT(*) FROM sales`) to verify row counts and data integrity.

#### Lessons Learned
*   **NULL vs. Zero:** Learned that `NULL` represents a "missing" state and cannot be compared using `=`, only via `IS NULL`. 
*   **Safe Explorations:** Mastered the use of `LIMIT` and `ORDER BY` to find extremes (highest/lowest prices) without overloading the system.
*   **Logical Order of Operations:** Discovered that SQL processes `WHERE` before `ORDER BY`, which is essential for filtering records before sorting them for executive reports.

#### AI Usage
AI was used to troubleshoot Supabase "Foreign Key violation" errors during the import process and to explain the `UNION ALL` syntax used to create the single-view "Data Landscape" summary table.