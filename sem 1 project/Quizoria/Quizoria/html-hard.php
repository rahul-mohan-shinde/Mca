<?php
session_start();
include 'db.php'; // Database connection

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Handle AJAX request to save the score
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['save_score'])) {
    $user_id = $_SESSION['user_id'];
    $quiz_name = $_POST['quiz_name'];
    $quiz_level = $_POST['quiz_level'];
    $score = $_POST['score'];
    $total_questions = $_POST['total_questions'];

    $sql = "INSERT INTO scores (user_id, quiz_name, quiz_level, score, total_questions) 
            VALUES ('$user_id', '$quiz_name', '$quiz_level', '$score', '$total_questions')";

    if (mysqli_query($db_con, $sql)) {
        echo "Score saved successfully!";
    } else {
        echo "Error: " . mysqli_error($db_con);
    }
    exit();
}

// Fetch and shuffle quiz questions
$quiz_name = "HTML"; 
$quiz_level = "Hard";
$questions = [];

$sql = "SELECT * FROM quiz_questions WHERE quiz_name='$quiz_name' AND quiz_level='$quiz_level'";
$result = mysqli_query($db_con, $sql);

while ($row = mysqli_fetch_assoc($result)) {
    $options = [
        ["text" => $row["option_a"], "is_correct" => ($row["correct_answer"] == "option_a")],
        ["text" => $row["option_b"], "is_correct" => ($row["correct_answer"] == "option_b")],
        ["text" => $row["option_c"], "is_correct" => ($row["correct_answer"] == "option_c")],
        ["text" => $row["option_d"], "is_correct" => ($row["correct_answer"] == "option_d")]
    ];

    shuffle($options); // Shuffle options

    foreach ($options as $index => $option) {
        if ($option["is_correct"]) {
            $correctIndex = $index;
            break;
        }
    }

    $questions[] = [
        "question" => $row["question"],
        "options" => array_column($options, "text"),
        "correct" => $correctIndex
    ];
}

shuffle($questions); // Shuffle questions

$questions_json = json_encode($questions);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="home.css">
    <script src="https://unpkg.com/scrollreveal"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery for AJAX -->
    <title>Quizoria - HTML Hard</title>
</head>
<body>

<?php include 'header.php'; ?>

<!-- Quiz Section -->
<section class="quiz-section">
    <h2 id="quiz-title">🚀 HTML Quiz - Hard</h2>
    <p id="question-counter">Question 1 / 5</p>

    <div class="quiz-container">
        <p class="question" id="question-text"></p>

        <div class="options">
            <label class="option">
                <input type="radio" name="quiz-option" value="0">
                <span id="option1"></span>
            </label>
            <label class="option">
                <input type="radio" name="quiz-option" value="1">
                <span id="option2"></span>
            </label>
            <label class="option">
                <input type="radio" name="quiz-option" value="2">
                <span id="option3"></span>
            </label>
            <label class="option">
                <input type="radio" name="quiz-option" value="3">
                <span id="option4"></span>
            </label>
        </div>

        <p class="feedback"></p>
        <button id="next-btn" class="next-btn" style="display: none;">Next</button>
    </div>
</section>

<script>
    const quizTitle = "🚀 HTML Quiz - Hard";
    const questions = <?php echo $questions_json; ?>;
    const totalQuestions = questions.length;
    let currentQuestionIndex = 0;
    let score = 0;

    function loadQuestion() {
        let currentQuestion = questions[currentQuestionIndex];
        document.getElementById("quiz-title").textContent = quizTitle;
        document.getElementById("question-counter").textContent = `Question ${currentQuestionIndex + 1} / ${totalQuestions}`;
        document.getElementById("question-text").textContent = currentQuestion.question;

        document.querySelectorAll(".option input").forEach((input, index) => {
            input.checked = false;
            input.disabled = false;
            input.parentElement.style.backgroundColor = "#fff";
            input.nextElementSibling.textContent = currentQuestion.options[index];
        });

        document.querySelector(".feedback").textContent = "";
        document.getElementById("next-btn").style.display = "none";
    }

    document.querySelectorAll(".option input").forEach((input) => {
        input.addEventListener("change", function () {
            let selectedOption = parseInt(this.value);
            let correctAnswer = questions[currentQuestionIndex].correct;
            let feedback = document.querySelector(".feedback");

            if (selectedOption === correctAnswer) {
                this.parentElement.style.backgroundColor = "green";
                feedback.textContent = "✅ Correct!";
                feedback.style.color = "green";
                score++;
            } else {
                this.parentElement.style.backgroundColor = "red";
                feedback.textContent = "❌ Wrong! The correct answer is " +
                    questions[currentQuestionIndex].options[correctAnswer];
                feedback.style.color = "red";
                document.querySelectorAll(".option")[correctAnswer].style.backgroundColor = "green";
            }

            document.querySelectorAll(".option input").forEach(btn => btn.disabled = true);
            document.getElementById("next-btn").style.display = "block";
        });
    });

    document.getElementById("next-btn").addEventListener("click", function () {
        currentQuestionIndex++;

        if (currentQuestionIndex < totalQuestions) {
            loadQuestion();
        } else {
            // Save score using AJAX inside the same file
            $.ajax({
                type: "POST",
                url: "", // This same file
                data: {
                    save_score: true,
                    quiz_name: "<?php echo $quiz_name; ?>",
                    quiz_level: "<?php echo $quiz_level; ?>",
                    score: score,
                    total_questions: totalQuestions
                },
                success: function(response) {
                    console.log("Score saved: " + response);
                },
                error: function(xhr, status, error) {
                    console.error("Error saving score: " + error);
                }
            });

            document.querySelector(".quiz-container").innerHTML = `
                <h2>🎉 Quiz Completed! 🎉</h2>
                <p>Your Score: <strong>${score} / ${totalQuestions}</strong></p>
            `;
            document.getElementById("question-counter").style.display = "none";
        }
    });

    loadQuestion();
</script>

</body>
</html>
