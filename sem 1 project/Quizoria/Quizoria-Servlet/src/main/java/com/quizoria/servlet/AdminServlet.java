package com.quizoria.servlet;

import com.quizoria.dao.QuestionDAO;
import com.quizoria.model.Question;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    private QuestionDAO questionDAO;
    
    @Override
    public void init() throws ServletException {
        questionDAO = new QuestionDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }
        
        String selectedQuiz = request.getParameter("selected_quiz");
        String selectedLevel = request.getParameter("selected_level");
        
        List<String> quizNames = questionDAO.getDistinctQuizNames();
        List<Map<String, Object>> quizCounts = questionDAO.getQuizCounts();
        request.setAttribute("quizNames", quizNames);
        request.setAttribute("quizCounts", quizCounts);
        
        if (selectedQuiz != null && selectedLevel != null && 
            !selectedQuiz.isEmpty() && !selectedLevel.isEmpty()) {
            List<Question> questions = questionDAO.getQuestionsByFilter(selectedQuiz, selectedLevel);
            request.setAttribute("selectedQuiz", selectedQuiz);
            request.setAttribute("selectedLevel", selectedLevel);
            request.setAttribute("questions", questions);
        }
        
        request.getRequestDispatcher("/WEB-INF/views/admin.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }
        
        Question question = new Question();
        question.setQuizName(request.getParameter("quiz_name"));
        question.setQuizLevel(request.getParameter("quiz_level"));
        question.setQuestion(request.getParameter("question"));
        question.setOptionA(request.getParameter("option_a"));
        question.setOptionB(request.getParameter("option_b"));
        question.setOptionC(request.getParameter("option_c"));
        question.setOptionD(request.getParameter("option_d"));
        question.setCorrectAnswer(request.getParameter("correct_answer"));
        
        boolean success = questionDAO.addQuestion(question);
        request.setAttribute("message", success ? "Question added successfully!" : "Error adding question!");
        
        doGet(request, response);
    }
}

