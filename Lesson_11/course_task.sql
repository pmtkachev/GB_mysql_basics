-- Создаем базу данных
DROP DATABASE IF EXISTS el_shop;
CREATE DATABASE el_shop;

-- Выбираем созданную базу
USE el_shop;

-- Создаем таблицу для пользователей
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    login VARCHAR(150) NOT NULL UNIQUE,
    password_hash CHAR(65) DEFAULT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP);


-- Создаем таблицу профилей, где будут храниться данные о пользователях
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
    user_id BIGINT UNSIGNED PRIMARY KEY,
    first_name VARCHAR(150) NOT NULL,
    lastname VARCHAR(150) NOT NULL,
    birthday DATE NOT NULL,
    address VARCHAR(250),
    phone CHAR(11) UNIQUE,
    FOREIGN KEY (user_id) REFERENCES users (id));

-- Создаем таблицу с каталогами товаров
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE);

-- Создаем таблицу с производителями
DROP TABLE IF EXISTS devs;
CREATE TABLE devs(
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT DEFAULT NULL);

-- Создаем таблицу с товарами
DROP TABLE IF EXISTS products;
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    catalog_id BIGINT UNSIGNED,
    name VARCHAR(150) NOT NULL,
    ram INT DEFAULT NULL,
    rom INT DEFAULT NULL,
    dev_id BIGINT UNSIGNED,
    price INT DEFAULT 0 NOT NULL,
    FOREIGN KEY (catalog_id) REFERENCES catalogs (id),
    FOREIGN KEY (dev_id) REFERENCES devs (id));

-- Создаем таблицу, где храним оценки
DROP TABLE IF EXISTS rates;
CREATE TABLE rates (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50));

-- Создаем таблицу с отзывами
DROP TABLE IF EXISTS feedback;
CREATE TABLE feedback (
    id SERIAL PRIMARY KEY,
    rate_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    product_id BIGINT UNSIGNED NOT NULL,
    description TEXT,
    date_feed DATETIME DEFAULT CURRENT_TIMESTAMP(),
    FOREIGN KEY (rate_id) REFERENCES rates (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (product_id) REFERENCES products (id));

-- Создаем таблицу с акциями
DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
    id SERIAL PRIMARY KEY,
    product_id BIGINT UNSIGNED NOT NULL,
    promocode VARCHAR(50) NOT NULL,
    name VARCHAR (100),
    FOREIGN KEY (product_id) REFERENCES products (id));

-- Создаем таблицу со статусами заказа
DROP TABLE IF EXISTS statuses;
CREATE TABLE statuses (
    id SERIAL PRIMARY KEY,
    status VARCHAR(50) NOT NULL);

-- Создаем таблицу с заказами
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    product_id BIGINT UNSIGNED NOT NULL,
    status_id BIGINT UNSIGNED NOT NULL DEFAULT 1, 
    time_of_order DATETIME DEFAULT CURRENT_TIMESTAMP(),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (product_id) REFERENCES products (id),
    FOREIGN KEY (status_id) REFERENCES statuses (id));

-- Наполняем таблицы данными
INSERT INTO catalogs (name) VALUES 
('Смартфоны'),
('Ноутбуки'),
('Носимая электроника');

INSERT INTO users (login) VALUES
('pmtkachev'),
('hacker'),
('anonim'),
('admin'),
('test');

INSERT INTO devs (name) VALUES 
('Samsung'),
('Xiaomi'),
('Huawei'),
('Dell'),
('Apple');

INSERT INTO products (catalog_id, name, ram, rom, dev_id, price) VALUES
(1, 'Samsung S21', 8, 128, 1, 50000),
(1, 'iPhone 11', 4, 64, 5, 45000),
(2, 'Dell Vostro 3515-5418', 8, 256, 4, 68000),
(1, 'Xiaomi Mi 11 Lite', 8, 128, 2, 25000),
(3, 'HUAWEI GT 3', DEFAULT , 4, 3, 17000);

INSERT INTO rates (name) VALUES 
('Отличный товар'),
('Хороший товар'),
('Товар не понравился');

INSERT INTO feedback (rate_id, user_id, product_id, description) VALUES 
(1, 1, 1, 'Товар соответствует заявленным характеристикам'),
(2, 3, 2, 'Телефон мне понравился, доставка быстрая'),
(3, 4, 3, 'Слабый ноут, за такую цену можно и получше найти');

INSERT INTO discounts (product_id, promocode, name) VALUES 
(2, 'IPHONE', 'Скидка 10% по промокоду: IPHONE'),
(4, 'SALE20', 'Скидка 20% на все смартфоны Xiaomi по промокоду: SALE20');

INSERT INTO statuses (status) VALUES 
('Не оплачено'),
('Оплачено');

INSERT INTO orders (user_id, product_id, status_id) VALUES 
(1, 1, 2),
(3, 2, DEFAULT),
(5, 4, 2),
(2, 5, DEFAULT),
(1, 3, 2);

INSERT INTO profiles (user_id, first_name, lastname, birthday, phone) VALUES 
(1, 'Pavel', 'Tkachev', '1996-07-31', '89999999999'),
(2, 'Hacker', 'Hacker', '1990-02-21', '89999999998'),
(3, 'Anonim', 'Anonim', '1970-01-31', '89999999997'),
(4, 'Admin', 'Admin', '1996-07-31', '89999999996'),
(5, 'Test', 'Test', '2000-05-10', '89999999995');
