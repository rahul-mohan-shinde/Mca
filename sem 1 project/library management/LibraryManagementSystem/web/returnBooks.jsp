<%@ include file="navbar.jsp" %>
<%@ page import="java.sql.*" %>

<%
    if(session.getAttribute("username") == null){
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Borrowed Books</title>
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/availableBooks.css">

</head>
<body>
    <h1>Borrowed Books</h1>

    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Borrowed Date</th>
            <th>Return Date</th>
            <th>Action</th>
        </tr>

<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/library_db", "root", "Rahul@123"
        );

        // Correct query using JOINs
        String query = "SELECT b.id AS borrow_id, b.book_id, bk.title, bk.author, b.borrow_date, b.return_date " +
                       "FROM borrow b " +
                       "JOIN book bk ON b.book_id = bk.id " +
                       "JOIN students s ON b.student_id = s.id " +
                       "WHERE s.username = ?";

        ps = con.prepareStatement(query);
        ps.setString(1, username);
        rs = ps.executeQuery();

        boolean hasRecords = false;
        while(rs.next()) {
            hasRecords = true;
            int borrowId = rs.getInt("borrow_id");
            int bookId = rs.getInt("book_id");
%>
        <tr>
            <td><%= borrowId %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("author") %></td>
            <td><%= rs.getDate("borrow_date") %></td>
            <td><%= rs.getDate("return_date") != null ? rs.getDate("return_date") : "Not Returned" %></td>
            <td>
<%
    if(rs.getDate("return_date") == null){ 
%>
    <form action="ReturnBookServlet" method="post">
        <input type="hidden" name="borrow_id" value="<%= borrowId %>">
        <input type="submit" class="btn" value="Return">
    </form>
<% 
    } else { 
%>
    Returned
<% } %>
            </td>
        </tr>
<%
        }

        if(!hasRecords){
%>
        <tr>
            <td colspan="6" class="error">No borrowed books found!</td>
        </tr>
<%
        }

    } catch(Exception e){
%>
        <tr>
            <td colspan="6" class="error">Error: <%= e.getMessage() %></td>
        </tr>
<%
        e.printStackTrace();
    } finally {
        try { if(rs != null) rs.close(); } catch(Exception e){}
        try { if(ps != null) ps.close(); } catch(Exception e){}
        try { if(con != null) con.close(); } catch(Exception e){}
    }
%>
    </table>
</body>
</html>
