/*Subqueries
Get a list of all customers who have placed at least one order with a total amount
greater than $100.*/
SELECT customer_name
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders WHERE total_amount >
100);

/*Get a list of all orders placed by customers who live in the same city as customer "John
Smith".*/
SELECT order_number
FROM orders
WHERE customer_id IN (SELECT customer_id FROM customers WHERE city = (SELECT
city FROM customers WHERE customer_name = 'John Smith'));

/*Get a list of all customers who have not placed any orders.*/
SELECT customer_name
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);

/*Get a list of all customers and their orders, along with the total number of orders they
have placed.*/
SELECT c.customer_name, o.order_number, o.order_date, o.total_amount,
 (SELECT COUNT(*) FROM orders WHERE customer_id = c.customer_id) AS
order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_name;

/*Get a list of all customers and their orders, along with the maximum total amount of
orders for customers who have placed at least one order.*/
SELECT c.customer_name, o.order_number, o.order_date, o.total_amount,
 (SELECT MAX(total_amount) FROM orders WHERE customer_id = c.customer_id) AS
max_total_amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE EXISTS (SELECT * FROM orders WHERE customer_id = c.customer_id)
ORDER BY c.customer_name;