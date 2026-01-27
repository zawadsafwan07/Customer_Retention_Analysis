
#Average Order per customer
SELECT
	customer_id,
	ROUND(AVG(total_amount),2) AS average_order_value,
    COUNT(order_id) AS total_orders
FROM orders
group by customer_id
ORDER BY average_order_value ASC
LIMIT 20;