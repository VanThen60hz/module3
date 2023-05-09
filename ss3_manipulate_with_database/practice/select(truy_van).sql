use quanlysinhvien;
-- Hiển thị danh sách tất cả các học viên
select * from student;
-- Hiển thị danh sách các học viên đang theo học.
select * from student
where Status = true;
-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.
select * from subject
where credit < 10;
-- Hiển thị danh sách học viên lớp A1
SELECT s.StudentId, s.StudentName, c.ClassName
FROM student s JOIN Class c ON s.ClassId = c.ClassId
WHERE ClassName = 'A1';
-- Hiển thị điểm môn CF của các học viên.

select s.StudentId, s.StudentName, sub.SubName, m.Mark
from Student s join Mark m on s.StudentId = M.StudentId join Subject sub on m.SubId = sub.SubId
where sub.SubName = 'CF';

