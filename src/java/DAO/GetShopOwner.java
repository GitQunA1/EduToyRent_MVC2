/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.DBUtils;
import Entity.ShopOwner;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HagiLee
 */
public class GetShopOwner {
    private List<ShopOwner> shopList;
    
    public GetShopOwner(){
        shopList = new ArrayList<>();
        loadProductsFromDatabase();
    }
    
    private void loadProductsFromDatabase() {
        try {          
        
        Connection conn = new DBUtils().getConnection();
        if (conn != null) {
            String query = "SELECT * FROM Shop_Owner";  
            try (PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery()) {
                
                while (rs.next()) {
                    int uid = rs.getInt("UID");
                    int soid = rs.getInt("SOID");
                    String avatar = rs.getString("Avatar");
                    String name = rs.getString("Name");
                    String citizenCode = rs.getString("Citizen_code");
                    String wareHouse = rs.getString("Warehouse");
                    int type = rs.getInt("Type");
                    
                    ShopOwner SO = new ShopOwner(uid, soid, avatar, name, citizenCode, wareHouse, type);
                    shopList.add(SO);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        } catch (Exception e) {
        }
    }
    
    public List<ShopOwner> getShopList() {
        return shopList;
    }   
    
    private Connection connection ;
    public List<ShopOwner> getShopsByIds(List<Integer> shopIds) throws Exception {
        List<ShopOwner> shopOwners = new ArrayList<>();
        if (shopIds.isEmpty()) return shopOwners; // Nếu không có ID thì trả về danh sách rỗng

        // Tạo câu lệnh SQL
        StringBuilder sql = new StringBuilder("SELECT * FROM Shop_Owner WHERE SOID IN (" );
        for (int i = 0; i < shopIds.size(); i++) {
            sql.append("?");
            if (i < shopIds.size() - 1) sql.append(", ");
        }
        sql.append(")");
        connection = new DBUtils().getConnection();
        try (PreparedStatement stmt = connection.prepareStatement(sql.toString())) {
            for (int i = 0; i < shopIds.size(); i++) {
                stmt.setInt(i + 1, shopIds.get(i)); // Đặt các giá trị vào câu lệnh
            }
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                // Tạo đối tượng ShopOwner từ kết quả truy vấn
                ShopOwner shopOwner = new ShopOwner();
                shopOwner.setUid(rs.getInt("UID"));
                shopOwner.setSoid(rs.getInt("SOID"));
                shopOwner.setAvatar(rs.getString("Avatar"));
                shopOwner.setName(rs.getString("Name"));
                shopOwner.setCitizenCode(rs.getString("Citizen_code"));
                shopOwner.setWareHouse(rs.getString("Warehouse"));
                shopOwner.setType(rs.getInt("Type"));
                shopOwners.add(shopOwner); // Thêm cửa hàng vào danh sách
            }
        }
        return shopOwners;
    }
}
