<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.socialmedia.model.Post, java.util.List, com.socialmedia.model.User" %>
<%
    // Session check
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    List<Post> posts = (List<Post>) request.getAttribute("posts");
    if (posts == null) {
        response.sendRedirect("feed");
        return;
    }
    
    String successMessage = (String) session.getAttribute("successMessage");
    String errorMessage = (String) session.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Feed - Social Media</title>
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
            max-width: 680px; 
            margin: 25px auto; 
            padding: 0 20px; 
        }
        .post { 
            background: white; 
            border-radius: 15px; 
            padding: 25px; 
            margin-bottom: 20px; 
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            border: 1px solid #e4e6eb;
            transition: all 0.3s;
        }
        .post:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.12);
        }
        .post-header { 
            display: flex; 
            align-items: center; 
            margin-bottom: 18px; 
        }
        .post-avatar {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 18px;
            margin-right: 12px;
        }
        .post-user-info {
            flex: 1;
        }
        .post-user { 
            font-weight: 600; 
            color: #1c1e21; 
            font-size: 16px;
            margin-bottom: 2px;
        }
        .post-username {
            color: #65676b;
            font-size: 14px;
        }
        .post-time { 
            color: #8a8d91; 
            font-size: 13px; 
        }
        .post-content { 
            margin: 18px 0; 
            font-size: 16px;
            line-height: 1.6;
            color: #1c1e21;
        }
        .post-actions { 
            display: flex; 
            gap: 20px; 
            margin-top: 18px;
            padding-top: 18px;
            border-top: 1px solid #f0f2f5;
        }
        .like-btn { 
            background: none; 
            border: none; 
            color: #65676b; 
            cursor: pointer; 
            padding: 8px 16px;
            border-radius: 8px;
            transition: all 0.3s;
            font-size: 14px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 6px;
        }
        .like-btn:hover {
            background: #f0f2f5;
            transform: scale(1.05);
        }
        .like-btn.liked { 
            color: #1877f2; 
            font-weight: 600;
        }
        .like-btn.loading {
            opacity: 0.6;
            cursor: not-allowed;
        }
        .create-post-btn { 
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); 
            color: white; 
            padding: 14px 28px; 
            border: none; 
            border-radius: 25px; 
            text-decoration: none; 
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-weight: 600;
            font-size: 15px;
            transition: all 0.3s;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }
        .create-post-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }
        .welcome-message {
            text-align: center;
            background: white;
            padding: 25px;
            border-radius: 15px;
            margin-bottom: 25px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-left: 5px solid #1877f2;
        }
        .no-posts {
            text-align: center;
            padding: 60px 40px;
            background: white;
            border-radius: 15px;
            color: #65676b;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .success-message {
            background: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            border: 1px solid #c3e6cb;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .error-message {
            background: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            border: 1px solid #f5c6cb;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .refresh-btn {
            background: #42b883;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 14px;
            transition: all 0.3s;
        }
        .refresh-btn:hover {
            background: #3aa876;
            transform: translateY(-1px);
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
    
    <script>
    function toggleLike(postId, buttonElement) {
        console.log("🔄 Toggle like for post:", postId);
        
        // Show loading state
        buttonElement.classList.add('loading');
        const originalHTML = buttonElement.innerHTML;
        buttonElement.innerHTML = '⏳ Loading...';
        
        // Use URLSearchParams for reliable data sending
        const data = new URLSearchParams();
        data.append('postId', postId.toString());
        data.append('action', 'toggle');
        
        fetch('like', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: data
        })
        .then(response => response.text())
        .then(result => {
            console.log("📨 Server response:", result);
            
            // Remove loading state
            buttonElement.classList.remove('loading');
            buttonElement.innerHTML = originalHTML;
            
            if (result === 'success') {
                // Update like count and appearance
                const likeCountElement = buttonElement.querySelector('.like-count');
                const currentCount = parseInt(likeCountElement.textContent);
                
                if (buttonElement.classList.contains('liked')) {
                    // Unlike
                    buttonElement.classList.remove('liked');
                    likeCountElement.textContent = currentCount - 1;
                    console.log("👎 Unliked post", postId);
                } else {
                    // Like
                    buttonElement.classList.add('liked');
                    likeCountElement.textContent = currentCount + 1;
                    console.log("👍 Liked post", postId);
                }
            } else {
                console.error("❌ Server error:", result);
                alert('Error: ' + result);
            }
        })
        .catch(error => {
            console.error('🚨 Fetch error:', error);
            buttonElement.classList.remove('loading');
            buttonElement.innerHTML = originalHTML;
            alert('Network error: ' + error.message);
        });
    }
    
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
    </script>
