 <style>
@import url("https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700;800&display=swap");

:root {
  --primary-color: #e79033;
  --primary-color-dark: #f7ebf3;
  --text-dark: #1e293b;
  --text-light: #64748b;
  --extra-light: #fafafa;
  --white: #ffffff;
  --max-width: 1200px;
}

* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
  }

body {
  font-family: "Work Sans", sans-serif;
}
/* Marquee*/
.horizontal-box {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #fcf59e; /* Light background color */
  padding: 20px;
  border-bottom: 2px solid #f14800 ; /* Blue border */
}

.horizontal-box marquee {
  font-weight: bold;
  font-size: 3rem; /* Larger font size */
  color: #f14800; /* Blue color for the title */
  margin: 0; /* Remove default margin */
}


/*Nav Bar*/
.nav_logo {
  display: flex;
  align-items: center;
  gap: 5px;
}

.nav_logo img {
  max-width: 50px;
}


.nav_logo span {
  font-size: 1.25rem;
  color: var(--text-dark);
}

nav {
  max-width: var(--max-width);
  margin: auto;
  padding: 2rem 1rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

nav ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  
}

nav li {
  float: left;
  margin: 2px;
}

nav li a {
  display: block;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  color: var(--text-light);
}

nav li a:hover {
  color: var(--primary-color);
  border: 1px solid;
}

.profile-container {
    position: relative;
    display: inline-block;
}

.profile-img {
    width: 40px;
    height: 40px;
    cursor: pointer;
    border-radius: 50%;
}

.dropdown-menu {
    position: absolute;
    top: 50px; /* Adjust dropdown position */
    right: 0;
    background: white;
    border-radius: 5px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    display: none;
    list-style: none;
    padding: 5px 0;
    z-index: 1000;
}

.dropdown-menu li {
    padding: 10px 20px;
    cursor: pointer;
}

.dropdown-menu li:hover {
    background: #f1f1f1;
}

/* Show dropdown on hover */
.profile-container:hover .dropdown-menu {
    display: block;
}




/*Section*/
/*Grid*/
section {
    background-color: #fcf59e;
    width: 90%;
    margin: 20px auto;
    padding: 20px;
    border-radius: 10px;
}

section .header {
	font-size: 1rem;
    font-weight: 300;
    text-align: center;
    color: var(--text-light);
    letter-spacing: 2px;
  }
  
section .subheader {
    font-size: 3rem;
    font-weight: 300;
    text-align: center;
    color: var(--text-dark);
  }

section .row {
  display: grid;
    grid-template-columns: repeat(2, 1fr); /* 4 columns */
    gap: 20px; /* Space between cards */
    justify-content: center;
}

