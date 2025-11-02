<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}
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
    <section class="quiz-levels">
        
    <h2 class="subheader">HTML Quiz</h2><br>
    <p class="header">Choose Your Level</p><br>
    
	<div class="cards">
    <div class="card">
      <h2>Easy</h2><br>
      <p>Basic level questions.</p>
	  <div class="btn-container">
      <a href="html-easy.php"><button class="quiz_btn">Start Quiz</button></a>
	  </div>
    </div>
    <div class="card">
      <h2>Medium</h2><br>
      <p>Intermediate level questions.</p>
	  <div class="btn-container">
      <a href="html-medium.php"><button class="quiz_btn">Start Quiz</button></a>
	  </div>
    </div>
    <div class="card">
      <h2>Hard</h2><br>
      <p>Advanced level questions.</p>
	  <div class="btn-container">
      <a href="html-hard.php"><button class="quiz_btn">Start Quiz</button></a>
	  </div>
    </div>
</div>

    </section>

    <?php include 'footer.php'; ?>
</body>
</html>