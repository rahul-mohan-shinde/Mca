package com.socialmedia.dao;

import com.socialmedia.util.DatabaseConnection;
import java.sql.*;

public class LikeDAO {
    
    public LikeDAO() {
        System.out.println("✅ LikeDAO initialized");
    }
    
    // Toggle like - Simple version
    public boolean toggleLike(int postId, int userId) {
        System.out.println("🎯 toggleLike - Post: " + postId + ", User: " + userId);
        
        try {
            // Pehle check karo like already hai ya nahi
            boolean alreadyLiked = isLiked(postId, userId);
            
            if (alreadyLiked) {
                System.out.println("🔄 Removing like...");
                return removeLike(postId, userId);
            } else {
                System.out.println("🔄 Adding like...");
                return addLike(postId, userId);
            }
            
        } catch (Exception e) {
            System.err.println("❌ Error in toggleLike: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    // Check if user liked post
    private boolean isLiked(int postId, int userId) {
        String sql = "SELECT COUNT(*) FROM likes WHERE post_id = ? AND user_id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, postId);
            stmt.setInt(2, userId);
            
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                System.out.println("📊 Like count for post " + postId + ", user " + userId + ": " + count);
                return count > 0;
            }
            
        } catch (Exception e) {
            System.err.println("❌ Error in isLiked: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    // Add like
    private boolean addLike(int postId, int userId) {
        String sql = "INSERT INTO likes (post_id, user_id) VALUES (?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, postId);
            stmt.setInt(2, userId);
            
            int rows = stmt.executeUpdate();
            System.out.println("✅ Like added - Rows affected: " + rows);
            return rows > 0;
            
        } catch (SQLException e) {
            System.err.println("❌ SQL Error adding like: " + e.getMessage());
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            return false;
        } catch (Exception e) {
            System.err.println("❌ Error adding like: " + e.getMessage());
            return false;
        }
    }
    
    // Remove like
    private boolean removeLike(int postId, int userId) {
        String sql = "DELETE FROM likes WHERE post_id = ? AND user_id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, postId);
            stmt.setInt(2, userId);
            
            int rows = stmt.executeUpdate();
            System.out.println("✅ Like removed - Rows affected: " + rows);
            return rows > 0;
            
        } catch (Exception e) {
            System.err.println("❌ Error removing like: " + e.getMessage());
            return false;
        }
    }
}