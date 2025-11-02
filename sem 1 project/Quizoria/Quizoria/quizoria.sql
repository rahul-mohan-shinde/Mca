-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2025 at 06:32 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizoria`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`) VALUES
(1, 'Om Thite', 'omthite245@gmail.com', 'ommthite'),
(2, 'Shreya Chaudhari', 'shreyachaudhari269@gmail.com', 'shreyachaudhari269');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `quiz_name` varchar(50) NOT NULL,
  `quiz_level` text NOT NULL,
  `question` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_answer` enum('option_a','option_b','option_c','option_d') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `timestamp`, `quiz_name`, `quiz_level`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`) VALUES
(1, '2025-03-24 17:00:31', 'CSS', 'Easy', 'What does CSS stand for?', 'Cascading Style Sheets', 'Creative Style Sheets', 'Computer Style Sheets', 'Custom Style Sheets', 'option_a'),
(2, '2025-03-24 17:00:31', 'CSS', 'Easy', 'Which CSS property is used to set the color of text?', 'color', 'background-color', 'font-size', 'font-style', 'option_a'),
(3, '2025-03-24 17:00:31', 'CSS', 'Easy', 'What is the purpose of the \"margin\" property in CSS?', 'Set the padding of an element', 'Set the border of an element', 'Set the space around an element', 'Set the width of an element', 'option_c'),
(4, '2025-03-24 17:00:31', 'CSS', 'Easy', 'Which CSS property is used to set the font size of text?', 'font-size', 'font-style', 'font-weight', 'font-family', 'option_a'),
(5, '2025-03-24 17:00:31', 'CSS', 'Easy', 'What is the purpose of the \"background-image\" property in CSS?', 'Set the background color of an element', 'Set the background image of an element', 'Set the border of an element', 'Set the padding of an element', 'option_b'),
(6, '2025-03-24 17:00:31', 'CSS', 'Easy', 'Which CSS property is used to set the width of an element?', 'width', 'height', 'margin', 'padding', 'option_a'),
(7, '2025-03-24 17:00:31', 'CSS', 'Easy', 'What is the purpose of the \"text-align\" property in CSS?', 'Set the alignment of text', 'Set the color of text', 'Set the font size of text', 'Set the font style of text', 'option_a'),
(8, '2025-03-24 17:00:31', 'CSS', 'Easy', 'Which CSS property is used to set the border of an element?', 'border', 'margin', 'padding', 'outline', 'option_a'),
(9, '2025-03-24 17:00:31', 'CSS', 'Easy', 'What is the purpose of the \"padding\" property in CSS?', 'Set the space around an element', 'Set the space inside an element', 'Set the border of an element', 'Set the width of an element', 'option_b'),
(10, '2025-03-24 17:00:31', 'CSS', 'Easy', 'Which CSS property is used to set the height of an element?', 'width', 'height', 'margin', 'padding', 'option_b'),
(11, '2025-03-24 17:01:38', 'CSS', 'Medium', 'What is the purpose of the \"box-sizing\" property in CSS?', 'Set the width and height of an element', 'Set the padding and border of an element', 'Include padding and border in an element\'s width and height', 'Exclude padding and border from an element\'s width and height', 'option_c'),
(12, '2025-03-24 17:01:38', 'CSS', 'Medium', 'Which CSS selector is used to select all elements with a specific class?', '.class', '#id', 'element', '*', 'option_a'),
(13, '2025-03-24 17:01:38', 'CSS', 'Medium', 'What is the purpose of the \"position\" property in CSS?', 'Set the position of an element relative to its parent', 'Set the position of an element relative to the viewport', 'Set the position of an element relative to the document', 'Set the display property of an element', 'option_a'),
(14, '2025-03-24 17:01:38', 'CSS', 'Medium', 'Which CSS property is used to set the transparency of an element?', 'opacity', 'transparency', 'visibility', 'display', 'option_a'),
(15, '2025-03-24 17:01:38', 'CSS', 'Medium', 'What is the purpose of the \"float\" property in CSS?', 'Set the position of an element relative to its parent', 'Set the position of an element relative to the viewport', 'Allow an element to be placed to the left or right of its parent', 'Set the display property of an element', 'option_c'),
(16, '2025-03-24 17:01:38', 'CSS', 'Medium', 'Which CSS selector is used to select all elements that are descendants of a specific element?', 'element >', 'element ~', 'element +', 'element', 'option_d'),
(17, '2025-03-24 17:01:38', 'CSS', 'Medium', 'What is the purpose of the \"z-index\" property in CSS?', 'Set the position of an element relative to its parent', 'Set the position of an element relative to the viewport', 'Set the stacking order of an element', 'Set the display property of an element', 'option_c'),
(18, '2025-03-24 17:01:38', 'CSS', 'Medium', 'Which CSS property is used to set the cursor shape?', 'cursor', 'pointer', 'hand', 'mouse', 'option_a'),
(19, '2025-03-24 17:01:38', 'CSS', 'Medium', 'What is the purpose of the \"overflow\" property in CSS?', 'Set the position of an element relative to its parent', 'Set the position of an element relative to the viewport', 'Control the visibility of content that overflows an element', 'Set the display property of an element', 'option_c'),
(20, '2025-03-24 17:01:38', 'CSS', 'Medium', 'Which CSS selector is used to select all elements that are siblings of a specific element?', 'element ~', 'element +', 'element >', 'element', 'option_a'),
(21, '2025-03-24 17:02:21', 'CSS', 'Hard', 'What is the purpose of the \":nth-child\" pseudo-class in CSS?', 'Select every nth child element', 'Select every nth parent element', 'Select every nth sibling element', 'Select every nth ancestor element', 'option_a'),
(22, '2025-03-24 17:02:21', 'CSS', 'Hard', 'Which CSS property is used to set the opacity of an element\'s background?', 'background-opacity', 'opacity', 'background-alpha', 'rgba', 'option_d'),
(23, '2025-03-24 17:02:21', 'CSS', 'Hard', 'What is the purpose of the \"transform\" property in CSS?', 'Change the layout of an element', 'Change the appearance of an element', 'Rotate, scale, or translate an element', 'Animate an element', 'option_c'),
(24, '2025-03-24 17:02:21', 'CSS', 'Hard', 'Which CSS property is used to set the shape of a float element?', 'float-shape', 'shape-outside', 'float-radius', 'border-radius', 'option_b'),
(25, '2025-03-24 17:02:21', 'CSS', 'Hard', 'What is the purpose of the \":checked\" pseudo-class in CSS?', 'Select checked radio buttons', 'Select checked checkboxes', 'Select all checked form elements', 'Select all form elements', 'option_c'),
(26, '2025-03-24 17:02:21', 'CSS', 'Hard', 'Which CSS property is used to set the direction of a flexbox layout?', 'flex-direction', 'flex-wrap', 'justify-content', 'align-items', 'option_a'),
(27, '2025-03-24 17:02:21', 'CSS', 'Hard', 'What is the purpose of the \"calc\" function in CSS?', 'Perform arithmetic operations on values', 'Perform logical operations on values', 'Perform string operations on values', 'Perform bitwise operations on values', 'option_a'),
(28, '2025-03-24 17:02:21', 'CSS', 'Hard', 'Which CSS property is used to set the grid template areas?', 'grid-template-areas', 'grid-template-columns', 'grid-template-rows', 'grid-auto-flow', 'option_a'),
(29, '2025-03-24 17:02:21', 'CSS', 'Hard', 'What is the purpose of the \":not\" pseudo-class in CSS?', 'Select elements that do not match a selector', 'Select elements that match a selector', 'Select all elements', 'Select no elements', 'option_a'),
(30, '2025-03-24 17:02:21', 'CSS', 'Hard', 'Which CSS property is used to set the animation delay?', 'animation-delay', 'animation-duration', 'animation-timing-function', 'animation-iteration-count', 'option_a'),
(31, '2025-03-24 17:06:04', 'HTML', 'Easy', 'What is the basic structure of an HTML document?', '<html> <head> <body>', '<html> <body> <head>', '<head> <html> <body>', '<body> <head> <html>', 'option_a'),
(32, '2025-03-24 17:06:04', 'HTML', 'Easy', 'What HTML tag is used for headings?', '<p>', '<h1>', '<b>', '<i>', 'option_b'),
(33, '2025-03-24 17:06:04', 'HTML', 'Easy', 'What is the purpose of the <a> tag in HTML?', 'Create a link', 'Display an image', 'Play audio', 'Create a table', 'option_a'),
(34, '2025-03-24 17:06:04', 'HTML', 'Easy', 'What HTML tag is used for paragraphs?', '<p>', '<h1>', '<b>', '<i>', 'option_a'),
(35, '2025-03-24 17:06:04', 'HTML', 'Easy', 'What is the purpose of the <img> tag in HTML?', 'Display text', 'Display an image', 'Create a link', 'Play audio', 'option_b'),
(36, '2025-03-24 17:06:04', 'HTML', 'Easy', 'What HTML tag is used for unordered lists?', '<ol>', '<ul>', '<li>', '<dl>', 'option_b'),
(37, '2025-03-24 17:06:04', 'HTML', 'Easy', 'What is the purpose of the <table> tag in HTML?', 'Create a list', 'Display an image', 'Create a table', 'Play audio', 'option_c'),
(38, '2025-03-24 17:06:04', 'HTML', 'Easy', 'What HTML tag is used for bold text?', '<b>', '<i>', '<u>', '<s>', 'option_a'),
(39, '2025-03-24 17:06:04', 'HTML', 'Easy', 'What is the purpose of the <form> tag in HTML?', 'Create a link', 'Display an image', 'Create a form', 'Play audio', 'option_c'),
(40, '2025-03-24 17:06:04', 'HTML', 'Easy', 'What is the purpose of the <title> tag in HTML?', 'Display text on the page', 'Create a link', 'Set the title of the page', 'Display an image', 'option_c'),
(41, '2025-03-24 17:06:41', 'HTML', 'Medium', 'What is the purpose of the \"alt\" attribute in HTML?', 'Specify link URL', 'Provide image description', 'Set font size', 'Define table border', 'option_b'),
(42, '2025-03-24 17:06:41', 'HTML', 'Medium', 'Which HTML tag is used to define a table row?', '<tr>', '<td>', '<th>', '<table>', 'option_a'),
(43, '2025-03-24 17:06:41', 'HTML', 'Medium', 'What is the purpose of the \"label\" tag in HTML?', 'Create a text input field', 'Create a checkbox', 'Associate text with a form element', 'Create a dropdown list', 'option_c'),
(44, '2025-03-24 17:06:41', 'HTML', 'Medium', 'Which HTML attribute is used to specify the character encoding of a document?', 'charset', 'encoding', 'lang', 'type', 'option_a'),
(45, '2025-03-24 17:06:41', 'HTML', 'Medium', 'What is the purpose of the \"fieldset\" tag in HTML?', 'Create a dropdown list', 'Create a checkbox', 'Group related form elements', 'Create a text input field', 'option_c'),
(46, '2025-03-24 17:06:41', 'HTML', 'Medium', 'Which HTML tag is used to define a table header cell?', '<th>', '<td>', '<tr>', '<table>', 'option_a'),
(47, '2025-03-24 17:06:41', 'HTML', 'Medium', 'What is the purpose of the \"placeholder\" attribute in HTML?', 'Specify the default value of a form field', 'Provide a hint to the user about the expected input', 'Set the font size of a form field', 'Define the border of a form field', 'option_b'),
(48, '2025-03-24 17:06:41', 'HTML', 'Medium', 'Which HTML attribute is used to specify the width of a table?', 'width', 'height', 'border', 'cellpadding', 'option_a'),
(49, '2025-03-24 17:06:41', 'HTML', 'Medium', 'What is the purpose of the \"optgroup\" tag in HTML?', 'Create a dropdown list', 'Create a checkbox', 'Group related options in a dropdown list', 'Create a text input field', 'option_c'),
(50, '2025-03-24 17:06:41', 'HTML', 'Medium', 'Which HTML attribute is used to specify the language of a document?', 'lang', 'charset', 'encoding', 'type', 'option_a'),
(51, '2025-03-24 17:07:47', 'HTML', 'Hard', 'What is the purpose of the \"microdata\" attribute in HTML?', 'Define semantic meaning of content', 'Specify the character encoding of a document', 'Group related form elements', 'Create a dropdown list', 'option_a'),
(52, '2025-03-24 17:07:47', 'HTML', 'Hard', 'Which HTML element is used to define a scalar value?', '<data>', '<meter>', '<time>', '<output>', 'option_b'),
(53, '2025-03-24 17:07:47', 'HTML', 'Hard', 'What is the purpose of the \"sandbox\" attribute in HTML?', 'Enable scripting for an iframe', 'Disable scripting for an iframe', 'Specify the character encoding of a document', 'Group related form elements', 'option_b'),
(54, '2025-03-24 17:07:47', 'HTML', 'Hard', 'Which HTML element is used to define a self-contained piece of content?', '<article>', '<section>', '<aside>', '<nav>', 'option_a'),
(55, '2025-03-24 17:07:47', 'HTML', 'Hard', 'What is the purpose of the \"spellcheck\" attribute in HTML?', 'Enable spell checking for a form field', 'Disable spell checking for a form field', 'Specify the character encoding of a document', 'Group related form elements', 'option_a'),
(56, '2025-03-24 17:07:47', 'HTML', 'Hard', 'Which HTML element is used to define a piece of content that is only tangentially related to the main content?', '<aside>', '<nav>', '<section>', '<article>', 'option_a'),
(57, '2025-03-24 17:07:47', 'HTML', 'Hard', 'What is the purpose of the \"draggable\" attribute in HTML?', 'Make an element draggable', 'Make an element droppable', 'Specify the character encoding of a document', 'Group related form elements', 'option_a'),
(58, '2025-03-24 17:07:47', 'HTML', 'Hard', 'Which HTML element is used to define a piece of content that represents a self-contained unit of content?', '<section>', '<article>', '<aside>', '<nav>', 'option_b'),
(59, '2025-03-24 17:07:47', 'HTML', 'Hard', 'What is the purpose of the \"hidden\" attribute in HTML?', 'Hide an element from view', 'Make an element visible', 'Specify the character encoding of a document', 'Group related form elements', 'option_a'),
(60, '2025-03-24 17:07:47', 'HTML', 'Hard', 'Which HTML element is used to define a piece of content that represents a set of navigational links?', '<nav>', '<aside>', '<section>', '<article>', 'option_a'),
(61, '2025-03-24 17:08:26', 'Android', 'Easy', 'What is the basic building block of an Android app?', 'Activity', 'Service', 'Broadcast', 'Content Provider', 'option_a'),
(62, '2025-03-24 17:08:26', 'Android', 'Easy', 'Which Android API is used for user interface design?', 'Android SDK', 'Android NDK', 'Android API', 'Android UI', 'option_a'),
(63, '2025-03-24 17:08:26', 'Android', 'Easy', 'What is the purpose of the AndroidManifest.xml file?', 'Declare app components', 'Define app layout', 'Store app data', 'Handle app errors', 'option_a'),
(64, '2025-03-24 17:08:26', 'Android', 'Easy', 'Which Android layout is used for linear arrangements?', 'LinearLayout', 'RelativeLayout', 'FrameLayout', 'GridLayout', 'option_a'),
(65, '2025-03-24 17:08:26', 'Android', 'Easy', 'What is the purpose of the onCreate() method in Android?', 'Initialize app components', 'Handle user input', 'Update app data', 'Close app resources', 'option_a'),
(66, '2025-03-24 17:08:26', 'Android', 'Easy', 'Which Android widget is used for displaying text?', 'Button', 'TextView', 'EditText', 'ListView', 'option_b'),
(67, '2025-03-24 17:08:26', 'Android', 'Easy', 'What is the purpose of the Intent class in Android?', 'Start new activities', 'Handle user input', 'Update app data', 'Close app resources', 'option_a'),
(68, '2025-03-24 17:08:26', 'Android', 'Easy', 'Which Android API is used for storing and retrieving data?', 'SQLite', 'Firebase', 'Realm', 'All of the above', 'option_d'),
(69, '2025-03-24 17:08:26', 'Android', 'Easy', 'What is the purpose of the Log class in Android?', 'Handle app errors', 'Debug app code', 'Update app data', 'Close app resources', 'option_b'),
(70, '2025-03-24 17:08:26', 'Android', 'Easy', 'Which Android component is used for background tasks?', 'Activity', 'Service', 'Broadcast', 'Content Provider', 'option_b'),
(71, '2025-03-24 17:08:57', 'Android', 'Medium', 'What is the purpose of the onDestroy() method in Android?', 'Initialize app components', 'Release system resources', 'Handle user input', 'Update app data', 'option_b'),
(72, '2025-03-24 17:08:57', 'Android', 'Medium', 'Which Android layout is used for complex layouts?', 'LinearLayout', 'RelativeLayout', 'FrameLayout', 'ConstraintLayout', 'option_d'),
(73, '2025-03-24 17:08:57', 'Android', 'Medium', 'What is the purpose of the Bundle class in Android?', 'Store app data', 'Pass data between activities', 'Handle app errors', 'Update app UI', 'option_b'),
(74, '2025-03-24 17:08:57', 'Android', 'Medium', 'Which Android API is used for networking?', 'Volley', 'Retrofit', 'OkHttp', 'All of the above', 'option_d'),
(75, '2025-03-24 17:08:57', 'Android', 'Medium', 'What is the purpose of the AsyncTask class in Android?', 'Perform background tasks', 'Handle user input', 'Update app UI', 'Store app data', 'option_a'),
(76, '2025-03-24 17:08:57', 'Android', 'Medium', 'Which Android component is used for handling system events?', 'Activity', 'Service', 'Broadcast Receiver', 'Content Provider', 'option_c'),
(77, '2025-03-24 17:08:57', 'Android', 'Medium', 'What is the purpose of the SharedPreferences class in Android?', 'Store app data', 'Pass data between activities', 'Handle app errors', 'Update app UI', 'option_a'),
(78, '2025-03-24 17:08:57', 'Android', 'Medium', 'Which Android layout is used for scrolling content?', 'ScrollView', 'ListView', 'RecyclerView', 'GridView', 'option_a'),
(79, '2025-03-24 17:08:57', 'Android', 'Medium', 'What is the purpose of the Fragment class in Android?', 'Represent a UI component', 'Handle app errors', 'Update app UI', 'Store app data', 'option_a'),
(80, '2025-03-24 17:08:57', 'Android', 'Medium', 'Which Android API is used for location-based services?', 'Google Maps API', 'Location API', 'Geolocation API', 'All of the above', 'option_d'),
(81, '2025-03-24 17:09:27', 'Android', 'Hard', 'What is the purpose of the \"android:transformPivotX\" attribute?', 'Rotate views', 'Scale views', 'Translate views', 'Pivot views', 'option_d'),
(82, '2025-03-24 17:09:27', 'Android', 'Hard', 'Which Android API is used for advanced graphics rendering?', 'OpenGL ES', 'RenderScript', 'Vulkan', 'All of the above', 'option_d'),
(83, '2025-03-24 17:09:27', 'Android', 'Hard', 'What is the purpose of the \"android:windowSoftInputMode\" attribute?', 'Control keyboard behavior', 'Control screen orientation', 'Control window layout', 'Control notification behavior', 'option_a'),
(84, '2025-03-24 17:09:27', 'Android', 'Hard', 'Which Android component is used for handling complex data processing?', 'Service', 'IntentService', 'JobService', 'ContentProvider', 'option_c'),
(85, '2025-03-24 17:09:27', 'Android', 'Hard', 'What is the purpose of the \"android:hardwareAccelerated\" attribute?', 'Enable hardware acceleration', 'Disable hardware acceleration', 'Control screen orientation', 'Control window layout', 'option_a'),
(86, '2025-03-24 17:09:27', 'Android', 'Hard', 'Which Android API is used for advanced networking?', 'OkHttp', 'Retrofit', 'Volley', 'Android Networking API', 'option_d'),
(87, '2025-03-24 17:09:27', 'Android', 'Hard', 'What is the purpose of the \"android:largeHeap\" attribute?', 'Request large heap size', 'Request small heap size', 'Control screen orientation', 'Control window layout', 'option_a'),
(88, '2025-03-24 17:09:27', 'Android', 'Hard', 'Which Android component is used for handling push notifications?', 'BroadcastReceiver', 'Service', 'FirebaseMessagingService', 'All of the above', 'option_d'),
(89, '2025-03-24 17:09:27', 'Android', 'Hard', 'What is the purpose of the \"android:directBootAware\" attribute?', 'Enable direct boot awareness', 'Disable direct boot awareness', 'Control screen orientation', 'Control window layout', 'option_a'),
(90, '2025-03-24 17:09:27', 'Android', 'Hard', 'Which Android API is used for advanced machine learning?', 'TensorFlow Lite', 'Android Neural Networks API', 'ML Kit', 'All of the above', 'option_d'),
(91, '2025-03-24 17:10:01', 'Java', 'Easy', 'What is the extension of a Java source file?', '.java', '.class', '.jar', '.exe', 'option_a'),
(92, '2025-03-24 17:10:01', 'Java', 'Easy', 'Which of the following is a basic data type in Java?', 'String', 'Array', 'int', 'Class', 'option_c'),
(93, '2025-03-24 17:10:01', 'Java', 'Easy', 'What is the purpose of the \'public static void main\' method in Java?', 'To declare variables', 'To define a class', 'To start the execution of a Java program', 'To import libraries', 'option_c'),
(94, '2025-03-24 17:10:01', 'Java', 'Easy', 'Which of the following is a valid Java variable name?', '123abc', 'abc123', 'abc$', 'abc!', 'option_b'),
(95, '2025-03-24 17:10:01', 'Java', 'Easy', 'What is the syntax to print \"Hello, World!\" in Java?', 'System.out.println(\"Hello, World!\");', 'System.out.print(\"Hello, World!\");', 'Console.println(\"Hello, World!\");', 'Print.println(\"Hello, World!\");', 'option_a'),
(96, '2025-03-24 17:10:01', 'Java', 'Easy', 'Which of the following Java operators is used for addition?', '+', '-', '*', '/', 'option_a'),
(97, '2025-03-24 17:10:01', 'Java', 'Easy', 'What is the purpose of the \'import\' statement in Java?', 'To create a new class', 'To import libraries and packages', 'To declare variables', 'To define methods', 'option_b'),
(98, '2025-03-24 17:10:01', 'Java', 'Easy', 'Which of the following is a type of Java comment?', 'Single-line comment', 'Multi-line comment', 'Javadoc comment', 'All of the above', 'option_d'),
(99, '2025-03-24 17:10:01', 'Java', 'Easy', 'What is the purpose of the \'System.out.println()\' method in Java?', 'To read input from the user', 'To print output to the console', 'To declare variables', 'To define methods', 'option_b'),
(100, '2025-03-24 17:10:01', 'Java', 'Easy', 'Which of the following is a basic Java data type?', 'Boolean', 'Char', 'Double', 'All of the above', 'option_d'),
(101, '2025-03-24 17:10:30', 'Java', 'Medium', 'What is the purpose of the \"break\" statement in Java?', 'Exit loop', 'Skip iteration', 'Continue loop', 'Return value', 'option_a'),
(102, '2025-03-24 17:10:30', 'Java', 'Medium', 'Which Java collection is an ordered collection?', 'Set', 'List', 'Map', 'Queue', 'option_b'),
(103, '2025-03-24 17:10:30', 'Java', 'Medium', 'What is the purpose of the \"super\" keyword in Java?', 'Call parent constructor', 'Access parent method', 'Override parent method', 'Hide parent field', 'option_a'),
(104, '2025-03-24 17:10:30', 'Java', 'Medium', 'Which Java statement is used to throw an exception?', 'throw', 'throws', 'try', 'catch', 'option_a'),
(105, '2025-03-24 17:10:30', 'Java', 'Medium', 'What is the purpose of the \"finally\" block in Java?', 'Handle exceptions', 'Release resources', 'Return values', 'Exit loops', 'option_b'),
(106, '2025-03-24 17:10:30', 'Java', 'Medium', 'Which Java method is used to convert a string to an integer?', 'parseInt()', 'parseDouble()', 'parseBoolean()', 'parseLong()', 'option_a'),
(107, '2025-03-24 17:10:30', 'Java', 'Medium', 'What is the purpose of the \"abstract\" keyword in Java?', 'Declare abstract class', 'Declare abstract method', 'Declare interface', 'Declare enum', 'option_a'),
(108, '2025-03-24 17:10:30', 'Java', 'Medium', 'Which Java collection is a key-value pair collection?', 'List', 'Set', 'Map', 'Queue', 'option_c'),
(109, '2025-03-24 17:10:30', 'Java', 'Medium', 'What is the purpose of the \"static\" keyword in Java?', 'Declare static method', 'Declare static variable', 'Declare static class', 'All of the above', 'option_d'),
(110, '2025-03-24 17:10:30', 'Java', 'Medium', 'Which Java statement is used to declare an array?', 'int[] arr;', 'int arr[];', 'int arr;', 'int[] arr = new int[5];', 'option_a'),
(111, '2025-03-24 17:10:58', 'Java', 'Hard', 'What is the purpose of the \"ClassLoader\" in Java?', 'Load classes', 'Initialize objects', 'Handle exceptions', 'Manage memory', 'option_a'),
(112, '2025-03-24 17:10:58', 'Java', 'Hard', 'Which Java concept allows multiple threads to access shared resources?', 'Synchronization', 'Serialization', 'Cloning', 'Reflection', 'option_a'),
(113, '2025-03-24 17:10:58', 'Java', 'Hard', 'What is the difference between \"HashMap\" and \"Hashtable\" in Java?', 'Synchronization', 'Performance', 'Data structure', 'All of the above', 'option_d'),
(114, '2025-03-24 17:10:58', 'Java', 'Hard', 'Which Java design pattern allows objects to be notified of changes?', 'Observer', 'Singleton', 'Factory', 'Builder', 'option_a'),
(115, '2025-03-24 17:10:58', 'Java', 'Hard', 'What is the purpose of the \"wait()\" method in Java?', 'Wait for notification', 'Notify other threads', 'Sleep for a duration', 'Yield control', 'option_a'),
(116, '2025-03-24 17:10:58', 'Java', 'Hard', 'Which Java concept allows objects to be serialized?', 'Serializable', 'Cloneable', 'Comparable', 'Runnable', 'option_a'),
(117, '2025-03-24 17:10:58', 'Java', 'Hard', 'What is the difference between \"===\" and \".equals()\" in Java?', 'Reference equality', 'Value equality', 'Object equality', 'Primitive equality', 'option_a'),
(118, '2025-03-24 17:10:58', 'Java', 'Hard', 'Which Java design pattern allows objects to be created without specifying the class?', 'Factory', 'Builder', 'Singleton', 'Prototype', 'option_a'),
(119, '2025-03-24 17:10:58', 'Java', 'Hard', 'What is the purpose of the \"notifyAll()\" method in Java?', 'Notify all waiting threads', 'Notify a single waiting thread', 'Wait for notification', 'Sleep for a duration', 'option_a'),
(120, '2025-03-24 17:10:58', 'Java', 'Hard', 'Which Java concept allows objects to be executed in parallel?', 'Multithreading', 'Multiprocessing', 'Synchronization', 'Serialization', 'option_a'),
(124, '2025-03-25 06:30:59', 'Java', 'Easy', 'questions ', 'a', 'B', 'C', 'D', 'option_a');

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `id` int(11) NOT NULL,
  `date_taken` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `quiz_name` varchar(255) NOT NULL,
  `quiz_level` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `total_questions` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`id`, `date_taken`, `user_id`, `quiz_name`, `quiz_level`, `score`, `total_questions`) VALUES
