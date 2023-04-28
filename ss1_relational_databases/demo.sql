create database if not exists A1122I1;
use A1122I1;
-- tao bang student
create table student(
id int primary key,
`name` varchar(50),
`point` float
);
-- them du lieu cho bang
insert into student(id,name,point)
				values(1,"thang",10),
						(2, "hung",9);
insert into student values(3, "thinh",8);
-- lay du lieu ra tu bang
select * from student;
select name,point from student;
-- update toan bo ten thang thanh then
update student
set name = "then"
where id = 1;

SET SQL_SAFE_UPDATES = 0;
update student 
set name = "then";

SET SQL_SAFE_UPDATES = 1;
-- xoa sinh vien co id = 3;
delete from student where id = 3;
-- them cot classID cho bang student
alter table student add column class_id int;
alter table student drop column class_id;
-- xoa bang
drop table student;
-- xoa database 
drop database A1122I1;

