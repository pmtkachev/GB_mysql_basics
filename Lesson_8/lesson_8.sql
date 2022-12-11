USE vk;

-- Task 8.1

SELECT u.id, u.firstname, u.lastname FROM users u
JOIN messages m ON m.from_user_id = u.id WHERE m.to_user_id = 6
GROUP BY m.from_user_id ORDER BY COUNT(from_user_id) DESC LIMIT 1;

-- Task 8.2

SELECT COUNT(*) AS cnt FROM users u 
JOIN posts p ON p.user_id = u.id
JOIN posts_likes pl ON p.id = pl.post_id
JOIN profiles p2 ON p2.user_id = u.id
WHERE (TIMESTAMPDIFF(YEAR, p2.birthday, NOW()) < 10) AND pl.like_type = 1;

-- Task 8.3

SELECT p.gender, COUNT(p.gender) AS total FROM posts_likes AS pl 
JOIN profiles AS p ON (p.user_id = pl.user_id && p.gender IN ('f','m'))
GROUP BY p.gender
ORDER BY total DESC;
