# DACA Week 1: SQL Fundamentals — UrbanStyle Data Landscape Audit

#### Business Problem
UrbanStyle IT Director Toomas Kask discovered a major integrity issue: over 5,000 duplicate records in the sales table, rendering the company's financial reports unreliable. The objective of this project is to perform a comprehensive "Read-Only" audit of the database to quantify duplicates, identify missing (NULL) values, and map the overall data landscape to restore trust in the data.

#### Approach
The audit was conducted using a systematic data exploration workflow focused on identification rather than modification:
*   **Data Retrieval:** Used `SELECT` and `FROM` to isolate specific columns (Sales, Products, Customers) and `LIMIT` to safely preview large datasets.
*   **Filtering & Auditing:** Applied `WHERE` clauses with comparison operators and `IS NULL` logic to find suspicious rows, such as transactions with zero or negative prices.
*   **Uniqueness Testing:** Utilized `COUNT(*)` versus `COUNT(DISTINCT)` to mathematically prove the existence of duplicate entries.
*   **Data Ingestion:** Managed a complex import of ~15,000 records using a staging table and `CASE` statements to unify mixed date formats (DD/MM/YYYY and YYYY-MM-DD).

#### Key Insights
*   **The Duplicate Crisis:** Confirmed exactly **5,116 duplicate rows** in the sales table (15,234 total rows vs. 10,118 unique sale IDs).
*   **Financial Anomalies:** Identified "suspicious" records where `total_price` was 0 or negative, indicating potential system errors.
*   **Data Connectivity Gaps:** Found multiple orders where the `customer_id` was missing (`NULL`), which compromises customer tracking and marketing analysis.
*   **Format Issues:** Approximately 3% of sales dates were stored in inconsistent formats, requiring a normalization process during the data load.
*   **Regional Footprint:** The audit mapped eight distinct cities in the customer base, identifying Tallinn as the primary hub (42% of orders).

#### Technical Stack
*   **SQL (PostgreSQL):** Core tool used for all data auditing, filtering, and aggregation.
*   **Supabase:** The primary cloud database platform used for table schema setup and query execution.
*   **Google Drive:** Source for the UrbanStyle CSV datasets used for ingestion.

#### Screenshots
*   **[Screenshot 1: Duplicate Identification Query]** – *Showing the discrepancy between total rows and unique IDs.*
*   **[Screenshot 2: Data Landscape Summary]** – *A UNION ALL result showing row counts for all primary tables.*
*   **[Screenshot 3: NULL Value Audit]** – *Visual evidence of missing customer IDs and price data.*

#### How to Run
1.  **Schema Creation:** Run the `urbanstyle_schema.sql` script in the Supabase SQL Editor to establish the database structure.
2.  **Ordered Data Import:** Import the CSV files in the mandatory sequence: `products` -> `customers` -> `sales` to avoid Foreign Key violations.
3.  **Date Normalization:** Use a staging table (`sales_import`) and the provided `INSERT` script with `CASE` logic to convert mixed date strings into a unified DATE type.
4.  **Audit Execution:** Run the diagnostic queries provided in the workbook (e.g., `SELECT COUNT(*) FROM sales`) to verify the integrity of the imported data.

#### Lessons Learned & Challenges
*   **NULL vs. Zero:** Learned that `NULL` is an "unknown" state and cannot be compared using the `=` operator; only `IS NULL` successfully identifies missing data.
*   **Import Logic:** Realized that relational databases require a strict order of operations for data ingestion to maintain Foreign Key constraints.
*   **The Danger of "NULL Math":** Discovered that arithmetic involving a NULL value results in a NULL total, which explained why many previous financial reports were failing.

#### AI Usage
AI was utilized to troubleshoot Supabase "Foreign Key violation" errors and UTF-8 BOM encoding issues during the import process. It was also used to clarify the `CASE` syntax required for the complex date normalization in the sales staging table.