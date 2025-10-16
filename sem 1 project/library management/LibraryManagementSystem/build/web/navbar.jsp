<%@ page import="javax.servlet.http.*" %>
<%
    String navbarUsername = null;
    if(session != null && session.getAttribute("username") != null){
        navbarUsername = (String) session.getAttribute("username");
    }
%>


<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar.css">

</head>
<body>


<div class="navbar">
    <a href="studentWellcome.jsp">Home</a>
    <a href="availableBooks.jsp">Available Books</a>
    <a href="myBorrowedBooks.jsp">My Borrowed Books</a>
    <a href="returnBooks.jsp">Return Books</a>
    <div class="right">
        <% if(navbarUsername != null){ %>
            <span style="padding:14px 20px; color:white;">Welcome, <%= navbarUsername %></span>
            <a href="LogoutServlet">Logout</a>
        <% } else { %>
            <a href="login.jsp">Login</a>
        <% } %>
    </div>
</div>

</body>
</html>
