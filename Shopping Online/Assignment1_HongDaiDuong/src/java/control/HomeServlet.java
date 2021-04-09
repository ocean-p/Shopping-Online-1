/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.AccountDAO;
import dao.CategoryDAO;
import dao.FoodDAO;
import dto.Account;
import dto.Category;
import dto.Food;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {
    private final String HOME = "home.jsp";
    private final String BUYER = "buyer.jsp";
    private final String ADMIN = "admin.jsp";
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String url = HOME;
            ArrayList<Category> c = CategoryDAO.getAllCategory();
            request.setAttribute("category", c);
            request.setAttribute("page", FoodDAO.getNumberPage());
            String index = request.getParameter("index");
            if(index == null){
                index = "1";
            }
            ArrayList<Food> f = FoodDAO.getFoodForBuyer(Integer.parseInt(index));
            request.setAttribute("food", f);
            request.setAttribute("number", index);
            HttpSession s = request.getSession();
            if(s.getAttribute("u")!=null && s.getAttribute("p")!=null){
                String username = (String) s.getAttribute("u");
                String password = (String) s.getAttribute("p");
                Account a = AccountDAO.getAccount(username, password);
                if(a!=null){
                    if(a.getIsAdmin()==0){
                        url=BUYER;
                    }
                    else{
                        url=ADMIN;
                        request.setAttribute("page", FoodDAO.getNumberPage2());
                        request.setAttribute("food", FoodDAO.getFoodForAdmin(Integer.parseInt(index)));
                    }
                    s.setAttribute("fn", a.getFullname());
                }
            }
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
