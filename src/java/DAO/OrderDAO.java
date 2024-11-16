/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.DBUtils;
import Entity.Cart;
import Entity.Order;
import Entity.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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

            String query = " INSERT INTO [Order] (UID, CreationDate, Price) VALUES (?, ?, ?) ";
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, uid);
            ps.setTimestamp(2, Timestamp.valueOf(currentDateTime));
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

    public boolean insertOrderDetail(int oid, List<Cart> cart) {

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
                ps.setNull(6, Types.NVARCHAR);
                ps.setNull(7, Types.NVARCHAR);
                ps.setInt(8, 1);
                int result = ps.executeUpdate();
            } catch (Exception e) {
            }
        }
        return true;
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

    public List<Order> getOrder(int uid) {
        List<Order> oList = new ArrayList<>();
        String sql = "SELECT * FROM [Order] WHERE UID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            rs = ps.executeQuery();
            while (rs.next()) {
                int oid = rs.getInt("OID");
                int id = rs.getInt("UID");
                String creationDate = rs.getString("CreationDate");
                float price = rs.getFloat("Price");

                Order o = new Order(oid, id, creationDate, price);
                oList.add(o);
            }
            return oList;
        } catch (Exception e) {
        }
        return oList;
    }

    public List<OrderDetail> GetOrderByStatus(int uid, int status) {
        List<Order> oList = getOrder(uid);
        List<OrderDetail> orderList = new ArrayList<>();
        String sql = "SELECT * FROM [Order_Detail] WHERE OID =? AND Status = ?";
        if (status == 0) {
            sql = "SELECT * FROM [Order_Detail] WHERE OID = ?";
        }
        try {
            conn = new DBUtils().getConnection();
            for (Order order : oList) {

                ps = conn.prepareStatement(sql);
                ps.setInt(1, order.getOid());
                if (status != 0) {
                    ps.setInt(2, status);
                }
                rs = ps.executeQuery();
                while (rs.next()) {
                    int odid = rs.getInt("ODID");
                    int oid = rs.getInt("OID");
                    int soid = rs.getInt("SOID");
                    int pid = rs.getInt("PID");
                    int quantity = rs.getInt("Quantity");
                    int rentTime = rs.getInt("TimeRent");
                    String dateStart = rs.getString("DateStart");
                    String dateEnd = rs.getString("DateEnd");
                    int sta = rs.getInt("Status");

                    OrderDetail od = new OrderDetail(odid, oid, soid, pid, quantity, rentTime, dateStart, dateEnd, sta);
                    orderList.add(od);
                }
            }
            return orderList;
        } catch (Exception e) {
        }
        return orderList;
    }

    public List<OrderDetail> GetOrderDetailBySOID(int soid, int status) {
        List<OrderDetail> orderDetailsOwner = new ArrayList<>();
        String sql = "SELECT * FROM [Order_Detail] WHERE SOID = ? AND Status = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, soid);
            ps.setInt(2, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                int odid = rs.getInt("ODID");
                int oid = rs.getInt("OID");
                int pid = rs.getInt("PID");
                int quantity = rs.getInt("Quantity");
                int rentTime = rs.getInt("TimeRent");
                String dateStart = rs.getString("DateStart");
                String dateEnd = rs.getString("DateEnd");

                OrderDetail od = new OrderDetail(odid, oid, soid, pid, quantity, rentTime, dateStart, dateEnd, status);
                orderDetailsOwner.add(od);
            }
            return orderDetailsOwner;
        } catch (Exception e) {
        }
        return orderDetailsOwner;
    }
    
    public OrderDetail GetPIDByODID(int odid){
        String sql = "SELECT PID FROM [Order_Detail] WHERE ODID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, odid);
            rs = ps.executeQuery();
            if(rs.next()){
                int oid = rs.getInt("OID");
                int soid = rs.getInt("SOID");
                int pid = rs.getInt("PID");
                int quantity = rs.getInt("Quantity");
                int rentTime = rs.getInt("TimeRent");
                String dateStart = rs.getString("DateStart");
                String dateEnd = rs.getString("DateEnd");
                int status = rs.getInt("Status");
                OrderDetail od = new OrderDetail(odid, oid, soid, pid, quantity, rentTime, dateStart, dateEnd, status);
                return od;
            }   
        } catch (Exception e) {
        }
        return null;
    }

    public boolean updateOrderDetail(int odid, int status) {
        String sql = "UPDATE [Order_Detail] SET Status = ? WHERE ODID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, odid);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean setRentTime(int odid, int rentTime) {
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String sql = "UPDATE [Order_Detail] SET DateStart = ?, DateEnd = ? WHERE ODID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setTimestamp(1, Timestamp.valueOf(currentDateTime));
            ps.setTimestamp(2, Timestamp.valueOf(currentDateTime.minusDays(rentTime)));
            ps.setInt(3, odid);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
}
