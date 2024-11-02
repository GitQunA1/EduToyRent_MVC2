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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



/**
 *
 * @author HagiLee
 */
public class GetProductDAO {

    private List<Product> successList;
    private List<Product> failureList;
    private List<Product> pendingList;

    public GetProductDAO() {
        successList = new ArrayList<>();
        failureList = new ArrayList<>();
        pendingList = new ArrayList<>();

        // Load products from the database
        loadProductsFromDatabase();
    }

    private void loadProductsFromDatabase() {
        try {
            
        
        Connection conn = new DBUtils().getConnection();
        if (conn != null) {
            String query = "SELECT * FROM Product";  
            try (PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery()) {

                
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

                    
                    Product product = new Product(pid, soid, image, name, price, qSell, 
                            qRent, age, brand, origin, description, category, type, status);
                    
                    switch (status) {
                        case "Thành công":
                            successList.add(product);
                            break;
                        case "Thất bại":
                            failureList.add(product);
                            break;
                        case "Đang chờ":
                            pendingList.add(product);
                            break;
                    }
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

    public List<Product> getSuccessList() {
        return successList;
    }

    public List<Product> getFailureList() {
        return failureList;
    }

    public List<Product> getPendingList() {
        return pendingList;
    }
    
    
     private Connection connection ;
    public List<Product> getProductsByIds(List<Integer> productIds) throws Exception {
        List<Product> products = new ArrayList<>();
        if (productIds.isEmpty()) return products; // Nếu không có ID thì trả về danh sách rỗng

        // Chuyển đổi danh sách ID thành một chuỗi cho câu lệnh SQL
        StringBuilder sql = new StringBuilder("SELECT * FROM Product WHERE PID IN (");
        for (int i = 0; i < productIds.size(); i++) {
            sql.append("?");
            if (i < productIds.size() - 1) sql.append(", ");
        }
        sql.append(")");
        
        connection = new DBUtils().getConnection();
        try (PreparedStatement stmt = connection.prepareStatement(sql.toString())) {
            for (int i = 0; i < productIds.size(); i++) {
                stmt.setInt(i + 1, productIds.get(i)); // Đặt các giá trị vào câu lệnh
            }
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                // Tạo đối tượng Product từ kết quả truy vấn
                Product product = new Product();
                product.setPid(rs.getInt("PID"));
                product.setSoid(rs.getInt("SOID"));
                product.setImage(rs.getString("Image"));
                product.setName(rs.getString("Name"));
                product.setPrice(rs.getFloat("Price"));
                product.setqSell(rs.getInt("QSell"));
                product.setqSell(rs.getInt("QRent"));
                product.setAge(rs.getInt("Age"));
                product.setBrand(rs.getString("Brand"));
                product.setOrigin(rs.getString("Origin"));
                product.setDescription(rs.getString("Description"));
                product.setCategory(rs.getString("Category"));
                product.setType(rs.getInt("Type"));
                product.setStatus(rs.getString("Status"));
                products.add(product); // Thêm sản phẩm vào danh sách
            }
        }
        return products;
    }
}
