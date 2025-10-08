package com.socialmedia.model;

import java.sql.Timestamp;

public class Follow {
    private int followId;
    private int followerId;
    private int followingId;
    private Timestamp createdAt;
    
    // Getters and Setters
    public int getFollowId() { return followId; }
    public void setFollowId(int followId) { this.followId = followId; }
    
    public int getFollowerId() { return followerId; }
    public void setFollowerId(int followerId) { this.followerId = followerId; }
    
    public int getFollowingId() { return followingId; }
    public void setFollowingId(int followingId) { this.followingId = followingId; }
    
    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}