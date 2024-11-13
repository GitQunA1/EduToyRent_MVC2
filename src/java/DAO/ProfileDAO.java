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
}
