<%@ include file="header.jsp" %>

<!-- Quiz Section -->
<section>
    <h2 class="header">Quizoria</h2>
    <p class="subheader">Quiz Your Way to Brilliance</p>
    <div class="quiz-card">
        <div class="row">
            <div class="column">
                <h2>JAVA</h2>
                <img class="quizzes-logo" src="${pageContext.request.contextPath}/assets/java.png" alt="Java Logo">
                <div class="btn-container">
                    <a class="quiz_btn" href="${pageContext.request.contextPath}/java">PLAY</a>
                </div>
            </div>
            <div class="column">
                <h2>ANDROID</h2>
                <img class="quizzes-logo" src="${pageContext.request.contextPath}/assets/android.png" alt="Android Logo">
                <div class="btn-container">
                    <a class="quiz_btn" href="${pageContext.request.contextPath}/android">PLAY</a>
                </div>
            </div>
            <div class="column">
                <h2>HTML</h2>
                <img class="quizzes-logo" src="${pageContext.request.contextPath}/assets/html.png" alt="HTML Logo">
                <div class="btn-container">
                    <a class="quiz_btn" href="${pageContext.request.contextPath}/html">PLAY</a>
                </div>
            </div>
            <div class="column">
                <h2>CSS</h2>
                <img class="quizzes-logo" src="${pageContext.request.contextPath}/assets/css.png" alt="CSS Logo">
                <div class="btn-container">
                    <a class="quiz_btn" href="${pageContext.request.contextPath}/css">PLAY</a>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>

