/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import utils.util;

/**
 *
 * @author LENOVO
 */
public class UserDAO {

    public boolean isExistemail(String email) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = util.getConnection();
            if (con != null) {
                String query = "SELECT * FROM [User] WHERE [Email] = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, email);
                rs = stm.executeQuery();
                return rs.next();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean signUp(User user) throws SQLException, ClassNotFoundException {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = util.getConnection();
            int nextUID = getNextUID(con);
            String sql = "INSERT INTO [User] ([UID], [Email], [Password], [Role]) VALUES (?,?,?,?)";
            stm = con.prepareStatement(sql);
            stm.setInt(1, nextUID);
            stm.setString(2, user.getEmail());
            //stm.setString(3, user.getPhone());
            stm.setString(3, user.getPassword());
            stm.setString(4, user.getRole());
            int result = stm.executeUpdate();
            return result > 0;
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    private int getNextUID(Connection conn) throws SQLException {
        String sql = "SELECT COALESCE(MAX(UID), 99999999) + 1 AS NextUID FROM [User]";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getInt("NextUID");
        } else {
            return 10000001; // Giá trị khởi tạo nếu không có bản ghi nào
        }
    }

    public int getLastInsertedUID() throws SQLException, ClassNotFoundException {
        Connection conn = util.getConnection();
        String sql = "SELECT COALESCE(MAX(UID), 99999999) AS MaxUID FROM [User]";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getInt("MaxUID");
        } else {
            return 0;
        }
    }
}