section .column {
	background-color: white;
    padding: 20px;
    text-align: center;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

section .quizzes-logo {
	padding:1rem;
	height:100px;
}

section .quiz-card {
    padding: 2%
}

section .quiz-card h4 {
    font-size: 1rem;
    font-weight: 600;
    margin-bottom: 1rem;
    color: var(--text-dark);
}
  
section .quiz-card h2 {
    margin-bottom: 1rem;
    font-size: 3.5rem;
    font-weight: 500;
    color: var(--primary-color);
}
  
section .quiz-card h2 sup {
    font-size: 1.5rem;
}
  
section .quiz-card h3 {
    margin-bottom: 1.5rem;
    font-size: 1rem;
    font-weight: 500;
    color: var(--text-light);
}
  
section .quiz-card p {
    margin-bottom: 1.5rem;
    color: var(--text-light);
}

section .quiz_btn {
    padding: 1rem 5rem;
    outline: none;
    border: none;
    font-size: 1rem;
    color: var(--white);
    background-color: var(--primary-color);
    border-radius: 5rem;
    cursor: pointer;
}

section .btn-container {
	text-align: center;
    padding: 1.5rem; /* Adds space below the last element before the button */
}

/*Cards*/

section .cards {
display: grid;
grid-template-columns: repeat(3, 1fr);
grid-auto-rows: auto;
grid-gap: 1rem;
}

section .card {
background-color: white;
border-radius: 4px;
padding: 10%;
}

section .cards h4 {
	text-align:center;
    font-size: 1rem;
    font-weight: 600;
    margin-bottom: 1rem;
    color: var(--text-dark);
}
  
section .cards h2 {
	text-align:center;
    margin-bottom: 1rem;
    font-size: 3.5rem;
    font-weight: 500;
    color: var(--primary-color);
}
  
section .cards h3 {
	text-align:center;
    margin-bottom: 1.5rem;
    font-size: 1rem;
    font-weight: 500;
    color: var(--text-light);
}
  
section .cards p {
	text-align:center;
    margin-bottom: 1.5rem;
    color: var(--text-light);
}

/*About*/
.banner {
	text-align: center;
    padding: 5rem 0;
    background-image: linear-gradient(to right, var(--primary-color), transparent);
    background-position: center center;
    background-size: cover;
    background-repeat: no-repeat;
  }
  
  .banner_container {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 2rem;
    text-align: center;
  }
  
  .banner_card h4 {
    margin-bottom: 1rem;
    font-size: 3rem;
    font-weight: 500;
    color: var(--white);
  }
  
  .banner_card p {
    color: var(--white);
  }

/*Login Page*/





.login-section {  
            display: flex;
            justify-content: center;
            align-items: center;
			padding:5rem;
        }
        
.login-container{
			background-color: white;
			padding: 20px;
	   }
	   
.login-container h2 {
    text-align:center;
    font-size: 2rem;
    font-weight: 600;
    margin-bottom: 1rem;
    color: var(--text-dark);
}
	   
.login-section input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
.login-section button {
            background-color: #e79033;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            cursor: pointer;
            border-radius: 5px;
        }
.login-section button:hover {
            background-color: #d07a2b;
        }
.login-section p {
            margin-top: 1rem;
        }
.login-section a {
            color: #e79033;
            text-decoration: none;
        }
.login-section a:hover {
            text-decoration: underline;
        }

/*Sign-Up Page*/

.signup-section {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 5rem;
}
.signup-container {
    background-color: white;
    padding: 20px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
.signup-container h2 {
    text-align: center;
    font-size: 2rem;
    font-weight: 600;
    margin-bottom: 1rem;
    color: var(--text-dark);
}
.signup-section input,
.signup-section select,
.signup-section textarea {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1rem;
    font-family: "Work Sans", sans-serif;
}

/* Select Dropdown */
.signup-section select {
    background-color: #fff;
    cursor: pointer;
}

/* Textarea Specific Styles */
.signup-section textarea {
    resize: vertical;
    min-height: 100px;
}

/* Hover & Focus Effects */
.signup-section select:hover, 
.signup-section select:focus,
.signup-section textarea:hover, 
.signup-section textarea:focus {
    border-color: var(--primary-color);
    outline: none;
}
.signup-section button {
    background-color: #e79033;
    color: white;
    border: none;
    padding: 10px;
    width: 100%;
    cursor: pointer;
    border-radius: 5px;
}
.signup-section button:hover {
    background-color: #d07a2b;
}
.signup-section p {
    margin-top: 1rem;
}
.signup-section a {
    color: #e79033;
    text-decoration: none;
}
.signup-section a:hover {
    text-decoration: underline;
}

/*Admin Page*/
.admin-page * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

.admin-page body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f4f4f9;
}

.admin-page .abovecontainer {
    margin: 2.5rem;
}

.admin-page .admin-container {
    margin: auto;
    justify-content: center;
    display: flex;
    width: 80%;
    height: 80vh;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    overflow: hidden;
}

/* Sidebar */
.admin-page .sidebar {
    width: 25%;
    background-color: #fcf59e;
    color: black;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 20px;
}

.admin-page .sidebar .logo img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    margin-bottom: 20px;
}

.admin-page .sidebar nav ul {
    list-style-type: none;
    width: 100%;
}

.admin-page .sidebar nav ul li {
    text-align: center;
    margin: 10px 0;
}

