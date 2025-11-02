<?php
include '../db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id'])) {
    $id = mysqli_real_escape_string($db_con, $_POST['id']);
    $query = "DELETE FROM quiz_questions WHERE id = '$id'";
    
    if (mysqli_query($db_con, $query)) {
        echo json_encode(["success" => true]);
    } else {
        echo json_encode(["success" => false, "error" => mysqli_error($db_con)]);
    }
}
?>
