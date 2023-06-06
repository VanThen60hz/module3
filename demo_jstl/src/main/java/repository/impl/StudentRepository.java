package repository.impl;

import model.Student;
import repository.IStudentRepository;

import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {

    private static List<Student> studentList = new ArrayList<>();
    static {
        studentList.add(new Student(1,"Lê Thị Thịnh",false,2,1));
        studentList.add(new Student(2,"Khang",true,10,1));
        studentList.add(new Student(3,"Nguyễn Thị Hải",false,7,1));
        studentList.add(new Student(4,"Hùng",true,6,1));
        studentList.add(new Student(5,"Tân",true,5,1));
    }

    @Override
    public List<Student> findAll() {
        // kết nối db
        return studentList;
    }

    @Override
    public boolean add(Student student) {
        // kết nối db
        studentList.add(student);
        return true;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public Student findById(int id) {
        return null;
    }
}
