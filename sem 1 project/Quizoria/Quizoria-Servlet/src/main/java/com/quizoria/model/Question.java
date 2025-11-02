package com.quizoria.model;

public class Question {
    private int id;
    private String quizName;
    private String quizLevel;
    private String question;
    private String optionA;
    private String optionB;
    private String optionC;
    private String optionD;
    private String correctAnswer;
    
    public Question() {}
    
    public Question(int id, String quizName, String quizLevel, String question,
                    String optionA, String optionB, String optionC, String optionD, String correctAnswer) {
        this.id = id;
        this.quizName = quizName;
        this.quizLevel = quizLevel;
        this.question = question;
        this.optionA = optionA;
        this.optionB = optionB;
        this.optionC = optionC;
        this.optionD = optionD;
        this.correctAnswer = correctAnswer;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
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
    
    public String getQuestion() {
        return question;
    }
    
    public void setQuestion(String question) {
        this.question = question;
    }
    
    public String getOptionA() {
        return optionA;
    }
    
    public void setOptionA(String optionA) {
        this.optionA = optionA;
    }
    
    public String getOptionB() {
        return optionB;
    }
    
    public void setOptionB(String optionB) {
        this.optionB = optionB;
    }
    
    public String getOptionC() {
        return optionC;
    }
    
    public void setOptionC(String optionC) {
        this.optionC = optionC;
    }
    
    public String getOptionD() {
        return optionD;
    }
    
    public void setOptionD(String optionD) {
        this.optionD = optionD;
    }
    
    public String getCorrectAnswer() {
        return correctAnswer;
    }
    
    public void setCorrectAnswer(String correctAnswer) {
        this.correctAnswer = correctAnswer;
    }
}

