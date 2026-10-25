Gym Management System

A web-based application designed to streamline gym operations, manage member subscriptions, track trainer assignments, and monitor facility usage efficiently.

📌 Project Overview

The Gym Management System provides an intuitive platform for gym owners, administrative staff, and members. It simplifies daily operational tasks such as membership enrollment, fee tracking, class scheduling, and member progress monitoring.

Key Objectives

Automation: Reduce manual paperwork and administrative overhead.

Member Management: Easily track member profiles, active plans, and attendance.

Financial Tracking: Keep record of payments, upcoming renewals, and pending dues.

Trainer Allocation: Assign trainers to specific members or workout sessions.

✨ Features

User Authentication & Roles: Secure login with role-based access control (Admin, Trainer, Member).

Dashboard: Visual overview of total members, active subscriptions, monthly revenue, and daily check-ins.

Member Management: Add, update, view, and delete member profiles and membership status.

Subscription & Billing: Manage membership packages, issue invoices, and track payment histories.

Trainer Management: View trainer schedules, assigned clients, and specialization details.

Attendance Tracking: Log member and trainer check-ins.

Reports & Analytics: Generate reports on membership growth, revenue, and attendance.

🛠️ Tech Stack

Frontend: HTML5, CSS3, JavaScript (or Bootstrap / React)

Backend: PHP / Node.js / Python (Django/Flask) (Select as applicable)

Database: MySQL / PostgreSQL / MongoDB (Select as applicable)

Styling: CSS Framework / Custom Styling

🚀 Getting Started

Follow these instructions to get a local copy up and running for development and testing.

Prerequisites

Ensure you have the following installed on your local machine:

Node.js / PHP (XAMPP/WAMP) (depending on backend choice)

MySQL Database Server or relevant DB server

Git

Installation Setup

Clone the Repository

git clone https://github.com/your-username/gym-management-system.git
cd gym-management-system


Configure Database

Start your local database server (e.g., MySQL via XAMPP).

Create a new database named gym_management_db.

Import the provided SQL schema file located in the /database or root directory:

mysql -u root -p gym_management_db < database/schema.sql


Configure Environment Variables

Rename .env.example to .env (if applicable).

Update database connection credentials:

DB_HOST=localhost
DB_USER=root
DB_PASS=your_password
DB_NAME=gym_management_db
PORT=5000


Install Dependencies & Start Application

For Node.js / Express:

npm install
npm start


For PHP / Apache (XAMPP):

Move the project folder into your htdocs directory.

Navigate to http://localhost/gym-management-system in your browser.

📁 Directory Structure

gym-management-system/
├── assets/             # Static files (CSS, JS, Images)
├── config/             # Configuration & Database connection settings
├── database/           # SQL scripts and database dumps
├── includes/           # Reusable UI components (header, footer, nav)
├── models/             # Database models / queries
├── views/              # UI templates / HTML pages
├── controllers/        # Application logic and request handlers
├── .env.example        # Environment variable template
├── index.php / App.js  # Application entry point
└── README.md           # Project documentation


🤝 Contributing

Contributions are welcome! If you'd like to improve this project:

Fork the repository.

Create a feature branch (git checkout -b feature/NewFeature).

Commit your changes (git commit -m 'Add NewFeature').

Push to the branch (git checkout origin feature/NewFeature).

Open a Pull Request.

