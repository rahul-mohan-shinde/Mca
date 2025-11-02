<?php
session_start();
include '../db.php'; // Ensure this file does not have any output

// If the user is already logged in, redirect to index.php
if (isset($_SESSION['admin'])) {
    header("Location: .");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $query = "SELECT * FROM admins WHERE email = '$email'";
    $result = mysqli_query($db_con, $query);

    if (mysqli_num_rows($result) === 1) {
        $user = mysqli_fetch_assoc($result);
        
        if ($password === $user['password']) { // Removed password_verify for normal comparison
            $_SESSION['admin'] = $user['email'];
            $_SESSION['user_name'] = $user['name'];
            header("Location: .");
            exit(); // Ensure script stops execution
        } else {
            $error = "Invalid password!";
        }
    } else {
        $error = "User not found!";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Quizoria</title>
    <link rel="stylesheet" href="../home.css">
</head>
<body>
<?php include 'header.php'; // Include header ?>
    <section class="login-section">
        <div class="login-container">
            <h2>ADMIN LOGIN</h2>
            <?php if (isset($error)) echo "<p style='color:red;'>$error</p>"; ?>
            <form method="POST" action="">
                <label>Email:</label>
                <input type="email" name="email" required>
                
                <label>Password:</label>
                <input type="password" name="password" required>
                
                <button type="submit">Login</button>
            </form>
        </div>
    </section>

    <?php include 'footer.php'; ?>
</body>
</html>
