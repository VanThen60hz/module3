package servlet;

import service.CalculatorService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Integer.parseInt(request.getParameter("first-operand"));
        float secondOperand = Integer.parseInt(request.getParameter("second-operand"));
        char operator = request.getParameter("operator").charAt(0);
        float res = 0;
        try {
            res = CalculatorService.calculate(firstOperand, secondOperand, operator);
            request.setAttribute("result",res);
            request.getRequestDispatcher("/result.jsp").forward(request,response);
        } catch (Exception e) {
            request.setAttribute("result",e.getMessage());
            request.getRequestDispatcher("/result.jsp").forward(request,response);

        }



    }
}
