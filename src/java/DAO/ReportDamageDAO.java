/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.DBUtils;
import Entity.DamageReport;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 *
 * @author HagiLee
 */
public class ReportDamageDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public boolean insertOrderDetail(int odid, String damaged, String name) {
        try {
            LocalDateTime currentDateTime = LocalDateTime.now();
            String sql = "INSERT INTO [Pos_Report] (ODID, Name, Quantity, NoDamage, HalfDamage, FullDamage, Date) VALUES (?,?,1,?,?,?,?)";
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, odid);
            ps.setString(2, name);
            ps.setTimestamp(6, Timestamp.valueOf(currentDateTime));
            if (damaged.equals("1")) {
                ps.setInt(3, 1);
                ps.setInt(4, 0);
                ps.setInt(5, 0);
            }
            if (damaged.equals("2")) {
                ps.setInt(3, 0);
                ps.setInt(4, 1);
                ps.setInt(5, 0);
            }
            if (damaged.equals("3")) {
                ps.setInt(3, 0);
                ps.setInt(4, 0);
                ps.setInt(5, 1);
            }
            int result = ps.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public DamageReport getDMGReport(int odid) {
        String sql = "SELECT * FROM [Pos_Report] WHERE ODID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, odid);
            rs = ps.executeQuery();
            if (rs.next()) {
                String name = rs.getString("Name");
                int quantity = rs.getInt("Quantity");
                String Overall = rs.getString("Overall");
                String external = rs.getString("External");
                String mobileParts = rs.getString("mobile_parts");
                String feature = rs.getString("feature");
                String accessory = rs.getString("accessory");
                String image = rs.getString("image");
                String description = rs.getString("Description");
                int noDamage = rs.getInt("NoDamage");
                int halfDamage = rs.getInt("HalfDamage");
                int fullDamege = rs.getInt("FullDamage");
                String date = rs.getString("Date");
                
                DamageReport dr = new DamageReport(odid, name, quantity, Overall, external, mobileParts, feature, accessory, image, description, noDamage, halfDamage, fullDamege, date);
                return dr;
            }
        } catch (Exception e) {
        }
        return null;
    }
}
