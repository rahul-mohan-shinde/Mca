package com.socialmedia.servlet;

import com.socialmedia.dao.UserDAO;
import com.socialmedia.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO;
    
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        System.out.println("Login attempt for: " + username);
        
        User user = userDAO.loginUser(username, password);
        
        if (user != null) {
            // ✅ Create NEW session (purani session invalidate karo)
            HttpSession oldSession = request.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }
            
            // ✅ Naya session create karo
            HttpSession newSession = request.getSession(true);
            
            // ✅ Session timeout set karo (optional)
            newSession.setMaxInactiveInterval(60 * 60); // 1 hour in seconds
            
            // ✅ All user data session mein set karo
            newSession.setAttribute("user", user);
            newSession.setAttribute("username", user.getUsername());
            newSession.setAttribute("fullName", user.getFullName());
            newSession.setAttribute("userId", user.getUserId());
            newSession.setAttribute("email", user.getEmail());
            
            System.out.println("✅ Login successful - Session created for: " + user.getUsername());
            System.out.println("Session ID: " + newSession.getId());
            System.out.println("Session timeout: " + newSession.getMaxInactiveInterval() + " seconds");
            
            response.sendRedirect("profile.jsp");
            
        } else {
            // Login failed
            System.out.println("❌ Login failed for: " + username);
            request.setAttribute("errorMessage", "Invalid username or password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}