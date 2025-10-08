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

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    private UserDAO userDAO;
    
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Direct access prevent karo, signup.jsp par redirect karo
        response.sendRedirect("signup.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Form data retrieve karo
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String fullName = request.getParameter("fullName");
        String bio = request.getParameter("bio");
        
        // Validation
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Password and Confirm Password do not match!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        
        if (userDAO.isUsernameExists(username)) {
            request.setAttribute("errorMessage", "Username already exists! Please choose another.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        
        if (userDAO.isEmailExists(email)) {
            request.setAttribute("errorMessage", "Email already registered! Please use another email.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        
        // New user create karo
        User user = new User(username, email, password, fullName);
        user.setBio(bio);
        
        // Database mein save karo
        boolean isRegistered = userDAO.registerUser(user);
        
        if (isRegistered) {
            // Success message session mein set karo
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Registration successful! Please login to continue.");
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("errorMessage", "Registration failed! Please try again.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}