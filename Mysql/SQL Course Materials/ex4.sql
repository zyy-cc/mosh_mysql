-- class four 插入值 
USE sql_store;





/* UPDATE invoices
SET payment_total = invoice_total *0.5,
	payment_date = due_date
WHERE client_id IN
		(SELECT client_id
		FROM clients
		WHERE state in ('CA','NY'))
        
UPDATE orders
SET comments = 'Gold'
WHERE customer_id in (
	SELECT customer_id 
	FROM customers
	WHERE points > 3000
)
*/

/* 
更新多行元素
USE sql_invoicing;
UPDATE invoices
SET payment_total = invoice_total *0.5,
	payment_date = due_date
WHERE client_id IN (3,4)

USE sql_store;
UPDATE customers
SET points = points + 50
WHERE birth_date < '1990-01-01'
*/

/*
更新一行元素
UPDATE invoices
SET payment_total = invoice_total *0.5,
	payment_date = due_date
WHERE invoice_id = 3

UPDATE invoices
SET payment_total = 10, payment_date = '2019-03-01'
WHERE invoice_id  = 1
*/

/* CREATE TABLE invoice_archived AS
SELECT
	i.invoice_id,
    i.number,
    c.name AS client,
    i.invoice_total,
    i.payment_total,
    i.invoice_date,
    i.due_date,
    i.payment_date
FROM invoices i
JOIN clients c 
	USING (client_id)
WHERE i.payment_date IS NOT NULL
*/

/* 
插入新的表格
INSERT INTO orders_archived 
SELECT * 
FROM orders
WHERE order_date < "2019-01-01"
*/
/*
创建表格
CREATE TABLE orders_archived AS
SELECT * 
FROM orders
*/

/* 
插入分层行
INSERT INTO orders(customer_id, order_date, status)
VALUES(1, '2019-01-02',1);

INSERT INTO order_items
VALUES(last_insert_id(),1, 1,2.9)
*/

/* 插入多行
INSERT INTO products(
	name, 
	quantity_in_stock,
	unit_price)
VALUES ('yy',3,2.3),
('zyy',4,2.5)

INSERT INTO shippers(name)
VALUES ('Shipper1'),
		('Shipper2'),
        ('Shipper3')
*/

/* 插入单行值
INSERT INTO customers(
	first_name,
	last_name,
	birth_date,
	address,
	city,
	state)
VALUES (
    'John',
    'Smith',
    '1990-01-01',
    'address',
    'city',
    'CA')
*/