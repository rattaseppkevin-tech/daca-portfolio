# DACA Week 2: SQL Data Cleaning — UrbanStyle Data Quality & Integrity Audit

#### Business Problem
UrbanStyle’s database was in a state of "chaos," with over **847 duplicate orders** and significant inconsistencies in customer and product records. These errors led to a **€1.4 million reporting discrepancy** (€4.2M reported vs. €2.8M actual), threatening the credibility of the upcoming board meeting with CEO Kristi Tamm.

#### Approach
The project followed a professional data surgery workflow: **Identify, Document, Test, and then Fix**. The audit was divided into four critical domains:
*   **Sales Domain:** Isolated duplicates using `GROUP BY + HAVING` and the `ROW_NUMBER()` window function to identify "originals" versus copies.
*   **Customer Domain:** Cleaned inconsistent city names (e.g., "tallinn" vs "Tallinn") and handled missing contact data.
*   **Product Domain:** Audited retail prices for logical errors, such as negative values or missing (NULL) costs.
*   **Cross-Validation:** Performed a "Data Quality Analyst" role to find **orphaned records**—sales entries pointing to customers or products that do not exist in the master tables.

#### Key Findings
*   **The Duplicate Impact:** Confirmed that duplicates inflated total revenue by approximately **33%**, with one specific `sale_id` being the most frequent offender.
*   **Orphaned Records:** Identified multiple sales transactions that lacked a valid `customer_id` or `product_id`, making them "ghost" transactions.
*   **Regional Fragmentation:** Discovered that inconsistent city entries caused the Tartu and Tallinn reports to be split into multiple incorrect categories.
*   **Financial Integrity:** Found several products with a `retail_price` of 0 or NULL, identifying gaps in the catalog that could lead to lost revenue.
*   **Future Sales:** Detected records with "future dates" (e.g., orders dated after today), which required immediate correction to stabilize the timeline analysis.

#### Technical Stack
*   **SQL (PostgreSQL):** Used for advanced data auditing, partitioning, and relational validation.
*   **Supabase:** The primary cloud environment for running audit scripts and managing test tables.

#### How to Run
1.  **Safety Protocol:** Never work on production tables. Create a test copy first: `CREATE TABLE sales_test AS SELECT * FROM sales;`.
2.  **Duplicate Check:** Run the `GROUP BY sale_id HAVING COUNT(*) > 1` script to identify duplicate clusters.
3.  **Cross-Validation:** Use `LEFT JOIN` with `IS NULL` filters to identify orphaned sales that don't match the customer or product tables.
4.  **Standardization:** Apply the `INITCAP(TRIM(city))` logic to the `customers_test` table to unify regional reporting.
5.  **Documentation:** Record the row counts before and after each simulated cleaning step in the audit log.

#### Lessons Learned
*   **The Power of NULL:** Mastered the logic that `NULL` is a state of "unknown" rather than a value, and learned the critical risk of "NULL math" where `100 + NULL = NULL`.
*   **Irreversibility:** Realized that `DELETE` and `UPDATE` are permanent; hence, working on test copies is a non-negotiable professional standard.
*   **Logic over Syntax:** Learned that defining *how* to identify a duplicate (e.g., by email vs. by ID) is a business decision that must precede the technical query.

#### AI Usage
AI was utilized to troubleshoot complex `ROW_NUMBER() OVER (PARTITION BY ...)` syntax and to verify the logic of the cross-validation `LEFT JOIN` scripts to ensure all orphaned records were accurately captured.