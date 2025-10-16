<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/register.css">
</head>
<body>

<div class="container-form">
    <h2>Login</h2>
    <form action="LoginServlet" method="post">
        Username: <input type="text" name="username" placeholder="Enter your username" required>
        Password: <input type="password" name="password" placeholder="Enter your password" required>
        <button type="submit">Login</button>
    </form>
    <a href="register.jsp">Don't have an account? Register</a>
</div>

</body>
</html>
