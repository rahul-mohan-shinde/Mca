
## 🧩 **Algorithm: User Side (Student Module) — Servlet-Based Library Management System**

### **Goal:**

Allow students to **register, log in, view books, borrow books**, and **view issued books** through a Java Servlet web app.

---

## 🧠 **Algorithm Steps**

---

### **1. Register (Create Account)**

**Objective:**
Allow new students to register into the system.

**Steps:**

1. User opens **`register.jsp`** page.
2. Form contains fields:

   * Name
   * Email
   * Username
   * Password
   * Confirm Password
3. User fills details and clicks **Register**.
4. Form sends data to **`RegisterServlet`** via POST method.
5. In `RegisterServlet`:

   * Validate fields are not empty.
   * Check if username/email already exists:

     ```sql
     SELECT * FROM students WHERE username = ?;
     ```
   * If not found → insert data:

     ```sql
     INSERT INTO students (name, email, username, password)
     VALUES (?, ?, ?, ?);
     ```
6. Show message: **“Registration Successful”**
   and redirect to **login.jsp**.
7. Else → show: *“Username already exists.”*

---

### **2. Login**

**Objective:**
Authenticate student and start session.

**Steps:**

1. User opens **`login.jsp`**.
2. Enters username and password.
3. On submit → data sent to **`LoginServlet`**.
4. `LoginServlet` executes query:

   ```sql
   SELECT * FROM students WHERE username = ? AND password = ?;
   ```
5. If match found:

   * Create session:

     ```java
     session.setAttribute("username", username);
     ```
   * Redirect to **availableBooks.jsp**
6. Else:

   * Show error: “Invalid username or password.”

---

### **3. View Available Books**

**Objective:**
Show all available books from database.

**Steps:**

1. Student requests **`AvailableBooksServlet`** (linked from menu or home).
2. Servlet runs:

   ```sql
   SELECT * FROM books;
   ```
3. Forward results to **`availableBooks.jsp`**.
4. Page displays:

   * Book Title
   * Author
   * Available Copies
   * “Borrow” Button (only if copies > 0)

---

### **4. Request a Book (Borrow)**

**Objective:**
Allow student to borrow a book.

**Steps:**

1. When user clicks **“Borrow”**, form sends book ID to **`BorrowBookServlet`**.
2. In `BorrowBookServlet`:

   * Get current logged-in student ID (from session).
   * Check availability:

     ```sql
     SELECT available_copies FROM books WHERE id = ?;
     ```
   * If available_copies > 0:

     * Insert into **borrowed_books** table:

       ```sql
       INSERT INTO borrowed_books (student_id, book_id, borrow_date, is_returned)
       VALUES (?, ?, NOW(), false);
       ```
     * Update available copies:

       ```sql
       UPDATE books SET available_copies = available_copies - 1 WHERE id = ?;
       ```
     * Show message: *“Book borrowed successfully!”*
   * Else → *“Book not available.”*

---

### **5. View Issued Books**

**Objective:**
Show all books currently borrowed by the logged-in student.

**Steps:**

1. Student opens **`IssuedBooksServlet`**.
2. Servlet fetches:

   ```sql
   SELECT b.title, bb.borrow_date, bb.is_returned
   FROM borrowed_books bb
   JOIN books b ON bb.book_id = b.id
   WHERE bb.student_id = ? AND bb.is_returned = false;
   ```
3. Forward data to **`issuedBooks.jsp`**.
4. Display table of:

   * Book Title
   * Borrow Date
   * Return Status

---

### **6. Logout**

**Objective:**
End student session.

**Steps:**

1. Student clicks **Logout** link/button.
2. Link calls **`LogoutServlet`**, which:

   ```java
   session.invalidate();
   response.sendRedirect("login.jsp");
   ```
3. Session ends → redirect to login page.

---

### **7. End**

* System ensures database consistency after every operation.
* Admin panel (separate module) updates available copies dynamically.

---
