USE vk;

-- Игры, в которые играют пользователи. 
-- Одна игра не добавляется пользователю несколько раз

CREATE TABLE IF NOT EXISTS games (
    game_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(150) NOT NULL,
    description VARCHAR(255),
    user_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (game_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users (id)
); 

-- Добавляем игры пользователям

INSERT games VALUES (1, 'Racing', 'Racing VK', 1);
INSERT games VALUES (1, 'Racing', 'Racing VK', 2);
INSERT games VALUES (2, 'Mario', 'Platformer VK', 1);

SELECT * FROM games;

-- Статусы пользователей связываем с id пользователя
-- Статус по умолчанию 'Hi, I am on VK'

CREATE TABLE IF NOT EXISTS statuses (
    status_id SERIAL PRIMARY KEY,
    txt_status VARCHAR(50) DEFAULT 'Hi, I am on VK',
    user_id BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT statuses VALUES (DEFAULT, DEFAULT, 1);
INSERT statuses VALUES (DEFAULT, 'DEFAULT', 2);

SELECT * FROM statuses;

-- Аудиозаписи пользователей

CREATE TABLE IF NOT EXISTS music (
    music_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    album VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    artist VARCHAR(50) NOT NULL,
    INDEX (name),
    PRIMARY KEY (music_id, user_id),
    FOREIGN  KEY (user_id) REFERENCES users (id)
);

INSERT music VALUES (1, 1, 'Shadow Zone', 'New Pain', 'Static-X');
INSERT music VALUES (2, 1, 'Human', 'Painkiller', 'Three Days Grace');

SELECT * FROM music;