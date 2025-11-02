# 🚀 How to Run Quizoria Servlet - Simple Steps

## Quick Start (5 Steps) ⚡

### Step 1: Setup Database ✅

**Option A: Using MySQL Command Line**
```bash
# Open MySQL command line
mysql -u root -p

# Then run:
CREATE DATABASE quizoria;
USE quizoria;

# Then import SQL file:
source C:/Users/rahul/Downloads/Quizoria[1]/Quizoria/quizoria.sql
# OR copy and paste the SQL content from quizoria.sql file
```

**Option B: Using MySQL Workbench**
1. Open MySQL Workbench
2. Create new connection (if not exists)
3. Connect to MySQL
4. Create new schema: `quizoria`
5. Right-click `quizoria` → Set as Default Schema
6. File → Run SQL Script → Select `Quizoria/quizoria.sql`

### Step 2: Copy Assets 📁

**Windows File Explorer:**
1. Go to: `Quizoria\assets\`
2. Select ALL files (Ctrl+A):
   - android.png
   - css.png
   - html.png
   - java.png
   - profile.png
   - quizoria-logo.png
3. Copy (Ctrl+C)
4. Go to: `Quizoria-Servlet\src\main\webapp\assets\`
5. Paste (Ctrl+V)

**Or using Command Prompt:**
```bash
cd "C:\Users\rahul\Downloads\Quizoria[1]"
xcopy /E /I "Quizoria\assets" "Quizoria-Servlet\src\main\webapp\assets"
```

### Step 3: Update Database Password (if needed) 🔐

If your MySQL has a password:
1. Open: `Quizoria-Servlet\src\main\java\com\quizoria\util\DatabaseConnection.java`
2. Find line: `private static final String DB_PASSWORD = "";`
3. Change to: `private static final String DB_PASSWORD = "yourpassword";`

**If no password, skip this step!**

### Step 4: Build the Project 🔨

**Open Command Prompt or PowerShell:**

```bash
# Navigate to project folder
cd "C:\Users\rahul\Downloads\Quizoria[1]\Quizoria-Servlet"

# Build the project (this creates WAR file)
mvn clean package

# Wait for "BUILD SUCCESS" message
```

**What happens:**
- Maven downloads dependencies (first time only)
- Compiles Java code
- Creates WAR file in `target/quizoria.war`

### Step 5: Run the Application 🎯

**Option A: Using Maven Tomcat Plugin (Easiest)**

```bash
# Still in Quizoria-Servlet folder
mvn clean tomcat7:run
```

**What happens:**
- Maven starts embedded Tomcat
- Application deploys automatically
- Server starts on port 8080

**Then open browser:**
```
http://localhost:8080/quizoria/
```

**To stop:** Press `Ctrl+C` in the terminal

---

**Option B: Deploy to Tomcat Manually**

```bash
# 1. Download Tomcat (if not installed)
# From: https://tomcat.apache.org/download-90.cgi
# Extract to: C:\apache-tomcat-9.0.x

# 2. Copy WAR file
copy "target\quizoria.war" "C:\apache-tomcat-9.0.x\webapps\"

# 3. Start Tomcat
cd C:\apache-tomcat-9.0.x\bin
startup.bat

# 4. Open browser
# http://localhost:8080/quizoria/
```

---

## Access URLs 🌐

Once running:

- **Home Page:** `http://localhost:8080/quizoria/`
- **User Login:** `http://localhost:8080/quizoria/login`
- **User Signup:** `http://localhost:8080/quizoria/signup`
- **Admin Login:** `http://localhost:8080/quizoria/admin/login`

---

## Default Credentials 👤

**Admin Login:**
- Email: `omthite245@gmail.com`
- Password: `ommthite`

*(Check `quizoria.sql` for other admin accounts)*

---

## Common Issues & Solutions 🔧

### ❌ Issue: "Cannot find Maven command"

**Solution:**
1. Install Maven: https://maven.apache.org/download.cgi
2. Add to PATH environment variable
3. Restart Command Prompt

### ❌ Issue: "Port 8080 already in use"

**Solution 1:** Stop other applications using port 8080
```bash
# Find what's using port 8080
netstat -ano | findstr :8080

# Kill the process (replace PID with actual number)
taskkill /PID <PID> /F
```

**Solution 2:** Change Tomcat port
- Edit `pom.xml` → tomcat7-maven-plugin → port (change 8080 to 8081)
- Access: `http://localhost:8081/quizoria/`

### ❌ Issue: "Connection refused" (Database error)

**Solution:**
1. Check MySQL is running:
   - Windows Services → MySQL → Start
2. Verify database exists:
   ```sql
   SHOW DATABASES;
   ```
3. Check credentials in `DatabaseConnection.java`

### ❌ Issue: "404 Not Found"

**Solution:**
1. Verify build succeeded: `mvn clean package`
2. Check WAR file exists: `target/quizoria.war`
3. Check Tomcat is running
4. Verify URL: `http://localhost:8080/quizoria/` (note: `/quizoria/`)

### ❌ Issue: Images not showing

**Solution:**
1. Copy assets again (Step 2)
2. Rebuild: `mvn clean package`
3. Restart server
4. Clear browser cache (Ctrl+F5)

---

## Quick Test ✅

After running, test these:

1. **Register a new user:**
   - Go to Signup page
   - Fill the form
   - Submit

2. **Login:**
   - Use your new account
   - Or use existing user from database

3. **Take a quiz:**
   - Select "Java" → "Easy"
   - Answer questions
   - See your score

4. **Check profile:**
   - Click profile icon → My Profile
   - View quiz scores

5. **Admin login:**
   - Go to Admin Login
   - Use admin credentials
   - Add/Delete questions

---

## Development Tips 💡

### Hot Reload (for development):

**IntelliJ IDEA:**
1. Right-click project → Run → Edit Configurations
2. Add → Tomcat Server → Local
3. Deployment tab → Add Artifact → quizoria:war
4. Application context: `/quizoria`
5. Run configuration
6. Changes will reload automatically

**Eclipse:**
1. Right-click project → Run As → Run on Server
2. Select Tomcat
3. Changes auto-reload

### View Logs:
- Tomcat logs: `CATALINA_HOME/logs/catalina.out`
- Maven output: Shows in terminal

### Debug:
- Set breakpoints in IDE
- Use Debug mode instead of Run

---

## File Structure 📂

```
Quizoria-Servlet/
├── src/
│   └── main/
│       ├── java/          # Java source code
│       └── webapp/         # Web resources
│           ├── assets/     # ← Images go here
│           ├── css/        # CSS files
│           └── WEB-INF/
│               └── views/  # JSP pages
├── target/                 # Build output (WAR file here)
├── pom.xml                 # Maven configuration
└── RUN.md                  # This file
```

---

## Success Indicators ✅

✅ Build successful: "BUILD SUCCESS"
✅ Tomcat started: "Server startup in XXXX ms"
✅ Database connected: No connection errors
✅ Application accessible: Home page loads
✅ Images visible: All logos display correctly
✅ Login works: Can login with credentials

---

## Need More Help?

1. Check `SETUP_GUIDE.md` for detailed setup
2. Check `README.md` for project overview
3. Check `QUICK_START.md` for quick reference
4. Check Tomcat logs for errors

---

**🎉 Happy Coding!**

