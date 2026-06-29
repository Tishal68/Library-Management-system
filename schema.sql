CREATE DATABASE IF NOT EXISTS library_management_system;
USE library_management_system;
CREATE TABLE IF NOT EXISTS users (
    user_id        INT AUTO_INCREMENT PRIMARY KEY,
    username       VARCHAR(50)  NOT NULL UNIQUE,
    password_hash  VARCHAR(255) NOT NULL,
    full_name      VARCHAR(100) NOT NULL,
    role           ENUM('Admin', 'Librarian') NOT NULL DEFAULT 'Librarian',
    email          VARCHAR(100),
    created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active      BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;
