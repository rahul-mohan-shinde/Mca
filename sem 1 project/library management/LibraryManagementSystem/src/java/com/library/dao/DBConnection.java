package com.library.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    // Returns a new DB connection every time
    public static Connection getConnection() {
        Connection con = null;
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to database
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/library_db", // Database URL
                "root",                                  // DB username
                "Rahul@123"                              // DB password
            );
        } catch (ClassNotFoundException e) {
            e.printStackTrace(); // Driver not found
        } catch (SQLException e) {
            e.printStackTrace(); // DB connection error
        }
        return con;
    }
}
