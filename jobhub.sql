CREATE DATABASE IF NOT EXISTS jobhub CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE jobhub;
SET FOREIGN_KEY_CHECKS=0; DROP TABLE IF EXISTS applications; DROP TABLE IF EXISTS jobs; DROP TABLE IF EXISTS users; SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE users(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100) NOT NULL,email VARCHAR(150) NOT NULL UNIQUE,password VARCHAR(255) NOT NULL,role ENUM('seeker','recruiter','admin') NOT NULL DEFAULT 'seeker',created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE jobs(id INT AUTO_INCREMENT PRIMARY KEY,recruiter_id INT NULL,title VARCHAR(150) NOT NULL,company VARCHAR(150) NOT NULL,location VARCHAR(120) NOT NULL,salary DECIMAL(12,2) DEFAULT 0,category VARCHAR(50) NOT NULL DEFAULT 'IT',job_type VARCHAR(50) NOT NULL DEFAULT 'Full Time',description TEXT NOT NULL,posted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,INDEX idx_category(category),INDEX idx_location(location),FOREIGN KEY(recruiter_id) REFERENCES users(id) ON DELETE SET NULL);
CREATE TABLE applications(id INT AUTO_INCREMENT PRIMARY KEY,user_id INT NOT NULL,job_id INT NOT NULL,status ENUM('Applied','Shortlisted','Rejected') DEFAULT 'Applied',applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,UNIQUE KEY unique_application(user_id,job_id),FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,FOREIGN KEY(job_id) REFERENCES jobs(id) ON DELETE CASCADE);
-- Demo accounts, password: password
INSERT INTO users(name,email,password,role) VALUES('Demo Recruiter','recruiter@jobhub.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC0z5V3x8Y9h7v4H6G4K','recruiter'),('Demo Admin','admin@jobhub.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC0z5V3x8Y9h7v4H6G4K','admin');
INSERT INTO jobs(recruiter_id,title,company,location,salary,category,job_type,description) VALUES
(1,'Frontend Developer','Nexora Labs','Ahmedabad',650000,'IT','Full Time','Build accessible, responsive web experiences with JavaScript, CSS and modern frontend practices.'),
(1,'PHP Developer','Vertex Digital','Remote',550000,'IT','Full Time','Create reliable PHP APIs, work with SQL databases and collaborate with a product team.'),
(1,'UI/UX Designer','Layers Studio','Ahmedabad',600000,'Design','Full Time','Design thoughtful user flows, prototypes and polished interfaces for web products.'),
(1,'Data Analyst Intern','Orbit Analytics','Vadodara',180000,'IT','Internship','Turn datasets into insights using spreadsheets, SQL and clear visualizations.'),
(1,'Digital Marketing Executive','Bloom Growth','Surat',360000,'Marketing','Full Time','Support content, campaign reporting, SEO and digital growth experiments.'),
(1,'Sales Associate','Northstar Co.','Remote',420000,'Sales','Full Time','Build customer relationships, understand needs and support a growing sales pipeline.');