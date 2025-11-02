<%@ page import="java.util.*" %>
<%
    Boolean isLoggedIn = session != null && session.getAttribute("user_id") != null;
    String userName = isLoggedIn ? (String) session.getAttribute("user_name") : null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet" />
    <script src="https://unpkg.com/scrollreveal"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css" />
    <title>Quizoria</title>
</head>
<body>
    <!-- Header Section -->
    <div class="horizontal-box">
        <marquee class="">Quizoria</marquee>
    </div>

    <nav>
        <div class="nav_logo">
            <img src="${pageContext.request.contextPath}/assets/quizoria-logo.png" alt="logo" />
        </div>
        <ul class="nav_links">
            <li class="li_links"><a href="${pageContext.request.contextPath}/">Home</a></li>
            <li class="li_links"><a href="${pageContext.request.contextPath}/about">About</a></li>
        </ul>

        <div class="nav_logo">
            <% if (isLoggedIn) { %>
                Welcome, <%= userName %>!
            <% } %>

            <div class="profile-container">
                <img src="${pageContext.request.contextPath}/assets/profile.png" id="profileIcon" class="profile-img" />
                <ul class="dropdown-menu" id="dropdownMenu">
                    <% if (!isLoggedIn) { %>
                        <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                    <% } else { %>
                        <li><a href="${pageContext.request.contextPath}/profile">My Profile</a></li>
                        <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>
    
<script>
document.addEventListener("DOMContentLoaded", function () {
    const profileIcon = document.getElementById("profileIcon");
    const dropdownMenu = document.getElementById("dropdownMenu");

    profileIcon.addEventListener("click", function (event) {
        event.stopPropagation();
        dropdownMenu.style.display =
            dropdownMenu.style.display === "block" ? "none" : "block";
    });

    document.addEventListener("click", function (event) {
        if (!profileIcon.contains(event.target) && !dropdownMenu.contains(event.target)) {
            dropdownMenu.style.display = "none";
        }
    });
});
</script>

