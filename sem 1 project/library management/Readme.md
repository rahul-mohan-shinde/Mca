

## 🧩 **Mini Project Topic:**

### **Library Management System using Django**

---

### 🎯 **Project Objective:**

To create a small web-based system where a librarian can manage books and students can view available books and borrow or return them.

---

### 🏗️ **Main Features:**

1. **Admin Panel**

   * Add / Edit / Delete Books
   * View Borrowed Books
   * Manage Students
```Perfect 👍

---

## 🧩 **Algorithm: Manage Books (Add / Edit / Delete)**

### **Goal:**

Allow admin users to manage (add, edit, and delete) books in the library database.

---

### **Algorithm Steps**

#### **Step 1: Start**

1. Start the Django server.
2. Log in as **Admin** using the Django Admin Panel (`/admin`).

---

#### **Step 2: Access Book Management Section**

1. Admin navigates to the **“Books”** section in the admin dashboard.
   (This section appears because of the `Book` model registered in `admin.py`.)
2. Django displays the list of all books stored in the database with options like:

   * **Add Book**
   * **Change (Edit)**
   * **Delete**

---

#### **Step 3: Add a New Book**

1. Click **“Add Book”**.
2. A form appears with fields:

   * Title
   * Author
   * ISBN
   * Total Copies
   * Available Copies
3. Admin enters book details.
4. When the admin clicks **Save**, Django performs:

   * Field validation (checks if required fields are filled and ISBN is unique).
   * If valid, Django ORM executes:

     ```sql
     INSERT INTO book (title, author, isbn, total_copies, available_copies) VALUES (...);
     ```
   * Displays a success message: *“Book added successfully.”*

---

#### **Step 4: Edit (Update) Existing Book**

1. From the book list, admin clicks **“Change”** beside the desired book.
2. Django displays the existing data in an editable form.
3. Admin modifies any field (e.g., available copies or title).
4. When **Save** is clicked:

   * Django validates the form.
   * If valid, ORM executes:

     ```sql
     UPDATE book SET title=..., author=..., available_copies=... WHERE id=book_id;
     ```
   * Displays a message: *“Book details updated successfully.”*

---

#### **Step 5: Delete a Book**

1. From the book list, admin selects a book or multiple books.
2. Clicks **“Delete Selected Books”**.
3. Django asks for confirmation.
4. After confirmation, ORM executes:

   
   DELETE FROM book WHERE id=book_id;
   
5. Displays message: *“Book deleted successfully.”*

---

#### **Step 6: End**

* The Admin Panel updates the book list automatically.
* The updated data is reflected everywhere (like on the student side’s “Available Books” page).


---

Would you like me to also write the **flowchart** or **diagram** for this algorithm (for your project report or documentation)?
```

2. **User Side (Student)**

   * Register / Login
   * View Available Books
   * Request a Book
   * View Issued Books
```
Perfect 👍
Now let’s write the **algorithm** for the **User Side (Student)** part of your Django-based **Library Management System** mini project.

---

## 🧩 **Algorithm: User Side (Student Module)**

### **Goal:**

Allow students to **register, log in, view books, request books**, and **see issued books**.

---

## 🧠 **Algorithm Steps**

---

### **1. Register (Create Account)**

#### **Objective:**

Allow a new user (student) to create an account.

**Steps:**

1. User opens the **Register Page** (`/register/`).
2. System displays a registration form asking for:

   * Username
   * Email
   * Password
   * Confirm Password
3. User fills in the details and clicks **Register**.
4. Django checks:

   * All fields are filled.
   * Passwords match.
   * Username or email not already used.
5. If valid → Save user data in database:

   ```sql
   INSERT INTO auth_user (username, email, password) VALUES (...);
  
6. Display message: **“Registration Successful”**
   Redirect to Login page.

---

### **2. Login**

#### **Objective:**

Allow a registered user to log into the system.

**Steps:**

1. User opens **Login Page** (`/login/`).
2. System displays fields:

   * Username
   * Password
3. User enters credentials and clicks **Login**.
4. Django Authentication System:

   * Checks username and password against `auth_user` table.
   * If matched → Start session (login user).
   * Else → Show error “Invalid credentials.”
5. On success, redirect user to **Available Books** page.

---

### **3. View Available Books**

#### **Objective:**

Show the list of all books in the library with available copies.

**Steps:**

