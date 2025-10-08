<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.socialmedia.model.Post, java.util.List" %>
<%
    List<Post> posts = (List<Post>) request.getAttribute("posts");
    if (posts == null) {
        response.sendRedirect("feed");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Feed - Social Media</title>
    <style>
        body { font-family: Arial; margin: 0; padding: 0; background: #f0f2f5; }
        .navbar { background: #1877f2; color: white; padding: 15px 20px; }
        .navbar a { color: white; text-decoration: none; margin: 0 15px; }
        .container { max-width: 600px; margin: 20px auto; padding: 0 15px; }
        .post { background: white; padding: 20px; margin-bottom: 15px; border-radius: 8px; }
        .like-btn { background: #1877f2; color: white; padding: 8px 15px; border: none; border-radius: 5px; cursor: pointer; }
        .like-btn.liked { background: #42b883; }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="feed">Feed</a>
        <a href="profile.jsp">Profile</a>
        <a href="create_post.jsp">Create Post</a>
        <a href="logout">Logout</a>
    </div>

    <div class="container">
        <h1>News Feed</h1>
        
        <% for (Post post : posts) { %>
            <div class="post">
                <h3><%= post.getFullName() %> (@<%= post.getUsername() %>)</h3>
                <p><%= post.getContent() %></p>
                <small><%= post.getCreatedAt() %></small>
                
                <!-- SIMPLE FORM SUBMIT (WORKING SOLUTION) -->
                <form action="like" method="post" style="margin-top: 10px; display: inline;">
                    <input type="hidden" name="postId" value="<%= post.getPostId() %>">
                    <input type="hidden" name="action" value="toggle">
                    <button type="submit" class="like-btn <%= post.isLikedByCurrentUser() ? "liked" : "" %>">
                        👍 <%= post.getLikeCount() %> Likes
                    </button>
                </form>
            </div>
        <% } %>
    </div>
</body>
</html>