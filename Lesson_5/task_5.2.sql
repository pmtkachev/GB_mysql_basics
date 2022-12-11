-- Task 5.2.1
USE shop;

SELECT * FROM users;

SELECT ROUND(AVG(TIMESTAMPDIFF(YEAR, birthday_at, CURRENT_TIMESTAMP)), 2) AS AVG FROM users;

-- Task 5.2.2
SELECT CASE WEEKDAY(birthday_at) WHEN 0 THEN 'Понедельник' 
WHEN 1 THEN 'Вторник' 
WHEN 2 THEN 'Среда' 
WHEN 3 THEN 'Четверг' 
WHEN 4 THEN 'Пятница' 
WHEN 5 THEN 'Суббота' 
WHEN 6 THEN 'Воскресенье' 
ELSE -1 END as wd, COUNT(birthday_at) as num FROM users GROUP BY wd ORDER BY FIELD(wd,'Понедельник','Вторник','Среда','Четверг','Пятница','Суббота','Воскресенье');

