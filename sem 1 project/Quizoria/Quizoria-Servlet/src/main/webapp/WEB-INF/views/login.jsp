<%@ include file="header.jsp" %>

<section class="login-section">
    <div class="login-container">
        <h2>LOGIN</h2>
        <% if (request.getAttribute("error") != null) { %>
            <p style="color:red;"><%= request.getAttribute("error") %></p>
        <% } %>
        <form method="POST" action="${pageContext.request.contextPath}/login">
            <label>Email:</label>
            <input type="email" name="email" required>
            
            <label>Password:</label>
            <input type="password" name="password" required>
            
            <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="${pageContext.request.contextPath}/signup">Sign Up</a></p>
    </div>
</section>

<%@ include file="footer.jsp" %>

