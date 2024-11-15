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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HagiLee
 */
public class SearchProduct {

    public List<Product> SearchByName(String txtName, int qRent, int qSell, int qStype) {
        List<Product> searchResults = new ArrayList<>();
        try {
            // Kết nối với cơ sở dữ liệu
            Connection conn = new DBUtils().getConnection();
            if (conn != null) {
                String query = String.format(
                        "SELECT * FROM [Product] WHERE Name COLLATE Vietnamese_CI_AI LIKE N'%%%s%%' AND QRent = %d AND QSell >= %d AND Type = %d",
                        txtName, qRent, qSell, qStype
                );
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);
         

                
                while (rs.next()) {
                    int pid = rs.getInt("PID");
                    int soid = rs.getInt("SOID");
                    String image = rs.getString("Image");
                    String name = rs.getString("Name");
                    float price = rs.getFloat("Price");
                    int qSellResult = rs.getInt("QSell");
                    int qRentResult = rs.getInt("QRent");
                    int age = rs.getInt("Age");
                    String brand = rs.getString("Brand");
                    String origin = rs.getString("Origin");
                    String description = rs.getString("Description");
                    String category = rs.getString("Category");
                    int type = rs.getInt("Type");
                    String status = rs.getString("Status");

                    // Tạo đối tượng Product từ kết quả truy vấn và thêm vào danh sách
                    Product product = new Product(pid, soid, image, name, price, qSellResult, qRentResult, age, brand,
                            origin, description, category, type, status);
                    searchResults.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return searchResults; 
    }

}
