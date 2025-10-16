<%@ include file="navbar.jsp" %>
<%@ page import="java.sql.*" %>

<%
    if(session == null || session.getAttribute("username") == null){
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Available Books</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/availableBooks.css">

</head>
<body>

<h1>Available Books</h1>

<form method="get" action="availableBooks.jsp" style="text-align:center; margin-bottom:20px;">
    <input type="text" name="search" placeholder="Search by Title or Author" value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
    <input type="submit" class="btn" value="Search">
</form>

<table>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Author</th>
        <th>Available Copies</th>
        <th>Action</th>
    </tr>

<%
    Connection con = null;
    PreparedStatement psStudent = null;
    PreparedStatement psCheck = null;
    ResultSet rs = null;
    int studentId = 0;
    String search = request.getParameter("search");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_db","root","Rahul@123");

        // Get student id
        psStudent = con.prepareStatement("SELECT id FROM students WHERE username=?");
        psStudent.setString(1, username);
        ResultSet rsStudent = psStudent.executeQuery();
        if(rsStudent.next()){
            studentId = rsStudent.getInt("id");
        }

        String sql = "SELECT * FROM book";
        if(search != null && !search.trim().isEmpty()){
            sql += " WHERE title LIKE ? OR author LIKE ?";
        }
        PreparedStatement psBooks = con.prepareStatement(sql);
        if(search != null && !search.trim().isEmpty()){
            psBooks.setString(1, "%" + search + "%");
            psBooks.setString(2, "%" + search + "%");
        }
        rs = psBooks.executeQuery();

        while(rs.next()){
            int bookId = rs.getInt("id");
            int availableCopies = rs.getInt("available_copies");

            // Check pending borrow
            psCheck = con.prepareStatement("SELECT * FROM borrow WHERE student_id=? AND book_id=? AND return_date IS NULL");
            psCheck.setInt(1, studentId);
            psCheck.setInt(2, bookId);
            ResultSet rsCheck = psCheck.executeQuery();
            boolean alreadyBorrowed = rsCheck.next();
%>

    <tr>
        <td><%= bookId %></td>
        <td><%= rs.getString("title") %></td>
        <td><%= rs.getString("author") %></td>
        <td><%= availableCopies %></td>
        <td>
            <% if(availableCopies > 0 && !alreadyBorrowed){ %>
                <form action="BorrowBookServlet" method="post">
                    <input type="hidden" name="book_id" value="<%= bookId %>">
                    <input type="submit" class="btn" value="Borrow">
                </form>
            <% } else if(alreadyBorrowed){ %>
                <span style="color:green;">Already Borrowed</span>
            <% } else { %>
                <span style="color:red;">Not Available</span>
            <% } %>
        </td>
    </tr>

<%
        }
        con.close();
    } catch(Exception e){
        out.println("<tr><td colspan='5' style='color:red;'>Error: "+e.getMessage()+"</td></tr>");
        e.printStackTrace();
    }
%>

</table>
</body>
</html>
