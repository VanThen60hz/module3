package controller;

import model.Household;
import service.impl.HouseholdService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HouseholdServlet", value = "/household")
public class HouseholdServlet extends HttpServlet {
    private HouseholdService householdService = new HouseholdService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action ="";
        }
        switch (action){
            case "add":
                break;
            case "delete":
                break;
            default:
                showList(request,response);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Household> householdList = householdService.findAll();
        request.setAttribute("householdList", householdList);
        request.getRequestDispatcher("view/list.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action ="";
        }
        switch (action){
            case "add":
                break;
            case "edit":

                break;
        }
    }
}
