
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author LENOVO
 */
public class util {
    private static final String DB_Name = "EduToyRend";
    private static final String DB_User_Name = "sa";
    private static final String DB_Password = "12345";
    
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Connection con = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url="jdbc:sqlserver://localhost:1433;databaseName=EduToyRend";
        con = DriverManager.getConnection(url, DB_User_Name, DB_Password);       
        return con;
    }
    
    public static void main(String[] args) {
        util u = new util();
        System.out.println(u);
    }
}
