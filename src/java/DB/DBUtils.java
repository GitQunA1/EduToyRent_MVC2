    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author hd
 */
public class DBUtils {
    public static final Connection getConnection() throws ClassNotFoundException, SQLException{
        Connection conn= null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
         String url = "jdbc:sqlserver://localhost:1433;databaseName=EduToyRend;useUnicode=true&characterEncoding=UTF-8";
       // String url= "jdbc:sqlserver://localhost:1433;databaseName=BookShop";
        conn= DriverManager.getConnection(url, "sa", "12345");
        return conn;
    }
}
