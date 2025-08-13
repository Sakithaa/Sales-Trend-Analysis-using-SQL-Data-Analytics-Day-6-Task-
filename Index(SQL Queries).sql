CREATE DATABASE sales_analysis;
USE sales_analysis;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    product_id INT,
    product_name VARCHAR(255),
    amount DECIMAL(10,2)
);

-- Query 1: With average order value
SELECT * FROM orders LIMIT 20;

-- Query 2: Monthly revenue & order volume
SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- Query 3: 2024 only
SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
WHERE YEAR(order_date) = 2024
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- Query 4: Sorted by highest revenue
SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY order_year, order_month
ORDER BY total_revenue DESC;


-- Query 5: With average order value
USE sales_analysis;
SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(amount) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM orders
GROUP BY order_year, order_month
ORDER BY order_year, order_month;