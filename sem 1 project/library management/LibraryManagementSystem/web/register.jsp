<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/register.css">

</head>
<body>

<div class="container-form">
    <form action="RegisterServlet" method="post">
        Name: <input type="text" name="name" placeholder="Your full name" required><br>
        Email: <input type="text" name="email" placeholder="Your email" required><br>
        Username: <input type="text" name="username" placeholder="Choose username" required><br>
        Password: <input type="password" name="password" placeholder="Enter password" required><br>
        <button type="submit">Register</button>
    </form>
    <a href="login.jsp">Already registered? Login</a>
</div>

</body>
</html>
