package com.socialmedia.test;

import com.socialmedia.util.DatabaseConnection;
import java.sql.*;

public class TestConnection {
    public static void main(String[] args) {
        System.out.println("=== DATABASE TEST ===");
        
        try {
            // Test connection
            Connection conn = DatabaseConnection.getConnection();
            System.out.println("✅ Database connected!");
            
            // Test likes table
            String sql = "SELECT COUNT(*) FROM likes";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                System.out.println("✅ Likes table exists. Total likes: " + rs.getInt(1));
            }
            
            // Test insert
            String insertSQL = "INSERT INTO likes (post_id, user_id) VALUES (1, 1)";
            try {
                PreparedStatement insertStmt = conn.prepareStatement(insertSQL);
                int result = insertStmt.executeUpdate();
                System.out.println("✅ Test insert successful. Rows: " + result);
            } catch (SQLException e) {
                System.out.println("ℹ️ Test insert failed (probably duplicate): " + e.getMessage());
            }
            
            conn.close();
            
        } catch (Exception e) {
            System.err.println("❌ Test failed: " + e.getMessage());
            e.printStackTrace();
        }
    }
}