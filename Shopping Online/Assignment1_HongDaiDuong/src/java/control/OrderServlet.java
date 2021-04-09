/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.FoodDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dto.Cart;
import dto.Food;
import dto.Order;
import dto.OrderDetail;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
@WebServlet(name = "OrderServlet", urlPatterns = {"/order"})
public class OrderServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            HttpSession s = request.getSession();
            if(s.getAttribute("cart") != null){
                String address = request.getParameter("address").trim();
                if (address.length() < 6 || address.length() > 50) {
                    request.setAttribute("addresserr", "Address's length must be between 6 - 50");
                    request.getRequestDispatcher("viewcart.jsp").forward(request, response);
                } else {
                    ArrayList<Cart> c = (ArrayList<Cart>) s.getAttribute("cart");
                    ArrayList<Food> f = FoodDAO.getAllFood();
                    ArrayList<String> name = new ArrayList<>();
                    for (int i = 0; i < c.size(); i++) {
                        for (int j = 0; j < f.size(); j++) {
                            if (c.get(i).getFd().getFid() == f.get(j).getFid()) {
                                if (c.get(i).getQuantity() > f.get(j).getQuantity()) {
                                    name.add(c.get(i).getFd().getFname());
                                }
                            }
                        }
                    }
                    ArrayList<Food> f2 = FoodDAO.getAllFood2();
                    ArrayList<String> name2 = new ArrayList<>();
                    for (int i = 0; i < c.size(); i++) {
                        for (int j = 0; j < f2.size(); j++) {
                            if (c.get(i).getFd().getFid() == f2.get(j).getFid()) {
                                if (f2.get(j).getIsdelete() == 1) {
                                    name2.add(c.get(i).getFd().getFname());
                                }
                            }
                        }
                    }
                    if (!name.isEmpty() || !name2.isEmpty()) {
                        request.setAttribute("quantityErr", name);
                        request.setAttribute("deleteErr", name2);
                        request.getRequestDispatcher("viewcart.jsp").forward(request, response);
                    } else {
                        //oid
                        int orderid = OrderDAO.getNumberOrder() + 1;
                        //date
                        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                        Date d = new Date();
                        String date = df.format(d);
                        //total quantity
                        int tquantity = 0;
                        for (Cart cart : c) {
                            tquantity += cart.getQuantity();
                        }
                        //total price
                        double totalprice = Double.parseDouble(s.getAttribute("total").toString());
                        //payment
                        String payment = request.getParameter("payment");
                        //username
                        String username = s.getAttribute("u").toString();
                        // add order
                        int a = OrderDAO.addOrder(new Order(orderid, date, tquantity,
                                totalprice, payment, username, address));

                        ///////////////////
                        // add orderdetail
                        int b1 = 0;
                        int b2 = 0;
                        for (Cart cart : c) {
                            b1 = OrderDetailDAO.addOrderDetail(new OrderDetail(orderid, cart.getFd().getFid(),
                                    cart.getFd().getFname(), cart.getFd().getFprice(),
                                    cart.getQuantity(), cart.getQuantity() * cart.getFd().getFprice()));
                            b2 = FoodDAO.updateQuantity(cart.getQuantity(), cart.getFd().getFid());
                        }
                        if (a > 0 && b1 > 0 && b2 > 0) {
                            s.removeAttribute("cart");
                            request.setAttribute("date", date);
                            request.setAttribute("id", orderid);
                            request.getRequestDispatcher("ordersuccess.jsp").forward(request, response);
                        }
                    }
                }
            }
            else{
                response.sendRedirect("viewcart.jsp");
            }
            
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
