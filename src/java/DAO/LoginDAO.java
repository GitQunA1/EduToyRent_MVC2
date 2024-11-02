/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Entity.User;


/**
 *
 * @author ACER
 */
public class LoginDAO {
    
    private Connection conn = null;
    private PreparedStatement ptm = null;
    private ResultSet rs = null;
    
    public boolean checkEmail (String txtEmail){
        boolean exit = false;
        String sql= "SELECT * FROM [User] WHERE [Email] = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, txtEmail);
                rs = ptm.executeQuery();
                if (rs.next()){
                    exit = rs.getInt(1)>0;
                }
            }
            }catch (Exception e){
                
            }
                 return exit;
       
        
    }
    public User checkLogin (String txtEmail, String txtPassword) {
        String sql= "SELECT * FROM [User] WHERE [Email] = ? and [Password] = ? ";
        User user = null;
        try {
             conn = DBUtils.getConnection();
             if (conn != null){
                 ptm = conn.prepareStatement(sql);
                 ptm.setString(1, txtEmail);
                 ptm.setString(2, txtPassword);
                 rs =ptm.executeQuery();
                 if (rs.next()){
                     int uID = rs.getInt("UID");
                     String email = rs.getString("Email");
                     String phone = rs.getString("Phone");
                     String password = rs.getString("Password");
                     String role = rs.getString("Role");
                     user = new User(uID, email, phone, password, role);
                 }
             } 
        } catch (Exception e) {
        }
        return user;
    }
    
}
