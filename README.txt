JOBHUB PRO — ONLINE JOB PORTAL
Stack: HTML, CSS, JavaScript, AngularJS 1.8, PHP, MySQL.

FEATURES
- Responsive landing page, search/filter by keyword/location/category/job type, remote filter and saved jobs
- Job seeker/recruiter registration, PHP session login/logout and password hashing
- Job applications with duplicate protection and application tracker
- Recruiter job posting/deletion and applicant pipeline with shortlist/reject
- Admin stats, user listing and job moderation
- SQL schema, indexes, foreign keys and sample jobs

RUN WITH XAMPP
1. Extract this folder into C:\xampp\htdocs\JobHub_Pro
2. Start Apache and MySQL in XAMPP.
3. Open http://localhost/phpmyadmin (use :8080 if your Apache uses port 8080).
4. Import database/jobhub.sql. WARNING: this SQL recreates the jobhub tables and clears existing demo data.
5. Open http://localhost/JobHub_Pro/ (or http://localhost:8080/JobHub_Pro/).
6. Register Job Seeker and Recruiter accounts.
7. Demo Admin: admin@jobhub.com / password
   Demo Recruiter: recruiter@jobhub.com / password
8. If demo login fails, register an account and, for local demo use only, set it to admin in phpMyAdmin:
   UPDATE users SET role='admin' WHERE email='your-email@example.com';

DATABASE CONFIG
Default XAMPP connection is host localhost, database jobhub, user root, blank password. Edit php/db.php if yours differs.

This is a college-project starter, not a production-audited service. Before public deployment add CSRF protection, rate limiting, secure headers, HTTPS, and review authorization. Resume uploads are not implemented yet.
