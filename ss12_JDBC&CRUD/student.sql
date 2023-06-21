DROP DATABASE IF EXISTS student_management;
CREATE DATABASE student_management;

USE student_management;
CREATE TABLE `class`(
	class_id INT PRIMARY KEY,
	class_name VARCHAR(50)
);

CREATE TABLE student(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50),
	gender BOOLEAN,
	point FLOAT,
	class_id INT,
	FOREIGN KEY (class_id) REFERENCES `class`(class_id)
);

CREATE TABLE room(
	id INT PRIMARY KEY,
	name VARCHAR(50),
	class_id INT,
	FOREIGN KEY (class_id) REFERENCES `class`(class_id)
);

INSERT INTO `student_management`.`class` (`class_id`, `class_name`) VALUES ('1', 'A1122I1');
INSERT INTO `student_management`.`class` (`class_id`, `class_name`) VALUES ('2', 'A1222I1');
INSERT INTO `student_management`.`class` (`class_id`, `class_name`) VALUES ('3', 'C1122I1');
INSERT INTO `student_management`.`class` (`class_id`, `class_name`) VALUES ('4', 'C1222I1');
INSERT INTO `student_management`.`class` (`class_id`, `class_name`) VALUES ('5', 'A0123I1');

INSERT INTO `student_management`.`student` (`id`, `name`, `gender`, `point`, `class_id`) VALUES ('1', 'văn thén', '1', '10', '1');
INSERT INTO `student_management`.`student` (`id`, `name`, `gender`, `point`, `class_id`) VALUES ('2', 'thanh hùng', '1', '9', '1');
INSERT INTO `student_management`.`student` (`id`, `name`, `gender`, `point`, `class_id`) VALUES ('3', 'nguyễn thị abc', '0', '8', '3');

INSERT INTO `student_management`.`room` (`id`, `name`, `class_id`) VALUES ('1', 'jame', '1');
INSERT INTO `student_management`.`room` (`id`, `name`, `class_id`) VALUES ('2', 'jimmy', '2');
INSERT INTO `student_management`.`room` (`id`, `name`, `class_id`) VALUES ('3', 'sony', '3');
INSERT INTO `student_management`.`room` (`id`, `name`, `class_id`) VALUES ('4', 'apple', '4');
INSERT INTO `student_management`.`room` (`id`, `name`, `class_id`) VALUES ('8', 'samsung', '5');


DELIMITER //
CREATE PROCEDURE delete_by_id(IN studentID INT)
BEGIN
    DELETE FROM student WHERE id = studentID;
END //
DELIMITER ;


