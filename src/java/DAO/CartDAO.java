/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.DBUtils;
import Entity.Cart;
import Entity.FeePolicy;
import Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HagiLee
 */
public class CartDAO {    
    private List<Cart> cartList;

    public List<Cart> getCart(User user) {
        cartList = new ArrayList<>();
        String sql = "SELECT * FROM [Cart] WHERE [UID] = ?";
        try {
            Connection conn = new DBUtils().getConnection();
            if (conn != null) {
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, user.getUid());
                ResultSet rs = ps.executeQuery(); 
                while (rs.next()) {
                    int caid = rs.getInt("CAID");
                    int uid = rs.getInt("UID");
                    int pid = rs.getInt("PID");
                    int quantity = rs.getInt("Quantity");
                    float total = rs.getFloat("Total");
                    int rentTime = rs.getInt("RentTime");
                
                    Cart cart = new Cart(caid, uid, pid, quantity, total, rentTime);
                    cartList.add(cart);
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return cartList; 
    }
    
    
    public boolean addToCart(User user, String txtPID, String txtQuantity, String txtPrice, String selectedDuration) {
       
        
        
        try {
            int pid = Integer.parseInt(txtPID);
            int quantity = Integer.parseInt(txtQuantity);
            int  rentTime = Integer.parseInt(selectedDuration);           
            float price = Float.parseFloat(txtPrice);
            float total = total(quantity, price, rentTime);
            Connection conn = new DBUtils().getConnection();
            
            if (conn != null) {
                String sql = "INSERT INTO [Cart] ([UID], [PID], [Quantity], [Total], [RentTime]) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, user.getUid());
                ps.setInt(2, pid);
                ps.setInt(3, quantity);
                ps.setFloat(4, total);
                ps.setInt(5, rentTime);
                int rowsAffected = ps.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public float total(int quantity, float price, int rentTime) {
        float total = 0;
        GetFeePolicy gfp = new GetFeePolicy();
        FeePolicy fp = gfp.getFeePolicy();
        if(rentTime == 0){
            total = price * quantity;
        }else if(rentTime == 7){
            total = price * quantity * fp.getWeek() / 100;
        }else if(rentTime == 14){
            total = price * quantity * fp.getBiWeek() / 100;
        }else if(rentTime == 30){
            total = price * quantity * fp.getMonth() / 100;
        }
        
        return total;
    }
    
    
    public boolean UpdateCart(int uid, String txtCAID, String txtQuantity, String txtPrice, String txtRentTime) {

        String sql = "UPDATE [Cart] SET Quantity = ?, Total = ?, RentTime = ? WHERE CAID = ? AND UID = ?";
        try {
            int caid = Integer.parseInt(txtCAID);
            int quantity = Integer.parseInt(txtQuantity);
            int rentTime = Integer.parseInt(txtRentTime);
            float price = Float.parseFloat(txtPrice);
            float total = total(quantity, price, rentTime);
            Connection conn = new DBUtils().getConnection();
            if (conn != null) {
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, quantity);
                ps.setFloat(2, total);
                ps.setInt(3, rentTime);
                ps.setInt(4, caid);
                ps.setInt(5, uid);
                int rowsAffected = ps.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    
    public boolean deleteCart(int uid, int caid) {
        String sql = "DELETE FROM [Cart] WHERE UID = ? AND CAID = ?";
        try{ 
            Connection conn = new DBUtils().getConnection();
            if (conn != null) {
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, uid);
                ps.setInt(2, caid);
                int rowsAffected = ps.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}

