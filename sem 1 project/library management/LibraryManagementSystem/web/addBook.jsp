<%@ include file="adminNavbar.jsp" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    HttpSession currentSession = request.getSession(false);
    if(currentSession == null || currentSession.getAttribute("admin") == null){
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/addBook.css">

</head>
<body>


<div class="box">
    <a href="adminDashboard.jsp" class="back">Back to Dashboard</a>
    <h2>Add New Book</h2>
    <form action="AddBookServlet" method="post">
        <input type="text" name="title" placeholder="Title" required>
        <input type="text" name="author" placeholder="Author" required>
        <input type="text" name="isbn" placeholder="ISBN" required>
        <input type="number" name="total_copies" placeholder="Total Copies" required>
        <input type="submit" value="Add Book" class="btn">
    </form>
</div>

</body>
</html>
