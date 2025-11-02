package com.quizoria.servlet;

import com.quizoria.dao.UserDAO;
import com.quizoria.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

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
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user_id") != null) {
            response.sendRedirect(request.getContextPath() + "/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String name = request.getParameter("name").trim();
        String phone = request.getParameter("phone").trim();
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password");
        
        String error = validateInput(name, phone, email, password);
        
        if (error == null) {
            if (userDAO.emailExists(email)) {
                error = "Email already exists!";
            } else {
                User user = new User();
                user.setName(name);
                user.setPhone(phone);
                user.setEmail(email);
                user.setPassword(password);
                
                int userId = userDAO.insertUser(user);
                if (userId > 0) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user_id", userId);
                    session.setAttribute("user_name", name);
                    response.sendRedirect(request.getContextPath() + "/profile");
                    return;
                } else {
                    error = "Error signing up! Please try again.";
                }
            }
        }
        
        request.setAttribute("error", error);
        request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
    }
    
    private String validateInput(String name, String phone, String email, String password) {
        if (name.isEmpty() || phone.isEmpty() || email.isEmpty() || password.isEmpty()) {
            return "All fields are required!";
        }
        
        if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            return "Invalid email format!";
        }
        
        if (!phone.matches("^[0-9]{10,15}$")) {
            return "Phone number must contain only digits and be between 10-15 characters.";
        }
        
        return null;
    }
}

