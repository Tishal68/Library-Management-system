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
CREATE TABLE IF NOT EXISTS members (
    member_id        INT AUTO_INCREMENT PRIMARY KEY,
    membership_code  VARCHAR(20) NOT NULL UNIQUE,
    full_name        VARCHAR(100) NOT NULL,
    email            VARCHAR(100),
    phone            VARCHAR(20),
    address          VARCHAR(255),
    membership_type  ENUM('Student', 'Faculty', 'Staff', 'General') DEFAULT 'Student',
    joined_on        DATE DEFAULT (CURRENT_DATE),
    is_active        BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS transactions (
    transaction_id   INT AUTO_INCREMENT PRIMARY KEY,
    book_id          INT NOT NULL,
    member_id        INT NOT NULL,
    issued_by        INT,
    issue_date       DATE NOT NULL,
    due_date         DATE NOT NULL,
    return_date      DATE NULL,
    fine_amount      DECIMAL(8,2) DEFAULT 0.00,
    status           ENUM('Issued', 'Returned', 'Overdue') NOT NULL DEFAULT 'Issued',
    FOREIGN KEY (book_id)   REFERENCES books(book_id)     ON DELETE CASCADE,
    FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE CASCADE,
    FOREIGN KEY (issued_by) REFERENCES users(user_id)     ON DELETE SET NULL
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS fine_settings (
    setting_id        INT AUTO_INCREMENT PRIMARY KEY,
    fine_per_day       DECIMAL(6,2) NOT NULL DEFAULT 5.00,
    loan_period_days   INT NOT NULL DEFAULT 14
) ENGINE=InnoDB;
INSERT INTO fine_settings (fine_per_day, loan_period_days)
SELECT 5.00, 14 WHERE NOT EXISTS (SELECT 1 FROM fine_settings);

CREATE INDEX idx_books_title         ON books(title);
CREATE INDEX idx_members_name        ON members(full_name);
CREATE INDEX idx_transactions_status ON transactions(status);
CREATE INDEX idx_transactions_due    ON transactions(due_date);
CREATE OR REPLACE VIEW v_active_issues AS
SELECT
    t.transaction_id,
    b.title         AS book_title,
    m.full_name     AS member_name,
    m.membership_code,
    t.issue_date,
    t.due_date,
    DATEDIFF(CURDATE(), t.due_date) AS days_overdue
FROM transactions t
JOIN books   b ON t.book_id = b.book_id
JOIN members m ON t.member_id = m.member_id
WHERE t.status = 'Issued';


