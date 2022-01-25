USE sql_invoicing;
SELECT * 
FROM(
	SELECT 
		client_id,
		name,
		(SELECT SUM(invoice_total)
		FROM invoices i
		WHERE i.client_id = c.client_id) AS total_sales,
		(SELECT AVG(invoice_total)
		FROM invoices) AS average,
		(SELECT total_sales - average) AS difference
	FROM clients c
) AS sales_summary
WHERE total_sales IS NOT NULL
/*
SELECT套SELECT
SELECT 
	client_id,
	name,
    (SELECT SUM(invoice_total)
    FROM invoices i
    WHERE i.client_id = c.client_id) AS total_sales,
    (SELECT AVG(invoice_total)
    FROM invoices) AS average,
    (SELECT total_sales - average) AS difference
FROM clients c

SELECT 
	invoice_id,
    invoice_total,
    (SELECT AVG(invoice_total)
    FROM invoices) AS invoice_average,
    invoice_total - (SELECT invoice_average) AS difference
FROM invoices 
*/
    
/* 
USE sql_store;
SELECT * 
FROM products p
WHERE NOT EXISTS(
	SELECT product_id
	FROM order_items
    WHERE product_id = p.product_id
)

USE sql_invoicing;

-- EXIST
SELECT *
FROM clients c
WHERE EXISTS(
	SELECT client_id
    FROM invoices
    WHERE client_id = c.client_id
)
*/

/* 
相关子查询
SELECT * 
FROM invoices i
WHERE invoice_total > (
	SELECT AVG(invoice_total)
	FROM invoices
	WHERE client_id = i.client_id
)


-- Select employees whose salary is 
-- above the avergae in their office
USE sql_hr;
SELECT * 
FROM employees e
WHERE salary > (
	SELECT AVG(salary)
	FROM employees
	WHERE office_id = e.office_id
)
*/

/*
-- Select clients with at least two invoices
USE sql_invoicing;
SELECT * 
FROM clients 
WHERE client_id IN (
	SELECT client_id
	FROM invoices
	GROUP BY client_id
    HAVING COUNT(*) >= 2
)
*/

/*
ALL 
-- SELECT invoices larger than all invoices of client 3
SELECT *
FROM invoices
WHERE invoice_total > (
	SELECT MAX(invoice_total)
	FROM invoices
	WHERE client_id = 3
)

SELECT *
FROM invoices
WHERE invoice_total > ALL (
	SELECT invoice_total
	FROM invoices
	WHERE client_id = 3
)
*/

/*
-- Find customers who have ordered lettuce (id = 3)
-- SELECT customer_id, first_name, last_name

USE sql_store;
SELECT DISTINCT customer_id, first_name, last_name
FROM customers c 
JOIN orders o USING (customer_id)
JOIN order_items oi USING (order_id)
WHERE oi.product_id = 3

SELECT customer_id, first_name, last_name
FROM customers
WHERE customer_id in (
	SELECT customer_id
	FROM orders
	WHERE order_id IN (
		SELECT order_id
		FROM order_items
		WHERE product_id = 3
)
)
*/

/*
-- ex4
USE sql_invoicing;
SELECT * 
FROM clients
WHERE client_id NOT IN (
	SELECT DISTINCT client_id
	FROM invoices
)

-- ex3 
USE sql_store;
SELECT * 
FROM products 
WHERE product_id NOT IN (
	SELECT DISTINCT product_id
	FROM order_items
)
*/

/* 
-- ex2 Find employees whose earn more than average
USE sql_hr;
SELECT * 
FROM employees
WHERE  salary > (
	SELECT AVG(salary)
    FROM employees
)

-- ex1
-- Find products that are more expensive than Lettice (id = 3)
USE sql_store;
SELECT * 
FROM products
WHERE  unit_price > (
	SELECT unit_price
    FROM products
    WHERE product_id = 3
)
*/