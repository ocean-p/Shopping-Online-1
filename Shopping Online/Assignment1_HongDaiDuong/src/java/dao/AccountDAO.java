/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.MyConnection;

/**
 *
 * @author DELL
 */
public class AccountDAO {
    public static Account getAccount(String u, String p) throws SQLException{
        Account a=null;
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select username, [password], fullname, isAdmin\n" +
                        "from tblAccount\n" +
                        "where username = ? and [password] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, u);
            pst.setString(2, p);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                a = new Account(rs.getString(1), rs.getString(2), rs.getString(3), 
                        rs.getInt(4));
            }
            cn.close();
        }
        return a;
    }
}
