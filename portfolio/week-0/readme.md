# Week 0: Onboarding & Workflow Architecture

---

## 🎯 Business Context
UrbanStyle Ltd. (a fashion e-commerce brand with 45 employees across Tallinn, Tartu, and Pärnu) was facing severe operational risk due to broken Excel workflows, duplicate data rows, and reporting discrepancies. 

The goal of this onboarding week was to **eliminate spreadsheet-dependency** by architecting a modern, scalable data ecosystem where data resides securely in the cloud, code changes are systematically tracked, and workflows are fully integrated[cite: 1].

---

## 🛠️ Technical Stack Configured
| Tool | Infrastructure Role | Strategic Advantage |
| :--- | :--- | :--- |
| **Supabase** | Cloud Data Tier | Deployed a PostgreSQL database instance in the `eu-central-1` region[cite: 1]. |
| **Git & GitHub** | Version Control | Set up local system tracking connected to the remote `daca-portfolio` repository[cite: 1]. |
| **VS Code** | Core IDE | Custom environments configured with Python, SQLTools, and GitLens[cite: 1]. |
| **Power BI** | Business Intelligence | Installed locally to ingest upcoming database schemas for executive dashboards[cite: 1]. |

---

## 🚀 Key Deliverables & "Vertical Slice" Validation

To verify that the entire analytical pipeline communicates flawlessly, I successfully built and executed an end-to-end **Vertical Solution**[cite: 1]:

1. **Database Schema Creation**: Wrote and deployed a relational structure (`team_members`) enforcing `SERIAL PRIMARY KEY` and automatic `TIMESTAMP` constraints[cite: 1].
2. **Data Ingestion**: Populated the cloud database with internal organizational roles (CEO, IT Director, Marketing Lead, and myself as the Data Analyst) via native SQL commands[cite: 1].
3. **Cross-Environment Verification**: Connected local VS Code environments securely via SSL to query the Supabase cluster and verified live state alignment[cite: 1].
4. **Codebase Synchronization**: Staged, committed, and pushed the pipeline script to GitHub to establish an immutable engineering log[cite: 1].

---

# Week 0 Group

---

## 👥 Team Information
* **Data Analyst Team Members:** Kevin, Eike, Nikita, Krista, Egle

---

## 🛠️ Shared Infrastructure Setup
* **GitHub Organization:** Initialized a centralized, shared organization to manage collaborative version control and team repositories.
* **Supabase (PostgreSQL):** Deployed a shared cloud database instance to serve as the single source of truth for team-wide query execution.
* **NotebookLM:** Configured a shared workspace environment for team knowledge management and document analysis.

---

## 📈 Key Deliverables & Observations
* **Ecosystem Integration:** Successfully built and cross-connected the cloud databases with team local IDE environments via secure SSL configurations.
* **Operational Note:** Configuring the environments and establishing proper access permissions across different platforms took longer than anticipated. However, all configuration bottlenecks have been resolved, and the entire shared pipeline is now fully operational and production-ready.

---