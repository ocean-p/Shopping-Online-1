/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.FoodDAO;
import dto.Food;
import dto.FoodErr;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "UpdateFoodServlet", urlPatterns = {"/updatefood"})
public class UpdateFoodServlet extends HttpServlet {
    private final String ERROR = "updateform.jsp";
    private final String SUCCESS = "process";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            String id = request.getParameter("id").trim();
            String name = request.getParameter("name").trim();
            String price = request.getParameter("price").trim();
            String img = request.getParameter("img").trim();
            String quantity = request.getParameter("quantity").trim();
            String category = request.getParameter("cbbox").trim();
            String cid = category.split("-")[0];
            String isdelete = request.getParameter("isdelete");
            String time = request.getParameter("time");
            
            boolean err = false;
            FoodErr fe = new FoodErr();
            
            if(name.length()<5 || name.length()>50){
                err=true;
                fe.setNameErr("Name's length is 5 between 50");
            }
            
            if(!price.matches("^[0-9]+(\\.[0-9]){0,1}$")){
                err=true;
                fe.setPriceErr("Price must be double number > 0");
            }
            
            if(!quantity.matches("^[0-9]+$")){
                err=true;
                fe.setQuantityErr("Quantity must be integer number > 0");
            }
            
            request.setAttribute("ERRORS", fe);
            String url = ERROR;
            if(err==false){
                Food f = new Food(Integer.parseInt(id), name, Double.parseDouble(price), 
                        img, Integer.parseInt(quantity), Integer.parseInt(isdelete), 
                                Integer.parseInt(cid), time);
                int res = FoodDAO.updateFood(f);
                if(res>0){
                   url = SUCCESS; 
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
