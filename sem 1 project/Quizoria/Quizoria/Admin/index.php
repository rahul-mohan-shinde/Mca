<?php
session_start();
include '../db.php'; // Database connection file

// Redirect to login if user is not logged in
if (!isset($_SESSION['admin'])) {
    header("Location: login.php");
    exit();
}

// Handle form submission for adding questions
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $quiz_name = mysqli_real_escape_string($db_con, $_POST['quiz_name']);
    $quiz_level = mysqli_real_escape_string($db_con, $_POST['quiz_level']);
    $question = mysqli_real_escape_string($db_con, $_POST['question']);
    $option_a = mysqli_real_escape_string($db_con, $_POST['option_a']);
    $option_b = mysqli_real_escape_string($db_con, $_POST['option_b']);
    $option_c = mysqli_real_escape_string($db_con, $_POST['option_c']);
    $option_d = mysqli_real_escape_string($db_con, $_POST['option_d']);
    $correct_answer = mysqli_real_escape_string($db_con, $_POST['correct_answer']);

    $sql = "INSERT INTO quiz_questions (quiz_name, quiz_level, question, option_a, option_b, option_c, option_d, correct_answer) 
            VALUES ('$quiz_name', '$quiz_level', '$question', '$option_a', '$option_b', '$option_c', '$option_d', '$correct_answer')";

    $message = mysqli_query($db_con, $sql) ? "Question added successfully!" : "Error: " . mysqli_error($db_con);
}

