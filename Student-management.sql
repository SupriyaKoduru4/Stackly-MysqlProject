
CREATE DATABASE student_management;
USE student_management;
SHOW DATABASES;

/* Student table */
CREATE TABLE students ( 
student_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
phone VARCHAR(15),
gender VARCHAR(10),
admission_date DATE
);


/* Courses table */
CREATE TABLE courses (
course_id INT PRIMARY KEY AUTO_INCREMENT,
course_name VARCHAR(100) NOT NULL,
duration_months INT,
fee DECIMAL(10,2)
);

/*enrollments table*/
CREATE TABLE enrollments (
enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
student_id INT NOT NULL,
course_id INT NOT NULL,
enrollment_date DATE,
FOREIGN KEY (student_id)
REFERENCES students(student_id),
FOREIGN KEY (course_id)
   REFERENCES courses(course_id),
UNIQUE (student_id, course_id)
);


/* attendance table*/
CREATE TABLE attendance (
attendance_id INT PRIMARY KEY AUTO_INCREMENT,
enrollment_id INT NOT NULL,
attendance_date DATE NOT NULL,
status ENUM('Present', 'Absent') NOT NULL,
FOREIGN KEY (enrollment_id)
   REFERENCES enrollments(enrollment_id),
UNIQUE (enrollment_id, attendance_date)
 );

/* marks */
CREATE TABLE marks (
mark_id INT PRIMARY KEY AUTO_INCREMENT,
enrollment_id INT NOT NULL,
subject_name VARCHAR(100) NOT NULL,
total_marks DECIMAL(5,2) NOT NULL,
obtained_marks DECIMAL(5,2) NOT NULL,
FOREIGN KEY (enrollment_id)
	REFERENCES enrollments(enrollment_id),
UNIQUE (enrollment_id, subject_name),
CHECK (total_marks > 0), CHECK (obtained_marks >= 0 AND obtained_marks <= total_marks)
);

USE student_management;
SHOW TABLES;
DESCRIBE students;
DESCRIBE courses;
DESCRIBE enrollments;
DESCRIBE attendance;
DESCRIBE marks;

USE student_management;

INSERT INTO students (name, email, phone, gender, admission_date) VALUES
 ('Ravi Kumar', 'ravi@gmail.com', '9876543210', 'Male', '2026-10-19'),
 ('Priya Sharma', 'priya@gmail.com', '9876543211', 'Female', '2026-10-19');

INSERT INTO courses (course_name, duration_months, fee) VALUES ('Java Full Stack', 6, 25000.00), ('Python Full Stack', 5, 22000.00);
SELECT * FROM students;
SELECT * FROM courses;

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES (1, 1, '2026-10-19'), (2, 2, '2026-10-19');
SELECT * FROM enrollments;
