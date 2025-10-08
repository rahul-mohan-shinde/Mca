package com.socialmedia.dao;

import com.socialmedia.model.User;
import com.socialmedia.util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FollowDAO {
    
    // Follow user
    public boolean followUser(int followerId, int followingId) {
        String sql = "INSERT INTO follows (follower_id, following_id) VALUES (?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, followerId);
            stmt.setInt(2, followingId);
            
            return stmt.executeUpdate() > 0;
            
        } catch (SQLException e) {
            // Already following - ignore
            System.err.println("Follow error: " + e.getMessage());
            return false;
        } catch (Exception e) {
            System.err.println("Unexpected error in followUser: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    // Unfollow user
    public boolean unfollowUser(int followerId, int followingId) {
        String sql = "DELETE FROM follows WHERE follower_id = ? AND following_id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, followerId);
            stmt.setInt(2, followingId);
            
            return stmt.executeUpdate() > 0;
            
        } catch (Exception e) {
            System.err.println("Error in unfollowUser: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    // Toggle follow
    public boolean toggleFollow(int followerId, int followingId) {
        if (isFollowing(followerId, followingId)) {
            return unfollowUser(followerId, followingId);
        } else {
            return followUser(followerId, followingId);
        }
    }
    
    // Check if user is following another user
    public boolean isFollowing(int followerId, int followingId) {
        String sql = "SELECT COUNT(*) FROM follows WHERE follower_id = ? AND following_id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, followerId);
            stmt.setInt(2, followingId);
            
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            
        } catch (Exception e) {
            System.err.println("Error in isFollowing: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    // ✅ GET FOLLOWERS COUNT - YE METHOD ADD KARO
    public int getFollowersCount(int userId) {
        String sql = "SELECT COUNT(*) FROM follows WHERE following_id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1);
            }
            
        } catch (Exception e) {
            System.err.println("Error in getFollowersCount: " + e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }
    
    // ✅ GET FOLLOWING COUNT - YE METHOD ADD KARO
    public int getFollowingCount(int userId) {
        String sql = "SELECT COUNT(*) FROM follows WHERE follower_id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1);
            }
            
        } catch (Exception e) {
            System.err.println("Error in getFollowingCount: " + e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }
    
    // Get followers list
    public List<User> getFollowers(int userId) {
        List<User> followers = new ArrayList<>();
        String sql = "SELECT u.* FROM users u " +
                    "JOIN follows f ON u.user_id = f.follower_id " +
                    "WHERE f.following_id = ? AND u.is_active = TRUE";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("full_name"));
                user.setBio(rs.getString("bio"));
                user.setProfilePicture(rs.getString("profile_picture"));
                
                followers.add(user);
            }
            
        } catch (Exception e) {
            System.err.println("Error in getFollowers: " + e.getMessage());
            e.printStackTrace();
        }
        return followers;
    }
    
    // Get following list
    public List<User> getFollowing(int userId) {
        List<User> following = new ArrayList<>();
        String sql = "SELECT u.* FROM users u " +
                    "JOIN follows f ON u.user_id = f.following_id " +
                    "WHERE f.follower_id = ? AND u.is_active = TRUE";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("full_name"));
                user.setBio(rs.getString("bio"));
                user.setProfilePicture(rs.getString("profile_picture"));
                
                following.add(user);
            }
            
        } catch (Exception e) {
            System.err.println("Error in getFollowing: " + e.getMessage());
            e.printStackTrace();
        }
        return following;
    }
}