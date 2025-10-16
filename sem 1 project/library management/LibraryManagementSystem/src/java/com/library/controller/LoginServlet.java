package com.library.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import com.library.dao.DBConnection;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM students WHERE username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("username", username);
                res.sendRedirect("studentWellcome.jsp");
            } else {
                res.getWriter().println("Invalid username or password!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
