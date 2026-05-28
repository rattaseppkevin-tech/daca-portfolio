# DACA Portfolio — Kevin Rattasepp

An intensive 11-week Data Analyst Career Accelerator (DACA) portfolio focused on turning raw data into strategic business outcomes. Throughout this program, I acted as a Data Analyst for the retail fashion brand **UrbanStyle Ltd**, building data infrastructure from scratch—moving from raw SQL database auditing to automated Python data pipelines and production-ready Power BI dashboards.

## 🛠️ Technical Stack
* **Languages & Frameworks:** SQL (PostgreSQL), Python (Pandas, NumPy)
* **Tools & Infrastructure:** Supabase (Database & API), VS Code, GitHub, Logging
* **Visualisation & BI:** Power BI (DAX, UI/UX Design), Plotly (Knaflic's Data Storytelling Principles)

---

## 📈 Week-by-Week Project Breakdown

### Week 0: Onboarding & Workflow Architecture
* **Focus:** Environment setup and strategic onboarding. 
* **Deliverables:** Configured VS Code, Python, Supabase, GitHub, and Power BI into a vertical workflow. Collaborated with the analytics department to draft a formal Team Charter and define business KPIs for UrbanStyle.

### Week 1: SQL Basics & Data Exploration
* **Focus:** Initial database profiling using `SELECT`, `WHERE`, `ORDER BY`, and `LIMIT`.
* **Deliverables:** Conducted a comprehensive data volume audit on UrbanStyle's 3,150 customer profiles. Successfully mapped out data fragmentation, including inconsistent formatting and missing record clusters.

### Week 2: SQL Data Cleaning
* **Focus:** Data quality assurance and transformation using `UPDATE`, `COALESCE`, and `CASE WHEN`.
* **Deliverables:** **Identified and removed 5,116 duplicate rows (33.58% of the total database volume)** originating from 4,013 repetitive `sale_id` entries. Standardized text fields, resolved 988 unique missing customer keys, corrected corrupt future dates, and documented the workflow in a dedicated audit log.

### Week 3: SQL JOINs & Cross-Channel Analysis
* **Focus:** Relational database mapping using multi-table `INNER JOIN` and `LEFT JOIN`.
* **Deliverables:** Combined `sales`, `customers`, and `products` tables to build UrbanStyle's operational "single source of truth". Discovered that physical brick-and-mortar stores drive 66% (€1.9M) of total revenue, while the Online channel holds a massive 34% (€1M) share, matching the flagship Tallinn store's transaction volume.

### Week 4: SQL Aggregation & Marketing ROI
* **Focus:** Advanced business intelligence using `GROUP BY`, `HAVING`, and Common Table Expressions (CTEs).
* **Deliverables:** Engineered complex CTEs to calculate campaign efficiency. Proven that Google Organic acquisition yields a Customer Value **5x higher than Instagram Ads** (€6,001 vs €1,144). Successfully reclaimed and assigned €286,500 of previously "unassigned" revenue back to active marketing channels through database cleanup.

### Week 5: Visualisation with Power BI (Operations Dashboard)
* **Focus:** Executive-level UI/UX dashboard engineering and distribution logic.
* **Deliverables:** Developed the *Operations Dashboard* focusing on stock efficiency. Visualized inventory distributions across categories to highlight overstock risks in Men's Apparel and Footwear, providing actionable insight into capital optimization.

### Week 6: Data Storytelling (Flagship Store Narrative)
* **Focus:** Stakeholder reporting, executive summaries, and annotated dashboards.
* **Deliverables:** Created a storytelling dashboard focusing on the Tallinn flagship store's performance. Highlighted its **historic €1M sales milestone (+11% YoY growth)** with a €287 Average Order Value (AOV). Uncovered that 40% of the revenue was generated outside the current loyalty program, serving as a direct strategic trigger for marketing expansion.

### Week 7: Python & Pandas — Customer Segmentation
* **Focus:** Advanced statistical profiling and segmentation using Python Pandas.
* **Deliverables:** Migrated from SQL environments to Python to perform a full-scale RFM (Recency, Frequency, Monetary) analysis. Segmented the customer base to isolate **519 high-value VIP Champions** and flag **381 At-Risk customers** facing churn. Generated minimal, clean Plotly visualizations using Cole Nussbaumer Knaflic’s clutter-reduction design rules.

### Week 8: APIs & Automated Data Pipeline
* **Focus:** Production automation, REST APIs, and error handling.
* **Deliverables:** Built an end-to-end automated data pipeline (`pipeline.py`). The architecture extracts raw streams via the Supabase API, cleanses and processes 8,947 validated rows (filtering out 1,053 corrupt records), generates Plotly HTML/CSV metrics, and records performance via a robust `logging` system—**executing seamlessly in just 2.32 seconds**.

### Week 9: Career Integration & Recruiter Perspective
* **Focus:** Market integration and professional positioning.
* **Deliverables:** Translating technical outcomes from the UrbanStyle database into high-impact, STAR-method metrics. Optimizing this portfolio, CV, and LinkedIn footprint to match exact employer requirements for modern data analysis roles.

### Week 10-11: Advanced Analytics & Graduation
* **Focus:** Capstone finalization, portfolio auditing, and program completion.
