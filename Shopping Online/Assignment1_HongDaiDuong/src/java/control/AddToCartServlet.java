/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.FoodDAO;
import dto.Cart;
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
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/addtocart"})
public class AddToCartServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession s = request.getSession();
            String id = request.getParameter("id");
            Food food = FoodDAO.getFoodByID(id);
            if (food.getIsdelete() == 0 && food.getQuantity() > 0) {
                if (s.getAttribute("cart") == null) {
                    ArrayList<Cart> list = new ArrayList<>();
                    list.add(new Cart(FoodDAO.getFoodByID(id), 1));
                    s.setAttribute("cart", list);
                    request.setAttribute("success", "Add to Cart success.");
                } else {
                    ArrayList<Cart> list = (ArrayList<Cart>) s.getAttribute("cart");
                    int index = Cart.isExist(id, list);
                    if (index < 0) {
                        list.add(new Cart(FoodDAO.getFoodByID(id), 1));
                        request.setAttribute("success", "Add to Cart success. The new food has been added.");
                    } else {
                        int quantity = list.get(index).getQuantity();
                        if(quantity < food.getQuantity()){
                            list.get(index).setQuantity(quantity+1);
                            request.setAttribute("success", "Add to Cart success. The quantity has been updated.");
                        }
                        else{
                            String message = "Food:" + food.getFname() + " - " + "Available Quantity:" + food.getQuantity();
                            request.setAttribute("message", message);
                        }
                    }
                    s.setAttribute("cart", list);
                }
            }
            else{
                String message = "Add to cart fail!";
                request.setAttribute("message", message);
            }
            request.getRequestDispatcher("viewcart.jsp").forward(request, response);
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
