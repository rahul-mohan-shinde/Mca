package com.library.controller;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import com.library.dao.DBConnection;

public class AvailableBooksServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        
        int bookId = Integer.parseInt(req.getParameter("book_id"));
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");
        
        try {
            Connection con = DBConnection.getConnection();
            
            // Student ID fetch karo
            PreparedStatement psStudent = con.prepareStatement("SELECT student_id FROM students WHERE username=?");
            psStudent.setString(1, username);
            ResultSet rsStudent = psStudent.executeQuery();
            rsStudent.next();
            int studentId = rsStudent.getInt("student_id");

            // Check if student already borrowed this book
            PreparedStatement psCheck = con.prepareStatement(
                "SELECT * FROM borrow WHERE student_id=? AND book_id=? AND return_date IS NULL"
            );
            psCheck.setInt(1, studentId);
            psCheck.setInt(2, bookId);
            ResultSet rsCheck = psCheck.executeQuery();
            if(rsCheck.next()) {
                res.getWriter().println("You have already borrowed this book!");
                return;
            }

            // Check available copies
            PreparedStatement psBook = con.prepareStatement("SELECT available_copies FROM books WHERE book_id=?");
            psBook.setInt(1, bookId);
            ResultSet rsBook = psBook.executeQuery();
            rsBook.next();
            int available = rsBook.getInt("available_copies");

            if(available > 0) {
                // Borrow book
                PreparedStatement psBorrow = con.prepareStatement(
                    "INSERT INTO borrow(student_id, book_id, borrow_date) VALUES (?, ?, CURRENT_DATE)"
                );
                psBorrow.setInt(1, studentId);
                psBorrow.setInt(2, bookId);
                psBorrow.executeUpdate();

                // Reduce available copies
                PreparedStatement psUpdate = con.prepareStatement(
                    "UPDATE books SET available_copies = available_copies - 1 WHERE book_id=?"
                );
                psUpdate.setInt(1, bookId);
                psUpdate.executeUpdate();

                res.getWriter().println("Book borrowed successfully!");
            } else {
                res.getWriter().println("No copies available!");
            }

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
