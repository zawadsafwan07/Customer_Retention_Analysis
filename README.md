# Amazon Sales SQL Analysis

## Overview

This project demonstrates a **complete SQL data analytics workflow** using an e-commerce dataset from [Kaggle: Amazon Sales Dataset](https://www.kaggle.com/datasets/rohiteng/amazon-sales-dataset).  

The goal is to:

1. **Clean and normalize raw order data** into dimensional tables.  
2. **Perform data quality checks** to ensure accuracy.  
3. **Analyze customer behavior**, including retention metrics.  
4. Prepare the work for use in a **portfolio or interactive analytics project**.  

---

## Dataset

**Source:** [Amazon Sales Dataset](https://www.kaggle.com/datasets/rohiteng/amazon-sales-dataset)  

- Contains historical order data for Amazon e-commerce transactions.  
- Columns include `OrderID`, `CustomerID`, `CustomerName`, `OrderDate`, `OrderStatus`, `TotalAmount`, `PaymentMethod`, `City`, `State`, `Country`, and more.  
- Used as **raw landing data** in this project.  

---

## Project Structure

| File | Description |
|------|-------------|
| `03_create_clean_tables.sql` | Creates clean tables (`customers`, `orders`) from `raw_orders` and inserts deduplicated data. Includes data quality checks. |
| `04_retention_analysis.sql` | Performs SQL analytics to calculate customer retention and repeat purchase behavior. |

---

## Steps

### 1️⃣ Stage Raw Data
- Imported `raw_orders` table from the dataset.  
- This table is used only as a **landing zone**, not for direct analysis.  

### 2️⃣ Create Clean Tables
- **`customers` table**: De-duplicated by `CustomerID`.  
- **`orders` table**: Stores transactional order data linked to `customers`.  
- **Techniques used:** `SELECT DISTINCT`, `GROUP BY`, `MIN()` functions, primary/foreign keys.  

### 3️⃣ Data Quality Checks
- Verified all orders have valid customers.  
- Checked for missing values and duplicate keys.  
- Reviewed distribution of `OrderStatus`.  

### 4️⃣ Customer Retention Analysis
- Calculated **repeat customers** and **overall retention rate** using SQL.  
- Example query used a **Common Table Expression (CTE)**:


