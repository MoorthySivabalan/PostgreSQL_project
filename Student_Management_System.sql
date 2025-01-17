SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Professors;
SELECT * FROM Semesters;
SELECT * FROM Classes;
SELECT * FROM Enrollments;
SELECT * FROM Grades;
SELECT * FROM Attendance;
SELECT * FROM Departments;
SELECT * FROM Assignments;
SELECT * FROM Submissions;
SELECT * FROM ExamResults;


-- 1. Students Table
CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F')) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- 2. Courses Table
CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(10) UNIQUE NOT NULL,
    credits INT CHECK (credits > 0) NOT NULL,
    department VARCHAR(50) NOT NULL
);

-- 3. Instructors Table
CREATE TABLE Instructors (
    instructor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(50) NOT NULL
);

-- 4. Semesters Table
CREATE TABLE Semesters (
    semester_id SERIAL PRIMARY KEY,
    semester_name VARCHAR(50) UNIQUE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- 5. Classes Table
CREATE TABLE Classes (
    class_id SERIAL PRIMARY KEY,
    course_id INT NOT NULL REFERENCES Courses(course_id),
    instructor_id INT NOT NULL REFERENCES Instructors(instructor_id),
    semester_id INT NOT NULL REFERENCES Semesters(semester_id),
    UNIQUE(course_id, semester_id)
);

-- 6. Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL REFERENCES Students(student_id),
    class_id INT NOT NULL REFERENCES Classes(class_id),
    enrollment_date DATE NOT NULL,
    UNIQUE(student_id, class_id)
);

-- 7. Grades Table
CREATE TABLE Grades (
    grade_id SERIAL PRIMARY KEY,
    enrollment_id INT NOT NULL REFERENCES Enrollments(enrollment_id) ON DELETE CASCADE,
    grade VARCHAR(2) NOT NULL,
    grade_date DATE NOT NULL
);

-- 8. Attendance Table
CREATE TABLE Attendance (
    attendance_id SERIAL PRIMARY KEY,
    enrollment_id INT NOT NULL REFERENCES Enrollments(enrollment_id) ON DELETE CASCADE,
    attendance_date DATE NOT NULL,
    status VARCHAR(10) CHECK (status IN ('Present', 'Absent')) NOT NULL
);

-- 9. Departments Table
CREATE TABLE Departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE NOT NULL,
    department_head VARCHAR(100) NOT NULL,
    office_location VARCHAR(100) NOT NULL
);

-- 10. Assignments Table
CREATE TABLE Assignments (
    assignment_id SERIAL PRIMARY KEY,
    class_id INT NOT NULL REFERENCES Classes(class_id),
    assignment_name VARCHAR(100) NOT NULL,
    due_date DATE NOT NULL,
    total_marks INT CHECK (total_marks > 0) NOT NULL
);

-- 11. Submissions Table
CREATE TABLE Submissions (
    submission_id SERIAL PRIMARY KEY,
    assignment_id INT NOT NULL REFERENCES Assignments(assignment_id),
    student_id INT NOT NULL REFERENCES Students(student_id),
    submission_date DATE NOT NULL,
    marks_obtained INT CHECK (marks_obtained >= 0 AND marks_obtained <= 100) NOT NULL
);

-- 12. Exam Results Table
CREATE TABLE ExamResults (
    exam_result_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL REFERENCES Students(student_id),
    class_id INT NOT NULL REFERENCES Classes(class_id),
    exam_date DATE NOT NULL,
    marks_obtained INT CHECK (marks_obtained >= 0 AND marks_obtained <= 100) NOT NULL,
    UNIQUE(student_id, class_id)
);


------------------ Inserting Datas ------------------

-- Insert into Students
INSERT INTO Students (first_name, last_name, date_of_birth, gender, email)
VALUES ('John', 'Doe', '2002-04-15', 'M', 'john.doe@example.com'),
('Jane', 'Smith', '2003-07-22', 'F', 'jane.smith@example.com'),
('Alice', 'Brown', '2001-09-30', 'F', 'alice.brown@example.com'),
('Bob', 'Johnson', '2004-02-18', 'M', 'bob.johnson@example.com');

-- Insert into Courses
INSERT INTO Courses (course_name, course_code, credits, department)
VALUES ('Mathematics', 'MATH101', 3, 'Mathematics'),
('Physics', 'PHY101', 4, 'Science'),
('English Literature', 'ENG101', 2, 'Arts'),
('Computer Science', 'CS101', 4, 'Computer Science');

-- Insert into Instructors
INSERT INTO Instructors (first_name, last_name, email, department)
VALUES ('Emily', 'Davis', 'emily.davis@example.com', 'Mathematics'),
('Michael', 'Brown', 'michael.brown@example.com', 'Science'),
('Laura', 'Wilson', 'laura.wilson@example.com', 'Arts'),
('David', 'Miller', 'david.miller@example.com', 'Computer Science');

-- Insert into Semesters
INSERT INTO Semesters (semester_name, start_date, end_date)
VALUES ('Spring 2025', '2025-01-15', '2025-05-30'),
('Fall 2025', '2025-08-20', '2025-12-15');

-- Insert into Classes
INSERT INTO Classes (course_id, instructor_id, semester_id)
VALUES (1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 2);

