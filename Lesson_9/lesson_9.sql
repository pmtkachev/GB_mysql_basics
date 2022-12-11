-- Task 9.1.1

START TRANSACTION;
INSERT sample.users SELECT * FROM shop.users WHERE id = 1;
DELETE FROM shop.users WHERE id = 1 LIMIT 1;
COMMIT;

-- Task 9.1.2

CREATE VIEW pro_cat AS SELECT p.name name_prod, c.name name_cat FROM products p
JOIN catalogs c ON p.catalog_id = c.id;

SELECT * FROM pro_cat;

-- Task 9.2.1

CREATE USER 'shop_read'@'localhost';
GRANT SELECT ON shop.* TO 'shop_read'@'localhost';

CREATE USER 'shop'@'localhost';
GRANT ALL ON shop.* TO 'shop'@'localhost';

SHOW GRANTS FOR 'shop'@'localhost';
SHOW GRANTS FOR 'shop_read'@'localhost';

-- Task 9.3.1

SELECT HOUR(now());

DELIMITER //

DROP FUNCTION IF EXISTS shop.hello;
CREATE FUNCTION shop.hello ()
RETURNS TINYTEXT DETERMINISTIC
BEGIN
    DECLARE time_now INT;
    SET time_now = HOUR(NOW());
    CASE
        WHEN time_now BETWEEN 6 AND 11 THEN
            RETURN "Доброе утро";
        WHEN time_now BETWEEN 12 AND 17 THEN
            RETURN "Добрый день";
        WHEN time_now BETWEEN 18 AND 23 THEN
            RETURN "Добрый вечер";
        WHEN time_now BETWEEN 0 AND 5 THEN
            RETURN "Доброй ночи";
    END CASE;
END//

DELIMITER ;

-- Task 9.3.2

DROP TRIGGER IF EXISTS nTrigger;
DELIMITER //
CREATE TRIGGER nTrigger BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    IF(ISNULL(NEW.name) AND ISNULL(NEW.description)) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Trigger Warning! NULL in both fields!';
    END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS nullTrigger;
DELIMITER //
CREATE TRIGGER nullTrigger BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    IF(ISNULL(NEW.name)) THEN
        SET NEW.name = 'No Name';
    END IF;
    IF(ISNULL(NEW.description)) THEN
        SET NEW.description = 'No Description';
    END IF;
END //
DELIMITER ;
