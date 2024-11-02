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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HagiLee
 */
public class SearchProduct {

    private List<Product> SearchByName;

    public List<Product> SearchByName(String txtName) {
        List<Product> SearchByName = new ArrayList<>(); // Khởi tạo danh sách sản phẩm
        try {
            Connection conn = new DBUtils().getConnection(); // Kết nối cơ sở dữ liệu
            if (conn != null) {
                String query = "SELECT * FROM Product WHERE [Name] LIKE ?";  
                PreparedStatement ps = conn.prepareStatement(query);                
                ps.setString(1, "%" + txtName + "%"); 

                ResultSet rs = ps.executeQuery(); // Thực thi truy vấn

                // Duyệt qua các kết quả trả về
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
                    int type = rs.getInt("[Type]");
                    String status = rs.getString("Status");

                    // Tạo đối tượng Product
                    Product product = new Product(pid, soid, image, name, price, qSell, qRent, age, brand, 
                            origin, description, category, type, status);
                    SearchByName.add(product); // Thêm sản phẩm vào danh sách
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Để dễ dàng debug nếu có lỗi
        }
        return SearchByName; // Trả về danh sách sản phẩm
    }

}
