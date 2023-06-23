package repository.impl;

import model.Student;
import repository.BaseRepository;
import repository.IStudentRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
      private final String SELECT_ALL ="SELECT * FROM student;";
      private final String DELETE_BY_ID ="call delete_by_id(?);";
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
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_BY_ID);
            callableStatement.setInt(1,id);
            return callableStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Student findById(int id) {
        return null;
    }

    @Override
    public String transaction() {
        String msg = "OK, transaction successfully!";
        Connection connection = BaseRepository.getConnectDB();
        Savepoint savepoint1=null;
        Savepoint savepoint2=null;
        try {
            connection.setAutoCommit(false);// cần set là false => tạo transaction
            // thêm mới 1 class
            PreparedStatement pSInsertClass =
                    connection.prepareStatement(
                            "insert into class (`name`)values (?)");
            pSInsertClass.setString(1, "c10");

            int rowAffect = pSInsertClass.executeUpdate();

            savepoint1= connection.setSavepoint();
            // thêm mới 1 room
            PreparedStatement pSInsertRoom =
                    connection.prepareStatement(
                            "insert into room(id,name,class_id) values(?,?,?);");
            pSInsertRoom.setString(1, "3");
            pSInsertRoom.setString(2, "Jimmy");
            pSInsertRoom.setString(3, "3");

            rowAffect += pSInsertRoom.executeUpdate();

            savepoint2= connection.setSavepoint();
            // thêm mới 1 học viên
            if (rowAffect == 2) {
                PreparedStatement pSInsertStudent
                        = connection.prepareStatement(
                        "insert into student(name,gender,point,class_id) values(?,?,?,?);");

                pSInsertStudent.setString(1,"Nguyễn thất bại 2");
                pSInsertStudent.setBoolean(2,true);
                pSInsertStudent.setFloat(3,7);
                pSInsertStudent.setInt(4,100);
                rowAffect += pSInsertStudent.executeUpdate();
            }
            // kiểm tra nếu cả 3 hoạt động thêm mới thành công thì mới commit
            if (rowAffect == 3) {
                connection.commit();
            } else {
                msg = "rollback try";
                connection.rollback();
            }

        } catch (SQLException e) {
            try {
                msg = "rollback catch";
                connection.rollback(savepoint1);
                connection.commit();

            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return msg;
    }
}
