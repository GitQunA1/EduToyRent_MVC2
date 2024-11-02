/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.DBUtils;
import Entity.Cart;
import Entity.FeePolicy;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
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
            LocalDate currentDate = LocalDate.now();

            String query = " INSERT INTO [Payment] (OID, Amount, points, Method, Date) VALUES (?, ?, ?, ?, ?) ";
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, oid);
            ps.setFloat(2, price);
            ps.setFloat(3, point);
            ps.setString(4, method);
            ps.setDate(5, Date.valueOf(currentDate));
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

    public void insertPDetail(int paid, int oid, List<Cart> cart) {
        for (Cart c : cart) {

            try {
                int odid = getODID(oid, c.getPid(), c.getRentTime());
                float deposit = Deposit(c.getTotal(), c.getRentTime());
                String status = "Đã thanh toán";
                LocalDate currentDate = LocalDate.now();
                String sql = "INSERT INTO [PDetail] (PAID, ODID, Price, Deposit, Refund_Shop, Refund_Cus, platform_fee, Date, Status) VALUES (?, ?, ?, ?, 0, 0, 0 ,? ,?)";
                conn = new DBUtils().getConnection();
                ps = conn.prepareStatement(sql);
                ps.setInt(1, paid);
                ps.setInt(2, odid);
                ps.setFloat(3, c.getTotal());
                ps.setFloat(4, deposit);
                ps.setDate(5, java.sql.Date.valueOf(currentDate));
                ps.setString(6, status);
                ps.executeUpdate();
            } catch (Exception e) {
            }
        }
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
}
