# DACA Week 5: Visualization Design — UrbanStyle Investor Dashboard

#### Business Problem
Investors are scheduled to visit UrbanStyle in five weeks and require a high-impact, professional dashboard to evaluate the company's performance. CEO Kristi Tamm needs a "30-second" view that answers four critical questions: Is the company growing? Which products are selling? Where are the customers coming from? Is marketing working? The goal is to replace static tables with an interactive, intuitive data story.

#### Approach
The project followed a design-first methodology, moving away from "throwing graphs on a screen" to intentional information architecture:
*   **Strategic Chart Selection:** Matched specific business questions to optimal visual types—Line charts for temporal trends, Bar charts for categorical rankings, Sektordiagrams (Pie) for proportions, and KPI cards for high-level metrics.
*   **Visual Hierarchy:** Applied the **Z-pattern** and **F-pattern** layout logic, placing the most vital growth KPIs in the top-left corner where the investor’s eye naturally begins.
*   **Gestalt Principles:** Utilized proximity and enclosure to group related metrics, ensuring that the connection between different data points is immediately obvious.
*   **Data-Ink Ratio Optimization:** Focused on maximizing clarity by removing "chart junk" such as 3D effects, shadows, excessive gridlines, and decorative backgrounds.
*   **Interactivity Planning:** Designed a dynamic system featuring cross-filtering and drill-downs, allowing stakeholders to "zoom in" on specific cities (e.g., Tartu) or time periods (e.g., Q4) without needing separate reports.

#### Key Findings
*   **Revenue Performance:** Total revenue reached **€305,000**, showing a strong **15% growth** compared to the previous quarter.
*   **Customer Base:** The company successfully reached **2,500 active customers** (+8%), with an average order value of **€32**.
*   **Market Share:** Tallinn remains the primary revenue driver at **42%**, while the **Online** segment has grown to be the second-largest channel at **28%**.
*   **Hero Product:** The **Denim Jacket** was identified as the top-performing item, generating **€45,000** in revenue.
*   **Inventory Alert:** Operational audits revealed a **25-unit discrepancy** in the Tartu warehouse, requiring immediate attention despite overall growth.

#### Technical Stack
*   **Visualization Tools:** Developed using Power BI (Track A) or Plotly and Streamlit (Track B).
*   **Database:** SQL (PostgreSQL) via Supabase used for back-end data aggregation.
*   **Design Frameworks:** Guided by the principles of Edward Tufte (Data-ink ratio) and Cole Knaflic (Storytelling with Data).

#### Screenshots
*   **[Screenshot 1: Main Investor Dashboard]** – *Wireframe showing the Z-pattern layout with top-level KPI cards.*
*   **[Screenshot 2: Regional Sales Breakdown]** – *A 4-segment pie chart showing the distribution between Tallinn, Online, Tartu, and Pärnu.*
*   **[Screenshot 3: Interactive Filters]** – *Demonstration of cross-filtering where selecting "Tallinn" updates the entire trend and product ranking.*

#### How to Run
1.  **Backend Check:** Ensure the SQL aggregations from the Week 4 audit are active in the Supabase project.
2.  **Tool Connection:** Connect Power BI or your Python environment to the Supabase database using the provided API keys.
3.  **Layout Setup:** Arrange 3-4 KPI cards at the top, the 12-month revenue line chart in the center, and the supporting bar/pie charts at the bottom.
4.  **Interactivity:** Configure the slicers for "Period," "City," and "Category" to ensure the dashboard remains dynamic.

#### Lessons Learned
*   **Simplicity Over Complexity:** A dashboard with 5-7 focused elements is far more effective than one with 20 unannotated charts.
*   **Context is King:** A number like €305K is only meaningful when compared to a baseline (e.g., +15% vs Q3).
*   **Design for the Eye:** Understanding how the human brain groups visual information (Gestalt) allows for faster and more accurate data interpretation.

#### AI Usage
AI was utilized as a "design critic" to evaluate the data-ink ratio of early drafts and to help generate color-blind friendly palettes using UrbanStyle's teal and navy brand colors. It also assisted in troubleshooting specific cross-filtering callbacks for the Plotly/Streamlit implementation.