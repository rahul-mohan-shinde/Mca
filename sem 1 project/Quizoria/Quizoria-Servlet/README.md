# Quizoria - Java Servlet Application

## Project Overview
This is a Java Servlet-based quiz application converted from PHP. It provides a platform for users to take quizzes on various topics like Java, Android, HTML, and CSS with different difficulty levels (Easy, Medium, Hard).

## Technology Stack
- **Backend**: Java Servlets, JSP
- **Database**: MySQL
- **Frontend**: HTML, CSS, JavaScript
- **Build Tool**: Maven
- **Server**: Tomcat (or any Servlet container)

## Project Structure
```
Quizoria-Servlet/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/quizoria/
│   │   │       ├── dao/          # Data Access Objects
│   │   │       ├── model/        # Model classes (User, Question, Score)
│   │   │       ├── servlet/      # Servlet classes
│   │   │       └── util/         # Utility classes (DatabaseConnection)
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   ├── views/        # JSP pages
│   │       │   └── web.xml       # Web configuration
│   │       ├── css/              # CSS files
│   │       └── assets/           # Images and static resources
├── pom.xml                        # Maven configuration
└── README.md
```

## Setup Instructions

### Prerequisites
1. Java JDK 11 or higher
2. Maven 3.6+
3. MySQL 5.7+ or MariaDB
4. Apache Tomcat 9.0+ or similar Servlet container

### Database Setup
1. Create a MySQL database named `quizoria`
2. Import the SQL file from the original project:
   ```sql
   -- Run the quizoria.sql file to create tables and insert sample data
   ```
3. Update database connection in `DatabaseConnection.java` if needed:
   - Default: localhost:3306/quizoria
   - Username: root
   - Password: (empty)

### Building the Project
```bash
# Navigate to project directory
cd Quizoria-Servlet

# Build the project
mvn clean package

# This will create a WAR file in the target directory
```

### Deployment
1. Copy the `quizoria.war` file from `target/` directory to your Tomcat `webapps/` folder
2. Start Tomcat server
3. Access the application at: `http://localhost:8080/quizoria/`

### Manual Setup (Without Maven)
1. Copy all Java files to `WEB-INF/classes/com/quizoria/`
2. Ensure MySQL JDBC connector is in `WEB-INF/lib/`
3. Deploy to your Servlet container

## Important: Assets Setup
**You need to manually copy the image assets:**
1. Copy all files from `Quizoria/assets/` to `Quizoria-Servlet/src/main/webapp/assets/`
   - android.png
   - css.png
   - html.png
   - java.png
   - profile.png
   - quizoria-logo.png

## Features
- ✅ User Registration and Login
- ✅ Quiz Categories: Java, Android, HTML, CSS
- ✅ Difficulty Levels: Easy, Medium, Hard
- ✅ Score Tracking and User Profiles
- ✅ Admin Panel for Question Management
- ✅ Session Management

## Default Admin Credentials
Check the `quizoria.sql` file for admin credentials. Default examples:
- Email: omthite245@gmail.com
- Password: ommthite

## API Endpoints

### User Endpoints
- `/` - Home page
- `/login` - Login page
- `/signup` - Registration page
- `/logout` - Logout
- `/profile` - User profile
- `/java`, `/android`, `/html`, `/css` - Quiz level selection
- `/quiz/{quizName}-{level}` - Take quiz (e.g., `/quiz/Java-easy`)

### Admin Endpoints
- `/admin/login` - Admin login
- `/admin` - Admin dashboard
- `/admin/logout` - Admin logout
- `/admin/delete-question` - Delete question (POST)

## Troubleshooting

### Database Connection Issues
- Ensure MySQL is running
- Check database credentials in `DatabaseConnection.java`
- Verify database name is `quizoria`

### 404 Errors
- Check if WAR file is deployed correctly
- Verify context path in Tomcat
- Ensure `web.xml` is properly configured

### JSP Not Rendering
- Verify JSP files are in `WEB-INF/views/`
- Check JSP dependencies in `pom.xml`
- Ensure JSP support is enabled in your Servlet container

## Notes
- The application uses plain text passwords (no encryption) - consider adding password hashing for production
- Session timeout is set to 30 minutes
- All SQL queries use PreparedStatements to prevent SQL injection

## License
This project is for educational purposes.

