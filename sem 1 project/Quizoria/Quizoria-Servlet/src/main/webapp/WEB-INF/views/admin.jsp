<%@ include file="header.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="com.quizoria.model.Question" %>
<%@ page import="java.util.Map" %>

<%
    List<String> quizNames = (List<String>) request.getAttribute("quizNames");
    String selectedQuiz = (String) request.getAttribute("selectedQuiz");
    String selectedLevel = (String) request.getAttribute("selectedLevel");
    List<Question> questions = (List<Question>) request.getAttribute("questions");
    String message = (String) request.getAttribute("message");
%>

<div class="admin-page">
    <div class="abovecontainer">
        <div class="admin-container">
            <!-- Sidebar -->
            <div class="sidebar">
                <nav>
                    <ul>
                        <li><a href="javascript:void(0);" onclick="showSection('quizzes')">Quizzes</a></li>
                        <li><a href="javascript:void(0);" onclick="showSection('add-question')">Add New Question</a></li>
                        <li><a href="javascript:void(0);" onclick="showSection('view-questions')">View & Delete Questions</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/logout">Logout</a></li><br>
                    </ul>
                </nav>
            </div>
            
            <!-- Admin Content -->
            <div class="admin-content">
                <div class="admin-header">
                    <h1>Admin Dashboard</h1>
                </div>
                
                <!-- Quizzes Section -->
                <div class="quizzes active" id="quizzes">
                    <h3>Quizzes & Question Counts</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Quiz Name</th>
                                <th>Quiz Level</th>
                                <th>Total Questions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Map<String, Object>> quizCounts = (List<Map<String, Object>>) request.getAttribute("quizCounts");
                                if (quizCounts != null && !quizCounts.isEmpty()) {
                                    for (Map<String, Object> count : quizCounts) {
                            %>
                            <tr>
                                <td><%= count.get("quizName") %></td>
                                <td><%= count.get("quizLevel") %></td>
                                <td><%= count.get("totalQuestions") %></td>
                            </tr>
                            <%
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="3">No questions found</td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                
                <!-- Add New Question -->
                <div class="add-question" id="add-question">
                    <h3>Add New Question</h3>
                    <% if (message != null) { %>
                        <p style="color: green;"><%= message %></p>
                    <% } %>
                    <form method="POST" action="${pageContext.request.contextPath}/admin">
                        <label>Quiz Name:</label>
                        <select name="quiz_name" required>
                            <option value="">Please Select</option>
                            <option value="Java">Java</option>
                            <option value="Android">Android</option>
                            <option value="CSS">CSS</option>
                            <option value="HTML">HTML</option>
                        </select>
                        <label>Quiz Level:</label>
                        <select name="quiz_level" required>
                            <option value="">Please Select</option>
                            <option value="Easy">Easy</option>
                            <option value="Medium">Medium</option>
                            <option value="Hard">Hard</option>
                        </select>
                        <label>Question:</label>
                        <textarea name="question" required></textarea>
                        <label>Option A:</label>
                        <input type="text" name="option_a" required>
                        <label>Option B:</label>
                        <input type="text" name="option_b" required>
                        <label>Option C:</label>
                        <input type="text" name="option_c" required>
                        <label>Option D:</label>
                        <input type="text" name="option_d" required>
                        <label>Correct Answer:</label>
                        <select name="correct_answer" required>
                            <option value="">Please Select</option>
                            <option value="option_a">A</option>
                            <option value="option_b">B</option>
                            <option value="option_c">C</option>
                            <option value="option_d">D</option>
                        </select>
                        <button type="submit">Add Question</button>
                    </form>
                </div>
                
                <!-- View & Delete Questions -->
                <div class="view-questions" id="view-questions">
                    <h3>View & Delete Questions</h3>
                    <form method="GET" action="${pageContext.request.contextPath}/admin">
                        <label>Select Quiz:</label>
                        <select name="selected_quiz">
                            <option value="">Select Quiz</option>
                            <% if (quizNames != null) { %>
                                <% for (String qn : quizNames) { %>
                                    <option value="<%= qn %>"><%= qn %></option>
                                <% } %>
                            <% } %>
                        </select>
                        <label>Select Level:</label>
                        <select name="selected_level">
                            <option value="">Select Level</option>
                            <option value="Easy">Easy</option>
                            <option value="Medium">Medium</option>
                            <option value="Hard">Hard</option>
                        </select>
                        <button type="submit">Filter</button>
                    </form>
                    
                    <% if (selectedQuiz != null && selectedLevel != null && questions != null && !questions.isEmpty()) { %>
                        <h4>Selected Quiz: <%= selectedQuiz %></h4>
                        <h4>Selected Level: <%= selectedLevel %></h4>
                        <div class="question-cards">
                            <% for (Question q : questions) { %>
                                <div class="question-card">
                                    <p><strong>Question:</strong> <%= q.getQuestion() %></p>
                                    <p>A: <%= q.getOptionA() %></p>
                                    <p>B: <%= q.getOptionB() %></p>
                                    <p>C: <%= q.getOptionC() %></p>
                                    <p>D: <%= q.getOptionD() %></p>
                                    <p><strong>Correct Answer:</strong> <%= q.getCorrectAnswer() %></p>
                                    <button class="delete-btn" onclick="deleteQuestion(<%= q.getId() %>, this)">Delete</button>
                                </div>
                            <% } %>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function showSection(sectionId) {
    document.querySelectorAll('.add-question, .view-questions, .quizzes').forEach(section => {
        section.classList.remove('active');
    });

    document.getElementById(sectionId).classList.add('active');
    history.pushState(null, '', window.location.pathname + '#' + sectionId);
    localStorage.setItem("activeSection", sectionId);
}

window.onload = function () {
    const hash = window.location.hash.replace('#', '');
    const activeSection = localStorage.getItem("activeSection");

    if (hash) {
        showSection(hash);
    } else if (activeSection) {
        showSection(activeSection);
    } else {
        showSection('quizzes');
    }
};

function deleteQuestion(questionId, buttonElement) {
    if (confirm("Are you sure you want to delete this question?")) {
        fetch("${pageContext.request.contextPath}/admin/delete-question", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: "id=" + questionId
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert("Question deleted successfully!");
                buttonElement.closest('.question-card').remove();
            } else {
                alert("Error: " + data.error);
            }
        })
        .catch(error => alert("Request failed!"));
    }
}
</script>

<%@ include file="footer.jsp" %>

