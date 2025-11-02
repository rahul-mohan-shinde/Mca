<%@ include file="header.jsp" %>

<!-- Quiz Section -->
<section class="quiz-levels">
    <h2 class="subheader"><%= request.getAttribute("quizName") %> Quiz</h2><br>
    <p class="header">Choose Your Level</p><br>
    
    <div class="cards">
        <div class="card">
            <h2>Easy</h2><br>
            <p>Basic level questions.</p>
            <div class="btn-container">
                <a href="${pageContext.request.contextPath}/quiz/<%= request.getAttribute("quizName") %>-easy">
                    <button class="quiz_btn">Start Quiz</button>
                </a>
            </div>
        </div>
        <div class="card">
            <h2>Medium</h2><br>
            <p>Intermediate level questions.</p>
            <div class="btn-container">
                <a href="${pageContext.request.contextPath}/quiz/<%= request.getAttribute("quizName") %>-medium">
                    <button class="quiz_btn">Start Quiz</button>
                </a>
            </div>
        </div>
        <div class="card">
            <h2>Hard</h2><br>
            <p>Advanced level questions.</p>
            <div class="btn-container">
                <a href="${pageContext.request.contextPath}/quiz/<%= request.getAttribute("quizName") %>-hard">
                    <button class="quiz_btn">Start Quiz</button>
                </a>
            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>

