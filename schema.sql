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
CREATE TABLE IF NOT EXISTS categories (
    category_id    INT AUTO_INCREMENT PRIMARY KEY,
    category_name  VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS authors (
    author_id      INT AUTO_INCREMENT PRIMARY KEY,
    author_name    VARCHAR(150) NOT NULL UNIQUE
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS publishers (
    publisher_id   INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(150) NOT NULL UNIQUE
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS books (
    book_id           INT AUTO_INCREMENT PRIMARY KEY,
    isbn              VARCHAR(20) UNIQUE,
    title             VARCHAR(255) NOT NULL,
    author_id         INT,
    publisher_id      INT,
    category_id       INT,
    publication_year  YEAR,
    total_copies      INT NOT NULL DEFAULT 1,
    available_copies  INT NOT NULL DEFAULT 1,
    rack_location     VARCHAR(50),
    price             DECIMAL(8,2) DEFAULT 0.00,
    added_on          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (author_id)    REFERENCES authors(author_id)       ON DELETE SET NULL,
    FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id) ON DELETE SET NULL,
    FOREIGN KEY (category_id)  REFERENCES categories(category_id)  ON DELETE SET NULL,
    CHECK (available_copies >= 0 AND available_copies <= total_copies)
) ENGINE=InnoDB;
