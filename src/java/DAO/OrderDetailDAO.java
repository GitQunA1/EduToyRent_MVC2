/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author LENOVO
 */
public class OrderDetailDAO {
    public void insertOrderDetail(int oid, int soid, int pid, int quantity, int timeRent) throws Exception {
        String sql = "INSERT INTO [Order_Detail] (OID, SOID, PID, Quantity, TimeRent, DateStart, DateEnd, Status) VALUES (?, ?, ?, ?, ?, NULL, NULL, ?)";
        
        try (Connection con = utils.util.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, oid);         
            ps.setInt(2, soid);        
            ps.setInt(3, pid);         
            ps.setInt(4, quantity);   
            ps.setInt(5, timeRent);    
            ps.setString(6, "1");     
            ps.executeUpdate();
        }
    }
}
