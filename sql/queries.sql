-- Total Revenue
SELECT SUM(amount) AS total_revenue
FROM order_details;

-- Revenue by City
SELECT customers.city, SUM(order_details.amount) AS revenue
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN order_details ON orders.order_id = order_details.order_id
GROUP BY customers.city;

-- Top Customer
SELECT customers.name, SUM(order_details.amount) AS total_spent
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN order_details ON orders.order_id = order_details.order_id
GROUP BY customers.name
ORDER BY total_spent DESC
LIMIT 1;

-- Product Revenue
SELECT product, SUM(amount) AS revenue
FROM order_details
GROUP BY product;
