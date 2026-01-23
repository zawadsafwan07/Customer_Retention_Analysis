-- Step 1: Identify each customer's first purchase month
WITH first_orders AS (
    SELECT 
        customer_id,
        MIN(DATE_FORMAT(order_date, '%Y-%m')) AS first_order_month
    FROM orders
    GROUP BY customer_id
),

-- Step 2: Count orders per customer per month
orders_by_month AS (
    SELECT
        customer_id,
        DATE_FORMAT(order_date, '%Y-%m') AS order_month
    FROM orders
)

-- Step 3: Join first order month to track retention
SELECT
    f.first_order_month AS cohort_month,
    o.order_month,
    COUNT(DISTINCT o.customer_id) AS active_customers
FROM orders_by_month o
JOIN first_orders f
  ON o.customer_id = f.customer_id
GROUP BY f.first_order_month, o.order_month
ORDER BY f.first_order_month, o.order_month;
