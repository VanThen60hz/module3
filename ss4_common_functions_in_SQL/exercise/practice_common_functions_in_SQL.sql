-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.

SELECT *
FROM subject s
WHERE s.Credit = (SELECT MAX(Credit) FROM subject);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT s.*
FROM subject s
JOIN mark m on s.SubId = m.SubId
WHERE Mark = (SELECT MAX(Mark) FROM mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần

SELECT s.*, c.ClassName, AVG(Mark) as 'điểm trung bình'
FROM student s
JOIN `class`c on s.ClassId = c.ClassID
JOIN mark m on s.StudentId = m.StudentId
GROUP BY s.StudentId
ORDER BY AVG(Mark) DESC;

