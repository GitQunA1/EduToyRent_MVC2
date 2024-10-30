/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.util.Date;

/**
 *
 * @author LENOVO
 */
public class OrderDetailDAO {

    public void insertOrderDetail(int oid, int soid, int pid, int quantity, int timeRent) throws Exception {
        String sql = "INSERT INTO [Order_Detail] (OID, SOID, PID, Quantity, TimeRent, DateStart, DateEnd, Status) VALUES (?, ?, ?, ?, ?, NULL, NULL, ?)";

        try (Connection con = utils.util.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, oid);
            ps.setInt(2, soid);
            ps.setInt(3, pid);
            ps.setInt(4, quantity);
            ps.setInt(5, timeRent);
            ps.setString(6, "1");
            ps.executeUpdate();
        }
    }

    public boolean updateOrderDetail(int odid, int quantity, int timeRent, LocalDate dateStart, LocalDate dateEnd, String status) throws Exception {
        String sql = "UPDATE [Order_Detail] SET Quantity = ?, TimeRent = ?, DateStart = ?, DateEnd = ?, Status = ? WHERE ODID = ?";

        try (Connection con = utils.util.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, quantity);
            ps.setInt(2, timeRent);
            ps.setDate(3, java.sql.Date.valueOf(dateStart)); 
            ps.setDate(4, java.sql.Date.valueOf(dateEnd));   
            ps.setInt(5, Integer.parseInt(status));
            ps.setInt(6, odid);

            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;
        }
    }
}
