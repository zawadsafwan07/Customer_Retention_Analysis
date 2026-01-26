#Frequency and time between purchase
-- Using LAG() to calculate days between orders
SELECT
    customer_id,
    order_id,
    order_date,
    DATEDIFF(order_date, LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date)) AS days_since_last_order
FROM orders
ORDER BY customer_id, order_date;
