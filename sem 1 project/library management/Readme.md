

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

2. **User Side (Student)**

   * Register / Login
   * View Available Books
   * Request a Book
   * View Issued Books

3. **Extra (Optional for bonus):**

   * Fine Calculation for late returns
   * Search by Book Title / Author

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