.admin-page .sidebar nav ul li a {
    color: black;
    text-decoration: none;
    font-size: 18px;
    display: block;
    text-align: center;
    padding: 10px;
    border-radius: 5px;
    transition: background-color 0.3s ease;
    cursor: pointer;
}

.admin-page .sidebar nav ul li a:hover {
    background-color: #34495e;
    color: white;
}

/* Content Area */
.admin-page .admin-content {
    width: 75%;
    padding: 20px;
    background-color: #ecf0f1;
	overflow-y: auto;
}

.admin-page .admin-header {
    text-align: center;
    margin-bottom: 30px;
}

.admin-page .add-question,
.admin-page .view-delete-question {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    display: none; /* Hidden by default */
}

.admin-page .add-question.active,
.admin-page .view-delete-question.active {
    display: block; /* Show when active */
}

/* Form Styles */
.admin-page form {
    width: 100%;
}

.admin-page label {
    font-weight: bold;
    display: block;
    margin: 10px 0 5px;
}

.admin-page input,
.admin-page select,
.admin-page textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1rem;
}

.admin-page select {
    background-color: #fff;
    cursor: pointer;
}

.admin-page textarea {
    resize: vertical;
    min-height: 100px;
}

.admin-page button {
    background-color: #e79033;
    color: white;
    border: none;
    padding: 10px;
    width: 100%;
    cursor: pointer;
    border-radius: 5px;
    margin-top: 10px;
}

.admin-page button:hover {
    background-color: #d07a2b;
}

/* Table Styles */
.admin-page table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.admin-page table, .admin-page th, .admin-page td {
    border: 1px solid black;
}

.admin-page th, .admin-page td {
    padding: 10px;
    text-align: left;
}

.admin-page th {
    background-color: #34495e;
    color: white;
}
.quizzes, .add-question, .view-questions {
    display: none;
}

.quizzes.active, .add-question.active, .view-questions.active {
    display: block;
}

.question-cards {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            margin-top: 20px;
        }
        .question-card {
            background: #f9f9f9;
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 8px;
            width: 100%;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        .question-card button {
            display: inline-block;
			width:10%;
            margin-top: 10px;
            padding: 8px 12px;
            background-color: red;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .question-card button:hover {
            background-color: darkred;
        }


/*Profile Page*/

/* Profile Page Specific Styles */
.profile-page * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

.profile-page body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f4f4f9;
}

.profile-page .abovecontainer {
	margin: 2.5rem;
}


.profile-page .container {
	margin: auto;
	justify-content: center;
    display: flex;
    width: 80%;
    height: 80vh;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    overflow: hidden;
}

.profile-page .sidebar {
    width: 25%;
    background-color: #fcf59e;
    color: black;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 20px;
}

.profile-page .sidebar .logo img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    margin-bottom: 20px;
}

.profile-page .sidebar nav ul {
    list-style-type: none;
    width: 100%;
}

.profile-page .sidebar nav ul li {
	text-align:center;
    margin: 10px 0;
}

.profile-page .sidebar nav ul li a {
    color: black;
    text-decoration: none;
    font-size: 18px;
    display: block;
    text-align: center;
    padding: 10px;
    border-radius: 5px;
    transition: background-color 0.3s ease;
    cursor: pointer;
}

.profile-page .sidebar nav ul li a:hover {
    background-color: #34495e;
    color: white;
}

.profile-page .profile-content {
    width: 75%;
    padding: 20px;
    background-color: #ecf0f1;
}

.profile-page .profile-header {
    text-align: center;
    margin-bottom: 30px;
}

.profile-page .personal-info,
.profile-page .quiz-info {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    display: none; /* Hidden by default */
}

.profile-page .personal-info.active,
.profile-page .quiz-info.active {
    display: block; /* Show when active */
}

.profile-page .personal-info h3,
.profile-page .quiz-info h3 {
    margin-bottom: 20px;
    font-size: 20px;
    color: #2c3e50;
}

.profile-page .personal-info p {
    margin-bottom: 10px;
    font-size: 16px;
}

