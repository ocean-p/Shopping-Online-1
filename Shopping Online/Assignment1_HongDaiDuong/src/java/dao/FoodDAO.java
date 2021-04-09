/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Food;
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
public class FoodDAO {
    public static ArrayList<Food> getAllFood() throws SQLException{
        ArrayList<Food> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select foodID, [name], price, img, quantity, isDelete, categoryID, createTime\n" +
                        "from tblFood\n" +
                        "where isDelete=0";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Food(rs.getInt(1), rs.getString(2), 
                                  rs.getDouble(3), rs.getString(4),
                                  rs.getInt(5), rs.getInt(6), 
                                  rs.getInt(7), rs.getString(8)));
            }
            cn.close();
        }
        return list;
    }
    public static ArrayList<Food> getAllFood2() throws SQLException{
        ArrayList<Food> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select foodID, [name], price, img, quantity, isDelete, categoryID, createTime\n" +
                        "from tblFood";
                        
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Food(rs.getInt(1), rs.getString(2), 
                                  rs.getDouble(3), rs.getString(4),
                                  rs.getInt(5), rs.getInt(6), 
                                  rs.getInt(7), rs.getString(8)));
            }
            cn.close();
        }
        return list;
    }
    public static ArrayList<Food> getFoodForBuyer(int index) throws SQLException{
        ArrayList<Food> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select foodID, [name], price, img, quantity, isDelete, categoryID, createTime"
                        + " from tblFood\n" +
                        "where isDelete=0\n" +
                        "and quantity > 0\n" +
                        "order by foodID\n" +
                        "offset ? rows\n" +
                        "fetch first 6 rows only";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, (index-1)*6);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Food(rs.getInt(1), rs.getString(2), 
                                  rs.getDouble(3), rs.getString(4),
                                  rs.getInt(5), rs.getInt(6), 
                                  rs.getInt(7), rs.getString(8)));
            }
            cn.close();
        }
        return list;
    }
    public static ArrayList<Food> getFoodForAdmin(int index) throws SQLException{
        ArrayList<Food> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select foodID, [name], price, img, quantity, isDelete, categoryID, createTime"
                        + " from tblFood\n" +
                        "where isDelete=0\n" +
                        "order by foodID\n" +
                        "offset ? rows\n" +
                        "fetch first 6 rows only";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, (index-1)*6);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Food(rs.getInt(1), rs.getString(2), 
                                  rs.getDouble(3), rs.getString(4),
                                  rs.getInt(5), rs.getInt(6), 
                                  rs.getInt(7), rs.getString(8)));
            }
            cn.close();
        }
        return list;
    }
    public static ArrayList<Food> searchFoodByName(String value) throws SQLException{
        ArrayList<Food> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select foodID, [name], price, img, quantity, isDelete, categoryID, createTime"
                    + " from tblFood\n" +
                        "where isDelete=0\n" +
                        "and [name] like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%"+value+"%");
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Food(rs.getInt(1), rs.getString(2), 
                                  rs.getDouble(3), rs.getString(4),
                                  rs.getInt(5), rs.getInt(6), 
                                  rs.getInt(7), rs.getString(8)));
            }
            cn.close();
        }
        return list;
    }
    public static ArrayList<Food> searchFoodByCategory(String id) throws SQLException{
        ArrayList<Food> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select foodID, [name], price, img, quantity, isDelete, categoryID, createTime"
                        + " from tblFood\n" +
                        "where isDelete=0\n" +
                        "and categoryID=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Food(rs.getInt(1), rs.getString(2), 
                                  rs.getDouble(3), rs.getString(4),
                                  rs.getInt(5), rs.getInt(6), 
                                  rs.getInt(7), rs.getString(8)));
            }
            cn.close();
        }
        return list;
    }
    public static ArrayList<Food> searchFoodByMoney(String from, String to) throws SQLException{
        ArrayList<Food> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select foodID, [name], price, img, quantity, isDelete, categoryID, createTime"
                        + " from tblFood\n" +
                        "where price>=? and price<=?\n"
                        + "and isDelete=0";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, from);
            pst.setString(2, to);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Food(rs.getInt(1), rs.getString(2), 
                                  rs.getDouble(3), rs.getString(4),
                                  rs.getInt(5), rs.getInt(6), 
                                  rs.getInt(7), rs.getString(8)));
            }
            cn.close();
        }
        return list;
    }
    public static int deleteFood(String a, String id) throws SQLException{
        Connection cn=MyConnection.makeConnection();
        int result=0;
        if(cn!=null){
            String sql="update tblFood\n" +
                        "set isDelete=?\n" +
                        "where foodID=?";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setString(1,a);
            pst.setString(2,id);
            result=pst.executeUpdate();
            cn.close();
        }
        return result;
    }
    public static ArrayList<Food> getAllFoodForBin() throws SQLException{
        ArrayList<Food> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select foodID, [name], price, img, quantity, isDelete, categoryID, createTime\n" +
                        "from tblFood\n" +
                        "where isDelete=1";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Food(rs.getInt(1), rs.getString(2), 
                                  rs.getDouble(3), rs.getString(4),
                                  rs.getInt(5), rs.getInt(6), 
                                  rs.getInt(7), rs.getString(8)));
            }
            cn.close();
        }
        return list;
    }
    public static ArrayList<Food> searchFoodInBin(String value) throws SQLException{
        ArrayList<Food> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select foodID, [name], price, img, quantity, isDelete, categoryID, createTime"
                        + " from tblFood\n" +
                        "where isDelete=1\n" +
                        "and [name] like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%"+value+"%");
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Food(rs.getInt(1), rs.getString(2), 
                                  rs.getDouble(3), rs.getString(4),
                                  rs.getInt(5), rs.getInt(6), 
                                  rs.getInt(7), rs.getString(8)));
            }
            cn.close();
        }
        return list;
    }
    public static Food getFoodByID(String id) throws SQLException{
        Food f = null;
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select foodID, [name], price, img, quantity, isDelete, categoryID, createTime\n" +
                        "from tblFood\n" +
                        "where foodID=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                f = new Food(rs.getInt(1), rs.getString(2), 
                                  rs.getDouble(3), rs.getString(4),
                                  rs.getInt(5), rs.getInt(6), 
                                  rs.getInt(7), rs.getString(8));
            }
            cn.close();
        }
        return f;
    }
    public static int updateFood(Food f) throws SQLException{
        Connection cn=MyConnection.makeConnection();
        int result=0;
        if(cn!=null){
            String sql="update tblFood\n" +
                        "set [name]=?, price=?,img=?,\n" +
                        "	quantity=?, categoryID=?\n" +
                        "where foodID=?";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setString(1,f.getFname());
            pst.setDouble(2,f.getFprice());
            pst.setString(3,f.getFimg());
            pst.setInt(4, f.getQuantity());
            pst.setInt(5, f.getCid());
            pst.setInt(6, f.getFid());
            result=pst.executeUpdate();
            cn.close();
        }
        return result;
    }
    public static int getNumberFood() throws SQLException{
        int result=0;
        Connection cn=MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select COUNT(foodID) from tblFood";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                result = rs.getInt(1);
            }
            cn.close();
        }
        return result;
    }
    public static int addFood(Food f) throws SQLException{
        Connection cn=MyConnection.makeConnection();
        int result=0;
        if(cn!=null){
            String sql="insert into tblFood\n" +
                        "values(?,?,?,?,?,?,?,CURRENT_TIMESTAMP)";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setInt(1,f.getFid());
            pst.setString(2,f.getFname());
            pst.setDouble(3,f.getFprice());
            pst.setString(4, f.getFimg());
            pst.setInt(5, f.getQuantity());
            pst.setInt(6, f.getIsdelete());
            pst.setInt(7, f.getCid());
            result=pst.executeUpdate();
            cn.close();
        }
        return result;
    }
    public static int updateQuantity(int n, int id) throws SQLException{
        Connection cn=MyConnection.makeConnection();
        int result=0;
        if(cn!=null){
            String sql="update tblFood\n" +
                        "set quantity -= ?\n" +
                         "where foodID = ?";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setInt(1, n);
            pst.setInt(2, id);
            result=pst.executeUpdate();
            cn.close();
        }
        return result;
    }
    public static int getNumberPage() throws SQLException{
        int result=0;
        Connection cn=MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select COUNT(foodID) from tblFood\n"
                    + "where isDelete = 0\n"
                    + "and quantity > 0";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                result = rs.getInt(1)/6;
                if(rs.getInt(1) % 6 != 0){
                    result++;
                }
            }
            cn.close();
        }
        return result;
    }
    public static int getNumberPage2() throws SQLException{
        int result=0;
        Connection cn=MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select COUNT(foodID) from tblFood\n"
                    + "where isDelete = 0";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                result = rs.getInt(1)/6;
                if(rs.getInt(1) % 6 != 0){
                    result++;
                }
            }
            cn.close();
        }
        return result;
    }
    public static ArrayList<Food> getNewFood() throws SQLException{
        ArrayList<Food> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select TOP 5 foodID, [name], price, img, quantity, isDelete, categoryID, createTime"
                    + " from tblFood\n" +
                        "where isDelete=0 and quantity >0\n" +
                        "order by foodID desc";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Food(rs.getInt(1), rs.getString(2), 
                                  rs.getDouble(3), rs.getString(4),
                                  rs.getInt(5), rs.getInt(6), 
                                  rs.getInt(7), rs.getString(8)));
            }
            cn.close();
        }
        return list;
    }
    public static int getBestSeller() throws SQLException{
        int res = 0;
        Connection cn=MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select TOP 1 foodID\n" +
                            "from tblOrderDetail\n" +
                            "group by foodID\n" +
                            "order by SUM(quantity) desc";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                res = rs.getInt(1);
            }
            cn.close();
        }
        return res;
    }
}
