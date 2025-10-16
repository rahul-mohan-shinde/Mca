package com.library.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import com.library.dao.DBConnection;

public class BorrowBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        int bookId = Integer.parseInt(req.getParameter("book_id"));

        try (Connection con = DBConnection.getConnection()) {

            // 1️⃣ Get student id
            int studentId = 0;
            try (PreparedStatement psStudent = con.prepareStatement(
                    "SELECT id FROM students WHERE username=?")) {
                psStudent.setString(1, username);
                try (ResultSet rsStudent = psStudent.executeQuery()) {
                    if (rsStudent.next()) {
                        studentId = rsStudent.getInt("id");
                    } else {
                        res.getWriter().println("Student not found!");
                        return;
                    }
                }
            }

            // 2️⃣ Check if student already has this book borrowed
            boolean alreadyBorrowed = false;
            try (PreparedStatement psCheck = con.prepareStatement(
                    "SELECT * FROM borrow WHERE student_id=? AND book_id=? AND return_date IS NULL")) {
                psCheck.setInt(1, studentId);
                psCheck.setInt(2, bookId);
                try (ResultSet rsCheck = psCheck.executeQuery()) {
                    if (rsCheck.next()) {
                        alreadyBorrowed = true;
                    }
                }
            }

            if (alreadyBorrowed) {
                res.setContentType("text/html");
                res.getWriter().println("<script>alert('You have already borrowed this book!'); window.location='availableBooks.jsp';</script>");
                return;
            }

            // 3️⃣ Check available copies
            int available = 0;
            try (PreparedStatement psBook = con.prepareStatement("SELECT available_copies FROM book WHERE id=?")) {
                psBook.setInt(1, bookId);
                try (ResultSet rsBook = psBook.executeQuery()) {
                    if (rsBook.next()) {
                        available = rsBook.getInt("available_copies");
                    }
                }
            }

            if (available <= 0) {
                res.setContentType("text/html");
                res.getWriter().println("<script>alert('No copies available!'); window.location='availableBooks.jsp';</script>");
                return;
            }

            // 4️⃣ Borrow book
            try (PreparedStatement psBorrow = con.prepareStatement(
                    "INSERT INTO borrow(student_id, book_id, borrow_date) VALUES (?, ?, CURRENT_DATE)")) {
                psBorrow.setInt(1, studentId);
                psBorrow.setInt(2, bookId);
                psBorrow.executeUpdate();
            }

            // 5️⃣ Reduce available copies
            try (PreparedStatement psUpdate = con.prepareStatement(
                    "UPDATE book SET available_copies = available_copies - 1 WHERE id=?")) {
                psUpdate.setInt(1, bookId);
                psUpdate.executeUpdate();
            }

            res.sendRedirect("availableBooks.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            res.setContentType("text/html");
            res.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
