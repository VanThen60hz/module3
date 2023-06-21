package repository.impl;

import model.Student;
import repository.BaseRepository;
import repository.IStudentRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
      private final String SELECT_ALL ="SELECT * FROM student;";
      private final String INSERT_INTO ="insert into student(name,gender,point,class_id) values(?,?,?,?);";

    @Override
    public List<Student> findAll() {
         List<Student> studentList = new ArrayList<>();
        // kết nối db
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
           ResultSet resultSet = preparedStatement.executeQuery();
           while (resultSet.next()){
               int id = resultSet.getInt("id");
               String name = resultSet.getString("name");
               boolean gender =resultSet.getBoolean("gender");
               float point = resultSet.getFloat("point");
               int classId = resultSet.getInt("class_id");
               Student student = new Student(id,name,gender,point,classId);
               studentList.add(student);
           }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentList;
    }

    @Override
    public boolean add(Student student) {

        // kết nối db
       Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1,student.getName());
            preparedStatement.setBoolean(2,student.isGender());
            preparedStatement.setFloat(3,student.getPoint());
            preparedStatement.setInt(4,student.getClassId());
           return preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
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
