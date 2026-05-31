#### Business Problem
UrbanStyle's leadership needed to condense 1,247 individual sales records into a handful of key performance indicators (KPIs) for the CEO. Specifically, the project aimed to track monthly sales trends, identify VIP customer segments, and investigate a 25-unit inventory discrepancy reported at the Tartu store.

#### Approach
The project moved beyond simple data retrieval to advanced analytical structuring:
*   **Data Grouping:** Utilized `GROUP BY` with aggregate functions (`SUM`, `AVG`, `COUNT`, `MIN/MAX`) to collapse raw data into meaningful summaries.
*   **Advanced Filtering:** Applied `HAVING` clauses to filter results based on aggregated values (e.g., identifying only cities with more than 10 orders).
*   **Analytical Structuring:** Implemented **CTEs (Common Table Expressions)** to break complex queries into readable steps and **Window Functions** (`LAG`, `ROW_NUMBER`) to calculate growth trends and rankings.

#### Key Findings
*   **Trend Analysis:** Condensed 1,247 sales rows into 12 monthly summaries, providing a clear view of the year's financial performance.
*   **Customer Segmentation:** Successfully categorized the customer base into "VIP," "Active," and "Regular" tiers based on total lifetime spend.
*   **Inventory Audit:** Developed a system to reconcile physical stock with digital records by auditing the `inventory_movements` table.
*   **Growth Metrics:** Calculated month-over-month growth percentages, highlighting the most profitable periods and identifying sales slumps.

#### Technical Stack
*   **SQL (PostgreSQL):** Core language used for complex aggregations and analytical functions.
*   **Supabase:** The SQL Editor environment used to query the UrbanStyle database (sales, products, customers, and inventory tables).

#### How to Run
1.  Log into the **Supabase UrbanStyle project** and open the **SQL Editor**.
2.  Verify the database connection by running `SELECT 1;`.
3.  Import the `inventory_movements` CSV from the datasets folder if performing the inventory audit.
4.  Execute the CTE-based scripts to generate the "CEO Report," which includes top 5 cities and monthly sales growth.

#### Lessons Learned
*   **Execution Order:** Learned that SQL filters rows with `WHERE` before grouping, and filters groups with `HAVING` after the aggregation is complete.
*   **The Power of CTEs:** Discovered that breaking a query into named steps (Common Table Expressions) makes debugging much easier and the code far more maintainable.
*   **Grouping Rules:** Mastered the requirement that every non-aggregated column in a `SELECT` statement must be included in the `GROUP BY` clause to avoid errors.

#### AI Usage
AI was utilized to debug specific PostgreSQL errors, such as the "column must appear in GROUP BY clause" message, and to refine the syntax for complex Window Functions like `LAG()` and `PARTITION BY`.