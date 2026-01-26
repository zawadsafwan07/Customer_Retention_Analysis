#Finds the customers with most amount spent
SELECT
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;