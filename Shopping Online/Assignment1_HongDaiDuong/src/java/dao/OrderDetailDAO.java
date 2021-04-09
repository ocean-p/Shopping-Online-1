/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.OrderDetail;
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
public class OrderDetailDAO {
    public static int addOrderDetail(OrderDetail o) throws SQLException{
        Connection cn=MyConnection.makeConnection();
        int result=0;
        if(cn!=null){
            String sql="insert into tblOrderDetail\n" +
                        "values(?,?,?,?,?,?)";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setInt(1, o.getOid());
            pst.setInt(2, o.getFid());
            pst.setString(3, o.getFname());
            pst.setDouble(4, o.getUprice());
            pst.setInt(5, o.getQuantity());
            pst.setDouble(6, o.getTprice());
            result=pst.executeUpdate();
            cn.close();
        }
        return result;
    }
    public static ArrayList<OrderDetail> getOrderDetailById(String id) throws SQLException{
        ArrayList<OrderDetail> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select orderID, foodID, foodName, unitPrice, quantity, totalPrice\n" +
                        "from tblOrderDetail \n" +
                        "where orderID=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getString(3), 
                                        rs.getDouble(4), rs.getInt(5), rs.getDouble(6)));
            }
            cn.close();
        }
        return list;
    }
}
