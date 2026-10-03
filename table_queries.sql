-- ==============================================
-- Table queries
-- ==============================================

CREATE DATABASE facebook;

USE facebook;

DROP TABLE IF EXISTS user_details;

CREATE TABLE IF NOT EXISTS user_details(
  account_id INT PRIMARY KEY,
  username VARCHAR(50) UNIQUE,
  age INT ,
  location VARCHAR(30),
  CONSTRAINT CHECK (age >= 13)
);

INSERT INTO user_details
(account_id, username, age, location)
VALUES
(101, "rsk@gmail.com", 26, "Pune"),
(102, "gsk@gmail.in", 20, "Delhi"),
(103, "ask@yahoo.com", 45, "Pune"),
(104, "sktg@yahoo.in", 62, "Mumbai"),
(105, "qsf@outlook.com", 24, "Pune"); 

SELECT * FROM user_details;

ALTER TABLE user_details
ADD COLUMN password VARCHAR(50) NOT NULL;

SET SQL_SAFE_UPDATES = 0; -- to update details

UPDATE user_details
SET password = "admin"
WHERE location = "Delhi";

-- DELETE FROM user_details
-- WHERE location = "Pune";

SELECT * FROM new_users;

ALTER TABLE user_details
RENAME new_users;

ALTER TABLE new_users
ADD COLUMN followers INT DEFAULT 0;

ALTER TABLE new_users
CHANGE COLUMN followers subscriptions INT DEFAULT 0;

ALTER TABLE new_users
DROP COLUMN location;

SELECT age, username, account_id
FROM new_users
WHERE age > 25
ORDER BY account_id DESC
LIMIT 3;