</head>
<body>
    <div class="navbar">
        <div>
            <strong style="font-size: 22px;">📱 SocialMedia</strong>
            <a href="feed" class="active">📰 Feed</a>
            <a href="profile">👤 Profile</a>
            <a href="create_post.jsp">📝 Create Post</a>
        </div>
        <div>
            <span style="margin-right: 20px; font-weight: 500;">Hello, <%= session.getAttribute("fullName") %>! 👋</span>
            <a href="logout" style="background: #e74c3c;">🚪 Logout</a>
        </div>
    </div>

    <div class="container">
        <!-- Success and Error Messages -->
        <% if (successMessage != null) { %>
            <div class="success-message">
                <span style="font-size: 18px;">✅</span>
                <div>
                    <strong>Success!</strong> <%= successMessage %>
                </div>
            </div>
            <% session.removeAttribute("successMessage"); %>
        <% } %>
        
        <% if (errorMessage != null) { %>
            <div class="error-message">
                <span style="font-size: 18px;">❌</span>
                <div>
                    <strong>Error!</strong> <%= errorMessage %>
                </div>
            </div>
            <% session.removeAttribute("errorMessage"); %>
        <% } %>

        <!-- Welcome Message -->
        <div class="welcome-message">
            <h2 style="margin: 0 0 8px 0; color: #1c1e21;">📰 News Feed</h2>
            <p style="margin: 0; color: #65676b;">Discover what's happening in your network</p>
        </div>

        <!-- Create Post Button -->
        <div style="text-align: center; margin: 25px 0;">
            <a href="create_post.jsp" class="create-post-btn">
                ✨ Create New Post
            </a>
        </div>

        <!-- Posts List -->
        <% if (posts != null && !posts.isEmpty()) { %>
            <% for (Post post : posts) { %>
                <div class="post">
                    <!-- Post Header -->
                    <div class="post-header">
                        <div class="post-avatar">
                            <%= post.getFullName().substring(0, 1).toUpperCase() %>
                        </div>
                        <div class="post-user-info">
                            <div class="post-user"><%= post.getFullName() %></div>
                            <div class="post-username">@<%= post.getUsername() %></div>
                        </div>
                        <div class="post-time">
                            📅 <%= post.getCreatedAt() %>
                        </div>
                    </div>
                    
                    <!-- Post Content -->
                    <div class="post-content">
                        <%= post.getContent() %>
                        
                        <!-- ✅ PHOTO DISPLAY -->
                        <% if (post.hasImage()) { %>
                            <div style="text-align: center; margin-top: 15px;">
                                <img src="<%= post.getImageUrl() %>" 
                                     class="post-image"
                                     alt="Post image"
                                     onclick="openImageModal('<%= post.getImageUrl() %>')">
                            </div>
                        <% } %>
                    </div>
                    
                    <!-- Post Actions -->
                    <div class="post-actions">
                        <!-- Like Button -->
                        <button type="button" 
                                class="like-btn <%= post.isLikedByCurrentUser() ? "liked" : "" %>"
                                onclick="toggleLike(<%= post.getPostId() %>, this)">
                            👍 <span class="like-count"><%= post.getLikeCount() %></span> Likes
                        </button>
                    </div>
                </div>
            <% } %>
            
            <!-- Refresh Button -->
            <div style="text-align: center; margin: 30px 0;">
                <a href="feed" class="refresh-btn">
                    🔄 Refresh Feed
                </a>
            </div>
            
        <% } else { %>
            <div class="no-posts">
                <div style="font-size: 64px; margin-bottom: 20px;">📝</div>
                <h3 style="margin-bottom: 15px; color: #4b4f56;">No posts yet</h3>
                <p style="color: #8a8d91; margin-bottom: 25px; font-size: 16px; max-width: 400px; margin-left: auto; margin-right: auto;">
                    Be the first one to share something amazing with the community!
                </p>
                <a href="create_post.jsp" class="create-post-btn">
                    ✨ Create First Post
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
    // Auto-hide messages after 5 seconds
    setTimeout(() => {
        const messages = document.querySelectorAll('.success-message, .error-message');
        messages.forEach(msg => {
            msg.style.transition = 'opacity 0.5s';
            msg.style.opacity = '0';
            setTimeout(() => msg.remove(), 500);
        });
    }, 5000);
    
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
        fetch('feed', { method: 'HEAD' })
            .then(() => console.log('💚 Session keep-alive check'))
            .catch(err => console.log('⚠️ Session check failed'));
    }, 300000);
    </script>
</body>
</html>