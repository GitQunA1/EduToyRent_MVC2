/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.DBUtils;
import Entity.FeePolicy;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HagiLee
 */
public class GetFeePolicy {

    public FeePolicy getFeePolicy() {
        try {
            Connection conn = new DBUtils().getConnection();
            if (conn != null) {
                String query = "SELECT * FROM Fee_Policy";
                try (PreparedStatement ps = conn.prepareStatement(query);
                        ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        int platform = rs.getInt("Platform");
                        int week = rs.getInt("Week");
                        int biWeek = rs.getInt("BiWeek");
                        int month = rs.getInt("Month");
                        FeePolicy feePolicy = new FeePolicy(platform, week, biWeek, month);
                        return feePolicy;
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } 
            }
        } catch (Exception e) {
        }
        return null;
    }
}
