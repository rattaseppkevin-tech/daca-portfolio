# DACA Portfolio — Week 1: SQL Basics

> Data Analyst Career Accelerator | Ettevõtluskeskus OÜ | March 2026

First week working with real data. Loaded UrbanStyle's actual sales, customer and product records into Supabase and used SQL to investigate a reported data quality issue — over 5,000 duplicate rows in the sales table.

---

### 🗄️ Dataset Loaded

| Table | Records | Status |
|-------|---------|--------|
| products | ~350 | ✅ |
| customers | ~3,150 | ✅ |
| sales | 15,234 | ✅ |

---

### 📚 What This Week Introduced

Week 1 was about learning to *read* data before drawing any conclusions. The focus was on three SQL building blocks: selecting and sorting records, filtering by conditions, and counting both total and unique values.

**SELECT and FROM** established the foundation — choosing specific columns from a table rather than dumping everything at once. ORDER BY and LIMIT made large datasets manageable by controlling what gets shown and in what order.

**WHERE** introduced filtering: narrowing results by value ranges, date periods, text patterns and null checks. The distinction between IS NULL and = NULL turned out to be one of the more counterintuitive moments — NULL is not a value, so it cannot be compared with an equals sign.

**DISTINCT and COUNT** were the tools that answered the week's main question. Comparing COUNT(\*) against COUNT(DISTINCT sale\_id) revealed the exact duplicate count: 15,234 total rows versus 10,118 unique sale IDs, giving 5,116 duplicates. The same approach applied to the customers table uncovered duplicate email addresses — a separate data quality problem to address next week.

The week closed with a structured report answering four questions from the IT director: exact duplicate count, null values, largest and smallest transactions, and suspicious zero-value rows.

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