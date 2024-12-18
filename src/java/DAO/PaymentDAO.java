/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.DBUtils;
import Entity.Cart;
import Entity.FeePolicy;
import Entity.Payment;
import Entity.PaymentDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 *
 * @author Quyền
 */
public class PaymentDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public int insertPayment(int oid, float price, float point, String method) {
        try {
            LocalDateTime currentDateTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

            String query = " INSERT INTO [Payment] (OID, Amount, points, Method, Date) VALUES (?, ?, ?, ?, ?) ";
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, oid);
            ps.setFloat(2, price);
            ps.setFloat(3, point);
            ps.setString(4, method);
            ps.setTimestamp(5, Timestamp.valueOf(currentDateTime));
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int paid = rs.getInt(1);
                    return paid;
                }
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public boolean insertPDetail(int paid, int oid, List<Cart> cart) {
        for (Cart c : cart) {

            try {
                int odid = getODID(oid, c.getPid(), c.getRentTime());
                float deposit = Deposit(c.getTotal(), c.getRentTime());
                String status = "Đã thanh toán";
                
                LocalDateTime currentDateTime = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
                String formattedDateTime = currentDateTime.format(formatter);
                
                String sql = "INSERT INTO [PDetail] (PAID, ODID, Price, Deposit, Refund_Shop, Refund_Cus, platform_fee, Date, Status) VALUES (?, ?, ?, ?, 0, 0, 0 ,? ,?)";
                conn = new DBUtils().getConnection();
                ps = conn.prepareStatement(sql);
                ps.setInt(1, paid);
                ps.setInt(2, odid);
                ps.setFloat(3, c.getTotal());
                ps.setFloat(4, deposit);
                ps.setTimestamp(5, Timestamp.valueOf(currentDateTime));
                ps.setString(6, status);
                int result =  ps.executeUpdate();
            } catch (Exception e) {
            }
        }
        return true;
    }

    public float Deposit(float total, int rentTime) {
        GetFeePolicy gfp = new GetFeePolicy();
        FeePolicy f = gfp.getFeePolicy();
        float deposit = 0;
        switch (rentTime) {
            case 7:
                deposit = total / f.getWeek() * (100 - f.getWeek());
                break;
            case 14:
                deposit = total / f.getBiWeek() * (100 - f.getBiWeek());
                break;
            case 30:
                deposit = total / f.getMonth() * (100 - f.getMonth());
                break;
        }
        return deposit;
    }

    public int getODID(int oid, int pid, int rentTime) {
        try {
            String sql = "SELECT [ODID] FROM [Order_Detail] WHERE OID = ? AND PID = ? AND TimeRent = ?";
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, oid);
            ps.setInt(2, pid);
            ps.setInt(3, rentTime);
            rs = ps.executeQuery();
            if (rs.next()) {
                int odid = rs.getInt("ODID");
                return odid;
            }
        } catch (Exception e) {
        }
        return 0;
    }
    
    public PaymentDetail getPDetail(int odid){
        String sql = "SELECT * FROM [PDetail] WHERE ODID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, odid);
            rs = ps.executeQuery();
            if (rs.next()) {                
                int pdid = rs.getInt("PDID");
                int paid = rs.getInt("PAID");
                float price = rs.getFloat("Price");
                float deposit = rs.getFloat("Deposit");
                float refShop = rs.getFloat("Refund_Shop");
                float refCus = rs.getFloat("Refund_Cus");
                float flatformFee = rs.getFloat("platform_fee");
                String date = rs.getString("Date");
                String status = rs.getString("Status");
                
                PaymentDetail pd = new PaymentDetail(pdid, paid, odid, price, deposit, refShop, refCus, flatformFee, date, status);
                return pd;
            }
        } catch (Exception e) {
        }
        return null;
    }
  
    public Payment getPaymentByOID(int oid) {
        String sql = "SELECT * FROM [Payment] WHERE OID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, oid); 

            rs = ps.executeQuery();  
            if (rs.next()) {
                int paid = rs.getInt("PAID");
                float amount = rs.getFloat("Amount");
                float points = rs.getFloat("points");
                String method = rs.getString("Method");
                String date = rs.getString("Date");
                Payment p = new Payment(paid, oid, amount, points, method, date);
                return p;
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return null; 
    }

    public boolean UpdatePDetail(int odid, float refundShop, float refundCus, float platformFee){
        String sql = "UPDATE [PDetail] SET Refund_Shop = ?, Refund_Cus = ?, platform_fee = ? WHERE ODID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setFloat(1, refundShop);
            ps.setFloat(2, refundCus);
            ps.setFloat(3, platformFee);
            ps.setInt(4, odid);
            int rs = ps.executeUpdate();
            if(rs > 0)
                return true;
        } catch (Exception e) {
        }
        return false;
    }

}
