USE vk;

DELETE FROM messages WHERE created_at >= current_timestamp;

SELECT * FROM messages;