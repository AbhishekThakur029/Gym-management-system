-- =====================================================
-- GYM MANAGEMENT SYSTEM - COMPLETE SQL SCRIPT
-- Academic Year: 2026-27
-- Student: ABHISHEK (UID: 25BCD10088)
-- =====================================================

-- 4.1 DATABASE AND TABLE CREATION
CREATE DATABASE IF NOT EXISTS gym_management;
USE gym_management;

-- Create Members Table
CREATE TABLE Members (
  member_id INT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(100) NOT NULL,
  phone VARCHAR(15) UNIQUE,
  email VARCHAR(100) UNIQUE,
  gender VARCHAR(20),
  join_date DATE NOT NULL,
  status ENUM('Active','Inactive') DEFAULT 'Active'
);

-- Create Trainers Table
CREATE TABLE Trainers (
  trainer_id INT PRIMARY KEY AUTO_INCREMENT,
  trainer_name VARCHAR(100) NOT NULL,
  specialization VARCHAR(80),
  phone VARCHAR(15) UNIQUE,
  monthly_salary DECIMAL(10,2) NOT NULL CHECK (monthly_salary >= 0)
);

-- Create Memberships Table
CREATE TABLE Memberships (
  membership_id INT PRIMARY KEY AUTO_INCREMENT,
  member_id INT NOT NULL,
  plan_name VARCHAR(40) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  fee DECIMAL(10,2) NOT NULL CHECK (fee >= 0),
  trainer_id INT,
  FOREIGN KEY (member_id) REFERENCES Members(member_id),
  FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id),
  CHECK (end_date >= start_date)
);

-- Create Attendance Table
CREATE TABLE Attendance (
  attendance_id INT PRIMARY KEY AUTO_INCREMENT,
  member_id INT NOT NULL,
  attendance_date DATE NOT NULL,
  check_in TIME,
  FOREIGN KEY (member_id) REFERENCES Members(member_id),
  UNIQUE (member_id, attendance_date)
);

-- Create Payments Table
CREATE TABLE Payments (
  payment_id INT PRIMARY KEY AUTO_INCREMENT,
  member_id INT NOT NULL,
  amount DECIMAL(10,2) NOT NULL CHECK (amount >= 0),
  payment_date DATE NOT NULL,
  payment_method ENUM('Cash','UPI','Card','Bank Transfer') NOT NULL,
  payment_status ENUM('Paid','Pending') DEFAULT 'Paid',
  FOREIGN KEY (member_id) REFERENCES Members(member_id)
);


-- =====================================================
-- 4.2 SAMPLE DATA INSERTION
-- =====================================================

-- Insert Sample Members
INSERT INTO Members(full_name, phone, email, gender, join_date, status) VALUES
('Aarav Sharma', '9876501001', 'aarav@example.com', 'Male', '2026-01-05', 'Active'),
('Meera Singh', '9876501002', 'meera@example.com', 'Female', '2026-01-12', 'Active'),
('Kabir Verma', '9876501003', 'kabir@example.com', 'Male', '2026-02-01', 'Active'),
('Simran Kaur', '9876501004', 'simran@example.com', 'Female', '2026-02-15', 'Inactive'),
('Rohan Gupta', '9876501005', 'rohan@example.com', 'Male', '2026-03-03', 'Active');

-- Insert Sample Trainers
INSERT INTO Trainers(trainer_name, specialization, phone, monthly_salary) VALUES
('Vikram Das', 'Strength Training', '9811102001', 28000),
('Neha Kapoor', 'Yoga and Flexibility', '9811102002', 26000),
('Arjun Malik', 'Cardio Fitness', '9811102003', 25000);

-- Insert Sample Memberships
INSERT INTO Memberships(member_id, plan_name, start_date, end_date, fee, trainer_id) VALUES
(1, 'Monthly', '2026-01-05', '2026-02-04', 1500.00, 1),
(2, 'Quarterly', '2026-01-12', '2026-04-11', 3800.00, 2),
(3, 'Monthly', '2026-02-01', '2026-03-02', 1500.00, 1),
(4, 'Half-Yearly', '2026-02-15', '2026-08-14', 7500.00, 3),
(5, 'Quarterly', '2026-03-03', '2026-06-02', 3800.00, 3);

-- Insert Sample Attendance
INSERT INTO Attendance(member_id, attendance_date, check_in) VALUES
(1, '2026-03-10', '06:30:00'),
(2, '2026-03-10', '07:00:00'),
(3, '2026-03-10', '18:00:00'),
(1, '2026-03-11', '06:35:00'),
(5, '2026-03-11', '19:15:00');

-- Insert Sample Payments
INSERT INTO Payments(member_id, amount, payment_date, payment_method, payment_status) VALUES
(1, 1500.00, '2026-01-05', 'UPI', 'Paid'),
(2, 3800.00, '2026-01-12', 'Card', 'Paid'),
(3, 1500.00, '2026-02-01', 'Cash', 'Paid'),
(4, 7500.00, '2026-02-15', 'Bank Transfer', 'Pending'),
(5, 3800.00, '2026-03-03', 'UPI', 'Paid');


-- =====================================================
-- 4.3 MEMBER AND TRAINER REPORTS
-- =====================================================
SELECT * FROM Members;
SELECT * FROM Trainers;


-- =====================================================
-- 4.4 MEMBERSHIP REPORT USING JOIN
-- =====================================================
SELECT m.member_id, m.full_name, ms.plan_name,       
       ms.start_date, ms.end_date, ms.fee, t.trainer_name
FROM Members m
JOIN Memberships ms ON m.member_id = ms.member_id
LEFT JOIN Trainers t ON ms.trainer_id = t.trainer_id
ORDER BY m.member_id;


-- =====================================================
-- 4.5 ATTENDANCE REPORT
-- =====================================================
SELECT a.attendance_date, m.full_name, a.check_in
FROM Attendance a
JOIN Members m ON a.member_id = m.member_id
ORDER BY a.attendance_date, a.check_in;


-- =====================================================
-- 4.6 REVENUE AND MEMBER STATUS REPORTS
-- =====================================================
SELECT SUM(amount) AS total_revenue
FROM Payments
WHERE payment_status = 'Paid';

SELECT status, COUNT(*) AS member_count
FROM Members
GROUP BY status;


-- =====================================================
-- 4.7 FILTERING AND PENDING PAYMENTS
-- =====================================================
SELECT m.full_name, ms.plan_name, ms.fee
FROM Members m
JOIN Memberships ms ON m.member_id = ms.member_id
WHERE ms.fee >= 3000
ORDER BY ms.fee DESC;

SELECT m.full_name, p.amount, p.payment_date, p.payment_status
FROM Payments p
JOIN Members m ON p.member_id = m.member_id
WHERE p.payment_status = 'Pending';


-- =====================================================
-- 4.8 UPDATE AND TRANSACTION CONTROL
-- =====================================================
UPDATE Members
SET status = 'Inactive'
WHERE member_id = 5;

SELECT member_id, full_name, status
FROM Members
WHERE member_id = 5;

START TRANSACTION;

UPDATE Payments
SET payment_status = 'Paid'
WHERE payment_id = 4;

SELECT payment_id, member_id, amount, payment_status
FROM Payments
WHERE payment_id = 4;

COMMIT;