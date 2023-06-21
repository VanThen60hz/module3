package controller;

import model.Customer;
import service.CustomerService;
import service.CustomerTypeService;
import service.impl.CustomerServiceImpl;
import service.impl.CustomerTypeServiceImpl;
import util.PageHelper;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CustomerController", value = "/customer")
public class CustomerController extends HttpServlet {
    private CustomerService customerService = new CustomerServiceImpl();
    private CustomerTypeService customerTypeService = new CustomerTypeServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("result", customerService.findAll(PageHelper.PageRequest(request)));
        request.setAttribute("customerTypes", customerTypeService.findAll());
        request.getRequestDispatcher("view/customer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
