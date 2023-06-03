package com.codegym;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "HelloServlet", value = "/sum")
public class SumServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        System.out.println("init chạy 1 lần duy nhất khi khởi tạo");
    }

    @Override
    public void destroy() {
        System.out.println("destroy chạy 1 lần khi bị phá huỷ ");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     // chạy khi gửi bằng mehtod (get)
        System.out.println("doGet");
        int num1 = Integer.parseInt(request.getParameter("n1"));
        int num2 = Integer.parseInt(request.getParameter("n2"));
        int sum = num1+num2;
        // cách 1 => không dùng
//        PrintWriter printWriter = response.getWriter();
//        printWriter.print("<h1> Result : " +sum+ "</h1");
        // cách 2 dùng
        // gói dữ liệu vào 1 biến
        request.setAttribute("n1",num1);
        request.setAttribute("n2",num2);
        request.setAttribute("tong",sum);
        // chuyển sang trang result.jsp để hiển thị
        request.getRequestDispatcher("/result.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // chạy khi gửi bằng method post
        System.out.println("doPost");
    }
}
