USE quanlysinhvien;

-- Bước 1: Sử dụng câu lệnh Use QuanLySinhVien để sử dụng cơ sở dữ liệu:
SELECT Address, COUNT(StudentId) AS 'Số lượng học viên'
FROM student
GROUP BY Address;

-- Bước 3: Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG

SELECT s.StudentId, s.StudentName, AVG(Mark) 
FROM student s 
JOIN mark m on s.StudentId = m.StudentId
GROUP BY s.StudentName;

-- Bước 4: Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15

SELECT s.StudentId, s.StudentName, AVG(Mark) AS 'điểm trung bình các môn học lớn hơn 15'
FROM student s
JOIN mark m on s.StudentId = m.StudentId
GROUP BY s.StudentId, s.StudentName
HAVING AVG(Mark) > 15;

-- Bước 5: Hiển thị thông tin các học viên có điểm trung bình lớn nhất.

SELECT s.StudentId, s.StudentName, AVG(Mark) AS 'điểm trung bình lon nhat '
FROM student s
JOIN mark m on s.StudentId = m.StudentId
GROUP BY s.StudentId, s.StudentName
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM mark m GROUP BY m.StudentId);