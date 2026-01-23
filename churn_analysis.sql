# Churn Analysis
-- Step 1: Find the last order date per customer
WITH last_order AS (
    SELECT
        customer_id,
        MAX(order_date) AS last_order_date
    FROM orders
    GROUP BY customer_id
)
SELECT
    COUNT(*) AS churned_customers
FROM last_order
WHERE last_order_date < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

#Churn Rate

WITH last_order AS (
    SELECT
        customer_id,
        MAX(order_date) AS last_order_date
    FROM orders
    GROUP BY customer_id
)
SELECT
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers),
        2
    ) AS churn_rate_percentage
FROM last_order
WHERE last_order_date < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

