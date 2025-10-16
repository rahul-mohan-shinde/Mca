package com.library.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.library.dao.DBConnection;

@WebServlet("/UpdateBookServlet")
public class UpdateBookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("admin") == null){
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String isbn = request.getParameter("isbn");
        int totalCopies = Integer.parseInt(request.getParameter("total_copies"));
        int availableCopies = Integer.parseInt(request.getParameter("available_copies"));

        try (Connection con = DBConnection.getConnection()) {

            // Optional: Ensure available copies never exceed total copies
            if(availableCopies > totalCopies) {
                availableCopies = totalCopies;
            }

            String sql = "UPDATE book SET title=?, author=?, isbn=?, total_copies=?, available_copies=? WHERE id=?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, title);
                ps.setString(2, author);
                ps.setString(3, isbn);
                ps.setInt(4, totalCopies);
                ps.setInt(5, availableCopies);
                ps.setInt(6, id);
                ps.executeUpdate();
            }

            response.sendRedirect("viewBooks.jsp");

        } catch(Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating book: " + e.getMessage());
        }
    }
}
