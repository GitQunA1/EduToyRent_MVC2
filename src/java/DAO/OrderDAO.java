/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import utils.util;
import java.sql.Date;

/**
 *
 * @author LENOVO
 */
public class OrderDAO {

    public void insertOrder(int uid, float price) throws Exception {
        String sql = "INSERT INTO [Order] (UID, CreationDate, Price) VALUES (?, ?, ?)";
        LocalDate date = LocalDate.now();

        try (Connection con = util.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, uid);
            ps.setDate(2, Date.valueOf(date));
            ps.setFloat(3, price);
            ps.executeUpdate();
        }
    }
}
