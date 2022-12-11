-- Task 7.1
USE shop;

SELECT name AS orders FROM users WHERE id IN (SELECT user_id FROM orders);

-- Task 7.2

SELECT p.name AS 'Product', c.name AS 'Catalog' FROM products AS p
JOIN
catalogs AS c WHERE c.id = p.catalog_id;