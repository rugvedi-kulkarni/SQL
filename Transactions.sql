-- ==============================================
-- Transactions in SQL
-- ==============================================

DROP DATABASE IF EXISTS prime;

CREATE DATABASE prime;

USE prime;

DROP TABLE IF EXISTS accounts;

DROP DATABASE IF EXISTS prime;

CREATE TABLE accounts (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  balance INT NOT NULL
);

INSERT INTO accounts (id, name, balance) VALUES
(1, 'Gojiri', 1000),
(2, 'Anagha', 2000),
(3, 'Rudra', 3000);

-- Verify rows exist right before the update
-- SELECT * FROM accounts WHERE id IN (1, 2);

START TRANSACTION;

-- UPDATE accounts SET balance = balance - 50 WHERE id = 1;
-- ROLLBACK; -- undo only commited changes
-- UPDATE accounts SET balance = balance + 50 WHERE id = 2;

UPDATE accounts SET balance = balance + 1000 WHERE id = 1;
SAVEPOINT after_wallet_topup;

UPDATE accounts SET balance = balance + 10 WHERE id = 1;
-- error
ROLLBACK TO after_wallet_topup;

COMMIT;

-- Verify rows changed after the update
SELECT * FROM accounts WHERE id IN (1, 2);