// Fetch quizzes for viewing and deleting
$quiz_query = "SELECT DISTINCT quiz_name FROM quiz_questions";
$quiz_result = mysqli_query($db_con, $quiz_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../home.css">
</head>
<body>
    <?php include 'header.php'; ?>
    <div class="admin-page">
        <div class="abovecontainer">
            <div class="admin-container">
                <!-- Sidebar -->
                <div class="sidebar">
                    <nav>
                        <ul>
							<li><a href="javascript:void(0);" onclick="showSection('quizzes')">Quizzes</a></li>
                            <li><a href="javascript:void(0);" onclick="showSection('add-question')">Add New Question</a></li>
                            <li><a href="javascript:void(0);" onclick="showSection('view-questions')">View & Delete Questions</a></li>
                            <li><a href="logout.php">Logout</a></li><br>
                        </ul>
                    </nav>
                </div>
                
                <!-- Admin Content -->
                <div class="admin-content">
                    <div class="admin-header">
                        <h1>Admin Dashboard</h1>
                    </div>
                    
					<!-- Quizzes Section -->
<div class="quizzes active" id="quizzes">
    <h3>Quizzes & Question Counts</h3>
    <table>
        <thead>
            <tr>
                <th>Quiz Name</th>
                <th>Quiz Level</th>
                <th>Total Questions</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $quiz_counts_query = "SELECT quiz_name, quiz_level, COUNT(*) as total_questions FROM quiz_questions GROUP BY quiz_name, quiz_level";
            $quiz_counts_result = mysqli_query($db_con, $quiz_counts_query);
            
            while ($quiz = mysqli_fetch_assoc($quiz_counts_result)) {
                echo "<tr>";
                echo "<td>" . htmlspecialchars($quiz['quiz_name']) . "</td>";
                echo "<td>" . htmlspecialchars($quiz['quiz_level']) . "</td>";
                echo "<td>" . $quiz['total_questions'] . "</td>";
                echo "</tr>";
            }
            ?>
        </tbody>
    </table>
</div>

					
                    <!-- Add New Question -->
                    <div class="add-question" id="add-question">
                        <h3>Add New Question</h3>
                        <?php if (isset($message)) echo "<p style='color: green;'>$message</p>"; ?>
                        <form method="POST">
                            <label>Quiz Name:</label>
                            <select name="quiz_name" required>
                                <option value="">Please Select</option>
                                <option value="Java">Java</option>
                                <option value="Android">Android</option>
                                <option value="CSS">CSS</option>
                                <option value="HTML">HTML</option>
                            </select>
                            <label>Quiz Level:</label>
                            <select name="quiz_level" required>
                                <option value="">Please Select</option>
                                <option value="Easy">Easy</option>
                                <option value="Medium">Medium</option>
                                <option value="Hard">Hard</option>
                            </select>
                            <label>Question:</label>
                            <textarea name="question" required></textarea>
                            <label>Option A:</label>
                            <input type="text" name="option_a" required>
                            <label>Option B:</label>
                            <input type="text" name="option_b" required>
                            <label>Option C:</label>
                            <input type="text" name="option_c" required>
                            <label>Option D:</label>
                            <input type="text" name="option_d" required>
                            <label>Correct Answer:</label>
                            <select name="correct_answer" required>
                                <option value="">Please Select</option>
                                <option value="option_a">A</option>
                                <option value="option_b">B</option>
                                <option value="option_c">C</option>
                                <option value="option_d">D</option>
                            </select>
                            <button type="submit">Add Question</button>
                        </form>
                    </div>
                    
                    <!-- View & Delete Questions -->
                    <div class="view-questions" id="view-questions">
                        <h3>View & Delete Questions</h3>
                        <form method="GET">
                            <label>Select Quiz:</label>
                            <select name="selected_quiz">
                                <option value="">Select Quiz</option>
                                <?php while ($quiz = mysqli_fetch_assoc($quiz_result)) { ?>
                                    <option value="<?php echo $quiz['quiz_name']; ?>"> <?php echo $quiz['quiz_name']; ?> </option>
                                <?php } ?>
                            </select>
                            <label>Select Level:</label>
                            <select name="selected_level">
                                <option value="">Select Level</option>
                                <option value="Easy">Easy</option>
                                <option value="Medium">Medium</option>
                                <option value="Hard">Hard</option>
                            </select>
                            <button type="submit">Filter</button>
                        </form>
                        <?php
                        if (isset($_GET['selected_quiz']) && isset($_GET['selected_level'])) {
                            $selected_quiz = mysqli_real_escape_string($db_con, $_GET['selected_quiz']);
                            $selected_level = mysqli_real_escape_string($db_con, $_GET['selected_level']);
                            
                            echo "<h4>Selected Quiz: $selected_quiz</h4>";
                            echo "<h4>Selected Level: $selected_level</h4>";
                            
                            $questions_query = "SELECT * FROM quiz_questions WHERE quiz_name = '$selected_quiz' AND quiz_level = '$selected_level'";
                            $questions_result = mysqli_query($db_con, $questions_query);
                            
                            echo "<div class='question-cards'>";
                            while ($question = mysqli_fetch_assoc($questions_result)) {
                                echo "<div class='question-card'>";
                                echo "<p><strong>Question:</strong> " . htmlspecialchars($question['question']) . "</p>";
                                echo "<p>A: " . htmlspecialchars($question['option_a']) . "</p>";
                                echo "<p>B: " . htmlspecialchars($question['option_b']) . "</p>";
                                echo "<p>C: " . htmlspecialchars($question['option_c']) . "</p>";
                                echo "<p>D: " . htmlspecialchars($question['option_d']) . "</p>";
                                echo "<p><strong>Correct Answer:</strong> " . htmlspecialchars($question['correct_answer']) . "</p>";
                                echo "<button class='delete-btn' onclick='deleteQuestion(" . $question['id'] . ", this)'>Delete</button>";
                                echo "</div>";
                            }
                            echo "</div>";
                        }
                        ?>
						
						<!-- View Quizzes -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php include 'footer.php'; ?>

    <script>
function showSection(sectionId) {
    document.querySelectorAll('.add-question, .view-questions, .quizzes').forEach(section => {
        section.classList.remove('active');
    });

    document.getElementById(sectionId).classList.add('active');
    history.pushState(null, '', window.location.pathname + '#' + sectionId);
    localStorage.setItem("activeSection", sectionId);
}

window.onload = function () {
    const hash = window.location.hash.replace('#', '');
    const activeSection = localStorage.getItem("activeSection");

    if (hash) {
        showSection(hash);
    } else if (activeSection) {
        showSection(activeSection);
    } else {
        showSection('quizzes');
    }
};


function deleteQuestion(questionId, buttonElement) {
    if (confirm("Are you sure you want to delete this question?")) {
        fetch("delete_question.php", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: "id=" + questionId
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert("Question deleted successfully!");
                buttonElement.closest('.question-card').remove(); // Remove card from UI
            } else {
                alert("Error: " + data.error);
            }
        })
        .catch(error => alert("Request failed!"));
    }
}
    </script>
</body>
</html>