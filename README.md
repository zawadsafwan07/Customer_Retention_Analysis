Overview

This project demonstrates a complete SQL data analytics workflow using an e-commerce dataset from Kaggle: Amazon Sales Dataset
.

The goal is to:

Clean and normalize raw order data into dimensional tables.

Perform data quality checks to ensure accuracy.

Analyze customer behavior, including retention metrics.

Prepare the work for use in a portfolio or interactive analytics project.

Dataset

Source: Amazon Sales Dataset

Contains historical order data for Amazon e-commerce transactions.

Columns include OrderID, CustomerID, CustomerName, OrderDate, OrderStatus, TotalAmount, PaymentMethod, City, State, Country, and more.

Used as raw landing data in this project.

Project Structure
File	Description
03_create_clean_tables.sql	Creates clean tables (customers, orders) from raw_orders and inserts deduplicated data. Includes data quality checks.
04_retention_analysis.sql	Performs SQL analytics to calculate customer retention and repeat purchase behavior.
Steps
1️⃣ Stage Raw Data

Imported raw_orders table from the dataset.

This table is used only as a landing zone, not for direct analysis.

2️⃣ Create Clean Tables

customers table: De-duplicated by CustomerID.

orders table: Stores transactional order data linked to customers.

Techniques used: SELECT DISTINCT, GROUP BY, MIN() functions, primary/foreign keys.

3️⃣ Data Quality Checks

Verified all orders have valid customers.

Checked for missing values and duplicate keys.

Reviewed distribution of OrderStatus.

4️⃣ Customer Retention Analysis

Calculated repeat customers and overall retention rate using SQL.

Example query used a Common Table Expression (CTE):

WITH customer_orders AS (
  SELECT customer_id, COUNT(order_id) AS order_count
  FROM orders
  GROUP BY customer_id
)
SELECT ROUND(
  COUNT(CASE WHEN order_count > 1 THEN 1 END) * 100.0 / COUNT(*),
  2
) AS retention_rate_percentage
FROM customer_orders;

Key Learnings

Dimensional modeling: separated customers and orders for clean analytics.

Data deduplication and integrity checks.

SQL aggregation and CTEs for business metrics like retention.

Portfolio-ready workflow from raw dataset → clean tables → analytics.

Tools & Technologies

SQL (MySQL) – table creation, inserts, queries, aggregations

MySQL Workbench – writing and executing SQL scripts

Kaggle Dataset – Amazon sales order data
