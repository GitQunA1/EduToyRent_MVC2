/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.DBUtils;
import Entity.Customer;
import Entity.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ACER
 */
public class ProfileDAO {

    private Connection conn = null;
    private PreparedStatement ptm = null;
    private ResultSet rs = null;

    public Customer ShowCustomer(int uid) {

        String sql = "SELECT * FROM [Customer] Where UID = ?";
        Customer cus = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, uid);
                rs = ptm.executeQuery();
                if(rs.next()){
                    String avatar = rs.getString("Avatar");
                    String name = rs.getString("Name");
                    String sex = rs.getString("Sex");
                    Date birthday = rs.getDate("Birthday");
                    String address = rs.getString("Address");
                    int membership = rs.getInt("Membership");
                    cus = new Customer(uid, avatar, name, sex, birthday, address, membership);
                }
                
            }

        } catch (Exception e) {
        }
        return cus;

    }
    
    public List<Customer> getCustomer(){
        String sql = "SELECT * FROM [Customer]";
        List<Customer> cusList = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while(rs.next()){
                    int uid = rs.getInt("UID");
                    String avatar = rs.getString("Avatar");
                    String name = rs.getString("Name");
                    String sex = rs.getString("Sex");
                    Date birthday = rs.getDate("Birthday");
                    String address = rs.getString("Address");
                    int membership = rs.getInt("Membership");
                    
                    Customer cus = new Customer(uid, avatar, name, sex, birthday, address, membership);
                    cusList.add(cus);
                }
            }
            return cusList;
        } catch (Exception e) {
        }
        return cusList;
    }
    
    public User ShowUser(int uid) {
        String sql = "SELECT * FROM [User] Where UID = ?";
        User u = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, uid);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int Uid = rs.getInt("UID");
                    String email = rs.getString("Email");
                    String phone = rs.getString("Phone");
                    String pass = rs.getString("Password");
                    String role = rs.getString("Role");
                    u = new User(Uid, email, phone, pass, role);
                }
            }
        } catch (Exception e) {
        }
        return u;
    }

    public int updateProfileCustomer(int uid, String avatar, String name, String sex, Date birthday, String address)
            throws SQLException, ClassNotFoundException {
        String sql = "UPDATE [Customer] SET [Avatar] = ?, [Name] = ?, [Sex] = ?, [Birthday] = ?, [Address] = ? WHERE [UID] = ?";
        try (Connection con = DB.DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, avatar);
            ps.setString(2, name);
            ps.setString(3, sex);
            ps.setDate(4, birthday);
            ps.setString(5, address);
            ps.setInt(6, uid);

            return ps.executeUpdate();
        }
    }
    
    public void updatePhone(int uid, String phone)
            throws SQLException, ClassNotFoundException {
        String sql = "UPDATE [User] SET [Phone] = ? WHERE [UID] = ?";
        try (Connection con = DB.DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, phone);
            ps.setInt(2, uid);

            ps.executeUpdate();
        }
    }
}
