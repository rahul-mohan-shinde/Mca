package com.quizoria.model;

import java.sql.Timestamp;

public class Score {
    private int id;
    private Timestamp dateTaken;
    private int userId;
    private String quizName;
    private String quizLevel;
    private int score;
    private int totalQuestions;
    
    public Score() {}
    
    public Score(int id, Timestamp dateTaken, int userId, String quizName, 
                String quizLevel, int score, int totalQuestions) {
        this.id = id;
        this.dateTaken = dateTaken;
        this.userId = userId;
        this.quizName = quizName;
        this.quizLevel = quizLevel;
        this.score = score;
        this.totalQuestions = totalQuestions;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public Timestamp getDateTaken() {
        return dateTaken;
    }
    
    public void setDateTaken(Timestamp dateTaken) {
        this.dateTaken = dateTaken;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public String getQuizName() {
        return quizName;
    }
    
    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }
    
    public String getQuizLevel() {
        return quizLevel;
    }
    
    public void setQuizLevel(String quizLevel) {
        this.quizLevel = quizLevel;
    }
    
    public int getScore() {
        return score;
    }
    
    public void setScore(int score) {
        this.score = score;
    }
    
    public int getTotalQuestions() {
        return totalQuestions;
    }
    
    public void setTotalQuestions(int totalQuestions) {
        this.totalQuestions = totalQuestions;
    }
}

