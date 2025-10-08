package com.socialmedia.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/social_media_db?useSSL=false&serverTimezone=UTC";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Rahul@123"; // Apna password daalo
    
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("✅ MySQL JDBC Driver successfully registered!");
        } catch (ClassNotFoundException e) {
            System.err.println("❌ MySQL JDBC Driver not found!");
            throw new RuntimeException("MySQL JDBC Driver not found", e);
        }
    }
    
    public static Connection getConnection() throws SQLException {
        try {
            Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            System.out.println("✅ Database connection established successfully!");
            return connection;
        } catch (SQLException e) {
            System.err.println("❌ Database connection failed!");
            System.err.println("URL: " + URL);
            System.err.println("Error: " + e.getMessage());
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            throw e;
        }
    }
    
    // Test method
    public static void testConnection() {
        System.out.println("=== DATABASE CONNECTION TEST ===");
        try (Connection conn = getConnection()) {
            System.out.println("✅ SUCCESS: Connected to database!");
        } catch (SQLException e) {
            System.err.println("❌ FAILED: " + e.getMessage());
        }
    }
}