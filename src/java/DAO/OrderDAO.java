/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.DBUtils;
import Entity.Cart;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 *
 * @author Quyền
 */
public class OrderDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public int insertOrder(int uid, float price) {
        try {
            LocalDateTime currentDateTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
            String formattedDateTime = currentDateTime.format(formatter);

            String query = " INSERT INTO [Order] (UID, CreationDate, Price) VALUES (?, ?, ?) ";
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, uid);
            ps.setString(2, formattedDateTime);
            ps.setFloat(3, price);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int oid = rs.getInt(1);
                    return oid;
                }
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public void insertOrderDetail(int oid, List<Cart> cart){

        for (Cart c : cart) {
            try {
                int soid = getSOID(c.getPid());
                String sql = "INSERT INTO [Order_Detail] (OID, SOID, PID, Quantity, TimeRent, DateStart, DateEnd, Status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                conn = new DBUtils().getConnection();
                ps = conn.prepareStatement(sql);
                ps.setInt(1, oid);
                ps.setInt(2, soid);
                ps.setInt(3, c.getPid());
                ps.setInt(4, c.getQuantity());
                ps.setInt(5, c.getRentTime());
                ps.setNull(6, Types.DATE);
                ps.setNull(7, Types.DATE);
                ps.setInt(8, 1);
                ps.executeUpdate();
            } catch (Exception e) {
            }
        }
    }

    public int getSOID(int pid) {
        int soid = 0;
        try {
            String sql = "SELECT [SOID] FROM [Product] WHERE PID = ?";
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, pid);
            rs = ps.executeQuery();
            if (rs.next()) {
                soid = rs.getInt("SOID");
                return soid;
            }
        } catch (Exception e) {
        }
        return soid;
    }
}
