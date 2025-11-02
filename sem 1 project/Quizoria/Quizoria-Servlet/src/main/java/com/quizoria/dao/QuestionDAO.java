package com.quizoria.dao;

import com.quizoria.model.Question;
import com.quizoria.util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class QuestionDAO {
    
    public List<Question> getQuestionsByQuizAndLevel(String quizName, String quizLevel) {
        List<Question> questions = new ArrayList<>();
        String query = "SELECT * FROM quiz_questions WHERE quiz_name = ? AND quiz_level = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, quizName);
            stmt.setString(2, quizLevel);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                questions.add(new Question(
                    rs.getInt("id"),
                    rs.getString("quiz_name"),
                    rs.getString("quiz_level"),
                    rs.getString("question"),
                    rs.getString("option_a"),
                    rs.getString("option_b"),
                    rs.getString("option_c"),
                    rs.getString("option_d"),
                    rs.getString("correct_answer")
                ));
            }
            Collections.shuffle(questions); // Shuffle questions
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questions;
    }
    
    public boolean addQuestion(Question question) {
        String query = "INSERT INTO quiz_questions (quiz_name, quiz_level, question, option_a, option_b, option_c, option_d, correct_answer) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, question.getQuizName());
            stmt.setString(2, question.getQuizLevel());
            stmt.setString(3, question.getQuestion());
            stmt.setString(4, question.getOptionA());
            stmt.setString(5, question.getOptionB());
            stmt.setString(6, question.getOptionC());
            stmt.setString(7, question.getOptionD());
            stmt.setString(8, question.getCorrectAnswer());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteQuestion(int questionId) {
        String query = "DELETE FROM quiz_questions WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, questionId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Question> getQuestionsByFilter(String quizName, String quizLevel) {
        List<Question> questions = new ArrayList<>();
        String query = "SELECT * FROM quiz_questions WHERE quiz_name = ? AND quiz_level = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, quizName);
            stmt.setString(2, quizLevel);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                questions.add(new Question(
                    rs.getInt("id"),
                    rs.getString("quiz_name"),
                    rs.getString("quiz_level"),
                    rs.getString("question"),
                    rs.getString("option_a"),
                    rs.getString("option_b"),
                    rs.getString("option_c"),
                    rs.getString("option_d"),
                    rs.getString("correct_answer")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questions;
    }
    
    public List<String> getDistinctQuizNames() {
        List<String> quizNames = new ArrayList<>();
        String query = "SELECT DISTINCT quiz_name FROM quiz_questions";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                quizNames.add(rs.getString("quiz_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return quizNames;
    }
    
    public List<Map<String, Object>> getQuizCounts() {
        List<Map<String, Object>> counts = new ArrayList<>();
        String query = "SELECT quiz_name, quiz_level, COUNT(*) as total_questions FROM quiz_questions GROUP BY quiz_name, quiz_level";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Map<String, Object> countMap = new HashMap<>();
                countMap.put("quizName", rs.getString("quiz_name"));
                countMap.put("quizLevel", rs.getString("quiz_level"));
                countMap.put("totalQuestions", rs.getInt("total_questions"));
                counts.add(countMap);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return counts;
    }
}
