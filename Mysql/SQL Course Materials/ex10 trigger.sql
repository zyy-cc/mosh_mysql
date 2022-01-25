/* 
-- 删除trigger
DROP TRIGGER IF EXISTS payments_after_insert

DELIMITER $$
-- 可以修改除了这张表以外的任意表
-- 表明+ after/before+动作(insert/delete/update)
CREATE TRIGGER payments_after_insert
	AFTER INSERT ON payments
    -- 每行都会触发
    FOR EACH ROW
BEGIN
	UPDATE invoices
    -- NEW (返回刚刚插入的行)/OLD(更新或者删除行的时候很有用，返回更新前的行以及对应的数值)
    SET payment_total = payment_total + NEW.amount
    WHERE invoice_id = NEW.invoice_id;
END $$
DELIMITER ;

use sql_invoicing;
INSERT INTO payments
VALUES (DEFAULT, 5,3,'2019-01-01',10,1)
*/

/*
DELIMITER $$
CREATE TRIGGER payments_after_delete
	AFTER DELETE ON payments
    FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total - OLD.amount
    WHERE invoice_id = OLD.invoice_id;
END $$
DELIMITER ;
*/

-- 查看trigger
-- SHOW TRIGGERS LIKE 'payments%';

-- 使用触发器进行审计 
/*
USE sql_invoicing;
DROP TRIGGER IF EXISTS payments_after_insert

DELIMITER $$

CREATE TRIGGER payments_after_insert
	AFTER INSERT ON payments
    FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total + NEW.amount
    WHERE invoice_id = NEW.invoice_id;
    
    INSERT INTO payments_audit
    VALUES (NEW.client_id, NEW.date,NEW.amount,'Insert',NOW());
END $$
*/

/*
-- 事件 task 是根据计划执行的任务或一堆SQL代码
-- SHOW VARIABLES LIKE 'event%';
-- SET GLOBAL event_scheduler = ON
DELIMITER $$
CREATE EVENT yearly_delete_sale_audit_rows
ON SCHEDULE
	-- AT '2019-01-10' 定期做一次
    -- EVERY 1 HOUR
    EVERY 1 YEAR STARTS '2019-01-01' ENDS '2029-01-01'
DO BEGIN
	DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END $$
DELIMITER ;
*/
SHOW EVENTS LIKE 'yearly%';
-- 删除
DROP EVENT IF EXISTS yearly_delete_sale_audit_rows;
-- 改变
-- 把CREATE 改成ALTER DISABLE
ALTER EVENT yearly_delete_sale_audit_rows ENABLE;






