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

    public void insertIncome(int soid, int pid, float incSell, int qSell, float incRent, int qRent, Date date) {
        String sql = "INSERT INTO [Income] (SOID, PID, IncSell, QSell, IncRent, QRent, Date) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = DB.DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(sql);
                ps.setInt(1, soid);
                ps.setInt(2, pid);
                ps.setFloat(3, incSell);
                ps.setInt(4, qSell);
                ps.setFloat(5, incRent);
                ps.setInt(6, qRent);
                ps.setDate(7, new java.sql.Date(date.getTime()));

                ps.executeUpdate(); // Thực thi câu lệnh
            }
        } catch (Exception e) {
        }
    }

    public Income checkExist(int soid, int pid, java.sql.Date date) {
        Income income = null;
        String sql = "SELECT SOID, PID, IncSell, QSell, IncRent, QRent, Date FROM [Income] WHERE SOID = ? AND PID = ? AND Date = ?";

        try {
            conn = DB.DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(sql);
                ps.setInt(1, soid);
                ps.setInt(2, pid);
                ps.setDate(3, date);

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

    public void updateIncome(int soid, int pid, float incSell, int qSell, float incRent, int qRent, Date date) {
        String sql = "UPDATE [Income] "
                + "SET IncSell = ?, QSell = ?, IncRent = ?, QRent = ? "
                + "WHERE SOID = ? AND PID = ? AND Date = ?";
        try {
            conn = DB.DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(sql);
                ps.setFloat(1, incSell);
                ps.setInt(2, qSell);
                ps.setFloat(3, incRent);
                ps.setInt(4, qRent);
                ps.setInt(5, soid);
                ps.setInt(6, pid);
                ps.setDate(7, date);

                ps.executeUpdate();
            }
        } catch (Exception e) {
        }
    }
}
