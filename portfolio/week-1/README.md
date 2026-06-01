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

