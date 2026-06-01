# DACA Week 4: SQL Aggregation — Transforming Raw Data into CEO Insights

#### Business Problem
UrbanStyle CEO Kristi Tamm needs high-level summary metrics for an upcoming board meeting. The company has over 1,247 individual sales records, but the leadership requires actionable intelligence: monthly sales trends, customer segmentation, and average order values. Additionally, a 25-unit discrepancy was reported in the Tartu store's inventory, requiring a deep-dive audit to restore data trust.

#### Approach
The project focused on transforming granular rows into strategic summaries using advanced SQL techniques:
*   **Data Grouping:** Applied `GROUP BY` to collapse 1,247 transaction rows into 12 monthly summaries and regional performance blocks.
*   **Advanced Filtering:** Utilized `HAVING` clauses to filter aggregated results (e.g., identifying only high-value cities with more than 5 major orders).
*   **Common Table Expressions (CTEs):** Structured complex logic into named, readable steps to calculate multi-stage metrics like customer tiers and growth rates.
*   **Window Functions:** Implemented `LAG()` to calculate month-over-month revenue changes and `ROW_NUMBER()` or `RANK()` to identify top-performing products within specific categories.

#### Key Findings
*   **The Power of 10:** Successfully reduced 1,247 raw sales lines into 10 essential KPIs that the CEO can use for immediate strategic decision-making.
*   **Revenue Trends:** Identified clear monthly growth patterns, isolating which periods outperformed the annual average and which required marketing intervention.
*   **Customer Segmentation:** Categorized the database into "VIP" (spend >€1000), "Active," and "Regular" tiers, revealing that a small percentage of VIPs drive a significant portion of total revenue.
*   **Inventory Accuracy:** Resolved the Tartu store discrepancy by auditing the `inventory_movements` table, identifying exactly where physical counts diverged from digital records.
*   **Regional Benchmarks:** Tallinn remains the revenue leader, but regional analysis showed Tartu has a distinct high-value category preference.

#### Technical Stack
*   **SQL (PostgreSQL):** Used for complex aggregation, CTE structuring, and window function calculations.
*   **Supabase:** The cloud environment for executing analytical queries against the UrbanStyle database.

#### How to Run
1.  **Connectivity:** Log into Supabase and verify the connection to the UrbanStyle project by running `SELECT 1;`.
2.  **Data Preparation:** Ensure the `inventory_movements` table is imported from the provided CSV dataset.
3.  **Run Reports:** Execute the `ceo_report.sql` script to generate the "Top 5 Cities" and "Monthly Sales Growth" views.
4.  **Segmentation:** Run the customer tiering script to update the loyalty segments based on the latest quarterly spend.

#### Lessons Learned & Challenges
*   **Execution Order:** Mastered the critical SQL execution sequence: rows are filtered by `WHERE` before grouping, and groups are filtered by `HAVING` after aggregation.
*   **Aggregation Logic:** Learned that every column in a `SELECT` statement that is not part of a function *must* be included in the `GROUP BY` clause.
*   **The "NULL" Effect:** Discovered that `COUNT(*)` counts all rows, while `COUNT(column)` ignores NULLs—a vital distinction for accurate data auditing.
*   **Partitioning vs. Grouping:** Realized that while `GROUP BY` collapses rows, `PARTITION BY` allows for complex calculations (like rankings) while keeping the original transaction detail visible.

#### AI Usage
AI was utilized to troubleshoot "column must appear in GROUP BY" errors and to refine the syntax for complex `LAG()` window functions when calculating percentage-based month-over-month growth.