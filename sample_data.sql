-- ============================================================
-- SAMPLE / SEED DATA for Library Management System
-- Run this AFTER schema.sql has been executed.
-- ============================================================
USE library_management_system;

-- ------------------------------------------------------------
-- Users (Admin + Librarian)
-- Default password for BOTH accounts is: "admin123" / "lib123"
-- (hashes generated with bcrypt - see authentication/auth.py)
-- NOTE: Run authentication/seed_users.py once to insert real
-- bcrypt hashes; the rows below are placeholders that the
-- seeding script will overwrite/update.
-- ------------------------------------------------------------
INSERT INTO users (username, password_hash, full_name, role, email) VALUES
('admin', '$2b$12$PLACEHOLDERHASHADMIN000000000000000000000000000000', 'System Administrator', 'Admin', 'admin@library.edu'),
('librarian1', '$2b$12$PLACEHOLDERHASHLIB0000000000000000000000000000000', 'Priya Sharma', 'Librarian', 'priya@library.edu');

-- ------------------------------------------------------------
-- Categories
-- ------------------------------------------------------------
INSERT INTO categories (category_name) VALUES
('Computer Science'), ('Artificial Intelligence'), ('Mathematics'),
('Physics'), ('Literature'), ('Electronics'), ('Data Science'),
('Self Help'), ('Biography'), ('Fiction');

-- ------------------------------------------------------------
-- Authors
-- ------------------------------------------------------------
INSERT INTO authors (author_name) VALUES
('Thomas H. Cormen'), ('Stuart Russell'), ('Ian Goodfellow'),
('Yuval Noah Harari'), ('James Gosling'), ('Donald Knuth'),
('Andrew Ng'), ('Walter Isaacson'), ('Robert C. Martin'), ('J.K. Rowling');

-- ------------------------------------------------------------
-- Publishers
-- ------------------------------------------------------------
INSERT INTO publishers (publisher_name) VALUES
('MIT Press'), ('Pearson Education'), ('O''Reilly Media'),
('Penguin Random House'), ('Springer'), ('Wiley'), ('McGraw Hill');

-- ------------------------------------------------------------
-- Books (20 sample records)
-- ------------------------------------------------------------
INSERT INTO books (isbn, title, author_id, publisher_id, category_id, publication_year, total_copies, available_copies, rack_location, price) VALUES
('978-0262033848', 'Introduction to Algorithms', 1, 1, 1, 2009, 5, 5, 'A1-01', 1250.00),
('978-1292401133', 'Artificial Intelligence: A Modern Approach', 2, 2, 2, 2020, 4, 4, 'A1-02', 1500.00),
('978-0262035613', 'Deep Learning', 3, 1, 2, 2016, 3, 3, 'A1-03', 1800.00),
('978-0099590088', 'Sapiens: A Brief History of Humankind', 4, 4, 9, 2015, 6, 6, 'B2-01', 499.00),
('978-0131103627', 'The Java Programming Language', 5, 2, 1, 2005, 3, 3, 'A2-01', 950.00),
('978-0201896831', 'The Art of Computer Programming Vol.1', 6, 1, 1, 1997, 2, 2, 'A2-02', 2200.00),
('978-0134685991', 'Machine Learning Yearning', 7, 3, 7, 2018, 4, 4, 'A3-01', 800.00),
('978-1451648539', 'Steve Jobs', 8, 4, 9, 2011, 5, 5, 'B2-02', 599.00),
('978-0134494166', 'Clean Architecture', 9, 2, 1, 2017, 3, 3, 'A2-03', 1100.00),
('978-0747532699', 'Harry Potter and the Philosopher''s Stone', 10, 4, 10, 1997, 8, 8, 'C1-01', 399.00),
('978-0262046305', 'Reinforcement Learning: An Introduction', 2, 1, 2, 2018, 3, 3, 'A1-04', 1400.00),
('978-1098125974', 'Designing Data-Intensive Applications', 9, 3, 7, 2017, 4, 4, 'A3-02', 1650.00),
('978-0073523323', 'Discrete Mathematics and Its Applications', 6, 7, 3, 2011, 5, 5, 'A4-01', 1050.00),
('978-0321573513', 'Algorithms', 1, 2, 1, 2011, 4, 4, 'A1-05', 999.00),
('978-0143127741', 'Homo Deus', 4, 4, 9, 2016, 5, 5, 'B2-03', 549.00),
('978-1593279509', 'Python Crash Course', 9, 3, 1, 2019, 6, 6, 'A2-04', 850.00),
('978-0262539548', 'Hands-On Machine Learning', 7, 1, 7, 2019, 4, 4, 'A3-03', 1750.00),
('978-0307887894', 'Steve Jobs: The Exclusive Biography', 8, 4, 9, 2011, 3, 3, 'B2-04', 599.00),
('978-0439708180', 'Harry Potter and the Chamber of Secrets', 10, 4, 10, 1998, 7, 7, 'C1-02', 399.00),
('978-0262018029', 'Probabilistic Graphical Models', 2, 1, 2, 2009, 2, 2, 'A1-06', 2100.00);

