# DACA Week 6: Data Storytelling — Beyond the Dashboard

#### Business Problem
While UrbanStyle’s dashboards were visually functional, they lacked the narrative context needed to persuade investors and stakeholders. The objective was to move from simply showing "what" happened (raw data) to explaining "why" it happened and "how" the company should respond. The goal was to transform raw metrics into compelling data stories that justify strategic investments and operational changes.

#### Approach
The project focused on enhancing visual communication through three core pillars:
*   **Strategic Annotation:** Applied a hierarchy of annotations, including titles, subtitles, and callouts, to ensure charts are self-explanatory. This eliminates the need for oral explanations and directs the viewer's eye to key anomalies like the "Black Friday effect."
*   **Data Storytelling Framework:** Implemented Cole Nussbaumer Knaflic’s three-part structure (Context → Data → Narrative) and the 3-Act film structure (Setup, Conflict, Resolution) to build a persuasive business case.
*   **Audience-Centric Design:** Designed specialized views for different stakeholders (CEO, IT, and Operations) using "Progressive Disclosure"—starting with high-level KPIs and allowing users to drill down into technical details or raw data tables.

#### Key Findings
*   **Revenue Milestone:** Sales in 2024 reached **€501,200**, marking a **40% year-over-year growth** and exceeding the half-million mark for the first time.
*   **Marketing Efficiency:** Facebook was identified as the primary growth driver with a **3.2x ROI**, responsible for bringing in **60% of all new customers**.
*   **Product Performance:** The **Denim Jacket** line has become a "hero" product, now accounting for **28% of total revenue**.
*   **Operational Risks:** The Tartu store showed a **5% decline** in sales, highlighting a specific need for an operational audit despite overall company growth.

#### Technical Stack
*   **Visualization Tools:** Power BI (Track A) or Plotly and Streamlit (Track B) for interactive data presentation.
*   **Database:** SQL (PostgreSQL) via Supabase for back-end data retrieval.
*   **Design Frameworks:** Guided by the principles of Knaflic (Storytelling with Data) and McKinney (Plotting and Visualization).

#### How to Run
1.  **Audit:** Open the Week 5 dashboard and apply the "So What?" test to every chart to ensure each data point leads to a business action.
2.  **Annotate:** Add at least four types of annotations (Title, Axis Labels, Reference Lines, and Callouts) to critical charts to provide immediate context.
3.  **Segment:** Configure the dashboard to support different user views—ensure the CEO sees 3-5 strategic KPIs while operations managers see inventory alerts.
4.  **Narrate:** Structure the final report or presentation using the Context → Data → Narrative framework to present the Investor Pitch.

#### Lessons Learned
*   **The Power of "Why":** Learned that investors buy stories, not just tables. A simple slide with three numbers and a clear narrative is often more persuasive than 15 unannotated charts.
*   **Clutter vs. Context:** Discovered that while annotations are essential, over-annotating creates visual clutter. The key is to focus only on the points that support the main business message.
*   **The "So What?" Test:** Realized that any data point that doesn't lead to a recommendation (e.g., "increase the Facebook budget") should likely be removed from executive-level views.

#### AI Usage
AI was utilized as a "storytelling partner" to perform multi-level "So What?" tests on specific data points and to refine the wording of subtitles to ensure they captured strategic significance for a CEO audience.