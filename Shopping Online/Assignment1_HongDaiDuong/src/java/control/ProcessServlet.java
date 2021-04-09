/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.CategoryDAO;
import dto.Category;
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
@WebServlet(name = "ProcessServlet", urlPatterns = {"/process"})
public class ProcessServlet extends HttpServlet {
    private final String HOME = "home";
    private final String LOGIN = "login";
    private final String LOGOUT = "logout";
    private final String SEARCH = "search";
    private final String BIN = "bin";
    private final String ADD = "addform.jsp";
    private final String CART = "viewcart.jsp";
    private final String HISTORY = "history";
    private final String TOP5 = "top5";
    private final String BEST = "bestseller";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try{
            String action = request.getParameter("btAction");
            String url = "";
            if(action == null){
                url = HOME;
            }
            else switch(action){
                case "Login":
                    url = LOGIN;
                    break;
                case "Logout":
                    url = LOGOUT;
                    break;
                case "Search":
                    url = SEARCH;
                    break; 
                case "Recycle Bin":
                    url = BIN;
                    break;
                case "Add Food":
                    HttpSession s = request.getSession();
                    ArrayList<Category> c = CategoryDAO.getAllCategory();
                    s.setAttribute("cupdate", c);
                    url = ADD;
                    break;
                case "View Cart":
                    url = CART;
                    break;
                case "View History":
                    url = HISTORY;
                    break;
                case "All Orders":
                    url = HISTORY;
                    break;
                case "Top 5 New":
                    url = TOP5;
                    break;
                case "Best Seller":
                    url = BEST;
                    break;
            }
            request.getRequestDispatcher(url).forward(request, response);
        }catch(Exception e){
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
