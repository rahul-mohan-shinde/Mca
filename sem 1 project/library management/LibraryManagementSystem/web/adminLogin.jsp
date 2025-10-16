<!DOCTYPE html>
<html>
<head>
    <title>Admin Login - Library</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/register.css">

</head>
<body>
    <div class="login-box">
        <a href="index.html">Home</a>
        <h2>Admin Login</h2>
        <form action="AdminLoginServlet" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" value="Login" class="btn">
        </form>
    </div>
</body>
</html>
