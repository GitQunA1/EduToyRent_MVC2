/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Entity.Customer;
import utils.util;
/**
 *
 * @author LENOVO
 */
public class CustomerDAO {
    public boolean addCustomer_Register(Customer customer) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;
        boolean result = false;
        try {
            con = util.getConnection();
            String sql = "INSERT INTO [Customer] (UID, Name) VALUES (?, ?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, customer.getUID());
            ps.setString(2, customer.getName());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
        return result;
    }
}
