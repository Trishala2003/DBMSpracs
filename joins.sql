/*Joins
Consider following tables:*/
CREATE TABLE customers (
 customer_id INT PRIMARY KEY,
 customer_name VARCHAR(50),
 customer_email VARCHAR(50)
);
CREATE TABLE orders (
 order_id INT PRIMARY KEY,
 order_number VARCHAR(50),
 order_date DATE,
 total_amount DECIMAL(10,2),
 customer_id INT,
 CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES
customers(customer_id)
);
/*Get a list of all customers and their total orders amount, sorted by the highest total
orders amount first.*/
SELECT c.customer_name, SUM(o.total_amount) AS total_orders_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_orders_amount DESC;

/*Get a list of all orders and their corresponding customers, along with the order date and
total amount, sorted by order date.*/
SELECT o.order_number, c.customer_name, o.order_date, o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date;

/*Get a count of the number of orders for each customer.*/
SELECT c.customer_name, COUNT(*) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

/*Get a list of all customers who have not placed any orders.*/
SELECT c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

/*Get a list of all customers and the total amount of their orders, including customers who
have not placed any orders yet.*/
SELECT c.customer_name, SUM(o.total_amount) AS total_order_amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY c.customer_name;