-- ------------------------------------------------------------
-- Members (15 sample records)
-- ------------------------------------------------------------
INSERT INTO members (membership_code, full_name, email, phone, address, membership_type, joined_on) VALUES
('LIB-2026-0001', 'Arjun Mehta', 'arjun.mehta@example.com', '9876543210', 'Chennai, TN', 'Student', '2026-01-10'),
('LIB-2026-0002', 'Sneha Reddy', 'sneha.reddy@example.com', '9876543211', 'Hyderabad, TS', 'Student', '2026-01-12'),
('LIB-2026-0003', 'Karthik Iyer', 'karthik.iyer@example.com', '9876543212', 'Coimbatore, TN', 'Student', '2026-01-15'),
('LIB-2026-0004', 'Dr. Lakshmi Narayan', 'lakshmi.n@example.com', '9876543213', 'Chennai, TN', 'Faculty', '2026-01-05'),
('LIB-2026-0005', 'Rahul Verma', 'rahul.verma@example.com', '9876543214', 'Bangalore, KA', 'Student', '2026-02-01'),
('LIB-2026-0006', 'Ananya Pillai', 'ananya.pillai@example.com', '9876543215', 'Madurai, TN', 'Student', '2026-02-03'),
('LIB-2026-0007', 'Vikram Singh', 'vikram.singh@example.com', '9876543216', 'Delhi, DL', 'Staff', '2026-02-05'),
('LIB-2026-0008', 'Divya Krishnan', 'divya.k@example.com', '9876543217', 'Trichy, TN', 'Student', '2026-02-10'),
('LIB-2026-0009', 'Mohammed Faizal', 'faizal.m@example.com', '9876543218', 'Chennai, TN', 'Student', '2026-02-12'),
('LIB-2026-0010', 'Pooja Nair', 'pooja.nair@example.com', '9876543219', 'Kochi, KL', 'General', '2026-02-15'),
('LIB-2026-0011', 'Sanjay Gupta', 'sanjay.gupta@example.com', '9876543220', 'Mumbai, MH', 'Student', '2026-03-01'),
('LIB-2026-0012', 'Meera Joshi', 'meera.joshi@example.com', '9876543221', 'Pune, MH', 'Faculty', '2026-03-05'),
('LIB-2026-0013', 'Aditya Rao', 'aditya.rao@example.com', '9876543222', 'Vizag, AP', 'Student', '2026-03-10'),
('LIB-2026-0014', 'Nisha Agarwal', 'nisha.a@example.com', '9876543223', 'Jaipur, RJ', 'Student', '2026-03-15'),
('LIB-2026-0015', 'Rohan Desai', 'rohan.desai@example.com', '9876543224', 'Ahmedabad, GJ', 'General', '2026-03-20');

-- ------------------------------------------------------------
-- Transactions (sample issued / returned / overdue records)
-- ------------------------------------------------------------
INSERT INTO transactions (book_id, member_id, issued_by, issue_date, due_date, return_date, fine_amount, status) VALUES
(1, 1, 2, '2026-05-01', '2026-05-15', '2026-05-14', 0.00, 'Returned'),
(2, 2, 2, '2026-05-03', '2026-05-17', NULL, 0.00, 'Issued'),
(3, 3, 1, '2026-05-05', '2026-05-19', '2026-05-25', 30.00, 'Returned'),
(4, 4, 2, '2026-05-10', '2026-05-24', NULL, 0.00, 'Issued'),
(5, 5, 2, '2026-04-01', '2026-04-15', '2026-04-15', 0.00, 'Returned'),
(7, 6, 1, '2026-06-01', '2026-06-15', NULL, 0.00, 'Issued'),
(9, 7, 2, '2026-05-20', '2026-06-03', NULL, 0.00, 'Overdue'),
(10, 8, 2, '2026-06-10', '2026-06-24', NULL, 0.00, 'Issued'),
(11, 9, 1, '2026-04-15', '2026-04-29', '2026-05-02', 15.00, 'Returned'),
(12, 10, 2, '2026-06-05', '2026-06-19', NULL, 0.00, 'Issued'),
(14, 11, 2, '2026-05-25', '2026-06-08', NULL, 0.00, 'Overdue'),
(16, 12, 1, '2026-06-15', '2026-06-29', NULL, 0.00, 'Issued'),
(17, 1, 2, '2026-03-01', '2026-03-15', '2026-03-14', 0.00, 'Returned'),
(19, 13, 2, '2026-06-18', '2026-07-02', NULL, 0.00, 'Issued'),
(6, 14, 1, '2026-04-20', '2026-05-04', '2026-05-10', 30.00, 'Returned');

-- ------------------------------------------------------------
-- Sync available_copies to reflect the above issued transactions
-- ------------------------------------------------------------
UPDATE books SET available_copies = available_copies - 1 WHERE book_id IN (2,4,7,9,10,12,14,16,19);
