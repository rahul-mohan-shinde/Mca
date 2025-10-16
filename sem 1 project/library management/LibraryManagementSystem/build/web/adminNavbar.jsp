<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar.css">

    </head>
    <body>

        <!-- Navbar -->
        <div class="navbar">
            <a href="adminDashboard.jsp">Home</a>
            <a href="viewBooks.jsp">View Books</a>
            <a href="adminBorrowedBooks.jsp">Borrowed Books</a>
            <a href="addBook.jsp">Add New Book</a>
            <a href="adminLogin.jsp">Logout</a>
            <span class="welcome">Welcome, <%= session.getAttribute("admin")%></span>
        </div>

        <!-- Page content should go here -->
        <div class="content">
            <!-- Add your dashboard links or content here -->
        </div>

    </body>
</html>
