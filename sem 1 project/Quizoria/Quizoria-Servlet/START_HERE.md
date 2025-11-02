# 🎯 START HERE - Quick Run Guide

## Fastest Way to Run (Copy-Paste Commands) ⚡

### Prerequisites Check:
```bash
# 1. Check Java is installed
java -version

# 2. Check Maven is installed
mvn -version

# 3. Check MySQL is running
# (Usually runs automatically as Windows service)
```

---

## 🚀 Run in 3 Commands:

### 1️⃣ Setup Database (One Time)
```sql
-- Open MySQL Workbench or command line
CREATE DATABASE quizoria;
USE quizoria;

-- Then import: Quizoria/quizoria.sql file
```

### 2️⃣ Copy Assets (One Time)
```bash
# In File Explorer:
# Copy ALL files from: Quizoria\assets\
# Paste to: Quizoria-Servlet\src\main\webapp\assets\
```

### 3️⃣ Build & Run
```bash
# Open Command Prompt in Quizoria-Servlet folder
cd "C:\Users\rahul\Downloads\Quizoria[1]\Quizoria-Servlet"

# Build
mvn clean package

# Run
mvn tomcat7:run
```

### 4️⃣ Open Browser
```
http://localhost:8080/quizoria/
```

---

## ✅ That's It!

**If you see "BUILD SUCCESS" and Tomcat starts → You're done!**

**If you see errors → Check `RUN.md` for troubleshooting**

---

## 📚 Need More Details?

- **Quick Start:** See `QUICK_START.md`
- **Detailed Setup:** See `SETUP_GUIDE.md`
- **Step-by-Step:** See `RUN.md`

---

**Default Admin Login:**
- Email: `omthite245@gmail.com`
- Password: `ommthite`

---

🎉 **Ready to go!**

