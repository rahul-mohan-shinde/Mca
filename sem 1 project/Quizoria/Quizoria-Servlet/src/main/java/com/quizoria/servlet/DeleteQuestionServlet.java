package com.quizoria.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.quizoria.dao.QuestionDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/admin/delete-question")
public class DeleteQuestionServlet extends HttpServlet {
    private QuestionDAO questionDAO;
    
    @Override
    public void init() throws ServletException {
        questionDAO = new QuestionDAO();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }
        
        response.setContentType("application/json");
        Map<String, Object> result = new HashMap<>();
        
        try {
            int questionId = Integer.parseInt(request.getParameter("id"));
            boolean success = questionDAO.deleteQuestion(questionId);
            result.put("success", success);
            if (!success) {
                result.put("error", "Failed to delete question");
            }
        } catch (NumberFormatException e) {
            result.put("success", false);
            result.put("error", "Invalid question ID");
        }
        
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getWriter(), result);
    }
}

