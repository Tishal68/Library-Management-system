📚 Library Management System
A complete, professional desktop Library Management System built with Python, CustomTkinter, and MySQL — developed as a second-year B.Tech (AI & Data Science) academic project. Designed to be realistic, well-structured, and genuinely discussable in internship interviews.
![Python](https://img.shields.io/badge/Python-3.10+-blue)
![CustomTkinter](https://img.shields.io/badge/GUI-CustomTkinter-2563EB)
![MySQL](https://img.shields.io/badge/Database-MySQL-orange)
![License](https://img.shields.io/badge/License-MIT-green)
---
✨ Features
🖥️ Modern Professional GUI
Dark / Light mode toggle
Sidebar navigation with active-state highlighting
Dashboard KPI cards
Embedded Matplotlib charts (pie, bar, line)
Search bars with live filtering
Toast-style status notifications
🔐 Authentication
Admin & Librarian login roles
Passwords hashed with bcrypt (salted, never stored in plain text)
Role-based settings access
📖 Book Management
Add / Edit / Delete books
Search by title, author, ISBN
Filter by category, author, publisher
Live availability tracking
🧑‍🤝‍🧑 Member Management
Add / Edit / Delete members
Auto-generated membership IDs (e.g. `LIB-2026-0001`)
Search by name, ID, or email
🔁 Issue & Return System
Issue books to members with automatic due-date calculation
Return books with automatic fine calculation for late returns
Real-time book availability sync
Currently-issued + full transaction history views
📊 Dashboard Analytics
Total Books, Issued Books, Available Books, Total Members, Overdue Books, Monthly Transactions
📈 Reports & Data Visualization
Most Borrowed Books (bar chart)
Popular Categories (pie chart)
Monthly Issue Trends (line chart)
Fine Collection Report (bar chart)
Library Usage Statistics
Full catalogue / member exports
📤 Export
Export any report to Excel (.xlsx) with styled headers (OpenPyXL)
Export to CSV
---
🗂️ Project Structure
```
LibraryManagementSystem/
├── main.py                      # Application entry point
├── requirements.txt
├── README.md
│
├── gui/                         # All CustomTkinter UI screens
│   ├── login_window.py
│   ├── main_app.py               # Sidebar + page-switching shell
│   ├── sidebar.py
│   ├── dashboard.py
│   ├── book_management.py
│   ├── member_management.py
│   ├── issue_return.py
│   ├── reports_window.py
│   ├── settings_page.py
│   ├── widgets.py                # StatCard, SearchBar, DataTable
│   ├── notification.py           # Toast notifications
│   └── theme.py                  # Colors / fonts / dark-light toggle
│
├── database/
│   ├── schema.sql                # Full normalized MySQL schema
│   ├── sample_data.sql           # Seed data (books, members, txns)
│   ├── db_connection.py          # Singleton MySQL connection
│   └── models.py                 # Book / Member / Transaction OOP models
│
├── authentication/
│   ├── auth.py                   # bcrypt hashing + login logic
│   └── seed_users.py             # One-time default-user seeding script
│
├── reports/
│   ├── report_generator.py       # Pandas DataFrame builders
│   ├── chart_generator.py        # Matplotlib figure builders
│   └── export_manager.py         # Excel/CSV export (OpenPyXL)
│
├── assets/                       # Icons / images (add your own)
└── screenshots/                  # App screenshots for this README
```
---
🛠️ Tech Stack
Layer	Technology
GUI	CustomTkinter, Pillow
Database	MySQL 8.0+
Data handling	Pandas
Charts	Matplotlib
Excel export	OpenPyXL
Password security	bcrypt
Language	Python 3.10+ (OOP design)
---
⚙️ Setup Instructions
1. Clone & install dependencies
```bash
git clone https://github.com/<your-username>/LibraryManagementSystem.git
cd LibraryManagementSystem
pip install -r requirements.txt
```
2. Create the MySQL database
```bash
mysql -u root -p < database/schema.sql
mysql -u root -p < database/sample_data.sql      # optional sample data
```
3. Configure your DB credentials
Edit `database/db_connection.py`:
```python
DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "your_mysql_password",   # <-- change this
    "database": "library_management_system",
}
```
4. Seed default login accounts (real bcrypt hashes)
```bash
python -m authentication.seed_users
```
This creates:
Role	Username	Password
Admin	admin	admin123
Librarian	librarian1	lib123
5. Run the application
```bash
python main.py
```
---
🧱 Database Design
The schema is normalized to 3NF:
`authors`, `publishers`, `categories` are separate lookup tables (no repeated text in `books`)
`books`, `members`, `transactions`, `users` are linked via foreign keys
`transactions` is the central ledger driving fine calculation and analytics
A `fine_settings` table makes the fine-per-day/loan-period configurable instead of hard-coded
See `database/schema.sql` for the full DDL with constraints, indexes, and a convenience view (`v_active_issues`).
---
🧠 Design Notes (for interview discussion)
3-tier architecture: GUI layer (`gui/`) never writes raw SQL — it calls OOP model classes in `database/models.py`, which call the `DatabaseConnection` singleton.
Singleton pattern used for the DB connection to avoid opening multiple MySQL connections.
bcrypt salted hashing for passwords (never plain text, never reversible).
Live availability sync: issuing/returning a book updates `available_copies` in the same transaction logic, so the dashboard and book list are always accurate.
Configurable business rules: fine rate & loan period are stored in the DB (`fine_settings`), not hard-coded, so an Admin can tune them without touching code.
Pandas + OpenPyXL separate "data shaping" from "file writing" — reports are built as DataFrames first, then exported, which also makes them easy to test independently of the GUI.
