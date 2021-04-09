/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.MyConnection;

/**
 *
 * @author DELL
 */
public class OrderDAO {
    public static int getNumberOrder() throws SQLException{
        int result=0;
        Connection cn=MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select COUNT(orderID) from tblOrder";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                result = rs.getInt(1);
            }
            cn.close();
        }
        return result;
    }
    public static int addOrder(Order o) throws SQLException{
        Connection cn=MyConnection.makeConnection();
        int result=0;
        if(cn!=null){
            String sql="insert into tblOrder\n" +
                            "values(?,?,?,?,?,?,?)";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setInt(1, o.getId());
            pst.setString(2, o.getDate());
            pst.setInt(3, o.getQuantity());
            pst.setDouble(4, o.getPrice());
            pst.setString(5, o.getPayment());
            pst.setString(6, o.getUsername());
             pst.setString(7, o.getAddress());
            result=pst.executeUpdate();
            cn.close();
        }
        return result;
    }
    public static ArrayList<Order> getOrderByUsername(String name) throws SQLException{
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select orderID, createDate, totalQuantity, totalPrice, payment, username, address\n" +
                        "from tblOrder\n" +
                        "where username=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, name);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Order(rs.getInt(1), rs.getString(2), rs.getInt(3), 
                                    rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            cn.close();
        }
        return list;
    }
    public static ArrayList<Order> searchByDate(String value, String name) throws SQLException{
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select orderID, createDate, totalQuantity, totalPrice, payment, username, address\n" +
                        "from tblOrder\n" +
                        "where createDate like ?\n"
                        + "and username = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%"+value+"%");
            pst.setString(2, name);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Order(rs.getInt(1), rs.getString(2), rs.getInt(3), 
                                    rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            cn.close();
        }
        return list;
    }
    public static ArrayList<Order> searchByName(String value, String name) throws SQLException{
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select DISTINCT o.orderID, o.createDate, o.totalQuantity, o.totalPrice, o.payment, o.username, o.address\n" +
                        "from tblOrder o, tblOrderDetail od\n" +
                        "where o.orderID = od.orderID\n" +
                        "and od.foodName like ?\n"
                    + "and o.username = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%"+value+"%");
            pst.setString(2, name);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Order(rs.getInt(1), rs.getString(2), rs.getInt(3), 
                                    rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            cn.close();
        }
        return list;
    }
}
