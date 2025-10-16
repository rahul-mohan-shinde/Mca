<%@ include file="navbar.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("username");
    if(username == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <style>
        /* Root Colors - GitHub Dark Inspired */
        :root {
            --bg-dark: #0d1117;
            --text-light: #c9d1d9;
            --primary: #238636;
            --primary-hover: #2ea043;
            --border: #30363d;
            --radius: 6px;
            --font: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif;
        }

        body {
            background-color: var(--bg-dark);
            font-family: var(--font);
            margin: 0;
            color: var(--text-light);
        }

        /* Dashboard Content */
        .dashboard {
            padding: 40px 20px;
            max-width: 1200px;
            margin: auto;
        }

        .dashboard h1 {
            text-align: center;
            font-size: 32px;
            margin-bottom: 40px;
            color: var(--primary-hover);
        }

        /* Cards Grid */
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 25px;
        }

        .card {
            background-color: #161b22;
            border-radius: var(--radius);
            padding: 25px;
            text-align: center;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
            transition: all 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.5);
        }

        .card h3 {
            font-size: 22px;
            margin-bottom: 12px;
            color: var(--primary-hover);
        }

        .card p {
            font-size: 14px;
            color: var(--text-light);
            margin-bottom: 20px;
        }

        .card a {
            display: inline-block;
            padding: 10px 22px;
            border-radius: var(--radius);
            background-color: var(--primary);
            color: white;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .card a:hover {
            background-color: var(--primary-hover);
            transform: scale(1.05);
        }

        /* Welcome Message */
        .welcome-msg {
            text-align: center;
            font-size: 18px;
            margin-bottom: 30px;
            color: var(--primary-hover);
        }

        /* Responsive */
        @media(max-width: 500px){
            .dashboard h1 { font-size: 24px; }
            .card h3 { font-size: 18px; }
        }
    </style>
</head>
<body>

    <div class="dashboard">
        <!-- Welcome Message -->
<div class="welcome-msg">
    <h1>👋 Welcome, <span><%= username %></span>!</h1>
</div>

<style>
    .welcome-msg {
        text-align: center;
        margin-bottom: 40px;
    }

    .welcome-msg h1 {
        font-size: 36px;
        background: linear-gradient(90deg, #58a6ff, #238636, #ff7b72);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        animation: gradientMove 3s infinite linear;
    }

    .welcome-msg span {
        font-weight: bold;
    }

    @keyframes gradientMove {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    /* Responsive */
    @media(max-width: 500px){
        .welcome-msg h1 {
            font-size: 26px;
        }
    }
</style>
 <h1>Quick Access</h1>
        <div class="cards">
            <div class="card">
                <h3>Available Books</h3>
                <p>View all books you can borrow</p>
                <a href="availableBooks.jsp">Go</a>
            </div>
            <div class="card">
                <h3>My Borrowed Books</h3>
                <p>Check your borrowed books</p>
                <a href="borrowedBooks.jsp">Go</a>
            </div>
            <div class="card">
                <h3>Profile</h3>
                <p>Manage your account</p>
                <a href="profile.jsp">Go</a>
            </div>
            <div class="card">
                <h3>Settings</h3>
                <p>Update your preferences</p>
                <a href="settings.jsp">Go</a>
            </div>
        </div>
    </div>

</body>
</html>
