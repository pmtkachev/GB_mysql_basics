USE vk;

ALTER TABLE profiles ADD COLUMN is_active BOOL NOT NULL DEFAULT True;

DESCRIBE profiles;

INSERT users VALUES (DEFAULT, 'Petya', 'Petukhov', 'petya@mail.com', '89212223334', NULL, DEFAULT);
SELECT * FROM users ;

INSERT profiles (user_id, gender, birthday)
VALUES (25, 'm', '2015-10-21')

UPDATE profiles 
SET is_active = FALSE 
WHERE TIMESTAMPDIFF(YEAR, profiles.birthday, CURRENT_TIMESTAMP) <= 18;

SELECT * FROM profiles ;