DELIMITER $$
DROP TRIGGER IF EXISTS payments_after_delete;
CREATE TRIGGER payments_after_delete
	AFTER DELETE ON payments
    FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total - OLD.amount
    WHERE invoice_id = OLD.invoice_id;
    
    INSERT INTO payments_audit
    VALUES (OLD.client_id, OLD.date,OLD.amount,'DELETE',NOW());
END $$
DELIMITER ;