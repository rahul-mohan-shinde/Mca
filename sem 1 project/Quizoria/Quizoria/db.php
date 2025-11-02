<?php
$host = "localhost"; // Change if your database is hosted elsewhere
$uid = "root"; // Replace with your database username
$password = ""; // Replace with your database password
$dbName = "quizoria"; // Replace with your actual database name

// Create connection
$db_con = mysqli_connect($host, $uid, $password, $dbName);

// Check connection
if (!$db_con) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
