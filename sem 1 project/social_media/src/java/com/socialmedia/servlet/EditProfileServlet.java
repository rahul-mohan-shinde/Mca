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

@WebServlet("/edit-profile")
public class EditProfileServlet extends HttpServlet {
    private UserDAO userDAO;
    
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");
        
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String fullName = request.getParameter("fullName");
        String bio = request.getParameter("bio");
        String email = request.getParameter("email");
        
        // Update user object
        currentUser.setFullName(fullName);
        currentUser.setBio(bio);
        currentUser.setEmail(email);
        
        // TODO: Implement update method in UserDAO
        // boolean success = userDAO.updateUser(currentUser);
        boolean success = true; // Temporary
        
        if (success) {
            session.setAttribute("user", currentUser);
            session.setAttribute("successMessage", "Profile updated successfully!");
        } else {
            session.setAttribute("errorMessage", "Failed to update profile. Please try again.");
        }
        
        response.sendRedirect("profile.jsp");
    }
}