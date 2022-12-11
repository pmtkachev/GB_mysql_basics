USE vk;

SHOW TABLES;

INSERT IGNORE users (first_name, lastname, email, phone)
VALUES ('Pavel', 'Tkachev', 'pm@m.ru', '89274568790'),
('Olga', 'Khobta', 'oh@m.ru', '89274568791'),
('Irina', 'Tkacheva', 'it@m.ru', '89274568792'),
('Mikhail', 'Tkachev', 'mt@m.ru', '89274568793'),
('Marcella', 'Gottlieb', 'dedrick.rippin@example.net', '577-278-718'),
('Armando', 'Bosco', 'myriam.cummerata@example.com', '(010)550-77'),
('Glen', 'Kilback', 'adell.spinka@example.org', '+88(0)29390'),
('Julius', 'Rath', 'brodriguez@example.com', '1-926-481-1'),
('Lenore', 'Wisozk', 'tre64@example.org', '857-379-787'),
('Oda', 'Shanahan', 'mkiehn@example.com', '576.129.817');

SELECT * FROM users ;

INSERT IGNORE profiles (user_id, gender, birthday)
VALUES (1, 'm', '1997-12-01'),
(2, 'f', '1997-12-01'),
(3, 'f', '1996-11-01'),
(4, 'm', '1995-02-04'),
(15, 'm', '1991-12-31'),
(16, 'm', '1990-10-01'),
(17, 'm', '1995-11-11'),
(18, 'm', '1993-12-21'),
(19, 'f', '1994-10-11'),
(20, 'f', '1997-02-07');

SELECT * FROM profiles ;

INSERT IGNORE messages (from_user_id, to_user_id, txt)
VALUES (1, 2, '1997-12-01'),
(2, 3, '1997-12-01'),
(3, 4, '1996-11-01'),
(4, 15, '1995-02-04'),
(15, 1, '1991-12-31'),
(16, 4, '1990-10-01'),
(17, 3, '1995-11-11'),
(18, 2, '1993-12-21'),
(19, 15, '1994-10-11'),
(20, 1, '1997-02-07');


SELECT * FROM messages ;

INSERT IGNORE friend_requests (from_user_id, to_users_id)
VALUES (1, 2),
(2, 3),
(3, 4),
(4, 15),
(15, 1),
(16, 4),
(17, 3),
(18, 2),
(19, 15),
(20, 1);

SELECT * FROM friend_requests ;

INSERT IGNORE communities (name, admin_id)
VALUES ('Num 1', 2),
('Num 2', 3),
('Num 3', 4),
('Num 4', 15),
('Num 5', 1),
('Num 6', 4),
('Num 7', 3),
('Num 8', 2),
('Num 9', 15),
('Num 10', 1);

SELECT * FROM communities ;

INSERT IGNORE communities_users (community_id, user_id)
VALUES (1, 2),
(1, 3),
(2, 4),
(3, 15),
(2, 1),
(1, 4),
(2, 3),
(3, 2),
(4, 15),
(5, 1);

SELECT * FROM communities_users ;

INSERT IGNORE media_types (name)
VALUES ('Image'),
('Music'),
('Run'),
('Python'),
('Video');

SELECT * FROM media_types;

INSERT IGNORE media (user_id, file_name, media_types_id)
VALUES (1, 'img.png', 1),
(2, 'img.mp4', 5),
(3, 'img1.png', 1),
(4, 'img.py', 4),
(15, 'img.exe', 3);

SELECT * FROM media;