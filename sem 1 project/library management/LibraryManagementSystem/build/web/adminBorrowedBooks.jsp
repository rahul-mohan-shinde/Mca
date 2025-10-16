<%@ include file="adminNavbar.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%    // Session check: admin only
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>All Borrowed Books - Admin View</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/adminBorrowedBooks.css">

    </head>
    <body>
        <a href="adminDashboard.jsp">Back to Dashboard</a>
        <h1 style="text-align:center;">All Borrowed/Returned Books</h1>

        <!-- Search Form -->
        <form method="get" action="adminBorrowedBooks.jsp">
            <input type="text" name="searchUser" placeholder="Search by Username" 
                   value="<%= request.getParameter("searchUser") != null ? request.getParameter("searchUser") : ""%>">
            <input type="submit" class="btn" value="Search">
        </form>

        <table>
            <tr>
                <th>User</th>
                <th>Book Title</th>
                <th>Author</th>
                <th>Borrow Date</th>
                <th>Return Date</th>
                <th>Status</th>
            </tr>

            <%
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                String searchUser = request.getParameter("searchUser");

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_db", "root", "Rahul@123");

                    // JOIN students table to get username
                    String query = "SELECT s.username, b.title, b.author, bb.borrow_date, bb.return_date, bb.is_returned "
                            + "FROM borrow bb "
                            + "JOIN book b ON bb.book_id = b.id "
                            + "JOIN students s ON bb.student_id = s.id";

                    if (searchUser != null && !searchUser.trim().isEmpty()) {
                        query += " WHERE s.username LIKE ?";
                    }

                    query += " ORDER BY bb.borrow_date DESC";

                    ps = con.prepareStatement(query);

                    if (searchUser != null && !searchUser.trim().isEmpty()) {
                        ps.setString(1, "%" + searchUser + "%");
                    }

                    rs = ps.executeQuery();

                    boolean hasRecords = false;
                    while (rs.next()) {
                        hasRecords = true;
                        String status = rs.getBoolean("is_returned") ? "Returned" : "Borrowed";
            %>
            <tr>
                <td><%= rs.getString("username")%></td>
                <td><%= rs.getString("title")%></td>
                <td><%= rs.getString("author")%></td>
                <td><%= rs.getDate("borrow_date")%></td>
                <td><%= rs.getDate("return_date") != null ? rs.getDate("return_date") : "-"%></td>
                <td><%= status%></td>
            </tr>

            <%
                }
                if (!hasRecords) {
            %>
            <tr>
                <td colspan="6" style="color:red;">No records found!</td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='6' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) {
                            rs.close();
                        }
                    } catch (Exception e) {
                    }
                    try {
                        if (ps != null) {
                            ps.close();
                        }
                    } catch (Exception e) {
                    }
                    try {
                        if (con != null) {
                            con.close();
                        }
                    } catch (Exception e) {
                    }
                }
            %>
        </table>



    </body>
</html>
