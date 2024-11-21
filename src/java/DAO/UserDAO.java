/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.DBUtils;
import Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author LENOVO
 */
public class UserDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public boolean isExistemail(String email) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String query = "SELECT 1 FROM [User] WHERE [Email] = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, email);
                rs = stm.executeQuery();
                if(rs.next()){
                    result = true;
                }
            }
        } catch(Exception e){
        }
        return result;
    }

    public int signUp(User user) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "INSERT INTO [User] ([Email], [Password], [Role]) VALUES (?,?,?)";
            stm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, user.getEmail());
            stm.setString(2, user.getPassword());
            stm.setString(3, user.getRole());

            int affectedRows = stm.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating user failed, no rows affected.");
            }

            // Lấy UID tự động tạo nếu cần
            try (ResultSet rs = stm.getGeneratedKeys()) {
                if (rs.next()) {
                    int generatedUID = rs.getInt(1); // Cột đầu tiên là UID
                    user.setUid(generatedUID); // Gán UID vào đối tượng User nếu cần
                    return generatedUID;
                }
            }
        } catch (Exception e) {
        }
        return -1;
    }
    
    public List<User> getUsersByUIDs(List<Integer> uidList) {
        List<User> users = new ArrayList<>();

        
        if (uidList == null || uidList.isEmpty()) {
            return users;
        }
        StringBuilder queryBuilder = new StringBuilder("SELECT DISTINCT UID, Email, Phone, Password, Role FROM [User] WHERE UID IN (");
        for (int i = 0; i < uidList.size(); i++) {
            queryBuilder.append("?");
            if (i < uidList.size() - 1) {
                queryBuilder.append(", ");
            }
        }
        queryBuilder.append(")");

        String query = queryBuilder.toString();
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            for (int i = 0; i < uidList.size(); i++) {
                ps.setInt(i + 1, uidList.get(i));
            }
            rs = ps.executeQuery();
            
            while (rs.next()) {
                int uid = rs.getInt("UID");
                String email = rs.getString("Email");
                String phone = rs.getString("Phone");
                String password = rs.getString("Password");
                String role = rs.getString("Role");

                users.add(new User(uid, email, phone, password, role));
            }
            
        } catch (Exception e) {
        } 
       return users;
     }
}