1. User visits **Available Books Page** (`/available_books/`).
2. Django fetches all records from the `Book` table:

   ```sql
   SELECT * FROM book;
   
3. For each book, display:

   * Title
   * Author
   * Available Copies
   * “Borrow” Button (if available_copies > 0)
4. If no books → show message: *“No books available right now.”*

---

### **4. Request a Book (Borrow)**

#### **Objective:**

Allow the student to borrow a book.

**Steps:**

1. User clicks **“Borrow”** next to the desired book.
2. Django retrieves that book’s data.
3. System checks:

   * If `available_copies > 0`
4. If yes:

   * Create a new entry in the `Borrow` table:

     ```sql
     INSERT INTO borrow (user_id, book_id, borrow_date, is_returned)
     VALUES (current_user, selected_book, today, False);
     ```
   * Decrease available copies:

     
     UPDATE book SET available_copies = available_copies - 1 WHERE id = book_id;
   
   * Show success message: *“Book borrowed successfully!”*
5. If no copies are available:

   * Show message: *“Book not available right now.”*

---

### **5. View Issued Books**

#### **Objective:**

Allow student to see all books they currently borrowed.

**Steps:**

1. User opens **Issued Books Page** (`/issued_books/`).
2. Django fetches all borrow records of the current user:

   ```sql
   SELECT * FROM borrow WHERE user_id = current_user AND is_returned = False;
   
3. For each record, display:

   * Book title
   * Borrow date
   * Return status
4. If no borrowed books → display message: *“You have no issued books.”*

---

### **6. Logout**

#### **Objective:**

End the user session.

**Steps:**

1. User clicks **Logout**.
2. Django ends the session:

   
   logout(request)
   
3. Redirects to the **Login page**.



```
3. **Extra (Optional for bonus):**

   * Fine Calculation for late returns
   * Search by Book Title / Author
```
     Perfect 👍
Now let’s write the **Algorithm for “Search by Book Title / Author”** — this is a small but important feature in your **Library Management System (User Side)** using Django.

---

## 🔍 **Feature Name:**

**Search Books by Title or Author**

---

## 🎯 **Objective:**

Allow a student (user) to find a specific book from the library by typing part of the **title** or **author name** in a search box.

---

## ⚙️ **Algorithm Steps**

### **Step 1: Start**

1. User logs in successfully.
2. The system loads the **Available Books** page.

---

### **Step 2: Display Search Bar**

1. On the top of the “Available Books” page, display a **search box** and a **Search button**.

   * Placeholder text: `"Search by title or author..."`

---

### **Step 3: Get User Input**

1. User types a keyword (for example, *Harry Potter* or *J.K. Rowling*).
2. When the **Search button** is clicked:

   * The keyword (search term) is sent to the Django view (backend).

---

### **Step 4: Process the Search Query**

1. Django receives the search term from the GET request:

   ```python
   search_query = request.GET.get('q')
   
2. System checks:

   * If `search_query` is not empty.
3. If present → perform a **case-insensitive search** in the Book table using Django ORM:

   ```python
   Book.objects.filter(
       Q(title__icontains=search_query) | Q(author__icontains=search_query)
   )
   

   * `icontains` → means partial match, case-insensitive.

---

### **Step 5: Display Matching Results**

1. The filtered book list is sent to the template.
2. The template displays:

   * Title
   * Author
   * Available copies
   * Borrow button (if available)
3. If no matches found → show message:
   *“No books found matching your search.”*

---

### **Step 6: End**

* If the user clears the search box → show **all available books** again.



---

## 🧠 **How It Works in Django (Conceptual Example)**

**views.py**

```python
from django.db.models import Q

def available_books(request):
    query = request.GET.get('q')
    if query:
        books = Book.objects.filter(
            Q(title__icontains=query) | Q(author__icontains=query)
        )
    else:
        books = Book.objects.all()
    return render(request, 'available_books.html', {'books': books})


**available_books.html**

```html
<form method="get" action="">
  <input type="text" name="q" placeholder="Search by title or author" value="{{ request.GET.q }}">
  <button type="submit">Search</button>
</form>


---

✅ **Summary of Flow:**

1. Student enters keyword →
2. Django filters books by title or author →
3. Matching books are displayed →
4. If nothing matches → “No results” message.

---

```

---

### 🧠 **Core Django Concepts Used:**

* Django Models (for Books, Students, Borrow Records)
* Django Templates (HTML pages)
* Django Authentication (for login/register)
* Django Admin (for quick management)
* SQLite Database

---

### 📁 **Suggested Project Structure:**

```
library_project/
│
├── library_app/
│   ├── migrations/
│   ├── templates/
│   │   ├── base.html
│   │   ├── index.html
│   │   ├── book_list.html
│   │   ├── book_detail.html
│   │   ├── borrow_book.html
│   │   └── login_register.html
│   ├── static/
│   │   └── css/style.css
│   ├── models.py
│   ├── views.py
│   ├── urls.py
│   └── forms.py
│
├── library_project/
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
│
└── manage.py
```
