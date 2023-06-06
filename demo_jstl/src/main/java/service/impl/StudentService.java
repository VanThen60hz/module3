package service.impl;

import model.Student;
import repository.IStudentRepository;
import repository.impl.StudentRepository;
import service.IStudentService;

import java.util.List;

public class StudentService  implements IStudentService {
    private IStudentRepository studentRepository = new StudentRepository();
    @Override
    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public boolean add(Student student) {
        //kiểm trả dữ liệu có hợp lệ hay không
        if (student.getId()>1000){
            return false;
        }
        return studentRepository.add(student);
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
