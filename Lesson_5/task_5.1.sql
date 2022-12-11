-- Task 5.1

SELECT * FROM users;

UPDATE users 
SET 
    created_at = NOW(),
    updated_at = NOW();
    
-- Task 5.2

UPDATE users 
SET 
    created_at =  STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'),
    updated_at =  STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');
    
-- Task 5.3

SELECT * FROM storehouses_products;

INSERT storehouses_products (id, storehouse_id, product_id, value) VALUES
(1, 1, 1, 11),
(2, 1, 2, 1),
(3, 1, 1, 5),
(4, 1, 2, 0),
(5, 1, 1, 71);

SELECT * FROM storehouses_products ORDER BY IF (value = 0, 1, 0), value;