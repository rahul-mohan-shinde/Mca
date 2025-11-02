<?php
session_start();
include 'db.php'; // Database connection file

// If the user is already logged in, redirect to index.php
if (isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = trim($_POST['name']);
    $phone = trim($_POST['phone']);
    $email = trim($_POST['email']);
    $password = $_POST['password']; // Allow special characters

    // Validate input
    if (empty($name) || empty($phone) || empty($email) || empty($password)) {
        $error = "All fields are required!";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Invalid email format!";
    } elseif (!preg_match('/^[0-9]{10,15}$/', $phone)) { // Optional: Validate phone number (10-15 digits)
        $error = "Phone number must contain only digits and be between 10-15 characters.";
    } else {
        // Check if email already exists (Prevent SQL Injection)
        $check_query = "SELECT id FROM users WHERE email = ?";
        $stmt = mysqli_prepare($db_con, $check_query);
        mysqli_stmt_bind_param($stmt, "s", $email);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_store_result($stmt);

        if (mysqli_stmt_num_rows($stmt) > 0) {
            $error = "Email already exists!";
        } else {
            // Insert user into database using prepared statement
            $query = "INSERT INTO users (name, phone, email, password) VALUES (?, ?, ?, ?)";
            $stmt = mysqli_prepare($db_con, $query);
            mysqli_stmt_bind_param($stmt, "ssss", $name, $phone, $email, $password);

            if (mysqli_stmt_execute($stmt)) {
                $_SESSION['user_id'] = mysqli_insert_id($db_con);
                $_SESSION['user_name'] = $name;
                header("Location: profile.php");
                exit();
            } else {
                $error = "Error signing up! Please try again.";
            }
        }
        mysqli_stmt_close($stmt);
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Quizoria</title>
    <link rel="stylesheet" href="home.css">
</head>
<body>
<?php include 'header.php'; ?>

    <section class="signup-section">
        <div class="signup-container">
            <h2>SIGN UP</h2>
            <?php if (isset($error)) echo "<p style='color:red;'>$error</p>"; ?>
            <form method="POST" action="">
                <label>Name:</label>
                <input type="text" name="name" required>

                <label>Phone:</label>
                <input type="text" name="phone" required>

                <label>Email:</label>
                <input type="email" name="email" required>

                <label>Password:</label>
                <input type="password" id="password" name="password" pattern="^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$" title="Password must include at least one uppercase letter, one number, and one special character." required>
				

                <button type="submit">Sign Up</button>
            </form>
            <p>Already have an account? <a href="login.php">Login</a></p>
        </div>
    </section>

<?php include 'footer.php'; ?>
</body>
</html>
