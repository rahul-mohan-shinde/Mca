package com.socialmedia.dao;

import com.socialmedia.model.Post;
import com.socialmedia.util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
    
    // Create new post
    public boolean createPost(Post post) {
        String sql = "INSERT INTO posts (user_id, content, image_url) VALUES (?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, post.getUserId());
            stmt.setString(2, post.getContent());
            stmt.setString(3, post.getImageUrl());
            
            return stmt.executeUpdate() > 0;
            
        } catch (Exception e) {
            System.err.println("Error in createPost: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    // Get all posts for feed
    public List<Post> getAllPosts(int currentUserId) {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT p.*, u.username, u.full_name, " +
                    "COUNT(l.like_id) as like_count, " +
                    "EXISTS(SELECT 1 FROM likes WHERE post_id = p.post_id AND user_id = ?) as is_liked " +
                    "FROM posts p " +
                    "JOIN users u ON p.user_id = u.user_id " +
                    "LEFT JOIN likes l ON p.post_id = l.post_id " +
                    "WHERE p.is_active = TRUE " +
                    "GROUP BY p.post_id " +
                    "ORDER BY p.created_at DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, currentUserId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Post post = extractPostFromResultSet(rs);
                posts.add(post);
            }
            
        } catch (Exception e) {
            System.err.println("Error in getAllPosts: " + e.getMessage());
            e.printStackTrace();
        }
        return posts;
    }
    
    // ✅ GET POSTS BY USER - YE METHOD ADD KARO
    public List<Post> getPostsByUser(int userId, int currentUserId) {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT p.*, u.username, u.full_name, " +
                    "COUNT(l.like_id) as like_count, " +
                    "EXISTS(SELECT 1 FROM likes WHERE post_id = p.post_id AND user_id = ?) as is_liked " +
                    "FROM posts p " +
                    "JOIN users u ON p.user_id = u.user_id " +
                    "LEFT JOIN likes l ON p.post_id = l.post_id " +
                    "WHERE p.user_id = ? AND p.is_active = TRUE " +
                    "GROUP BY p.post_id " +
                    "ORDER BY p.created_at DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, currentUserId);
            stmt.setInt(2, userId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Post post = extractPostFromResultSet(rs);
                posts.add(post);
            }
            
        } catch (Exception e) {
            System.err.println("Error in getPostsByUser: " + e.getMessage());
            e.printStackTrace();
        }
        return posts;
    }
    
    // Delete post
    public boolean deletePost(int postId, int userId) {
        String sql = "UPDATE posts SET is_active = FALSE WHERE post_id = ? AND user_id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, postId);
            stmt.setInt(2, userId);
            
            return stmt.executeUpdate() > 0;
            
        } catch (Exception e) {
            System.err.println("Error in deletePost: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    // ✅ HELPER METHOD TO EXTRACT POST FROM RESULTSET
    private Post extractPostFromResultSet(ResultSet rs) throws SQLException {
        Post post = new Post();
        post.setPostId(rs.getInt("post_id"));
        post.setUserId(rs.getInt("user_id"));
        post.setContent(rs.getString("content"));
        post.setImageUrl(rs.getString("image_url"));
        post.setCreatedAt(rs.getTimestamp("created_at"));
        post.setUpdatedAt(rs.getTimestamp("updated_at"));
        post.setActive(rs.getBoolean("is_active"));
        post.setUsername(rs.getString("username"));
        post.setFullName(rs.getString("full_name"));
        post.setLikeCount(rs.getInt("like_count"));
        post.setLikedByCurrentUser(rs.getBoolean("is_liked"));
        return post;
    }
}