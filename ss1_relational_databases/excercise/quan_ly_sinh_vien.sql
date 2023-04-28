create database if not exists student_management;
use student_management;
-- Đặt tên của bảng là Class và điền các trường tương ứng vào trong bảng
create table class(
id int primary key,
`className` varchar(50),
`number` int
);

-- them du lieu cho bang
insert into class(id,className,number)
				values(1,"Ä1122I1",8),
						(2,"A1222I1",17),
                        (3,"A0123I1",20);

insert into class values(4,"A0223I1",18);

-- lay ra toan bo danh sach
select * from class;

create table teacher(
id int primary key,
`name` varchar(50),
`salary` double
);

-- them du lieu cho teacher
insert into teacher(id,name,salary)
			values(1,"Quang",2000),
					(2,"Long",1500),
                    (3,"Chanh",3000);

insert into teacher values(4,"Quoc",1800);

select name,salary from teacher;
