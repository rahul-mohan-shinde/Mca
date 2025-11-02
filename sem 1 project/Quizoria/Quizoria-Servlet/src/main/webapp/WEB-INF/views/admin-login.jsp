<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Quizoria</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>
    <section class="login-section">
        <div class="login-container">
            <h2>ADMIN LOGIN</h2>
            <% if (request.getAttribute("error") != null) { %>
                <p style="color:red;"><%= request.getAttribute("error") %></p>
            <% } %>
            <form method="POST" action="${pageContext.request.contextPath}/admin/login">
                <label>Email:</label>
                <input type="email" name="email" required>
                
                <label>Password:</label>
                <input type="password" name="password" required>
                
                <button type="submit">Login</button>
            </form>
            <p><a href="${pageContext.request.contextPath}/">Back to Home</a></p>
        </div>
    </section>
</body>
</html>

