package com.library.controller;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import com.library.dao.DBConnection;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO students(name,email,username,password) VALUES(?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, username);
            ps.setString(4, password);

            int row = ps.executeUpdate();
            if (row > 0) {
                res.sendRedirect("login.jsp");
            } else {
                res.getWriter().println("Registration Failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
