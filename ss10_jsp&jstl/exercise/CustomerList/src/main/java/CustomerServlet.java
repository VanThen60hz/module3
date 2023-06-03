import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();

    static{
        customerList.add(new Customer(1,"Mai Văn Hoàn", "1983-08-20","Hà Nội","/img1.png"));
        customerList.add(new Customer(2,"Nguyễn Văn Nam", "1983-08-21","Bắc Giang","/img2.png"));
        customerList.add(new Customer(3,"Nguyễn Thái Hòa", "1983-08-22","Nam Định","/img3.png"));
        customerList.add(new Customer(4,"Trần Đăng Khoa", "1983-08-17","Hà Tây","/img4.png"));
        customerList.add(new Customer(5,"Nguyễn Đình Thi", "1983-08-19","Hà Nội","/img5.png"));

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.setAttribute("myDate",new Date());
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
