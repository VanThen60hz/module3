import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "/student")
public class StudentServlet extends HttpServlet {
    private static List<Student> studentList = new ArrayList<>();
    static {
        studentList.add(new Student(1,"Lê Thị Thịnh",false,2,1));
        studentList.add(new Student(2,"Khang",true,10,1));
        studentList.add(new Student(3,"Nguyễn Thị Hải",false,7,1));
        studentList.add(new Student(4,"Hùng",true,6,1));
        studentList.add(new Student(5,"Tân",true,5,1));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         request.setAttribute("studentList",studentList);
         request.setAttribute("myDate",new Date());
         request.getRequestDispatcher("/list.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
