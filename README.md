# Amazon Sales Data Engineering & Advanced SQL Analytics

## 📌 Project Overview
This project demonstrates a comprehensive SQL data analytics workflow, transforming raw, flat e-commerce data into a structured relational database. The analysis moves beyond basic reporting into **behavioral analytics**, leveraging advanced SQL techniques to evaluate customer retention, churn, and purchase velocity.

The goal of this project is to showcase strong data modeling, SQL engineering, and analytical thinking skills commonly expected in data analyst and data engineer roles.

---

## 🚀 Key Features
- **Data Normalization:** Designed and implemented a relational schema by decomposing raw sales data into optimized `customers` and `orders` tables.
- **Advanced Analytics:** Performed Cohort Analysis to measure long-term user engagement and Churn Analysis to identify inactive customers.
- **Window Functions:** Used `LAG()` and `ROW_NUMBER()` to sequence customer purchase journeys and calculate time between orders.
- **Data Quality Assurance:** Enforced referential integrity with primary and foreign key constraints and validated data completeness.

---

## 📂 Project Structure

| File | Description | Key SQL Techniques |
|-----|------------|-------------------|
| `create_clean_tables.sql` | Normalizes raw data into structured tables with PK/FK constraints | DDL, DML, Data Cleaning |
| `retention_analysis.sql` | Calculates repeat customer percentage | CTEs, Aggregations |
| `cohort_retention_analysis.sql` | Tracks customer activity by first purchase month | Date Formatting, Joins |
| `churn_analysis.sql` | Identifies customers inactive for over 6 months | `DATE_SUB`, `CURDATE` |
| `time_frequency_btw_orders.sql` | Measures purchase velocity per customer | `LAG()`, `DATEDIFF` |
| `revenue_monthly.sql` | Analyzes monthly revenue and order volume trends | Time-Series Analysis |

---

## 📊 Analytics Deep-Dive

### 1. Customer Retention
The analysis reveals that **68.70%** of customers are repeat buyers.  
This metric highlights strong brand loyalty and indicates sustainable long-term revenue potential.

---

### 2. Cohort Analysis
Customers are grouped by their first purchase month to track engagement over time.  
This approach helps measure customer “stickiness” and identifies drop-off patterns across cohorts.

---

### 3. Purchase Frequency (Velocity)
Using window functions, the project calculates `days_since_last_order` for every transaction.  
These insights can be used to:
- Predict customer repurchase behavior  
- Trigger personalized marketing campaigns  
- Optimize promotional timing  

---

### 4. Churn Detection
Customers are classified as **churned** if they have not placed an order in over 6 months.  
This automated logic produces a clean, actionable list for win-back and re-engagement strategies.

---

## 🛠️ Tech Stack
- **Database:** MySQL / PostgreSQL  
- **Querying:** CTEs, Window Functions, Complex Joins, Date Functions  
- **Data Modeling:** Snowflake & Star Schema principles  

---

## 📈 Key Insights Summary
- **High Loyalty:** Nearly 69% of customers return for additional purchases.
- **Revenue Trends:** Monthly revenue analysis reveals seasonal patterns and order volume fluctuations.
- **Operational Reliability:** Achieved 100% referential integrity through strict foreign key enforcement.

---

## ▶️ How to Run
1. Execute `create_clean_tables.sql` to create and normalize the database schema.
2. Run any analysis script (e.g., `cohort_retention_analysis.sql`) to generate insights and reports.

---

*This project is designed to demonstrate real-world SQL analytics, data modeling, and business insight generation.*
