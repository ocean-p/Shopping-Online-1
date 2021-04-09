/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.OrderDAO;
import dto.Order;
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
@WebServlet(name = "SearchOrderServlet", urlPatterns = {"/searchorder"})
public class SearchOrderServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            String value = request.getParameter("search").trim();
            HttpSession s = request.getSession();
            String name = (String) s.getAttribute("u");
            if(value.matches("^[0-9]{2}\\/[0-9]{2}\\/[0-9]{4}$")){
                ArrayList<Order> o = OrderDAO.searchByDate(value, name);
                if(o.isEmpty()){
                   request.setAttribute("test", "abc");
                }
                else{
                   request.setAttribute("order", o);
                }
                
                request.setAttribute("value", value);
            }
            else{
                ArrayList<Order> o = OrderDAO.searchByName(value, name);
                if(o.isEmpty()){
                   request.setAttribute("test", "abc");
                }
                else{
                   request.setAttribute("order", o);
                }
                request.setAttribute("value", value);
            }
            request.getRequestDispatcher("viewhistory.jsp").forward(request, response);
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
