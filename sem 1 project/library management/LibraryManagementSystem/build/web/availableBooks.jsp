<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp" %>
<%@ page import="java.sql.*" %>

<%
    // Check user login
    if(session == null || session.getAttribute("username") == null){
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("username");
    String search = request.getParameter("search");
%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/availableBooks.css">

<div class="container">
    <h1>Available Books</h1>

    <!-- Search Form -->
    <form method="get" style="margin-bottom:20px;">
        <input type="text" name="search" placeholder="Search by title or author" value="<%= (search != null) ? search : "" %>" />
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
    PreparedStatement psBook = null;
    PreparedStatement psCheck = null;
    ResultSet rs = null;
    int studentId = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_db", "root", "Rahul@123");

        // Get student ID
        psStudent = con.prepareStatement("SELECT id FROM students WHERE username=?");
        psStudent.setString(1, username);
        ResultSet rsStudent = psStudent.executeQuery();
        if(rsStudent.next()){
            studentId = rsStudent.getInt("id");
        }

        // Get books
        String query = "SELECT * FROM book";
        if(search != null && !search.trim().isEmpty()){
            query += " WHERE title LIKE ? OR author LIKE ?";
            psBook = con.prepareStatement(query);
            psBook.setString(1, "%" + search + "%");
            psBook.setString(2, "%" + search + "%");
        } else {
            psBook = con.prepareStatement(query);
        }

        rs = psBook.executeQuery();

        boolean hasBooks = false;
        while(rs.next()){
            hasBooks = true;
            int bookId = rs.getInt("id");
            String title = rs.getString("title");
            String author = rs.getString("author");
            int availableCopies = rs.getInt("available_copies");

            // Check if already borrowed
            psCheck = con.prepareStatement(
                "SELECT * FROM borrow WHERE student_id=? AND book_id=? AND return_date IS NULL"
            );
            psCheck.setInt(1, studentId);
            psCheck.setInt(2, bookId);
            ResultSet rsCheck = psCheck.executeQuery();
            boolean alreadyBorrowed = rsCheck.next();
%>
        <tr>
            <td><%= bookId %></td>
            <td><%= title %></td>
            <td><%= author %></td>
            <td><%= availableCopies %></td>
            <td>
                <% if(availableCopies > 0 && !alreadyBorrowed){ %>
                    <form action="BorrowBookServlet" method="post">
                        <input type="hidden" name="book_id" value="<%= bookId %>">
                        <input type="submit" class="btn" value="Borrow">
                    </form>
                <% } else if(alreadyBorrowed){ %>
                    <span class="status green">Already Borrowed</span>
                <% } else { %>
                    <span class="status red">Not Available</span>
                <% } %>
            </td>
        </tr>
<%
        }

        if(!hasBooks){
%>
        <tr>
            <td colspan="5" class="status red">No books found!</td>
        </tr>
<%
        }

        rs.close();
        if(psBook!=null) psBook.close();
        if(psCheck!=null) psCheck.close();
        if(psStudent!=null) psStudent.close();
        if(con!=null) con.close();
    } catch(Exception e){
%>
        <tr>
            <td colspan="5" class="status red">Error: <%= e.getMessage() %></td>
        </tr>
<%
        e.printStackTrace();
    }
%>
    </table>
</div>
