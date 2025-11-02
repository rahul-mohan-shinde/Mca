<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
include '../db.php'; // Include database connection

// Check if user is logged in
$isLoggedIn = isset($_SESSION['admin']);

if ($isLoggedIn) {
    // Fetch user details
    $email = $_SESSION['admin'];
    $query = "SELECT name FROM admins WHERE email = '$email'";
    $result = mysqli_query($db_con, $query);
    $user = mysqli_fetch_assoc($result);
}
?>

<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet" />
    <script src="https://unpkg.com/scrollreveal"></script>
    <link rel="stylesheet" href="../home.css" />
    <title>Quizoria</title>
</head>

<body>
    <!-- Header Section -->
    <div class="horizontal-box">
        <marquee class="">Quizoria</marquee>
    </div>

    <nav>
        <div class="nav_logo">
            <img src="../assets/quizoria-logo.png" alt="logo" />
        </div>
        <div class="nav_logo">
            <?php if ($isLoggedIn): ?>
                    Welcome, <?php echo htmlspecialchars($user['name']); ?>!
            <?php endif; ?>

            <div class="profile-container">
    <img src="../assets/profile.png" id="profileIcon" class="profile-img" />
    <ul class="dropdown-menu" id="dropdownMenu">
        <?php if (!$isLoggedIn): ?>
            <li><a href="login.php">Login</a></li>
        <?php else: ?>
            <li><a href="logout.php">Logout</a></li>
        <?php endif; ?>
    </ul>
</div>


        </div>
    </nav>
</body>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const profileIcon = document.getElementById("profileIcon");
    const dropdownMenu = document.getElementById("dropdownMenu");

    profileIcon.addEventListener("click", function (event) {
        event.stopPropagation(); // Prevents click from closing immediately
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
</html>
