-- DELIMITER 自己设置符号,新的分隔符;把这些语句当做一个整体！
USE sql_invoicing;
/* 
DELIMITER $$
CREATE PROCEDURE get_clients()
BEGIN
	SELECT * FROM clients;
END$$

DELIMITER ;
*/

/*DELIMITER $$
CREATE PROCEDURE get_invoices_with_balance()
BEGIN
	SELECT * 
    FROM invoices_with_balance
    WHERE balance > 0;
END$$

DELIMITER ;
*/

/* 
DROP PROCEDURE IF EXISTS get_clients_by_state;

DELIMITER $$
CREATE PROCEDURE get_clients_by_state
(
-- String 2 VARCHAR不知道固定的长度
	state CHAR(2)
)
BEGIN
	SELECT * FROM clients c
    WHERE c.state = state;
END$$

DELIMITER ;
*/

/*
DROP PROCEDURE IF EXISTS get_invoices_by_client;
DELIMITER $$
CREATE PROCEDURE get_invoices_by_client
(
	client_id INT
)
BEGIN
	SELECT * FROM invoices i
    WHERE i.client_id = client_id;
END$$
DELIMITER ;
*/
/*
DROP PROCEDURE IF EXISTS get_clients_by_state;

DELIMITER $$
CREATE PROCEDURE get_clients_by_state
(
	state CHAR(2)
)
BEGIN	
		SELECT * FROM clients c
		WHERE c.state = IFNULL(state,c.state);	
END$$

DELIMITER ;
*/
-- DROP PROCEDURE IF EXISTS get_payments;
/*
BEGIN
	IF payment_amount <= 0 THEN
		SIGNAL SQLSTATE '22003' 
        --We get can get the error from the website
        SET MESSAGE_TEXT = 'Invalid payment amount';
	END IF;    
	UPDATE invoice i
    SET 
		i.payment_total = payment_amount,
        i.payment_date = payment_date
	WHERE i.invoice_id = invoice_id;
END
*/
-- 验证参数
/*
	IF payment_amount <= 0 THEN
		SIGNAL SQLSTATE '22003' 
        SET MESSAGE_TEXT = 'Invalid payment amount';
	END IF;  
*/

-- 输出参数
/*
CREATE PROCEDURE get_unpaid_invoices_for_client(
	client_id INT,
    OUT invoices_count INT,
    OUT invoices_total DECIMAL(9,2)
)
BEGIN
	SELECT COUNT(*), SUM(invoice_total)
    INTO invoices_count,invoices_total
    FROM invoices i
    WHERE i.client_id = client_id 
    AND payment_total = 0;
END
*/

-- User or session variables
-- SET @invoices_count = 0
-- Local variable 仅仅在执行过程中有用 
-- DECIMAL(9,2) 最多9位数,有2位小数

-- create function
/*
CREATE FUNCTION get_risk_factor_for_client
(
	client_id INT
)
RETURNS INTEGER
-- 设置属性确定性，给定同样的一组值，返回相同的值
-- DETERMINISTIC 
-- 函数配置选择语句，用以读取一些数据
READS SQL DATA 
-- 函数有插入、更新或者删除
-- MODIFIES SQL DATA 
BEGIN
	DECLARE risk_factor DECIMAL(9,2) DEFAULT 0;
    DECLARE invoices_total DECIMAL(9,2);
    DECLARE invoices_count INT;
    
    SELECT COUNT(*),SUM(invoice_total)
    INTO invoices_count,invoices_total
    FROM invoices i 
    WHERE i.client_id = client_id;
    
    SET risk_factor = invoices_total / invoices_count * 5;
    
	RETURN IFNULL(risk_factor,0);
END
*/
SELECT 
	client_id,
    name,
    get_risk_factor_for_client(client_id) AS risk_factor
FROM clients

-- DROP FUNCTION get_risk_factor_for_client;















