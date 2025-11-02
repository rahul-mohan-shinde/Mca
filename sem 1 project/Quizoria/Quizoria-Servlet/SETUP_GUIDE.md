# How to Run Quizoria Servlet Application

## Prerequisites Check
1. ✅ Java JDK 11 or higher installed
2. ✅ Maven installed (or use Maven Wrapper)
3. ✅ MySQL/MariaDB installed and running
4. ✅ Apache Tomcat 9.0+ (or any Servlet container)

## Step 1: Set Up Database

### 1.1 Start MySQL
```bash
# Windows (if MySQL is a service, it might already be running)
# Check MySQL service status

# Or start MySQL server manually if needed
```

### 1.2 Create Database
```sql
-- Open MySQL command line or MySQL Workbench
CREATE DATABASE quizoria;
USE quizoria;
```

### 1.3 Import SQL File
```bash
# From the original Quizoria folder, import the SQL file
mysql -u root -p quizoria < Quizoria/quizoria.sql

# Or in MySQL Workbench: File > Run SQL Script > Select quizoria.sql
```

## Step 2: Update Database Connection (if needed)

Open: `Quizoria-Servlet/src/main/java/com/quizoria/util/DatabaseConnection.java`

```java
private static final String DB_URL = "jdbc:mysql://localhost:3306/quizoria";
private static final String DB_USER = "root";
private static final String DB_PASSWORD = "";  // Change if you have password
```

**If you have a MySQL password**, update the `DB_PASSWORD` value.

## Step 3: Copy Assets

**IMPORTANT:** Copy image files from original project:

1. Open Windows File Explorer
2. Navigate to `Quizoria/assets/`
3. Copy ALL image files:
   - `android.png`
   - `css.png`
   - `html.png`
   - `java.png`
   - `profile.png`
   - `quizoria-logo.png`
4. Paste them into: `Quizoria-Servlet/src/main/webapp/assets/`

## Step 4: Build the Project

### Option A: Using Maven (Recommended)

```bash
# Navigate to project directory
cd Quizoria-Servlet

# Build the project (creates WAR file)
mvn clean package

# If build is successful, you'll see:
# BUILD SUCCESS
# The WAR file will be in: target/quizoria.war
```

### Option B: Using IDE (Eclipse/IntelliJ IDEA)

1. **Eclipse:**
   - File > Import > Existing Maven Project
   - Select `Quizoria-Servlet` folder
   - Right-click project > Run As > Maven build
   - Goals: `clean package`

2. **IntelliJ IDEA:**
   - File > Open > Select `Quizoria-Servlet`
   - Open Maven tool window (View > Tool Windows > Maven)
   - Run `clean` then `package`

## Step 5: Deploy to Tomcat

### Option A: Manual Deployment

1. **Download Tomcat** (if not installed):
   - Download from: https://tomcat.apache.org/
   - Extract to a folder (e.g., `C:\apache-tomcat-9.0.x`)

2. **Copy WAR file:**
   ```bash
   # Copy the WAR file to Tomcat webapps folder
   copy target\quizoria.war C:\apache-tomcat-9.0.x\webapps\
   ```

3. **Start Tomcat:**
   ```bash
   # Navigate to Tomcat bin directory
   cd C:\apache-tomcat-9.0.x\bin
   
   # Start Tomcat
   startup.bat
   ```

4. **Access Application:**
   - Open browser: `http://localhost:8080/quizoria/`
   - The application should be running!

### Option B: Using IDE Embedded Tomcat

**IntelliJ IDEA:**
1. Run > Edit Configurations
2. Add > Tomcat Server > Local
3. Deployment tab > Add Artifact > quizoria:war
4. Application context: `/quizoria`
5. Run the configuration

**Eclipse:**
1. Right-click project > Run As > Run on Server
2. Select Tomcat instance
3. Finish

### Option C: Maven Tomcat Plugin (Quick Test)

Add to `pom.xml` (after `<build>` section):

```xml
<plugin>
    <groupId>org.apache.tomcat.maven</groupId>
    <artifactId>tomcat7-maven-plugin</artifactId>
    <version>2.2</version>
    <configuration>
        <port>8080</port>
        <path>/quizoria</path>
    </configuration>
</plugin>
```

Then run:
```bash
mvn tomcat7:run
```

## Step 6: Access the Application

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

4. **Default Admin Credentials:**
   - Email: `omthite245@gmail.com`
   - Password: `ommthite`
   
   (Check `quizoria.sql` for all admin accounts)

## Troubleshooting

### Issue: "ClassNotFoundException: com.mysql.cj.jdbc.Driver"
**Solution:** Ensure MySQL Connector is in classpath. Maven should handle this automatically.

### Issue: "Connection refused" or database errors
**Solution:** 
- Check MySQL is running
- Verify database name is `quizoria`
- Check username/password in `DatabaseConnection.java`
- Ensure database and tables are created

### Issue: "404 Not Found" after deployment
**Solution:**
- Check WAR file name matches context path
- Verify Tomcat is running
- Check Tomcat logs in `logs/catalina.out`

### Issue: Images not showing
**Solution:**
- Verify assets are copied to `src/main/webapp/assets/`
- Check browser console for 404 errors
- Rebuild and redeploy if needed

### Issue: JSP compilation errors
**Solution:**
- Ensure JSP dependencies in `pom.xml`
- Check JSP files are in `WEB-INF/views/`
- Verify JSP syntax is correct

### Issue: "Port 8080 already in use"
**Solution:**
- Change Tomcat port in `server.xml` (or use different port)
- Or stop the application using port 8080

## Quick Start Checklist

- [ ] MySQL installed and running
- [ ] Database `quizoria` created
- [ ] SQL file imported (`quizoria.sql`)
- [ ] Database credentials updated (if needed)
- [ ] Assets copied to `src/main/webapp/assets/`
- [ ] Project built with `mvn clean package`
- [ ] WAR file deployed to Tomcat
- [ ] Tomcat started
- [ ] Application accessible at `http://localhost:8080/quizoria/`

## Testing the Application

1. **Test User Registration:**
   - Go to Signup page
   - Create a new account
   - Login

2. **Test Quiz:**
   - Select a quiz category (Java, Android, HTML, CSS)
   - Choose difficulty level
   - Take a quiz
   - Check your score in Profile

3. **Test Admin:**
   - Login as admin
   - Add a new question
   - View/Delete questions

## Development Tips

1. **Hot Reload:** Use IDE with Tomcat for faster development
2. **Logs:** Check `CATALINA_HOME/logs/catalina.out` for errors
3. **Database:** Use MySQL Workbench for easier database management
4. **Debug:** Set breakpoints in IDE for debugging

## Next Steps

- Add password hashing (BCrypt) for production
- Add input validation and sanitization
- Add error handling pages
- Configure HTTPS for production
- Add logging framework (Log4j/SLF4J)

---

**Need Help?** Check the README.md file for more details!

