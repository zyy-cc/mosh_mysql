USE sql_store;
UPDATE orders SET status = 1 WHERE order_id = 1;
UPDATE customers SET state = 'VA' WHERE customer_id = 1;
-- UPDATE orders SET status = 1 WHERE order_id = 1;
COMMIT;