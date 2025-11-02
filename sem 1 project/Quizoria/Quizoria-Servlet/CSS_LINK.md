# CSS File Link 🔗

## Direct CSS File URLs

### When Application is Running:

1. **CSS File Direct Access:**
   ```
   http://localhost:8080/quizoria/css/home.css
   ```

2. **Home Page (CSS applied):**
   ```
   http://localhost:8080/quizoria/
   ```

3. **Login Page:**
   ```
   http://localhost:8080/quizoria/login
   ```

4. **Signup Page:**
   ```
   http://localhost:8080/quizoria/signup
   ```

---

## CSS Path in Code

### In header.jsp (Line 13):
```jsp
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css" />
```

**Resolves to:**
- `/quizoria/css/home.css` (when deployed with context path `/quizoria`)

---

## How to Verify CSS is Working

### Method 1: Direct URL
1. Start server: `mvn tomcat7:run`
2. Open browser: `http://localhost:8080/quizoria/css/home.css`
3. ✅ If CSS code appears → CSS file is accessible
4. ❌ If 404 error → Rebuild needed: `mvn clean package`

### Method 2: Browser DevTools
1. Open: `http://localhost:8080/quizoria/`
2. Press `F12` (DevTools)
3. Go to **Network** tab
4. Refresh page (`F5`)
5. Look for `home.css`:
   - ✅ Status 200 → CSS loading successfully
   - ❌ Status 404 → File not found

### Method 3: View Page Source
1. Open: `http://localhost:8080/quizoria/`
2. Right-click → **View Page Source**
3. Find: `<link rel="stylesheet" href="/quizoria/css/home.css">`
4. Click on that link → Should open CSS file

---

## Local File Path (For Reference)

**Source file location:**
```
C:\Users\rahul\Downloads\Quizoria[1]\Quizoria-Servlet\src\main\webapp\css\home.css
```

**In WAR file (after build):**
```
target/quizoria.war → quizoria/css/home.css
```

---

## Quick Test Links

### After Starting Server (`mvn tomcat7:run`):

1. **CSS File:**
   ```
   http://localhost:8080/quizoria/css/home.css
   ```

2. **Assets (Images):**
   ```
   http://localhost:8080/quizoria/assets/quizoria-logo.png
   http://localhost:8080/quizoria/assets/java.png
   http://localhost:8080/quizoria/assets/android.png
   http://localhost:8080/quizoria/assets/html.png
   http://localhost:8080/quizoria/assets/css.png
   http://localhost:8080/quizoria/assets/profile.png
   ```

3. **Application Pages:**
   ```
   http://localhost:8080/quizoria/          (Home)
   http://localhost:8080/quizoria/login     (Login)
   http://localhost:8080/quizoria/signup    (Signup)
   ```

---

## Note

- **Port 8080:** Default Tomcat port
- **Context Path:** `/quizoria` (from WAR file name)
- **If different port:** Change `8080` to your port number
- **If different context:** Change `/quizoria` to your context path

---

✅ **All CSS links are relative to context path!**

