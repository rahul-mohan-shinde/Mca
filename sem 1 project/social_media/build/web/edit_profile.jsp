<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.socialmedia.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile - Social Media</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; background: #f0f2f5; }
        .navbar { background: #1877f2; color: white; padding: 15px 20px; }
        .navbar a { color: white; text-decoration: none; margin-right: 15px; }
        .container { max-width: 600px; margin: 20px auto; padding: 0 15px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], input[type="email"], textarea { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; }
        textarea { height: 80px; resize: vertical; }
        .btn { background: #1877f2; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; margin-right: 10px; }
        .success { color: green; margin-bottom: 15px; }
        .error { color: red; margin-bottom: 15px; }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="profile.jsp">← Back to Profile</a>
        <strong>Edit Profile</strong>
    </div>

    <div class="container">
        <%
            String successMessage = (String) session.getAttribute("successMessage");
            if (successMessage != null) {
                session.removeAttribute("successMessage");
        %>
            <div class="success"><%= successMessage %></div>
        <% } %>
        
        <%
            String errorMessage = (String) session.getAttribute("errorMessage");
            if (errorMessage != null) {
                session.removeAttribute("errorMessage");
        %>
            <div class="error"><%= errorMessage %></div>
        <% } %>

        <form action="edit-profile" method="post">
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="fullName" value="<%= user.getFullName() %>" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required>
            </div>
            
            <div class="form-group">
                <label for="bio">Bio</label>
                <textarea id="bio" name="bio"><%= user.getBio() != null ? user.getBio() : "" %></textarea>
            </div>
            
            <button type="submit" class="btn">Save Changes</button>
            <a href="profile.jsp" class="btn" style="background: #6c757d;">Cancel</a>
        </form>
    </div>
</body>
</html>