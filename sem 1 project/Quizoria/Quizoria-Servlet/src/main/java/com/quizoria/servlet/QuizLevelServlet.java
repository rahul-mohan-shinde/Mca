package com.quizoria.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet({"/java", "/html", "/css", "/android"})
public class QuizLevelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        String path = request.getServletPath();
        String quizName = path.substring(1); // Remove leading /
        // Capitalize first letter
        quizName = quizName.substring(0, 1).toUpperCase() + quizName.substring(1).toLowerCase();
        
        request.setAttribute("quizName", quizName);
        request.getRequestDispatcher("/WEB-INF/views/quiz-levels.jsp").forward(request, response);
    }
}

