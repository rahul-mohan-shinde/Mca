<?php
session_start();
// Check if user is logged in
$isLoggedIn = isset($_SESSION['user_id']);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet" />
    <link rel="stylesheet" href="home.css" />
    <script src="https://unpkg.com/scrollreveal"></script>
    <title>Quizoria</title>
</head>

<body>
    
<?php include 'header.php'; ?>

    <!-- Quiz Section -->
    <section>
            <h2 class="header">Quizoria</h2>
            <p class="subheader">Quiz Your Way to Brilliance</p>
			<div class="quiz-card">
            <div class="row">
                <div class="column">
                    <h2>JAVA</h2>
                    <img class="quizzes-logo" src="assets/java.png" alt="Java Logo">
					<div class="btn-container">
                    <a class="quiz_btn" href="java.php">PLAY</a>
					</div>
                </div>
                <div class="column">
                    <h2>ANDROID</h2>
                    <img class="quizzes-logo" src="assets/android.png" alt="Android Logo">
					<div class="btn-container">
                    <a class="quiz_btn" href="android.php">PLAY</a>
					</div>
                </div>
                <div class="column">
                    <h2>HTML</h2>
                    <img class="quizzes-logo" src="assets/html.png" alt="HTML Logo">
					<div class="btn-container">
                    <a class="quiz_btn" href="html.php">PLAY</a>
					</div>
                </div>
                <div class="column">
                    <h2>CSS</h2>
                    <img class="quizzes-logo" src="assets/css.png" alt="CSS Logo">
					<div class="btn-container">					
                    <a class="quiz_btn" href="css.php">PLAY</a>
					</div>
                </div>
            </div>
            </div>
    </section>

    <?php include 'footer.php'; ?>
</body>
</html>