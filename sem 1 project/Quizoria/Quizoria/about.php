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
    <script src="https://unpkg.com/scrollreveal" href="main.js"></script>
    <title>Quizoria </title>
</head>


<body>
    <?php include 'header.php'; ?>

    <section class="banner">
        <div class="banner_container">
          <div class="banner_card">
            <h4>300+</h4>
            <p>Quiz</p>
          </div>
          <div class="banner_card">
            <h4>450+</h4>
            <p>USERS</p>
          </div>
          <div class="banner_card">
            <h4>4+</h4>
            <p>SUBJECTS</p>
          </div>
          <div class="banner_card">
            <h4>340</h4>
            <p>Lesson Conducted</p>
          </div>
        </div>
      </section>

<?php include 'footer.php'; ?>
    
      </body>
      </html>