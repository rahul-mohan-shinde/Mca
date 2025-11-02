package com.quizoria.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.quizoria.dao.QuestionDAO;
import com.quizoria.dao.ScoreDAO;
import com.quizoria.model.Question;
import com.quizoria.model.Score;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@WebServlet("/quiz/*")
public class QuizServlet extends HttpServlet {
    private QuestionDAO questionDAO;
    private ScoreDAO scoreDAO;
    
    @Override
    public void init() throws ServletException {
        questionDAO = new QuestionDAO();
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
        
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        
        String[] pathParts = pathInfo.substring(1).split("-");
        if (pathParts.length != 2) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        
        String quizName = pathParts[0];
        String quizLevel = pathParts[1].substring(0, 1).toUpperCase() + 
                          pathParts[1].substring(1).toLowerCase();
        
        List<Question> questions = questionDAO.getQuestionsByQuizAndLevel(quizName, quizLevel);
        
        // Convert questions to JSON format for JavaScript
        List<Map<String, Object>> questionsJson = new ArrayList<>();
        for (Question q : questions) {
            Map<String, Object> questionMap = new HashMap<>();
            questionMap.put("question", q.getQuestion());
            
            // Create options list and shuffle
            List<String> options = Arrays.asList(q.getOptionA(), q.getOptionB(), 
                                                 q.getOptionC(), q.getOptionD());
            List<Integer> indices = Arrays.asList(0, 1, 2, 3);
            Collections.shuffle(indices);
            
            List<String> shuffledOptions = new ArrayList<>();
            int correctIndex = -1;
            for (int i = 0; i < indices.size(); i++) {
                int idx = indices.get(i);
                shuffledOptions.add(options.get(idx));
                if (q.getCorrectAnswer().equals("option_a") && idx == 0 ||
                    q.getCorrectAnswer().equals("option_b") && idx == 1 ||
                    q.getCorrectAnswer().equals("option_c") && idx == 2 ||
                    q.getCorrectAnswer().equals("option_d") && idx == 3) {
                    correctIndex = i;
                }
            }
            
            questionMap.put("options", shuffledOptions);
            questionMap.put("correct", correctIndex);
            questionsJson.add(questionMap);
        }
        
        request.setAttribute("quizName", quizName);
        request.setAttribute("quizLevel", quizLevel);
        request.setAttribute("questions", questionsJson);
        request.getRequestDispatcher("/WEB-INF/views/quiz.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }
        
        int userId = (Integer) session.getAttribute("user_id");
        String quizName = request.getParameter("quiz_name");
        String quizLevel = request.getParameter("quiz_level");
        int score = Integer.parseInt(request.getParameter("score"));
        int totalQuestions = Integer.parseInt(request.getParameter("total_questions"));
        
        Score scoreObj = new Score();
        scoreObj.setUserId(userId);
        scoreObj.setQuizName(quizName);
        scoreObj.setQuizLevel(quizLevel);
        scoreObj.setScore(score);
        scoreObj.setTotalQuestions(totalQuestions);
        
        if (scoreDAO.saveScore(scoreObj)) {
            response.getWriter().write("Score saved successfully!");
        } else {
            response.getWriter().write("Error saving score!");
        }
    }
}

