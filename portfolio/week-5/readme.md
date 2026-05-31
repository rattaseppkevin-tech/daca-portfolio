# DACA Week 5: Visualization Design — UrbanStyle Investor Dashboard

#### Business Problem
Investors are scheduled to visit UrbanStyle in five weeks and require a high-impact, professional dashboard to evaluate the company's performance. The objective is to move away from static Excel tables and create an interactive "30-second" view that clearly shows whether the company is growing, which products are selling, and where customers are coming from.

#### Approach
The project followed a design-first methodology to ensure the dashboard tells a clear story:
*   **Strategic Chart Selection:** Matched business questions to the most effective visual types—Line charts for trends, Bar charts for rankings, and KPI cards for critical totals.
*   **Visual Hierarchy:** Applied the Z-pattern and F-pattern layout logic, placing the most vital growth metrics in the top-left corner where the eye naturally begins.
*   **Gestalt Principles:** Utilized proximity and enclosure to group related metrics, such as placing all sales-related KPI cards in a single row.
*   **Data-Ink Ratio Optimization:** Focused on removing "chart junk" (3D effects, shadows, and excessive gridlines) to maximize the clarity of the information.
*   **Interactivity Planning:** Designed a three-filter system (Period, Location, Category) and implemented cross-filtering to allow investors to drill down into specific data points.

#### Key Findings
*   **Growth Metrics:** Total revenue reached **€305,000**, marking a significant **15% growth** compared to the previous quarter.
*   **Customer Engagement:** The customer base grew to **2,500 active users** (+8%), with an average order value of **€32**.
*   **Market Distribution:** Tallinn remains the dominant market at **42%**, but the **Online** segment is a strong second at **28%**.
*   **Hero Products:** The **Denim Jacket** was identified as the top-performing product by revenue, generating **€45,000**.

#### Technical Stack
*   **Visualization Tools:** Developed using Power BI (Track A) or Plotly + Streamlit (Track B).
*   **Database:** SQL (PostgreSQL) serves as the back-end data source via Supabase.
*   **Design Frameworks:** Guided by Knaflic (Storytelling with Data) and Tufte’s principles.

#### How to Run
1.  Verify that the SQL aggregations from the Week 4 database audit are completed.
2.  Connect the chosen visualization tool (Power BI or Python/Streamlit) to the UrbanStyle Supabase project.
3.  Set up the primary KPI cards at the top of the page to show Revenue, Customer Count, and Average Order Value.
4.  Implement the "Last 12 Months" trend line chart as the central "hero" element of the dashboard.
5.  Configure interactive slicers for Date Range, City, and Product Category.

#### Lessons Learned
*   **Simplicity Wins:** Learned that a clean dashboard with 5-7 focused elements is far more effective than one cluttered with 20 charts.
*   **The Power of Context:** A number like "€305K" is meaningless without context; adding a comparison percentage (e.g., +15% vs Q3) makes the data actionable.
*   **User-Centric Design:** Discovered that interactive filters (cross-filtering) allow one dashboard to serve multiple stakeholders, from CEOs to regional managers.

#### AI Usage
AI was utilized as a design partner to suggest color-blind friendly palettes, critique the dashboard wireframe for "chart junk," and provide syntax help for complex Plotly callbacks and Streamlit widget integration.