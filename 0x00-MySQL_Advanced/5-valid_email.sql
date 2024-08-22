-- Create a trigger that decreases item quantity after adding a new order
DELIMITER //

CREATE TRIGGER valid_email_before_update
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF NEW.email NOT REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid email';
    END IF;
END;

DELIMITER;