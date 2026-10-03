-- ==============================================
-- Basic queries of SQL & Clauses
-- ==============================================

CREATE DATABASE IF NOT EXISTS student;

USE student;

CREATE TABLE IF NOT EXISTS information(
	rollNo INT, 
    name VARCHAR(30),
    age INT
);

INSERT INTO information
VALUES
(101, "GOJIRI", 20),
(102, "ADAM", 30);

SELECT * FROM information;

CREATE DATABASE IF NOT EXISTS instagram;

USE instagram;

CREATE TABLE IF NOT EXISTS users (
  id INT PRIMARY KEY,
  age INT,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) UNIQUE,
  followers INT DEFAULT 0,
  following INT,
  CONSTRAINT CHECK (age >= 13)
);

DROP TABLE IF EXISTS users;

INSERT INTO users
(id, age, name, email, followers, following)
VALUES
(1, 14, "adam", "adam@yahoo.com", 123, 145),
(2, 15, "bob", "bob123@outlook.com", 200, 200),
(3, 16, "casey", "casey@email.com", 300, 306),
(4, 17, "donald", "donald@gmail.com", 200, 105);


INSERT INTO users
(id, age, name, email, followers, following)
VALUES
(5, 14, "eve", "eve@yahoo.in", 400, 145),
(6, 16, "farah", "farah@gmail.in", 4000, 1000);



SELECT name, followers
FROM users
WHERE followers >= 200;

SELECT followers, age
FROM users
WHERE followers = 200 AND age = 16;

SELECT name, age, followers
FROM users
WHERE age > 15 OR followers > 200;

SELECT name, age, followers
FROM users
WHERE age BETWEEN 15 AND 17;

SELECT name, followers, age
FROM users
WHERE email IN ("casey@email.com", "donald@gmail.com", "adam@yahoo.com", "abc@gmail.com");

SELECT age, name
FROM users
WHERE age IN (14, 16);

SELECT age, name 
FROM users
WHERE age NOT IN (15, 17);

SELECT age, name
FROM users
WHERE age > 14
LIMIT 2;

SELECT age, name, followers
FROM users
ORDER BY followers;

-- Aggregate functions

SELECT MAX(followers)
FROM users;

SELECT COUNT(age)
FROM users
WHERE age = 14;

SELECT age, COUNT(name), MAX(followers)
FROM users
GROUP BY age;

SELECT age, COUNT(name), MAX(followers)
FROM users
GROUP BY age
HAVING MAX(followers) >= 400;

SELECT age, COUNT(name), MAX(followers)
FROM users
GROUP BY age
HAVING MAX(followers) >= 400
ORDER BY age DESC
LIMIT 2;

SET SQL_SAFE_UPDATES = 0;

-- To update rows  
UPDATE users
SET followers = 600
WHERE age = 16;

SELECT * FROM users;

-- To delete rows
DELETE FROM users
WHERE age = 14;

-- To add colume using ALTER 
ALTER TABLE users
ADD COLUMN city_new VARCHAR(50) DEFAULT "Delhi";

SELECT * FROM users;

-- To delete column
ALTER TABLE users
DROP COLUMN age;

-- to rename table
ALTER TABLE users
RENAME instaUser;

SELECT * FROM instaUser;

-- To rename column
ALTER TABLE instaUser
CHANGE COLUMN followers subs INT DEFAULT 0;

SELECT * FROM instaUser;

-- TO MODIFY DATATYPE OR CONSTRAINT
ALTER TABLE users
MODIFY subs INT DEFAULT 5;

-- to delete table data
TRUNCATE TABLE instaUser;

SELECT * FROM instaUser;


CREATE TABLE posts(
  id INT PRIMARY KEY,
  content VARCHAR(100),
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO posts
(id, content, user_id)
VALUES
(101, "Hello world", 2),
(102, "Bye Bye", 1),
(103, "Hello Guys", 3);

DROP TABLE IF EXISTS posts;

SELECT * FROM posts;

SHOW DATABASES;
SHOW TABLES;