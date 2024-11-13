/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.DBUtils;
import Entity.Shipper;
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
public class GetShipperDAO {
    private List<Shipper> shipperList;
    
    public GetShipperDAO(){
        shipperList = new ArrayList<>();
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
                    int shid = rs.getInt("SHID");
                    String name = rs.getString("Name");
                    String citizenCode = rs.getString("Citizen_code");
                    
                    Shipper SO = new Shipper(shid, uid, name, citizenCode);
                    shipperList.add(SO);
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
    
    public List<Shipper> getShipperList() {
        return shipperList;
    } 
}
