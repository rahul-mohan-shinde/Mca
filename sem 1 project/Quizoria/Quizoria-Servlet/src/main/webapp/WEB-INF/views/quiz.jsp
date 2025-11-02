<%@ include file="header.jsp" %>
<%@ page import="java.util.*" %>

<%
    String quizName = (String) request.getAttribute("quizName");
    String quizLevel = (String) request.getAttribute("quizLevel");
    List<Map<String, Object>> questions = (List<Map<String, Object>>) request.getAttribute("questions");
%>

<!-- Quiz Section -->
<section class="quiz-section">
    <h2 id="quiz-title">🚀 <%= quizName %> Quiz - <%= quizLevel %></h2>
    <p id="question-counter">Question 1 / <%= questions.size() %></p>

    <div class="quiz-container">
        <p class="question" id="question-text"></p>

        <div class="options">
            <label class="option">
                <input type="radio" name="quiz-option" value="0">
                <span id="option1"></span>
            </label>
            <label class="option">
                <input type="radio" name="quiz-option" value="1">
                <span id="option2"></span>
            </label>
            <label class="option">
                <input type="radio" name="quiz-option" value="2">
                <span id="option3"></span>
            </label>
            <label class="option">
                <input type="radio" name="quiz-option" value="3">
                <span id="option4"></span>
            </label>
        </div>

        <p class="feedback"></p>
        <button id="next-btn" class="next-btn" style="display: none;">Next</button>
    </div>
</section>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    const quizTitle = "🚀 <%= quizName %> Quiz - <%= quizLevel %>";
    <%
        com.fasterxml.jackson.databind.ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
        String questionsJson = mapper.writeValueAsString(questions);
    %>
    const questions = <%= questionsJson %>;
    const totalQuestions = questions.length;
    let currentQuestionIndex = 0;
    let score = 0;

    function loadQuestion() {
        let currentQuestion = questions[currentQuestionIndex];
        document.getElementById("quiz-title").textContent = quizTitle;
        document.getElementById("question-counter").textContent = `Question ${currentQuestionIndex + 1} / ${totalQuestions}`;
        document.getElementById("question-text").textContent = currentQuestion.question;

        document.querySelectorAll(".option input").forEach((input, index) => {
            input.checked = false;
            input.disabled = false;
            input.parentElement.style.backgroundColor = "#fff";
            input.nextElementSibling.textContent = currentQuestion.options[index];
        });

        document.querySelector(".feedback").textContent = "";
        document.getElementById("next-btn").style.display = "none";
    }

    document.querySelectorAll(".option input").forEach((input) => {
        input.addEventListener("change", function () {
            let selectedOption = parseInt(this.value);
            let correctAnswer = questions[currentQuestionIndex].correct;
            let feedback = document.querySelector(".feedback");

            if (selectedOption === correctAnswer) {
                this.parentElement.style.backgroundColor = "green";
                feedback.textContent = "✅ Correct!";
                feedback.style.color = "green";
                score++;
            } else {
                this.parentElement.style.backgroundColor = "red";
                feedback.textContent = "❌ Wrong! The correct answer is " +
                    questions[currentQuestionIndex].options[correctAnswer];
                feedback.style.color = "red";
                document.querySelectorAll(".option")[correctAnswer].style.backgroundColor = "green";
            }

            document.querySelectorAll(".option input").forEach(btn => btn.disabled = true);
            document.getElementById("next-btn").style.display = "block";
        });
    });

    document.getElementById("next-btn").addEventListener("click", function () {
        currentQuestionIndex++;

        if (currentQuestionIndex < totalQuestions) {
            loadQuestion();
        } else {
            // Save score using AJAX
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/quiz/<%= quizName %>-<%= quizLevel.toLowerCase() %>",
                data: {
                    quiz_name: "<%= quizName %>",
                    quiz_level: "<%= quizLevel %>",
                    score: score,
                    total_questions: totalQuestions
                },
                success: function(response) {
                    console.log("Score saved: " + response);
                },
                error: function(xhr, status, error) {
                    console.error("Error saving score: " + error);
                }
            });

            document.querySelector(".quiz-container").innerHTML = `
                <h2>🎉 Quiz Completed! 🎉</h2>
                <p>Your Score: <strong>${score} / ${totalQuestions}</strong></p>
            `;
            document.getElementById("question-counter").style.display = "none";
        }
    });

    loadQuestion();
</script>

<%@ include file="footer.jsp" %>

