# 🚀 Quick Start Guide - Run Quizoria Servlet

## Prerequisites Check ⚡

**Before starting, ensure you have:**
1. ✅ Java JDK 11+ installed
   - Check: `java -version`
2. ✅ Maven installed
   - Check: `mvn -version`
3. ✅ MySQL/MariaDB running
   - Check: MySQL service is running
4. ✅ Tomcat (or use Maven Tomcat plugin)

---

## Step-by-Step Instructions

### Step 1: Database Setup 🗄️

```bash
# 1. Start MySQL (if not running)
# Usually MySQL runs as a Windows service automatically

# 2. Open MySQL command line or MySQL Workbench
# Run these commands:

CREATE DATABASE quizoria;
USE quizoria;

# 3. Import the SQL file
# In MySQL Workbench: File > Run SQL Script > Select Quizoria/quizoria.sql
# OR in command line:
mysql -u root -p quizoria < "Quizoria/quizoria.sql"
```

### Step 2: Copy Assets 📁

**Manual Steps:**
1. Open File Explorer
2. Go to: `Quizoria[1]\Quizoria\assets\`
3. Copy ALL these files:
   - android.png
   - css.png
   - html.png
   - java.png
   - profile.png
   - quizoria-logo.png
4. Paste them into: `Quizoria[1]\Quizoria-Servlet\src\main\webapp\assets\`

### Step 3: Update Database Password (if needed) 🔐

If your MySQL has a password:
1. Open: `Quizoria-Servlet\src\main\java\com\quizoria\util\DatabaseConnection.java`
2. Change line: `private static final String DB_PASSWORD = "";`
3. Enter your password: `private static final String DB_PASSWORD = "yourpassword";`

### Step 4: Build the Project 🔨

**Open Command Prompt or PowerShell in project folder:**

```bash
# Navigate to project
cd "C:\Users\rahul\Downloads\Quizoria[1]\Quizoria-Servlet"

# Build the project
mvn clean package

# Wait for "BUILD SUCCESS" message
# WAR file will be created at: target\quizoria.war
```

### Step 5: Run with Maven Tomcat Plugin (Easiest) 🎯

**Option A: Add Tomcat Plugin to pom.xml**

I'll add this for you automatically. Then run:

```bash
cd "C:\Users\rahul\Downloads\Quizoria[1]\Quizoria-Servlet"
mvn clean tomcat7:run
```

**Option B: Deploy to Tomcat Manually**

```bash
# 1. Download Tomcat from https://tomcat.apache.org/
# 2. Extract to C:\apache-tomcat-9.0.x

# 3. Copy WAR file
copy "target\quizoria.war" "C:\apache-tomcat-9.0.x\webapps\"

# 4. Start Tomcat
cd C:\apache-tomcat-9.0.x\bin
startup.bat

# 5. Open browser
# http://localhost:8080/quizoria/
```

---

## Quick Test Commands

```bash
# Check Java
java -version

# Check Maven
mvn -version

# Check MySQL connection
mysql -u root -p

# Build project
cd Quizoria-Servlet
mvn clean package

# Run with Maven Tomcat (after adding plugin)
mvn tomcat7:run
```

---

## Access the Application 🌐

Once running, open these URLs:

1. **Home Page:**
   ```
   http://localhost:8080/quizoria/
   ```

2. **User Login:**
   ```
   http://localhost:8080/quizoria/login
   ```

3. **Admin Login:**
   ```
   http://localhost:8080/quizoria/admin/login
   ```

**Default Admin:**
- Email: `omthite245@gmail.com`
- Password: `ommthite`

---

## Troubleshooting 🔧

### "Cannot find Maven"
- Install Maven: https://maven.apache.org/download.cgi
- Add to PATH environment variable

### "Port 8080 already in use"
- Stop the application using port 8080
- Or change Tomcat port in `server.xml`

### "Database connection failed"
- Check MySQL is running
- Verify database name is `quizoria`
- Check username/password in `DatabaseConnection.java`
- Ensure database is created and SQL imported

### "404 Not Found"
- Verify WAR file is deployed
- Check Tomcat is running
- Check context path is `/quizoria`

### "Images not showing"
- Copy assets manually (Step 2)
- Rebuild and redeploy

---

## Need Help? 

1. Check `SETUP_GUIDE.md` for detailed instructions
2. Check `README.md` for project overview
3. Check Tomcat logs in `CATALINA_HOME/logs/`

---

**Happy Coding! 🎉**

