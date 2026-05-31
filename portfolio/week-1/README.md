# DACA Week 1: SQL Fundamentals — UrbanStyle Audit

#### Business Problem
UrbanStyle IT Director Toomas Kask discovered over 5,000 duplicate records in the sales database, making company reports unreliable. The goal of this project was to perform an urgent audit of the data to quantify duplicates, identify missing values, and report on sales extremes.

#### Approach
The audit was conducted using a "Read-Only" mindset to explore the data without altering it. 
*   **Data Retrieval:** Used `SELECT` and `FROM` to isolate specific columns like customer IDs and price totals.
*   **Filtering:** Applied `WHERE` clauses with comparison operators and `IS NULL` logic to find suspicious or missing data.
*   **Aggregation:** Used `COUNT(*)` vs. `COUNT(DISTINCT)` to mathematically prove the existence of duplicates.
*   **Environment:** Set up the UrbanStyle database in Supabase, importing ~18,000 records across products, customers, and sales tables.

#### Key Findings
*   **Duplicate Crisis:** Confirmed exactly 5,116 duplicate rows in the sales table (15,234 total rows vs. 10,118 unique IDs).
*   **Data Anomalies:** Identified "suspicious" rows where `total_price` was 0 or negative, and several orders where the `customer_id` was completely missing (NULL).
*   **Format Issues:** Approximately 3% of sales dates were in an inconsistent format (DD/MM/YYYY vs. YYYY-MM-DD), requiring a staging table for safe import.
*   **Customer Integrity:** Found duplicate email entries in the customers table, indicating further data quality issues.

#### Technical Stack
*   **SQL (PostgreSQL):** Used for all data auditing and filtering.
*   **Supabase:** The primary database platform and SQL editor.
*   **Google Drive:** Source for the UrbanStyle CSV datasets.

#### How to Run
1.  **Database Setup:** Run the `urbanstyle_schema.sql` script in the Supabase SQL Editor to create the table structures.
2.  **Data Import:** Import CSV files in the mandatory order: `products` -> `customers` -> `sales`.
3.  **Date Handling:** For the sales table, use a temporary `sales_import` staging table to convert inconsistent date strings into proper DATE types.
4.  **Audit Queries:** Execute the provided diagnostic scripts to verify row counts (e.g., `SELECT COUNT(*) FROM sales`).

#### Lessons Learned
*   **NULL Comparison:** Learned that `column = NULL` never works; `IS NULL` is the only way to find missing data because NULL is a state, not a value.
*   **Arithmetic Risks:** Discovered that any math operation involving a NULL (e.g., `100 + NULL`) results in NULL, which explains why many UrbanStyle reports were failing.
*   **The Power of DISTINCT:** Understanding the difference between `COUNT(*)` (all rows) and `COUNT(DISTINCT column)` is the fastest way to identify data integrity leaks.

#### AI Usage
AI was used to troubleshoot Supabase import errors (specifically UTF-8 BOM issues) and to explain the logic behind `CASE` statements used during the complex sales data import process.


---

# Group Work



## 👥 Team Information
* **Department:** Product Analytics Department
* **Data Analyst Team Members:** Kevin, Eike, Krista, Egle


## 🛠️ What I Did
* **SQL Queries:** Analyzed the `sales` table and executed various queries.
* **Key Finding:** Discovered a major discrepancy in the data—there are **10,118 unique sales**, but **15,234 total rows**. This means we have over 5,000 duplicates that require cleaning.
* **Teamwork:** Contributed to the team by writing and executing SQL queries regarding the `sales` table.


## 💡 Key Learnings
* Thorough data cleaning is critical.
* Precise table filtering is essential.


## 📂 Files
* `week1_[tabel]_exploration.sql` — [Individual Queries & Exercises](https://github.com/rattaseppkevin-tech/daca-portfolio/tree/main/portfolio/week-1/Individual/Harjutused%20ja%20P%C3%A4ringud)
* `week1_results_screenshot.png` — [Workbook Log Screenshot](https://github.com/rattaseppkevin-tech/daca-portfolio/blob/main/portfolio/week-1/Individual/Harjutused%20ja%20P%C3%A4ringud/TooVihik.md)


## 👥 Team Collaboration
* [Team Output (Week 1)](https://github.com/rattaseppkevin-tech/urbanstyle-TOOTE-grupp/blob/main/v%C3%A4ljund_w1.md)