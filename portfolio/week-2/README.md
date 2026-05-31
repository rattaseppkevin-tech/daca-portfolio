# DACA Portfolio — Week 2: SQL Cleaning

> Data Analyst Career Accelerator | Ettevõtluskeskus OÜ | March 2026

---

## Overview

This week focused on improving data quality within the UrbanStyle dataset. I analyzed sales and customer data to identify duplicates, missing values, and formatting inconsistencies that could impact reporting and business decisions.

## What I Did

- Investigated duplicate records and their effect on business metrics.
- Analyzed missing customer information and data completeness.
- Validated date values and checked data consistency.
- Applied SQL data-cleaning and validation techniques.
- Contributed to the team data quality assessment and reporting process.

## Key Findings

- Detected over 5,000 duplicate records in the sales dataset.
- Identified missing customer information that reduced data reliability.
- Found invalid date values requiring correction before analysis.
- Confirmed that data quality issues can significantly affect reporting accuracy.

## SQL Concepts & Functions

- GROUP BY
- HAVING
- ROW_NUMBER()
- COUNT()
- DISTINCT
- IS NULL / IS NOT NULL
- COALESCE()
- NULLIF()
- CASE WHEN
- CAST()
- TO_DATE()
- TO_CHAR()
- TRIM()
- UPPER()
- LOWER()
- INITCAP()

## Key Learnings

- Understanding the impact of poor data quality on business reporting.
- Identifying duplicates, NULL values, and formatting issues using SQL.
- Applying structured data-cleaning and validation workflows.
- Recognizing the importance of verifying data before analysis.

## AI Usage

Used AI to review SQL queries, troubleshoot issues, and strengthen my understanding of data-cleaning concepts and SQL best practices.

---

# Group Work



## Quality Control and Cross-Validation

**Role:** Data Quality Analyst

I verified data integrity across the `sales`, `customers`, and `products` tables. A positive finding was that no broken relationships were found; all sales records are consistent. 

However, I uncovered 664 price discrepancies and 604 inactive records (592 customers who have never made a purchase and 12 products that have never been sold). From a business perspective, this indicates that our pricing strategy might be flawed, and we are maintaining customers and products that do not generate revenue.

---

## Cross-Validation Summary Table (Step 6)

| Category | Issues Found | Description |
| :--- | :---: | :--- |
| **Orphaned Customers** | 0 | Sale references a non-existent customer (Resolved) |
| **Orphaned Products** | 0 | Sale references a non-existent product (Resolved) |
| **Price Discrepancies** | 664 | Sale price does not match product price (Critical) |
| **Ghost Customers** | 592 | Customer has never made a purchase (Marketing opportunity) |
| **Ghost Products** | 12 | Product has never been sold (Inventory risk) |
| **TOTAL** | **1268** | **Total number of identified discrepancies** |

---

## Expert Recommendation to Toomas

The most critical issue is the 664 price discrepancies, as they directly impact company revenue and the accuracy of financial reporting.
