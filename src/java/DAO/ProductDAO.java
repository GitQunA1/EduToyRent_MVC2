/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author LENOVO
 */
public class ProductDAO {

    public boolean insertProduct(int soid, String image, String name, float price, int qSell, int qRent, int age,
            String brand, String origin, String description, String category, int type, String status) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO [Product] (SOID, Image, Name, Price, QSell, QRent, Age, Brand, Origin, Description, Category, Type, Status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DB.DBUtils.getConnection(); 
            PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, soid);
            ps.setString(2, image);
            ps.setString(3, name);
            ps.setFloat(4, price);

            if (type == 1) { // Shop chỉ bán, kh cho thuê
                ps.setInt(5, qSell);
                ps.setInt(6, 0);
            } else if (type == 2) { //cá nhân cho thuê hoặc bán 1 sản phẩm
                if (qSell > 0) {
                    ps.setInt(5, 1);
                    ps.setInt(6, 0);
                } else if (qRent > 0) {
                    ps.setInt(5, 0);
                    ps.setInt(6, 1);
                } else {
                    throw new IllegalArgumentException("Cần chỉ định số lượng cho bán hoặc cho thuê, không được để cả hai là 0.");
                }
            }

            ps.setInt(7, age);
            ps.setString(8, brand);
            ps.setString(9, origin);
            ps.setString(10, description);
            ps.setString(11, category);
            ps.setInt(12, type);
            ps.setString(13, status);

            return ps.executeUpdate() > 0;
        }
    }

    public boolean updateProduct(int pid, String image, String name, float price, int qSell, int qRent, int age, String brand, String origin, String description, String category, String status) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE [Product] SET Image = ?, Name = ?, Price = ?, QSell = ?, QRent = ?, Age = ?, Brand = ?, Origin = ?, Description = ?, Category = ?, Status = ? WHERE PID = ?";

        try (Connection con = DB.DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, image);
            ps.setString(2, name);
            ps.setFloat(3, price);
            ps.setInt(4, qSell);
            ps.setInt(5, qRent);
            ps.setInt(6, age);
            ps.setString(7, brand);
            ps.setString(8, origin);
            ps.setString(9, description);
            ps.setString(10, category);
            ps.setString(11, status);
            ps.setInt(12, pid);

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        }
    }

    public void updateQSell(int pid, int newqsell) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE [Product] SET [QSell] = ? WHERE [PID] = ?";
        try (Connection con = DB.DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, newqsell);
            ps.setInt(2, pid);
            ps.executeUpdate();
        }
    }
    public void updateQRent(int pid, int newqrent) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE Product SET [QRent] = ? WHERE [PID] = ?";
        try (Connection con = DB.DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, newqrent);
            ps.setInt(2, pid);
            ps.executeUpdate();
        }
    }

    public boolean deleteProduct(int pid) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM [Product] WHERE [PID] = ?";
        try (Connection con = DB.DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, pid);
            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0;
        }
    }
}
