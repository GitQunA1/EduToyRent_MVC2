/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Entity.Customer;
/**
 *
 * @author LENOVO
 */
public class CustomerDAO {
    public void addCustomer_Register(Customer customer) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DB.DBUtils.getConnection();
            String sql = "INSERT INTO [Customer] (UID, Name) VALUES (?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, customer.getUid());
            ps.setString(2, customer.getName());
            ps.executeUpdate();
        } catch(Exception e){
        }
    }
}


