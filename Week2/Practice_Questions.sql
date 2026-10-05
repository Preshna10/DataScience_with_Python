#1)How many customers do we have?
SELECT COUNT(*) AS total_customers
FROM customers;

#2)What is the average order value?
SELECT AVG(total_amount) AS average_order_value
FROM orders;

#3)What is the total revenue?
SELECT SUM(total_amount) AS total_revenue
FROM orders;

#4)What are the 5 most expensive products?
SELECT product_id, product_name, price
FROM products
ORDER BY price DESC
LIMIT 5;

#5)Which customers have spent the most?
SELECT customers.customer_id, customers.fullname, SUM(orders.total_amount) AS total_spending
FROM customers JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.status = 'Completed'
GROUP BY customers.customer_id, customers.fullname
ORDER BY total_spending DESC LIMIT 5;

#6)How many orders has each customer made?
SELECT customers.customer_id, customers.fullname,
COUNT(orders.order_id) AS total_orders
FROM customers 
LEFT JOIN orders
ON customers.customer_id = orders.customer_id 
AND orders.status = 'Completed'
GROUP BY customers.customer_id, customers.fullname
ORDER BY total_orders DESC;

#7)What is the average order value for each customer?
SELECT customers.customer_id, customers.fullname,
AVG(orders.total_amount) AS average_order_value
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.status = 'Completed'
GROUP BY customers.customer_id, customers.fullname
ORDER BY average_order_value DESC;

#8)Which customers have never placed an order?
SELECT customers.customer_id, customers.fullname
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL;

#9)How many products are in each category?
SELECT categories.category_id, categories.category_name,
COUNT(products.product_id) AS total_products
FROM categories 
LEFT JOIN products 
ON categories.category_id = products.category_id
GROUP BY categories.category_id, categories.category_name
ORDER BY total_products DESC;

#10)What is the cheapest and most expensive product?
SELECT product_id, product_name, price
FROM products
WHERE price = (SELECT MIN(price) FROM products)
OR price = (SELECT MAX(price) FROM products);

#11) Which customers have placed more than one order?
SELECT customers.customer_id, customers.fullname,
COUNT(orders.order_id) AS total_orders
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.fullname
HAVING COUNT(orders.order_id) > 1
ORDER BY total_orders DESC;