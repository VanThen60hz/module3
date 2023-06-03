import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountCalculatorServlet", value = "/discount")
public class DiscountCalculatorServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        System.out.println("init");
    }

    @Override
    public void destroy() {
        System.out.println("destroy chạy 1 lần khi bị phá huỷ ");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doGet");
        double listPrice = Double.parseDouble(request.getParameter("list-price"));
        double discountPercent = Double.parseDouble(request.getParameter("discount-percent"));
        double discountAmount = listPrice * discountPercent * 0.01;

//        PrintWriter printWriter = response.getWriter();
//        printWriter.print("<h1> Result : " +discountAmount+ "</h1");
        // gói dữ liệu vào 1 biến
        request.setAttribute("price",listPrice);
        request.setAttribute("percent",discountPercent);
        request.setAttribute("discount",discountAmount);

        request.getRequestDispatcher("/result.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
