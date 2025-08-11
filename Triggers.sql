CREATE DATABASE IF NOT EXISTS demodb;
USE demodb;

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS audit_logs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  action VARCHAR(50) NOT NULL,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (username, email, password) VALUES
  ('user1', 'oZb0y@example.com', 'password1'),
  ('user2', 'H4qP2@example.com', 'password2'),
  ('user3', 'G2k3X@example.com', 'password3');


DELIMITER $$
CREATE TRIGGER after_user_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN

  INSERT INTO audit_logs (action, username, email, timestamp)
  VALUES ('INSERT', NEW.username, NEW.email, NOW()); -- NEW IS THE NEWLY INSERTED ROW,ITS USED TO ACCESS THE NEW VALUES

END $$
DELIMITER ;


INSERT INTO users (username, email, password) VALUES
  ('user4', '5k5x9@example.com', 'password4');


SELECT * FROM users;
SELECT * FROM audit_logs;