
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(session == null || session.getAttribute("admin") == null){
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/adminDashboard.css">

</head>
<body>

<div class="navbar">
    <a href="adminDashboard.jsp">Home</a>
    <a href="viewBooks.jsp">View Books</a>
    <a href="adminBorrowedBooks.jsp">Borrowed Books</a>
    <a href="AdminLogoutServlet">Logout</a>
    <span class="welcome">Welcome, <%= session.getAttribute("admin") %></span>
</div>

<div class="content">
    <h1>Admin Dashboard</h1>
    <p>Use the links above to manage books and borrowed records.</p>

    <div class="dashboard-links">
        <a href="viewBooks.jsp">View/Edit Books</a>
        <a href="adminBorrowedBooks.jsp">All Borrowed/Returned Books</a>
        <a href="addBook.jsp">Add New Book</a>
    </div>
</div>

</body>
</html>
