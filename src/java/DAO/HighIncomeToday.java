/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.DBUtils;
import Entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HagiLee
 */
public class HighIncomeToday {

    public List<Product> HighIncList(int SOID) {
        List<Product> HighIncList = new ArrayList<>();
        LocalDate currentDate = LocalDate.now();
        try {
            Connection conn = new DBUtils().getConnection();
            if (conn != null) {
                String query = "SELECT TOP 7 p.*\n"
                        + "FROM Product p\n"
                        + "JOIN Income i ON p.PID = i.PID\n"
                        + "Where i.Date = ?\n"
                        + "and p.SOID = ? \n"
                        + "ORDER BY (i.IncSell + i.IncRent) DESC;";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setDate(1, java.sql.Date.valueOf(currentDate));
                ps.setInt(2, SOID);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int pid = rs.getInt("PID");
                    int soid = rs.getInt("SOID");
                    String image = rs.getString("Image");
                    String name = rs.getString("Name");
                    float price = rs.getFloat("Price");
                    int qSell = rs.getInt("QSell");
                    int qRent = rs.getInt("QRent");
                    int age = rs.getInt("Age");
                    String brand = rs.getString("Brand");
                    String origin = rs.getString("Origin");
                    String description = rs.getString("Description");
                    String category = rs.getString("Category");
                    int type = rs.getInt("Type");
                    String status = rs.getString("Status");

                    // Tạo đối tượng Product
                    Product product = new Product(pid, soid, image, name, price, qSell, qRent, age, brand,
                            origin, description, category, type, status);
                    HighIncList.add(product); // Thêm sản phẩm vào danh sách
                }
            }
        } catch (Exception e) {
        }
        return HighIncList;
    }
    
    public List<Product> getAnother(int SOID){
        List<Product> Another = new ArrayList<>();
        try {
            Connection conn = new DBUtils().getConnection();
            if (conn != null) {
                String query = "SELECT * FROM Product Where SOID = ? ";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, SOID);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int pid = rs.getInt("PID");
                    int soid = rs.getInt("SOID");
                    String image = rs.getString("Image");
                    String name = rs.getString("Name");
                    float price = rs.getFloat("Price");
                    int qSell = rs.getInt("QSell");
                    int qRent = rs.getInt("QRent");
                    int age = rs.getInt("Age");
                    String brand = rs.getString("Brand");
                    String origin = rs.getString("Origin");
                    String description = rs.getString("Description");
                    String category = rs.getString("Category");
                    int type = rs.getInt("Type");
                    String status = rs.getString("Status");

                    // Tạo đối tượng Product
                    Product product = new Product(pid, soid, image, name, price, qSell, qRent, age, brand, 
                            origin, description, category, type, status);
                        Another.add(product);
                }
            }
        } catch (Exception e) {
        }
        
        return Another;
    }


}
