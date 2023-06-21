package controller;

import model.Student;
import service.IStudentService;
import service.impl.StudentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "/student")
public class StudentServlet extends HttpServlet {
    private IStudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action ="";
        }
        switch (action){
            case "add":
                showAddForm(request,response);

                break;
            case "delete":
                break;
            case "transaction":
                studentService.transaction();
                break;
            default:
                showList(request,response);
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("view/student/add.jsp").forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> studentList = studentService.findAll();
        request.setAttribute("studentList", studentList);
        request.getRequestDispatcher("view/student/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action ="";
        }
        switch (action){
            case "add":
                save(request,response);
                break;
            case "delete":
                deleteStudent(request,response);
                break;
            case "transaction":
                studentService.transaction();
                break;
            default:
        }
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idDelete = Integer.parseInt(request.getParameter("idDelete"));
        boolean check = studentService.delete(idDelete);
        String mess ="Xoá không thành công";
        if (check){
            mess = "Xoá thành công";
        }
        response.sendRedirect("/student?mess="+mess);

    }

    private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        float point = Float.parseFloat(request.getParameter("point"));
        int classId = Integer.parseInt(request.getParameter("classId"));
        Student student = new Student(name,gender,point,classId);
        boolean check = studentService.add(student);

        if (!check){
//            mess= "Thêm mới không thành công";
//            request.setAttribute("mess", mess);
//            showAddForm(request,response);
        }

        response.sendRedirect("/student?m="+ check);
    }
}
