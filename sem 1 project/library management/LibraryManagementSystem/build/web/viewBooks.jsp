<%@ include file="adminNavbar.jsp" %>
<%@ page import="java.sql.*, com.library.dao.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Admin session check
    if(session == null || session.getAttribute("admin") == null){
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Books</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/adminBorrowedBooks.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/adminBorrowedBooks.css">

</head>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<body>
    <h1>Manage Books</h1>
    <a href="adminDashboard.jsp" class="back-link">&larr; Back to Dashboard</a>

    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>ISBN</th>
            <th>Total Copies</th>
            <th>Available Copies</th>
            <th>Actions</th>
        </tr>

        <%
            try (Connection con = DBConnection.getConnection();
                 Statement stmt = con.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT * FROM book ORDER BY id ASC")) {

                while(rs.next()) {
        %>
        <tr>
            <form action="UpdateBookServlet" method="post">
                <td>
                    <%= rs.getInt("id") %>
                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                </td>
                <td><input type="text" name="title" value="<%= rs.getString("title") %>" required></td>
                <td><input type="text" name="author" value="<%= rs.getString("author") %>" required></td>
                <td><input type="text" name="isbn" value="<%= rs.getString("isbn") %>" required></td>
                <td><input type="number" name="total_copies" value="<%= rs.getInt("total_copies") %>" required min="0"></td>
                <td><input type="number" name="available_copies" value="<%= rs.getInt("available_copies") %>" required min="0"></td>
                <td>
                    <input type="submit" class="btn btn-update" value="Update">
                    <a href="DeleteBookServlet?id=<%= rs.getInt("id") %>" class="btn btn-delete" 
                       onclick="return confirm('Are you sure you want to delete this book?');">Delete</a>
                </td>
            </form>
        </tr>
        <%
                }

            } catch(Exception e) {
        %>
        <tr>
            <td colspan="7" class="error">Error: <%= e.getMessage() %></td>
        </tr>
        <%
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
