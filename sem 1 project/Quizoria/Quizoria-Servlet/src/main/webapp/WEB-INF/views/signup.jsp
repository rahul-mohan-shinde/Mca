<%@ include file="header.jsp" %>

<section class="signup-section">
    <div class="signup-container">
        <h2>SIGN UP</h2>
        <% if (request.getAttribute("error") != null) { %>
            <p style="color:red;"><%= request.getAttribute("error") %></p>
        <% } %>
        <form method="POST" action="${pageContext.request.contextPath}/signup">
            <label>Name:</label>
            <input type="text" name="name" required>

            <label>Phone:</label>
            <input type="text" name="phone" required>

            <label>Email:</label>
            <input type="email" name="email" required>

            <label>Password:</label>
            <input type="password" id="password" name="password" 
                   pattern="^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$" 
                   title="Password must include at least one uppercase letter, one number, and one special character." 
                   required>

            <button type="submit">Sign Up</button>
        </form>
        <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Login</a></p>
    </div>
</section>

<%@ include file="footer.jsp" %>

