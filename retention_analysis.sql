#Data Analytics

#1) Repeat Customers : Customer who placed more than 1 order
SELECT
  customer_id,
  COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1
ORDER BY total_orders DESC;

#2) Retentation Rate

WITH customer_orders AS (
  SELECT
    customer_id,
    COUNT(order_id) AS order_count
  FROM orders
  GROUP BY customer_id
)
SELECT
  ROUND(
    COUNT(CASE WHEN order_count > 1 THEN 1 END) * 100.0 / COUNT(*),
    2
  ) AS retention_rate_percentage
FROM customer_orders;

#it came as 68.70% which means that around 69% people order again.