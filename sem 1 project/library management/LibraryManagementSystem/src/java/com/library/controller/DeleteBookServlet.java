package com.library.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.library.dao.DBConnection;

@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));

        try (Connection con = DBConnection.getConnection()) {

            // 🔹 Check active borrow (not returned)
            String checkActive = "SELECT COUNT(*) FROM borrow WHERE book_id = ? AND return_date IS NULL";
            try (PreparedStatement psCheck = con.prepareStatement(checkActive)) {
                psCheck.setInt(1, id);
                ResultSet rs = psCheck.executeQuery();
                if (rs.next() && rs.getInt(1) > 0) {
                    response.setContentType("text/html;charset=UTF-8");
                    response.getWriter().println(
                        "<script>" +
                        "alert('❌ Cannot delete: Some students still have this book borrowed.');" +
                        "window.location='viewBooks.jsp';" +
                        "</script>"
                    );
                    return;
                }
            }

            // 🔹 Then check old history (optional: delete old borrow records)
            String deleteHistory = "DELETE FROM borrow WHERE book_id = ?";
            try (PreparedStatement psDelHist = con.prepareStatement(deleteHistory)) {
                psDelHist.setInt(1, id);
                psDelHist.executeUpdate();
            }

            // 🔹 Finally delete from book table
            String deleteBook = "DELETE FROM book WHERE id = ?";
            try (PreparedStatement psDelBook = con.prepareStatement(deleteBook)) {
                psDelBook.setInt(1, id);
                int rows = psDelBook.executeUpdate();

                response.setContentType("text/html;charset=UTF-8");
                if (rows > 0) {
                    response.getWriter().println(
                        "<script>" +
                        "alert('✅ Book deleted successfully!');" +
                        "window.location='viewBooks.jsp';" +
                        "</script>"
                    );
                } else {
                    response.getWriter().println(
                        "<script>" +
                        "alert('⚠️ Book not found.');" +
                        "window.location='viewBooks.jsp';" +
                        "</script>"
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            String msg = e.getMessage() != null ? e.getMessage().replace("'", "") : "Unknown error";
            response.getWriter().println(
                "<script>" +
                "alert('⚠️ Error deleting book: " + msg + "');" +
                "window.location='viewBooks.jsp';" +
                "</script>"
            );
        }
    }
}