-- Insert into Enrollments
INSERT INTO Enrollments (student_id, class_id, enrollment_date)
VALUES (1, 1, '2025-01-16'),
(2, 1, '2025-01-16'),
(1, 2, '2025-01-16'),
(3, 3, '2025-01-16'),
(4, 4, '2025-08-21');

-- Insert into Grades
INSERT INTO Grades (enrollment_id, grade, grade_date)
VALUES (1, 'A', '2025-05-15'),
(2, 'B+', '2025-05-15'),
(3, 'A-', '2025-05-15');

-- Insert into Attendance
INSERT INTO Attendance (enrollment_id, attendance_date, status)
VALUES (1, '2025-01-17', 'Present'),
(1, '2025-01-18', 'Absent'),
(2, '2025-01-17', 'Present'),
(3, '2025-01-19', 'Present');

-- Insert into Departments
INSERT INTO Departments (department_name, department_head, office_location)
VALUES ('Mathematics', 'Dr. Emily Davis', 'Building A'),
('Science', 'Dr. Michael Brown', 'Building B'),
('Arts', 'Dr. Laura Wilson', 'Building C'),
('Computer Science', 'Dr. David Miller', 'Building D');

-- Insert into Assignments
INSERT INTO Assignments (class_id, assignment_name, due_date, total_marks)
VALUES (1, 'Assignment 1', '2025-02-15', 100),
(2, 'Assignment 1', '2025-03-10', 100),
(3, 'Essay 1', '2025-03-05', 50);

-- Insert into Submissions
INSERT INTO Submissions (assignment_id, student_id, submission_date, marks_obtained)
VALUES (1, 1, '2025-02-14', 95),
(2, 2, '2025-03-09', 88),
(3, 3, '2025-03-04', 45);

-- Insert into Exam Results
INSERT INTO ExamResults (student_id, class_id, exam_date, marks_obtained)
VALUES (1, 1, '2025-05-01', 90),
(2, 2, '2025-05-02', 85),
(3, 3, '2025-05-03', 78);


----------- Changing Table name ---------

-- Update the table name from Instructors to Professors
ALTER TABLE Instructors RENAME TO Professors;

-- Updating references in other tables
ALTER TABLE Classes DROP CONSTRAINT classes_instructor_id_fkey;
ALTER TABLE Classes ADD CONSTRAINT classes_professor_id_fkey FOREIGN KEY (instructor_id) REFERENCES Professors(instructor_id);


----------- Changing Student name -----------

-- Updating a student's first and last name in the Students table
UPDATE Students SET first_name = 'Arun', last_name = 'Kumar' WHERE student_id = 1;


----------- Changing Column name -----------

-- Alter the column name credits to credit in the Courses table
ALTER TABLE Courses RENAME COLUMN credits TO credit;


----------- Adding Column -----------

-- Adding a column nativity to the Students table
ALTER TABLE Students ADD COLUMN nativity VARCHAR(100);

-- Insert values into the nativity column for students
UPDATE Students SET nativity = 'Tamil Nadu' WHERE student_id = 1;
UPDATE Students SET nativity = 'Kerala' WHERE student_id = 2;
UPDATE Students SET nativity = 'Karnataka' WHERE student_id = 3;
UPDATE Students SET nativity = 'Andhra Pradesh' WHERE student_id = 4;

-- Adding a new column to the Professors table
ALTER TABLE Professors ADD COLUMN phone_number VARCHAR(15);

-- Insert into the Professors table
INSERT INTO Professors (first_name, last_name, email, department, phone_number)
VALUES ('John', 'Doe', 'john.doe@example.com', 'Mathematics', '1234567890');

---------- Updating column to contain more letters ----------

-- Change the length of the department column in the Courses table
ALTER TABLE Courses ALTER COLUMN department TYPE VARCHAR(150);


-------- Join query --------

-- Selecting all students along with their courses using a JOIN query
SELECT s.student_id, s.first_name, s.last_name, c.course_name FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Classes cl ON e.class_id = cl.class_id
INNER JOIN Courses c ON cl.course_id = c.course_id;

-- Retrieve students who enrolled after a certain date
SELECT s.first_name, s.last_name, e.enrollment_date FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id WHERE e.enrollment_date > '2025-01-01';


--------- Like Query ---------

-- LIKE query to find courses in a department
SELECT * FROM Courses WHERE department LIKE 'Computer%';


---------- Distinct Query ----------

-- Select distinct departments from the Courses table
SELECT DISTINCT department FROM Courses;


---------- Conditional Queries ----------

SELECT student_id, first_name, last_name FROM Students WHERE student_id = 4;

SELECT student_id, first_name, last_name FROM Students WHERE first_name = 'Jane' OR student_id = 2;

SELECT student_id, first_name, last_name FROM Students WHERE student_id BETWEEN 1 AND 50;

SELECT student_id, first_name, last_name FROM Students WHERE student_id IN (1, 2, 4);

SELECT student_id, first_name, last_name FROM Students  WHERE first_name LIKE 'A%';

SELECT student_id, first_name, last_name FROM Students WHERE email IS NOT NULL;


-- Dropping column
ALTER TABLE Students DROP COLUMN nativity;