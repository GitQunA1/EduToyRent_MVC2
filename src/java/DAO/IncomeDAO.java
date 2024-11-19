/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.Income;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class IncomeDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public List<Income> getListIncomeByDate(int soid, LocalDate start, LocalDate end) {
        ArrayList<Income> incomeList = new ArrayList<>();
        String sql = "SELECT SOID, PID, IncSell, QSell, IncRent, QRent, Date FROM Income WHERE SOID = ? AND Date BETWEEN ? AND ?";
        try {
            conn = DB.DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(sql);
                ps.setInt(1, soid);
                ps.setDate(2, Date.valueOf(start));
                ps.setDate(3, Date.valueOf(end));

                rs = ps.executeQuery();
                while (rs.next()) {
                    Income income = new Income();
                    income.setSoid(rs.getInt("SOID"));
                    income.setPid(rs.getInt("PID"));
                    income.setIncSell(rs.getFloat("IncSell"));
                    income.setqSell(rs.getInt("QSell"));
                    income.setIncRent(rs.getFloat("IncRent"));
                    income.setqRent(rs.getInt("QRent"));
                    income.setDate(rs.getDate("Date"));
                    incomeList.add(income);
                }
            }
        } catch (Exception e) {
        }
        return incomeList;
    }

    public Income getIncomeByProductId(int soid, int pid) {
        Income income = null;
        String sql = "SELECT SOID, PID, IncSell, QSell, IncRent, QRent, Date FROM Income WHERE SOID = ? AND PID = ?";
        try {
            conn = DB.DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(sql);
                ps.setInt(1, soid);
                ps.setInt(2, pid);
                rs = ps.executeQuery();
                if (rs.next()) { 
                    income = new Income();
                    income.setSoid(rs.getInt("SOID"));
                    income.setPid(rs.getInt("PID"));
                    income.setIncSell(rs.getFloat("IncSell"));
                    income.setqSell(rs.getInt("QSell"));
                    income.setIncRent(rs.getFloat("IncRent"));
                    income.setqRent(rs.getInt("QRent"));
                    income.setDate(rs.getDate("Date"));
                }
            }
        } catch (Exception e) {
        }
        return income;
    }
}
