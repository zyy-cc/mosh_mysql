-- views are used to simply the complex sql query.

/* 
--创建视图
USE sql_invoicing;
CREATE VIEW sales_by_client AS 
SELECT 
	c.client_id,
    c.name,
    SUM(invoice_total) AS total_sales    
FROM clients c
JOIN invoices i USING (client_id)
GROUP BY client_id, name

SELECT * 
FROM sales_by_client
JOIN clients USING (client_id)
WHERE total_sales > 500

USE sql_invoicing;
CREATE VIEW clients_balance AS
SELECT 
	c.client_id,
    c.name,
    SUM(invoice_total - payment_total) AS balance    
FROM clients c
JOIN invoices i 
USING (client_id)
GROUP BY client_id

--删除视图
DROP VIEW sales_by_client

*/

/*
USE sql_invoicing;
CREATE OR REPLACE VIEW sales_by_client AS 
SELECT 
	c.client_id,
    c.name,
    SUM(invoice_total) AS total_sales    
FROM clients c
JOIN invoices i USING (client_id)
GROUP BY client_id, name
*/

/*
更新图表
CREATE OR REPLACE VIEW invoices_with_balance AS 
SELECT 
	invoice_id,
    number,
	client_id,
    invoice_total,
    payment_total,
    invoice_total - payment_total AS balance,
    invoice_date,
    due_date,
    payment_date
FROM invoices i 
WHERE (invoice_total - payment_total) > 0;

DELETE FROM invoices_with_balance
WHERE invoice_id = 1;

UPDATE invoices_with_balance
SET due_date = DATE_ADD(due_date, INTERVAL 2 DAY)
WHERE invoice_id = 2
*/

/*
-- WITH CHECK OPTION 保护视图，如果更新导致某行消失则会报错

CREATE OR REPLACE VIEW invoices_with_balance AS 
SELECT 
	invoice_id,
    number,
	client_id,
    invoice_total,
    payment_total,
    invoice_total - payment_total AS balance,
    invoice_date,
    due_date,
    payment_date
FROM invoices i 
WHERE (invoice_total - payment_total) > 0
WITH CHECK OPTION;

UPDATE invoices_with_balance
SET payment_total = invoice_total
WHERE invoice_id = 3
*/