(11, '2025-03-24 17:11:55', 1, 'Java', 'Easy', 2, 10),
(12, '2025-03-24 17:21:32', 1, 'Java', 'Medium', 1, 10),
(13, '2025-03-24 17:50:33', 4, 'Java', 'Easy', 2, 10),
(14, '2025-03-24 18:20:00', 1, 'Java', 'Hard', 0, 10),
(15, '2025-03-24 18:20:06', 6, 'HTML', 'Easy', 2, 10),
(16, '2025-03-24 18:24:31', 6, 'HTML', 'Easy', 4, 10),
(17, '2025-03-24 18:26:54', 6, 'HTML', 'Easy', 2, 10),
(18, '2025-03-25 06:47:26', 7, 'Java', 'Easy', 6, 11),
(19, '2025-03-26 06:12:47', 4, 'Java', 'Medium', 2, 10),
(20, '2025-04-01 06:08:51', 8, 'Java', 'Easy', 3, 11);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`) VALUES
(1, 'Om Thite', 'omthite245@gmail.com', '9011010903', '123'),
(3, 'admin', 'om@hd.j', '9087654321', '123'),
(4, 'Shreya', 'shreyachaudhari269@gmail.com', '9087654321', '123'),
(5, 'Shravani Kulkarni', 'shravanikulkarni@gmail.com', '09087654321', 'shrav'),
(6, 'siya shinde', 'siya@gmail.com', '90875347889', '123'),
(7, 'Shravni Kulkarni', 'shravanikulkarni08@gmail.com', '9975505327', '12345678'),
(8, 'saara', 'saara29@gmail.com', '09834039719', 'Saara@123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
