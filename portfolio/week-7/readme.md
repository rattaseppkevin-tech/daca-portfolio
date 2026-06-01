# DACA Week 7: Python Pandas — Advanced RFM Customer Segmentation

#### Business Problem
UrbanStyle Product Manager Marko Saar needs to move beyond general dashboards. While current reports show "what" is happening, they don't reveal "who" the customers are. The goal of this project is to implement an **RFM (Recency, Frequency, Monetary)** analysis to identify VIP Champions, Loyal Customers, and those "At Risk" of churning, enabling the marketing team to launch personalized, data-driven campaigns.

#### Approach
The project transitioned the analysis from SQL to Python to leverage the flexibility of the **pandas** library and the interactivity of **Plotly**:
*   **Data Extraction:** Integrated Python with the UrbanStyle database (Supabase) to load sales and customer data directly into pandas DataFrames.
*   **Data Wrangling:** Performed a comprehensive cleaning pipeline, including duplicate removal, handling NULL values in critical columns, and parsing string-based dates into Python `datetime` objects.
*   **RFM Logic:** Developed a multi-step analytical script to calculate the days since the last purchase (Recency), the total number of orders (Frequency), and the lifetime spend (Monetary) for every unique customer.
*   **Algorithmic Segmentation:** Utilized `pd.qcut()` to assign relative scores (1-5) to each dimension and categorized users into five distinct strategic segments (e.g., VIP Champions vs. At Risk).

#### Key Findings
*   **VIP Concentration:** Identified that the top "VIP Champions" segment (score 13-15) consists of a small group of highly frequent shoppers who drive a disproportionate share of revenue.
*   **Churn Risk:** Detected a significant "At Risk" segment—customers who were previously active but haven't purchased in over 120 days—requiring an immediate "win-back" campaign.
*   **Regional Performance:** Analysis confirmed that while Tallinn has the highest volume (42% of orders), the online segment is rapidly expanding as the second-largest sales channel.
*   **Operational Efficiency:** Shifting the RFM calculation from manual SQL/Excel to an automated Python script reduces analysis time from hours to seconds.

#### Technical Stack
*   **Python (3.11+):** The primary language for data orchestration.
*   **Pandas:** Used for data manipulation, merging tables, and categorical scoring.
*   **Plotly Express:** Used for creating interactive visualizations (Scatter plots, Bar charts, Pie charts).
*   **Supabase Client:** For live data connection (API).

#### Screenshots
*   **[Screenshot 1: RFM Table Output]** – *A view of the final DataFrame with R, F, and M scores and assigned segments.*
*   **[Screenshot 2: Segment Distribution Bar Chart]** – *A Plotly visualization showing the count of customers per loyalty tier.*
*   **[Screenshot 3: Recency vs. Monetary Scatter Plot]** – *Interactive plot showing how high-spending VIPs cluster compared to At-Risk users.*

#### How to Run
1.  **Environment Setup:** Ensure Python 3.11+ is installed.
2.  **Install Libraries:** Run `pip install pandas plotly supabase python-dotenv` in your terminal.
3.  **Data Source:** Ensure your `.env` file is configured with Supabase credentials or place the `urbanstyle_sales.csv` in the data folder.
4.  **Execution:** Run the Jupyter Notebook `week7_rfm_analysis.ipynb`.
5.  **Output:** View the interactive Plotly graphs in your browser and check the `rfm_segments.csv` for the final customer list.

#### Lessons Learned
*   **SQL vs. Pandas:** Discovered that while SQL is superior for "querying" data, pandas is far more powerful for "manipulating" it through multi-stage calculations and custom functions.
*   **The Difficulty of Segmentation:** Learned that defining thresholds for "Recency" is a business decision that requires a deep understanding of the product lifecycle (e.g., how long is a "normal" gap between clothes shopping?).
*   **Data Integrity:** Realized that "NULL math" (where `100 + NULL = NULL`) can silently break financial reports if not proactively handled during the cleaning phase.

#### AI Usage
AI was utilized as a "coding partner" to troubleshoot specific pandas errors, such as handling duplicates within the `pd.qcut()` function and refining the logic for the "Anti-Join" pattern used to find lost customers.