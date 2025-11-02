package com.quizoria.dao;

import com.quizoria.model.Score;
import com.quizoria.util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ScoreDAO {
    
    public boolean saveScore(Score score) {
        String query = "INSERT INTO scores (user_id, quiz_name, quiz_level, score, total_questions) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, score.getUserId());
            stmt.setString(2, score.getQuizName());
            stmt.setString(3, score.getQuizLevel());
            stmt.setInt(4, score.getScore());
            stmt.setInt(5, score.getTotalQuestions());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Score> getScoresByUserId(int userId) {
        List<Score> scores = new ArrayList<>();
        String query = "SELECT * FROM scores WHERE user_id = ? ORDER BY date_taken DESC";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                scores.add(new Score(
                    rs.getInt("id"),
                    rs.getTimestamp("date_taken"),
                    rs.getInt("user_id"),
                    rs.getString("quiz_name"),
                    rs.getString("quiz_level"),
                    rs.getInt("score"),
                    rs.getInt("total_questions")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return scores;
    }
}

