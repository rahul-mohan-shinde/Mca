<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.socialmedia.model.User, com.socialmedia.model.Post, java.util.List" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // Servlet se data receive karo
    Integer followersCount = (Integer) request.getAttribute("followersCount");
    Integer followingCount = (Integer) request.getAttribute("followingCount");
    List<Post> userPosts = (List<Post>) request.getAttribute("userPosts");
    Integer postsCount = (Integer) request.getAttribute("postsCount");
    
    // Default values set karo
    if (followersCount == null) followersCount = 0;
    if (followingCount == null) followingCount = 0;
    if (postsCount == null) postsCount = 0;
    if (userPosts == null) userPosts = new java.util.ArrayList<>();
    
    String username = (String) session.getAttribute("username");
    String fullName = (String) session.getAttribute("fullName");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile - Social Media</title>
    <style>
        body { 
            font-family: 'Segoe UI', Arial, sans-serif; 
            margin: 0; 
            padding: 0; 
            background: #f0f2f5; 
        }
        .navbar { 
            background: #1877f2; 
            color: white; 
            padding: 15px 20px; 
            display: flex; 
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .navbar a { 
            color: white; 
            text-decoration: none; 
            margin: 0 12px;
            padding: 8px 16px;
            border-radius: 6px;
            transition: all 0.3s;
            font-weight: 500;
        }
        .navbar a:hover {
            background: rgba(255,255,255,0.15);
            transform: translateY(-1px);
        }
        .navbar a.active {
            background: rgba(255,255,255,0.2);
        }
        .container { 
            max-width: 800px; 
            margin: 30px auto; 
            padding: 0 20px; 
        }
        .profile-header { 
            background: white; 
            border-radius: 15px; 
            padding: 40px; 
            text-align: center; 
            margin-bottom: 25px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border: 1px solid #e4e6eb;
        }
        .profile-stats { 
            display: flex; 
            justify-content: center; 
            gap: 50px; 
            margin: 30px 0; 
        }
        .stat { 
            text-align: center; 
            cursor: pointer;
            transition: transform 0.3s;
        }
        .stat:hover {
            transform: scale(1.05);
        }
        .stat-number { 
            font-size: 28px; 
            font-weight: bold; 
            color: #1877f2;
            display: block;
        }
        .stat-label {
            font-size: 14px;
            color: #65676b;
            margin-top: 5px;
        }
        .post { 
            background: white; 
            border-radius: 12px; 
            padding: 25px; 
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            border: 1px solid #e4e6eb;
            transition: transform 0.2s;
        }
        .post:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.12);
        }
        .btn { 
            background: #1877f2; 
            color: white; 
            padding: 12px 24px; 
            border: none; 
            border-radius: 8px; 
            text-decoration: none; 
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin: 8px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 600;
            font-size: 14px;
        }
        .btn:hover {
            background: #166fe5;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(24, 119, 242, 0.3);
        }
        .btn-secondary {
            background: #42b883;
        }
        .btn-secondary:hover {
            background: #3aa876;
        }
        .post-content {
            font-size: 16px;
            line-height: 1.6;
            color: #1c1e21;
            margin: 15px 0;
        }
        .post-meta {
            color: #65676b;
            font-size: 14px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 15px;
            padding-top: 15px;
            border-top: 1px solid #f0f2f5;
        }
        .post-image {
            max-width: 100%;
            max-height: 500px;
            border-radius: 12px;
            margin-top: 15px;
            border: 1px solid #e4e6eb;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s;
            cursor: pointer;
        }
        .post-image:hover {
            transform: scale(1.02);
        }
        .no-posts {
            text-align: center;
            padding: 60px 40px;
            background: white;
            border-radius: 15px;
            color: #65676b;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .user-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 32px;
            font-weight: bold;
            margin: 0 auto 20px;
        }
        .action-buttons {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 10px;
            margin: 25px 0;
        }
        
        /* Image Modal Styles */
        .image-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.9);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            max-width: 90%;
            max-height: 90%;
            position: relative;
        }
        .modal-image {
            max-width: 100%;
            max-height: 90vh;
            border-radius: 8px;
        }
        .close-modal {
            position: absolute;
            top: 15px;
            right: 15px;
            background: rgba(0,0,0,0.7);
            color: white;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            font-size: 20px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div>
            <strong style="font-size: 22px;">📱 SocialMedia</strong>
            <a href="feed">📰 Feed</a>
            <a href="profile" class="active">👤 Profile</a>
            <a href="create_post.jsp">📝 Create Post</a>
        </div>
        <div>
            <span style="margin-right: 20px; font-weight: 500;">Hello, <strong><%= fullName %></strong>! 👋</span>
            <a href="logout" style="background: #e74c3c;">🚪 Logout</a>
        </div>
    </div>

    <div class="container">
        <!-- Profile Header -->
        <div class="profile-header">
            <div class="user-avatar">
                <%= fullName.substring(0, 1).toUpperCase() %>
            </div>
            
            <h2 style="margin-bottom: 8px; color: #1c1e21; font-size: 28px;"><%= fullName %></h2>
            <p style="color: #65676b; font-size: 16px; margin-bottom: 20px;">@<%= username %></p>
            
            <% if (user.getBio() != null && !user.getBio().isEmpty()) { %>
                <p style="font-style: italic; color: #4b4f56; max-width: 600px; margin: 0 auto 25px; line-height: 1.5; padding: 15px; background: #f8f9fa; border-radius: 8px;">
                    " <%= user.getBio() %> "
                </p>
            <% } else { %>
                <p style="color: #8a8d91; font-style: italic; margin-bottom: 25px;">
                    ✏️ No bio yet. 
                    <a href="edit_profile.jsp" style="color: #1877f2; text-decoration: none; font-weight: 500;">Tell us about yourself!</a>
                </p>
            <% } %>
            
            <!-- Statistics -->
            <div class="profile-stats">
                <div class="stat">
                    <span class="stat-number"><%= postsCount %></span>
                    <span class="stat-label">Posts</span>
                </div>
                <div class="stat">
                    <span class="stat-number"><%= followersCount %></span>
                    <span class="stat-label">Followers</span>
                </div>
                <div class="stat">
                    <span class="stat-number"><%= followingCount %></span>
                    <span class="stat-label">Following</span>
                </div>
            </div>
            
            <!-- Action Buttons -->
            <div class="action-buttons">
                <a href="edit_profile.jsp" class="btn">
                    ✏️ Edit Profile
                </a>
                <a href="create_post.jsp" class="btn btn-secondary">
                    📝 Create Post
                </a>
                <a href="feed" class="btn" style="background: #6c757d;">
                    📰 View Feed
                </a>
            </div>
        </div>

        <!-- User Posts Section -->
        <div style="margin-bottom: 15px; display: flex; justify-content: space-between; align-items: center;">
            <h3 style="color: #1c1e21; margin: 0; font-size: 22px;">Your Posts (<%= postsCount %>)</h3>
            <% if (postsCount > 0) { %>
                <span style="color: #65676b; font-size: 14px;">📊 Total <%= postsCount %> posts</span>
            <% } %>
        </div>
        
        <% if (userPosts != null && !userPosts.isEmpty()) { %>
            <% for (Post post : userPosts) { %>
                <div class="post">
                    <div class="post-content">
                        <%= post.getContent() %>
                    </div>
                    
                    <!-- ✅ PHOTO DISPLAY -->
                    <% if (post.hasImage()) { %>
                        <div style="text-align: center; margin-top: 15px;">
                            <img src="<%= post.getImageUrl() %>" 
                                 class="post-image"
                                 alt="Post image"
                                 onclick="openImageModal('<%= post.getImageUrl() %>')">
                        </div>
                    <% } %>
                    
                    <div class="post-meta">
                        <div style="display: flex; gap: 15px;">
                            <span>📅 <%= post.getCreatedAt() %></span>
                            <span>👍 <%= post.getLikeCount() %> Likes</span>
                        </div>
                        <form action="delete-post" method="post" style="display: inline;">
                            <input type="hidden" name="postId" value="<%= post.getPostId() %>">
                            <button type="submit" class="btn" style="background: #e74c3c; padding: 6px 12px; font-size: 12px;" 
                                    onclick="return confirm('Are you sure you want to delete this post?')">
                                🗑️ Delete
                            </button>
                        </form>
                    </div>
                </div>
            <% } %>
        <% } else { %>
            <div class="no-posts">
                <div style="font-size: 64px; margin-bottom: 20px;">📝</div>
                <h3 style="margin-bottom: 15px; color: #4b4f56;">No posts yet</h3>
                <p style="color: #8a8d91; margin-bottom: 25px; font-size: 16px; max-width: 400px; margin-left: auto; margin-right: auto;">
                    Start sharing your thoughts and experiences with the community!
                </p>
                <a href="create_post.jsp" class="btn btn-secondary" style="font-size: 16px; padding: 14px 28px;">
                    ✨ Create Your First Post
                </a>
            </div>
        <% } %>
    </div>

    <!-- Image Modal -->
    <div id="imageModal" class="image-modal">
        <div class="modal-content">
            <button class="close-modal" onclick="closeImageModal()">×</button>
            <img id="modalImage" class="modal-image" src="" alt="Full size image">
        </div>
    </div>

    <script>
    // Image Modal Functions
    function openImageModal(imageUrl) {
        document.getElementById('modalImage').src = imageUrl;
        document.getElementById('imageModal').style.display = 'flex';
        document.body.style.overflow = 'hidden';
    }
    
    function closeImageModal() {
        document.getElementById('imageModal').style.display = 'none';
        document.body.style.overflow = 'auto';
    }
    
    // Close modal on background click
    document.getElementById('imageModal').addEventListener('click', function(e) {
        if (e.target === this) {
            closeImageModal();
        }
    });
    
    // Close modal on ESC key
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            closeImageModal();
        }
    });
    
    // Session keep-alive
    setInterval(() => {
        fetch('profile', { method: 'HEAD' })
            .then(() => console.log('💚 Session keep-alive check'))
            .catch(err => console.log('⚠️ Session check failed'));
    }, 300000);
    </script>
</body>
</html>