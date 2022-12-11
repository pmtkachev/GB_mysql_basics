CREATE DATABASE IF NOT EXISTS example;
USE example;

CREATE TABLE IF NOT EXISTS users(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO users VALUES
    (NULL, 'Pavel'),
    (NULL, 'Tkachev');

SELECT * FROM users;