package service;

import model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> findAll();

    boolean add(Student student);

    boolean delete(int id);

    Student findById(int id);

    String transaction();
}