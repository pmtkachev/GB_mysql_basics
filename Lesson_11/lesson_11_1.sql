USE shop;

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
    create_at DATETIME DEFAULT NOW(),
    table_ VARCHAR(45) NOT NULL,
    id INT UNSIGNED NOT NULL,
    name VARCHAR(45)) ENGINE=Archive;
    

DROP TRIGGER IF EXISTS shop.users_AFTER_INSERT;
DROP TRIGGER IF EXISTS shop.creation_record_users;

DELIMITER //

CREATE TRIGGER creation_record_users AFTER INSERT ON users FOR EACH ROW
BEGIN
    INSERT INTO logs (create_at, table_, id, name) VALUES
    (NOW(), 'users', new.id, new.name);
END//

DELIMITER ;


DROP TRIGGER IF EXISTS creation_record_catalogs;

DELIMITER //

CREATE TRIGGER creation_record_catalogs AFTER INSERT ON catalogs FOR EACH ROW
BEGIN
    INSERT INTO logs (create_at, table_, id, name)
    VALUES (NOW(), 'catalogs', new.id, new.name);
END//

DELIMITER ;

DROP TRIGGER IF EXISTS creation_record_products;

DELIMITER //

CREATE TRIGGER creation_record_products AFTER INSERT ON products FOR EACH ROW
BEGIN
    INSERT INTO logs (create_at, table_, id, name)
    VALUES (NOW(), 'products', new.id, new.name);
END//

DELIMITER ;