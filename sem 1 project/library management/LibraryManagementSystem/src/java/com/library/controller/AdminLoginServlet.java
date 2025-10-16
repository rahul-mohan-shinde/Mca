package com.library.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if("admin".equals(username) && "admin123".equals(password)){
            HttpSession session = request.getSession();
            session.setAttribute("admin", username);
            response.sendRedirect("adminDashboard.jsp");
        } else {
            response.sendRedirect("adminLogin.jsp?error=Invalid+Credentials");
        }
    }
}
