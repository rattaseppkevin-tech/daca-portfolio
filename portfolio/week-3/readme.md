# DACA Week 3: SQL JOINs — Connecting Data Islands for Marketing Intelligence

#### Business Problem
UrbanStyle's data was scattered across isolated "islands" (sales, customers, and products tables), making it impossible to answer complex business questions. Marketing Manager Anna Mets needed to identify the Top 20 customers, analyze which products they buy, and find "lost" customers who registered but never made a purchase. The goal was to bridge these tables to provide the insights necessary for a high-impact marketing campaign.

#### Approach
The project utilized relational algebra to unify the database and extract strategic value:
*   **Data Preparation:** Before joining, the production database was cleaned to remove duplicates (reducing sales records to ~10,118) and unify city names (standardizing 50+ variations down to 12).
*   **INNER JOIN:** Used to connect sales transactions with customer profiles and product details where matches existed in both tables.
*   **LEFT JOIN + WHERE IS NULL:** Implemented this "Anti-Join" pattern to mathematically identify gaps in the sales funnel, such as customers with zero purchases and products with zero sales.
*   **Multi-Table Integration:** Developed 3+ table queries (Sales + Customers + Products) to create a holistic view of the customer journey from registration to checkout.
*   **Table Aliasing:** Applied standard aliases (s, c, p) to maintain readable and professional code structures.

#### Key Insights
*   **Standardization Success:** By unifying city names, regional reporting became accurate, confirming exactly 12 unique service locations across Estonia.
*   **Lost Opportunity:** Identified a specific segment of "lost customers" who are registered but inactive, representing a significant untapped marketing potential.
*   **Revenue Concentration:** Successfully mapped the TOP 20 customers, identifying that a small percentage of users contribute to a disproportionate amount of total revenue.
*   **Inventory Efficiency:** Discovered capital tied up in "stagnant" products—items present in the catalog but never sold—allowing for data-driven decisions on discounts or liquidation.
*   **Regional Trends:** Mapped sales performance by city, revealing distinct category preferences between the Tallinn and Tartu markets.

#### Technical Stack
*   **SQL (PostgreSQL):** The primary language for relational auditing and data transformation.
*   **Supabase:** The cloud-based SQL environment used to execute JOIN operations against the UrbanStyle database.
*   **GitHub:** Used for version control and portfolio documentation.

#### How to Run
1.  **Preparation:** Run the provided cleaning script in the Supabase SQL Editor to remove duplicates and unify city names to ensure report accuracy.
2.  **Audit Queries:** Execute the `INNER JOIN` scripts to verify the connection between sales and customer IDs.
3.  **Gap Analysis:** Run the `LEFT JOIN` script with the `WHERE s.sale_id IS NULL` filter to generate the "Lost Customer" report for the marketing team.
4.  **Full Report:** Execute the multi-table JOIN script to generate a complete view of client names, their order dates, and the specific products they purchased.

#### Lessons Learned & Challenges
*   **Relational Logic:** Mastered the fundamental difference between `INNER JOIN` (matches only) and `LEFT JOIN` (preserves all primary records), which is critical for avoiding "hidden" data loss in reports.
*   **Key Connectivity:** Realized that without properly linked Primary and Foreign Keys, data remains isolated and business questions remain unanswered.
*   **The Power of NULL:** Learned to use `NULL` as a diagnostic tool rather than an error—specifically how it helps identify customers who haven't moved through the sales funnel.

#### AI Usage
AI was utilized to troubleshoot complex multi-table JOIN syntax and to perform "So What?" tests on the findings to ensure the data stories were actionable for executive stakeholders.