CREATE DATABASE IF NOT EXISTS lenguyenvu_student_managemnet;
USE lenguyenvu_student_managemnet;

CREATE TABLE class (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL
);


CREATE TABLE student (
	student_id INT PRIMARY KEY,
	student_name VARCHAR(50) NOT NULL,
	class_id INT,

	CONSTRAINT fk_student_class FOREIGN KEY (class_id) REFERENCES class(class_id)
);
INSERT INTO class
VALUES
(1,'class A'),
(2,'class B');



INSERT INTO student (student_id,student_name,class_id)
VALUES
(1,'Thang',2),
(2,'lam',1),
(3,'nhi',2);
