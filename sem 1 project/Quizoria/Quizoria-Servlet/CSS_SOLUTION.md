# CSS Apply Nah Ho Raha - Solution 🔧

## Problem: CSS nahi apply ho raha hai

## Quick Fix ⚡

### Step 1: Rebuild Project
```bash
cd "C:\Users\rahul\Downloads\Quizoria[1]\Quizoria-Servlet"
mvn clean package
```

### Step 2: Restart Server
```bash
# If using mvn tomcat7:run
mvn tomcat7:run

# OR if using standalone Tomcat
# Stop server, then:
copy target\quizoria.war C:\apache-tomcat-9.0.x\webapps\
startup.bat
```

### Step 3: Hard Refresh Browser
- Press `Ctrl + Shift + R` or `Ctrl + F5`
- This clears browser cache

---

## Verify CSS File Location ✅

1. **Check CSS file exists:**
   ```
   Quizoria-Servlet\src\main\webapp\css\home.css
   ```

2. **Verify in browser:**
   - Open: `http://localhost:8080/quizoria/css/home.css`
   - If CSS file opens → File is accessible ✅
   - If 404 error → File missing or path wrong ❌

---

## Check Browser Console 🔍

1. Open browser: `http://localhost:8080/quizoria/`
2. Press `F12` (Open DevTools)
3. Go to **Network** tab
4. Refresh page (`F5`)
5. Look for `home.css`:
   - ✅ Status 200 → CSS loading successfully
   - ❌ Status 404 → CSS file not found
   - ❌ Status 403 → Permission issue

---

## Common Issues & Fixes 🔧

### Issue 1: CSS File Not Found (404)
**Solution:**
```bash
# Rebuild project
mvn clean package

# Verify CSS file is in WAR
# Extract target/quizoria.war (rename to .zip)
# Check if css/home.css exists inside
```

### Issue 2: CSS Path Wrong
**Check header.jsp:**
```jsp
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css" />
```

**Should show in browser as:**
```html
<link rel="stylesheet" type="text/css" href="/quizoria/css/home.css" />
```

### Issue 3: Browser Cache
**Solution:**
- Hard refresh: `Ctrl + Shift + R`
- Or clear browser cache
- Or use Incognito/Private window

### Issue 4: WAR File Not Updated
**Solution:**
```bash
# Clean rebuild
mvn clean package

# Redeploy WAR file
copy target\quizoria.war C:\apache-tomcat-9.0.x\webapps\

# Restart Tomcat
```

---

## Test CSS is Working ✅

1. **Check CSS loads:**
   - Open: `http://localhost:8080/quizoria/css/home.css`
   - Should see CSS code

2. **Check in page source:**
   - Right-click page → View Page Source
   - Find: `<link rel="stylesheet" href="/quizoria/css/home.css">`
   - Click the link → Should open CSS file

3. **Visual Check:**
   - Page should have yellow background (`#fcf59e`)
   - Navbar should be styled
   - Buttons should be orange (`#e79033`)

---

## Manual Fix (If Still Not Working) 🛠️

### Option 1: Direct Path in Header
Update `header.jsp` line 13:
```jsp
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/home.css" />
```

### Option 2: Absolute Path (Not Recommended)
```jsp
<link rel="stylesheet" type="text/css" href="/quizoria/css/home.css" />
```

### Option 3: Check web.xml
Make sure web.xml doesn't have conflicting mappings

---

## Debug Steps 🔍

1. **Check WAR file contents:**
   ```bash
   # Rename WAR to ZIP
   copy target\quizoria.war target\quizoria.zip
   # Extract and check css/home.css exists
   ```

2. **Check Tomcat logs:**
   ```
   CATALINA_HOME/logs/catalina.out
   # Look for CSS file requests
   ```

3. **Check browser network tab:**
   - Open DevTools (F12)
   - Network tab
   - Refresh page
   - Look for home.css request
   - Check status code

---

## Quick Test Commands 🧪

```bash
# Rebuild
cd Quizoria-Servlet
mvn clean package

# Check CSS file exists
dir src\main\webapp\css\home.css

# Check WAR contains CSS
# Extract quizoria.war and check css/home.css

# Restart Tomcat
# Stop and start again
```

---

## Still Not Working? 📞

1. **Share error message** from browser console
2. **Share screenshot** of network tab showing CSS request
3. **Verify CSS file** exists at: `src/main/webapp/css/home.css`
4. **Check browser** console for any JavaScript errors

---

**Expected Result:** ✅
- Page has yellow background
- Navbar is styled
- Buttons are orange
- All styles from home.css are applied

---

🎉 **Good Luck!**

