package com.library.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.library.dao.DBConnection;

public class AddBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("admin") == null){
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String isbn = request.getParameter("isbn");
        int totalCopies = 0;

        try {
            totalCopies = Integer.parseInt(request.getParameter("total_copies"));
        } catch(NumberFormatException e) {
            out.println("<h3 style='color:red'>Invalid number of copies!</h3>");
            return;
        }

        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO book(title, author, isbn, total_copies, available_copies) VALUES(?,?,?,?,?)"
            );
            ps.setString(1, title);
            ps.setString(2, author);
            ps.setString(3, isbn);
            ps.setInt(4, totalCopies);
            ps.setInt(5, totalCopies);

            int rows = ps.executeUpdate();

            if(rows > 0){
                out.println("<h3 style='color:green'>Book added successfully!</h3>");
                out.println("<a href='addBook.jsp'>Add Another Book</a><br>");
                out.println("<a href='adminDashboard.jsp'>Go to Dashboard</a>");
            } else {
                out.println("<h3 style='color:red'>Failed to add book!</h3>");
            }

            con.close();

        } catch(Exception e){
            e.printStackTrace();
            out.println("<h3 style='color:red'>Error: " + e.getMessage() + "</h3>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("addBook.jsp");
    }
}
