<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.socialmedia.model.User" %>
<%
    // Check if user is logged in
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome - Social Media</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            text-align: center;
            width: 400px;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .welcome-message {
            font-size: 18px;
            color: #555;
            margin-bottom: 30px;
        }
        .user-info {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            margin: 5px;
        }
        .btn:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎉 Welcome to Social Media!</h1>
        
        <div class="user-info">
            <h3>Hello, <%= user.getFullName() %>!</h3>
            <p><strong>Username:</strong> <%= user.getUsername() %></p>
            <p><strong>Email:</strong> <%= user.getEmail() %></p>
            <% if (user.getBio() != null && !user.getBio().isEmpty()) { %>
                <p><strong>Bio:</strong> <%= user.getBio() %></p>
            <% } %>
        </div>
        
        <div class="welcome-message">
            You have successfully logged in to your account.
        </div>
        
        <div>
            <a href="#" class="btn">View Profile</a>
            <a href="logout.jsp" class="btn" style="background: #e74c3c;">Logout</a>
        </div>
    </div>
</body>
</html>