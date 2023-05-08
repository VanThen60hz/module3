DROP DATABASE IF EXISTS lenguyenvu_student_managemnet;
CREATE DATABASE lenguyenvu_student_managemnet;

USE lenguyenvu_student_managemnet;

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INT DEFAULT 18
-- CHECK(age >= 18)
);

-- INSERT INTO student(student_id,student_name,age)
-- VALUES (1,'John',18);

INSERT INTO student(student_id,student_name)
VALUES (1,'John');