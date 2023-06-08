/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tugaspbo;

import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.DriverManager;

/**
 *
 * @author Acer
 */
public class DBConnector {
    
    static Connection connection;
    
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/pos_db";
    static final String USER = "root";
    static final String PASSWORD = "";
    
    public static void initDBConnection()
    {
        try {
            Class.forName(JDBC_DRIVER);
            
            connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            
            if (connection != null)
            {
                System.out.println("connection is established");
            }
        } 
        catch (Exception ex) {
            System.out.println(ex);
        }
    }
    
    
}
