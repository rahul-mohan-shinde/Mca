package com.library.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ReturnBookServlet")
public class ReturnBookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");
        int borrowId = Integer.parseInt(request.getParameter("borrow_id"));

        Connection con = null;
        PreparedStatement psGetStudent = null;
        PreparedStatement psUpdateBorrow = null;
        PreparedStatement psUpdateBook = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/library_db", "root", "Rahul@123"
            );

            // 1️⃣ Get student_id
            int studentId = 0;
            psGetStudent = con.prepareStatement("SELECT id FROM students WHERE username=?");
            psGetStudent.setString(1, username);
            ResultSet rsStudent = psGetStudent.executeQuery();
            if(rsStudent.next()){
                studentId = rsStudent.getInt("id");
            } else {
                response.getWriter().println("Student not found!");
                return;
            }

            // 2️⃣ Update borrow table
            String updateBorrow = "UPDATE borrow SET return_date = NOW() WHERE id = ? AND student_id = ?";
            psUpdateBorrow = con.prepareStatement(updateBorrow);
            psUpdateBorrow.setInt(1, borrowId);
            psUpdateBorrow.setInt(2, studentId);
            int rows = psUpdateBorrow.executeUpdate();

            if(rows > 0){
                // 3️⃣ Get book_id from borrow table
                int bookId = 0;
                try (PreparedStatement psBook = con.prepareStatement("SELECT book_id FROM borrow WHERE id=?")) {
                    psBook.setInt(1, borrowId);
                    ResultSet rsBook = psBook.executeQuery();
                    if(rsBook.next()){
                        bookId = rsBook.getInt("book_id");
                    }
                }

                // 4️⃣ Update book table to increase available copies
                psUpdateBook = con.prepareStatement(
                        "UPDATE book SET available_copies = available_copies + 1 WHERE id = ?"
                );
                psUpdateBook.setInt(1, bookId);
                psUpdateBook.executeUpdate();

                response.sendRedirect("myBorrowedBooks.jsp");

            } else {
                response.getWriter().println("Invalid borrow record or already returned!");
            }

        } catch(Exception e){
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try { if(psGetStudent != null) psGetStudent.close(); } catch(Exception e){}
            try { if(psUpdateBorrow != null) psUpdateBorrow.close(); } catch(Exception e){}
            try { if(psUpdateBook != null) psUpdateBook.close(); } catch(Exception e){}
            try { if(con != null) con.close(); } catch(Exception e){}
        }
    }
}
