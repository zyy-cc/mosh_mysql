/*
START TRANSACTION;
INSERT INTO orders (customer_id, order_date,status)
VALUES (1,'2019-01-01',1); 

INSERT INTO order_items
VALUES(LAST_INSERT_ID(),1,1,1);

-- close the statement
-- COMMIT;
-- 检查语句 退回事务并撤销所有更改
ROLLBACK;
*/

/*
USE sql_store;
START TRANSACTION;
UPDATE customers
SET points = points+10
WHERE customer_id = 1;
COMMIT;
*/

/*
-- 修改隔离级别
SHOW VARIABLES LIKE 'transaction_isolation';
-- 下一次
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- 设置会话内的隔离级别
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- 设置全局 
SET GLOBAL TRANSACTION ISOLATION LEVEL SERIALIZABLE;
*/

-- Read Uncommited
USE sql_store;
/* 
不可重复性读
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;
SELECT points FROM customers WHERE customer_id = 1;
SELECT points FROM customers WHERE customer_id = 1;
COMMIT;
*/
--  REPEATABLE READ

-- 解决幻读问题,一个一个执行 
/*
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
SELECT * FROM customers WHERE state = 'VA';
-- SELECT points FROM customers WHERE customer_id = 1;
COMMIT;
*/
UPDATE customers SET state = 'VA' WHERE customer_id = 1;
UPDATE orders SET status = 1 WHERE order_id = 1;
COMMIT;













