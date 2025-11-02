package com.quizoria.servlet;

import com.quizoria.dao.ScoreDAO;
import com.quizoria.dao.UserDAO;
import com.quizoria.model.Score;
import com.quizoria.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private UserDAO userDAO;
    private ScoreDAO scoreDAO;
    
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
        scoreDAO = new ScoreDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        int userId = (Integer) session.getAttribute("user_id");
        User user = userDAO.getUserById(userId);
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        List<Score> scores = scoreDAO.getScoresByUserId(userId);
        
        request.setAttribute("user", user);
        request.setAttribute("scores", scores);
        request.getRequestDispatcher("/WEB-INF/views/profile.jsp").forward(request, response);
    }
}