.profile-page .personal-info p strong {
    font-weight: bold;
}

.profile-page table {
    width: 100%;
    border-collapse: collapse;
}

.profile-page table,
.profile-page th,
.profile-page td {
    border: 1px solid black;
}

.profile-page th,
.profile-page td {
    padding: 10px;
    text-align: left;
}

/*Quiz Section*/

.quiz-section {
  width: 80%;
  margin: 20px auto;
  background: #fcf59e;
  padding: 20px;
  border-radius: 10px;
  text-align: center;
}

#quiz-title {
  font-size: 1.8rem;
  font-weight: bold;
}

#question-counter {
  font-size: 1.2rem;
  color: #333;
  margin-bottom: 10px;
}

.quiz-container {
  background: #ddd;
  margin: 10px;
  padding: 20px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.quiz-container .question {
  font-size: 1.5rem;
  font-weight: bold;
  margin-bottom: 15px;
}

/* Options in 4 rows */
.options {
  display: flex;
  flex-direction: column; /* Each option in a new row */
  gap: 10px;
}

.option {
  background: #ddd;
  border: none;
  padding: 10px;
  font-size: 1.2rem;
  cursor: pointer;
  width: 100%;
  text-align: left;
  display: flex;
  align-items: center;
  gap: 10px;
  transition: 0.3s;
  border-radius: 5px;
}

/* Style for radio buttons */
.option input {
  cursor: pointer;
  transform: scale(1.2);
}

/* When hovering over an option */
.option:hover {
  background: #bbb;
}

/* Feedback message */
.feedback {
  font-size: 1.2rem;
  margin-top: 10px;
}

/* Next Button */
.next-btn {
  margin-top: 15px;
  padding: 10px 20px;
  font-size: 1.2rem;
  background-color: #ff8c00;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  display: none;
}

.next-btn:hover {
  background-color: #d07a2b;
}




/*Footer CSS*/

footer {
    background-color: var(--primary-color);
    size: 200px;
    margin-top: 5rem;
	margin-bottom: 0;
}

footer img{
	width: 100px;
}  
  
footer .footer-logo{
    font-size: 1.5rem;
    font-weight: 400;
    color: var(--white);
  }
  
footer .container {
	max-width: var(--max-width);
    margin: auto;
    padding: 2rem 1rem;
    display: grid;
    grid-template-columns: 1fr 2fr 1fr;
    gap: 2rem;
}

footer .col p {
    font-size: 1.25rem;
    color: var(--white);
    text-align: center;
}

footer .socials {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    gap: 1rem;
}
  
footer .socials a {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 50px;
    aspect-ratio: 1;
    font-size: 1.5rem;
    color: var(--white);
    background-color: #f7ebf330;
    border-radius: 100%;
}

footer .bar {
    font-size: 0.9rem;
	padding:2%;
    color: var(--white);
    text-align: center;
  }
    </style>
<footer class="footer" id="contact">
    <div class="container">
        <div class="col">
            <div class="footer-logo">
                <img src="${pageContext.request.contextPath}/assets/quizoria-logo.png" alt="Quizoria Logo" />
                <br>Quizoria
            </div>
        </div>
        <div class="col">
            <p>
                <strong>Contact Us:</strong> 020 9984 9984 <br>
                <strong>Email:</strong> quizoria@gmail.com <br>
                <strong>Address:</strong> Sita Apartment, Pradhikaran, <br>
                PCMC, Pune
            </p>
        </div>
        <div class="col">
            <div class="socials">
                <a href="https://twitter.com/" target="_blank" rel="noopener noreferrer"><i class="ri-twitter-fill"></i></a>
                <a href="https://www.facebook.com/" target="_blank" rel="noopener noreferrer"><i class="ri-facebook-fill"></i></a>
                <a href="https://www.instagram.com/" target="_blank" rel="noopener noreferrer"><i class="ri-instagram-line"></i></a>
            </div>
        </div>
    </div>
    <div class="bar">
        Thank you! Visit again.
    </div>
</footer>

