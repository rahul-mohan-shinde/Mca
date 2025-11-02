<?php
session_start();
include 'db.php'; // Database connection file

// Redirect to login if user is not logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Get user_id from session
$user_id = $_SESSION['user_id'];

// Fetch user details
$query = "SELECT id, name, phone, email FROM users WHERE id = '$user_id'";
$result = mysqli_query($db_con, $query);
$userdetails = mysqli_fetch_assoc($result);

// If user does not exist, redirect to login
if (!$userdetails) {
    header("Location: login.php");
    exit();
}

// Fetch quiz scores using user ID
$score_query = "SELECT date_taken, quiz_name, quiz_level, score, total_questions FROM scores WHERE user_id = '$user_id'";
$score_result = mysqli_query($db_con, $score_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Profile Page</title>

</head>
<body>
    <?php include 'header.php'; // Include header ?>
<div class="profile-page">
    <div class="abovecontainer">
    <div class="container">
        <!-- Sidebar Dashboard -->
        <div class="sidebar">
            <div class="logo">
                <img src="assets/profile.png" alt="Profile Picture">
            </div>
            <nav>
                <ul>
                    <li><a onclick="showSection('personal-info')">Dashboard</a></li><br>
                    <li><a onclick="showSection('quiz-info')">My Quizzes</a></li><br>
                    <li><a href="index.php">Home</a></li><br>
                    <li><a href="logout.php">Logout</a></li><br>
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
                <p><strong>Name:</strong> <?php echo htmlspecialchars($userdetails['name']); ?></p>
                <p><strong>Phone:</strong> <?php echo htmlspecialchars($userdetails['phone']); ?></p>
                <p><strong>Email:</strong> <?php echo htmlspecialchars($userdetails['email']); ?></p>
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
                    <?php while ($score = mysqli_fetch_assoc($score_result)) { ?>
                    <tr>
						<td><?php echo date('D, d-M-Y', strtotime($score['date_taken'])) ?><br><?php echo date('h:i A', strtotime($score['date_taken'])) ?></td>
                        <td><?php echo htmlspecialchars($score['quiz_name']); ?></td>
                        <td><?php echo htmlspecialchars($score['quiz_level']); ?></td>
                        <td><?php echo htmlspecialchars($score['score']); ?> / <?php echo htmlspecialchars($score['total_questions']); ?></td>
                    </tr>
                    <?php } ?>
                </table>
            </div>
        </div>
    </div>
    </div>
</div>
    <?php include 'footer.php'; // Include header ?>

<script>
    function showSection(sectionId) {
        // Hide all sections
        document.getElementById('personal-info').classList.remove('active');
        document.getElementById('quiz-info').classList.remove('active');

        // Show the selected section
        document.getElementById(sectionId).classList.add('active');
    }
</script>
</body>

</html>
