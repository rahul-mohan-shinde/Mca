# CSS Fix Guide

## Problem: CSS Not Applying

### Solution Steps:

1. **Rebuild the Project:**
   ```bash
   cd Quizoria-Servlet
   mvn clean package
   ```

2. **Check CSS File Location:**
   - CSS file should be at: `src/main/webapp/css/home.css`
   - Verify the file exists

3. **Check Browser Console:**
   - Open browser (F12)
   - Go to Network tab
   - Check if `home.css` is loading
   - Look for 404 errors

4. **Verify CSS Path in Browser:**
   - Right-click on page → Inspect
   - Check if CSS link shows: `/quizoria/css/home.css`
   - If path is wrong, the issue is with context path

5. **Hard Refresh Browser:**
   - Press `Ctrl + Shift + R` or `Ctrl + F5`
   - This clears cache

6. **Check WAR File:**
   - Extract `target/quizoria.war` (rename to .zip)
   - Verify `css/home.css` is inside
   - If missing, rebuild

7. **Add Static Resource Mapping (if needed):**
   - Sometimes Tomcat needs explicit mapping
   - Check if CSS folder is accessible at runtime

## Quick Fix Commands:

```bash
# Rebuild
cd Quizoria-Servlet
mvn clean package

# Then redeploy
# If using mvn tomcat7:run, just restart
mvn tomcat7:run

# If using standalone Tomcat
# Copy WAR file again
copy target\quizoria.war C:\apache-tomcat-9.0.x\webapps\
```

## Verify CSS is Loading:

1. Open browser: `http://localhost:8080/quizoria/`
2. Right-click → View Page Source
3. Look for: `<link rel="stylesheet" href="/quizoria/css/home.css">`
4. Click on that link - should open CSS file
5. If 404, the path is wrong

## Alternative: Add Explicit CSS Reference

If still not working, you can add direct path in header.jsp:
```jsp
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/home.css" />
```

## Check Tomcat Logs:

```bash
# Check if CSS request is being received
# Look in: CATALINA_HOME/logs/catalina.out
# Search for: "css/home.css"
```

