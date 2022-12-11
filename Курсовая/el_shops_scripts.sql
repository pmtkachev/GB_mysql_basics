USE el_shop;

-- Выбираем промокоды, которые существуют в магазине
SELECT promocode, name FROM discounts d;

-- Смотрим, кто совершал заказы на сайте, используя вложенный запрос
SELECT first_name, lastname FROM profiles WHERE user_id IN (SELECT user_id FROM orders);

-- Смотрим какие заказы осуществили пользователи, используя JOIN
SELECT u.login, p2.first_name, p2.lastname, p.name, s.status, o.time_of_order FROM orders o
JOIN users u ON o.user_id = u.id
JOIN profiles p2 ON p2.user_id = u.id
JOIN products p ON o.product_id = p.id
JOIN statuses s ON o.status_id = s.id;

-- Смотрим на какие товары проходят скидки, используя JOIN
SELECT p.name, d.promocode, d.name FROM discounts d
JOIN products p ON p.id = d.product_id;

-- Группировка товаров по производителю
INSERT INTO products (catalog_id, name, dev_id, price) VALUES
(1, 'Samsung A52', 1, 30000),
(3, 'Samsung Galaxy Watch 4', 1, 17000),
(1, 'iPhone X', 5, 25000);

SELECT p.dev_id, d.name, COUNT(*) AS cnt_products FROM products p
JOIN devs d ON p.dev_id = d.id
GROUP BY dev_id;

-- Группировка заказов по пользователю
SELECT u.login, COUNT(*) AS cnt_orders FROM orders o 
JOIN users u ON u.id = o.user_id GROUP BY u.login;

-- Создаем представления
-- Создаем представление для вывода последнего заказа
CREATE OR REPLACE VIEW last_order AS 
SELECT u.login, p2.first_name, p2.lastname, p.name, s.status, o.time_of_order FROM orders o
JOIN users u ON o.user_id = u.id
JOIN profiles p2 ON p2.user_id = u.id
JOIN products p ON o.product_id = p.id
JOIN statuses s ON o.status_id = s.id
ORDER BY o.id DESC LIMIT 1;

INSERT INTO orders (user_id, product_id, status_id) VALUES 
(3, 6, 1);

SELECT * FROM last_order;

-- Создаем представление для просмотра отзывов, которые оставили пользователи с сортировкой по рейтингу
CREATE OR REPLACE VIEW feedbacks AS
SELECT p.first_name, p.lastname, p2.name, r.name AS rate, f.description FROM feedback f 
JOIN rates r ON r.id = f.rate_id
JOIN users u ON u.id = f.user_id
JOIN profiles p ON p.user_id = u.id
JOIN products p2 ON p2.id = f.product_id ORDER BY f.rate_id;

SELECT * FROM feedbacks;

-- Создаем функцию, где во входном параметре передаем id пользователя, а возвращаем количество заказов,
-- которые он осуществил
DROP FUNCTION IF EXISTS cnt_orders_user;

DELIMITER //

CREATE FUNCTION cnt_orders_user(u_id BIGINT UNSIGNED)
RETURNS INT
DETERMINISTIC
BEGIN 
    -- Переменные
    DECLARE cnt INT;

    SET cnt = (SELECT count(*) FROM orders WHERE user_id = u_id);

    RETURN cnt;
END//


DELIMITER ;

-- Количество заказов пользователя с id = 1
SELECT cnt_orders_user(1);