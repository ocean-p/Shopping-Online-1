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
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    private final String INVALID = "login.jsp";
    private final String BUYER = "buyer.jsp";
    private final String ADMIN = "admin.jsp";
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String url = INVALID;
            Account a = AccountDAO.getAccount(username, password);
            HttpSession s = request.getSession();
            if(a!=null){
                if(a.getIsAdmin()==0){
                    url = BUYER;
                    request.setAttribute("page", FoodDAO.getNumberPage());
                    ArrayList<Food> f = FoodDAO.getFoodForBuyer(1);
                    request.setAttribute("food", f);
                    request.setAttribute("number", "1");
                }
                else{
                    url = ADMIN;
                    request.setAttribute("page", FoodDAO.getNumberPage2());
                    ArrayList<Food> f = FoodDAO.getFoodForAdmin(1);
                    request.setAttribute("food", f);
                    request.setAttribute("number", "1");
                }
                s.setAttribute("u", username);
                s.setAttribute("p", password);
                s.setAttribute("fn", a.getFullname());
                s.setAttribute("role", a.getIsAdmin());
            }
            else{
                request.setAttribute("err", "Invalid Username or Password");
            }
            ArrayList<Category> c = CategoryDAO.getAllCategory();
            request.setAttribute("category", c);
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
