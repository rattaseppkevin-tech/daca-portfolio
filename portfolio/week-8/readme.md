# DACA Week 8: Python APIs — Automated RFM Data Pipeline

#### Business Problem
Marko Saar (Product Manager) was spending over two hours every Monday manually exporting CSV files, cleaning data, and running scripts to update RFM analysis. The goal of this project was to transition from manual "handicraft" to a "production-grade" automated system. By connecting Python directly to the database via API, we aimed to provide real-time insights and eliminate repetitive manual labor.

#### Approach
The project implemented a modular **ETL (Extract, Transform, Load)** pipeline architecture:
*   **Extract:** Utilized the Supabase Python Client and REST API to fetch live sales and customer data directly from the cloud database, replacing static CSV files.
*   **Transform:** Developed reusable Python functions to clean data (handling duplicates and NULLs) and calculate RFM segments (Recency, Frequency, Monetary) dynamically.
*   **Load:** Automated the generation of timestamped CSV reports and interactive Plotly HTML dashboards.
*   **Security:** Implemented professional security standards by using `.env` files for API credentials and `.gitignore` to prevent sensitive data leaks.

#### Key Findings
*   **Efficiency Gains:** Automated a recurring 23-minute manual task (multiplied by 50 weeks/year), saving approximately **19 hours of manual labor annually** with a one-time 4-hour setup.
*   **Live Integrity:** Shifted from "yesterday's data" to real-time analysis, ensuring the 245 VIP customers identified are current.
*   **VIP Intelligence:** The pipeline successfully segments "VIP Champions" (e.g., customers with >€300 spend and high frequency) from "At Risk" users who haven't purchased in over 120 days.
*   **Operational Reliability:** Integrated logging and `try/except` blocks to ensure the system provides clear error reports instead of crashing if an API connection fails.

#### Technical Stack
*   **Python (3.11+):** Core language for pipeline orchestration.
*   **Supabase Python Client:** For REST API communication with the database.
*   **Pandas:** For advanced data wrangling and RFM logic.
*   **Plotly:** For generating interactive HTML visualizations.
*   **Dotenv:** For secure management of environment variables.

#### How to Run
1.  **Environment Setup:** Create a `.env` file in the root directory containing your `SUPABASE_URL` and `SUPABASE_KEY`.
2.  **Install Dependencies:** Run `pip install supabase python-dotenv pandas plotly`.
3.  **Security Check:** Ensure `.env` is listed in your `.gitignore` file to protect your API keys.
4.  **Execute Pipeline:** Run `python pipeline.py` to trigger the full ETL sequence.
5.  **Review Output:** Check the `reports/` or `output/` folder for the generated CSV and interactive HTML charts.

#### Lessons Learned
*   **API vs. CSV:** Realized that API-level filtering (e.g., `.eq()`) is significantly more efficient than downloading all data and filtering in pandas because it reduces network load.
*   **The DRY Principle:** Learned that writing modular functions (Don't Repeat Yourself) makes code flexible; one function can now generate reports for Tallinn, Tartu, and Pärnu simply by changing a parameter.
*   **Defensive Programming:** Discovered that logging is the "black box" of a script; without it, debugging an automated process that fails in the middle of the night is nearly impossible.

#### AI Usage
AI was used as a "coding partner" to troubleshoot Supabase pagination for large datasets and to refine the logic for the Plotly indicator cards. It also assisted in designing the `try/except` error handling structure to ensure the pipeline is resilient against connection timeouts.
