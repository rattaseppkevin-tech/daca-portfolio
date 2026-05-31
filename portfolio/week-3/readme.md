# DACA Week 3: SQL JOINs — Relational Data Analysis

#### Business Problem
Marketing Manager Anna Mets needed to bridge "data islands" within the UrbanStyle database. While the sales table was clean, it lacked context regarding who the customers were and what specific products they preferred. The goal was to identify the top 20 customers, analyze regional product performance, and find "lost" customers who registered but never made a purchase.

#### Approach
The project involved connecting multiple tables to create a unified view of the business:
*   **INNER JOIN:** Used to combine sales with customer profiles and product details where matches existed in both tables.
*   **LEFT JOIN + WHERE IS NULL:** Implemented this diagnostic pattern to identify inactive customers and stagnant inventory (products with zero sales).
*   **Multi-Table Joins:** Linked three tables (Sales + Customers + Products) simultaneously to build comprehensive marketing reports.
*   **Table Aliasing:** Applied short aliases (s, c, p) to maintain query readability and structure.

#### Key Findings
*   **Customer Engagement:** Successfully separated "active" customers from those who registered but haven't engaged, allowing for targeted re-engagement campaigns.
*   **Inventory Insights:** Identified specific product categories that have never been sold, highlighting capital tied up in unsold stock.
*   **Regional Trends:** Mapped sales performance to specific cities, revealing distinct category preferences between Tallinn and Tartu.
*   **Data Integrity:** Confirmed that multi-table connections are only reliable when the underlying "Foreign Key" links (customer_id, product_id) are accurate.

#### Technical Stack
*   **SQL (PostgreSQL):** Primary language for relational data querying and aggregation.
*   **Supabase:** The cloud-based SQL environment used to manage the UrbanStyle database schema.

#### How to Run
1.  **Preparation:** Apply the Week 2 cleaning scripts to the `sales` table to ensure the audit is based on unique, valid records.
2.  **Standardization:** Run the `UPDATE` script on the `customers` table to unify city names using `INITCAP(TRIM(city))` to prevent fragmented reporting.
3.  **Analysis:** Execute the multi-table JOIN scripts in the Supabase SQL Editor to generate the TOP 20 customer list and the "Lost Customer" audit.

#### Lessons Learned
*   **Relational Logic:** Mastered the fundamental difference between `INNER JOIN` (showing only matches) and `LEFT JOIN` (preserving all records from the primary table).
*   **The "IS NULL" Pattern:** Discovered how to use `WHERE IS NULL` on a joined table to mathematically identify gaps in the sales funnel.
*   **Query Layering:** Learned that complex business questions are solved by "building" queries one layer at a time—starting with a base table and adding context through successive JOINs.

#### AI Usage
AI was used to troubleshoot complex multi-table JOIN syntax and to clarify the logic of why the `WHERE IS NULL` condition must be applied to the "right" table in a `LEFT JOIN` to find missing data.