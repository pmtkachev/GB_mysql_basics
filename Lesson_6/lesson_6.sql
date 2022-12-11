-- Task 6.1
-- Выбираем пользователя с id = 6

USE vk;

SELECT id, lastname, firstname FROM users WHERE
id = (SELECT from_user_id FROM messages WHERE
to_user_id = 6 GROUP BY from_user_id ORDER BY COUNT(from_user_id)
DESC LIMIT 1);

-- Task 6.2

SELECT count(*)  FROM posts_likes WHERE
post_id IN 
(SELECT id FROM posts WHERE user_id IN 
(SELECT user_id FROM profiles WHERE TIMESTAMPDIFF(YEAR, profiles.birthday, NOW()) < 10)) AND like_type = 1;

-- Task 6.3

SELECT COUNT(*), 'Женщины'
FROM posts_likes
WHERE user_id IN (SELECT user_id FROM profiles WHERE gender = 'f') AND like_type = 1
UNION
SELECT COUNT(*), 'Мужчины'
FROM posts_likes
WHERE user_id IN (SELECT user_id FROM profiles WHERE gender = 'm') AND like_type = 1;