<%@ include file="header.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.quizoria.model.User" %>
<%@ page import="com.quizoria.model.Score" %>

<%
    User user = (User) request.getAttribute("user");
    List<Score> scores = (List<Score>) request.getAttribute("scores");
    SimpleDateFormat dateFormat = new SimpleDateFormat("EEE, dd-MMM-yyyy");
    SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm a");
%>

<div class="profile-page">
    <div class="abovecontainer">
        <div class="container">
            <!-- Sidebar Dashboard -->
            <div class="sidebar">
                <div class="logo">
                    <img src="${pageContext.request.contextPath}/assets/profile.png" alt="Profile Picture">
                </div>
                <nav>
                    <ul>
                        <li><a onclick="showSection('personal-info')">Dashboard</a></li><br>
                        <li><a onclick="showSection('quiz-info')">My Quizzes</a></li><br>
                        <li><a href="${pageContext.request.contextPath}/">Home</a></li><br>
                        <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li><br>
                    </ul>
                </nav>
            </div>

            <!-- Profile Section -->
            <div class="profile-content">
                <div class="profile-header">
                    <h1>My Profile</h1>
                </div>

                <div class="personal-info active" id="personal-info">
                    <h3>Personal Information</h3>
                    <p><strong>Name:</strong> <%= user.getName() %></p>
                    <p><strong>Phone:</strong> <%= user.getPhone() %></p>
                    <p><strong>Email:</strong> <%= user.getEmail() %></p>
                </div>

                <div class="quiz-info" id="quiz-info">
                    <h3>Your Quiz Scores</h3>
                    <table>
                        <tr>
                            <th>Date and Time</th>
                            <th>Quiz Name</th>
                            <th>Quiz Level</th>
                            <th>Score</th>
                        </tr>
                        <% for (Score score : scores) { %>
                        <tr>
                            <td><%= dateFormat.format(score.getDateTaken()) %><br><%= timeFormat.format(score.getDateTaken()) %></td>
                            <td><%= score.getQuizName() %></td>
                            <td><%= score.getQuizLevel() %></td>
                            <td><%= score.getScore() %> / <%= score.getTotalQuestions() %></td>
                        </tr>
                        <% } %>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function showSection(sectionId) {
        document.getElementById('personal-info').classList.remove('active');
        document.getElementById('quiz-info').classList.remove('active');

        document.getElementById(sectionId).classList.add('active');
    }
</script>

<%@ include file="footer.jsp" %>

