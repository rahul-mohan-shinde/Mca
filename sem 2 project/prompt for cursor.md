

# 🎯 MASTER PROMPT FOR CURSOR

(Online Examination System – MCA Level Project Generator)

> You are a senior full-stack architect and MCA-level project designer.
> Create a production-ready **Online Examination System** project with strict modular architecture, documentation-driven development, and algorithmic design.
> The goal is to generate a project that looks like an MCA 2nd-year professional system.

---

## 🗂️ 1. Root Project Structure (Mandatory)

Create a root folder:

```
online-examination-system/
```

Inside it, create:

```
/frontend (Angular + TypeScript)
/backend (Node.js + Express + TypeScript)
/docs
/modules
/project-map
/tests
/config
```

---

## 🧩 2. Modules List (Mandatory)

Create these modules inside `/modules`:

```
auth-module
admin-module
question-bank-module
exam-management-module
student-module
result-report-module
notification-module
proctoring-module
```

---

## 📁 3. Module Folder Structure (Strict Rule)

For EVERY module, create this structure:

```
/modules/<module-name>/
│── README.md
│── steps-to-concept.md
│── codemap.md
│── logic.md
│── flow-of-create-feature.md
│
└── features/
```

---

## 🧩 4. Feature Folder Structure (Strict Rule)

Inside each module → features → create feature folders.

Example (auth-module):

```
auth-module/
 └── features/
      ├── login/
      ├── register/
      ├── forgot-password/
      ├── role-based-access/
```

For EVERY feature folder, create these files:

```
README.md
feature-code-flow.md
algorithm.md
algomap.md
code-skeleton.md
concept-map.md
```

---

## 🗂️ 5. Project Map Folder (Global Mirror Architecture)

Create folder:

```
/project-map/
```

Inside it, create one folder per module:

```
auth-module/
admin-module/
question-bank-module/
exam-management-module/
student-module/
result-report-module/
notification-module/
proctoring-module/
```

Inside each module folder → create feature folders again and replicate all skeleton files:

```
README.md
feature-code-flow.md
algorithm.md
algomap.md
code-skeleton.md
concept-map.md
```

---

## 🧠 6. Content Rules for Every File (IMPORTANT)

### ✅ Rule 1: Documentation-first approach

Every `.md` file must contain:

* Concept explanation
* Step-by-step logic
* Flow diagrams (ASCII)
* Algorithms (pseudo-code)
* Developer instructions
* Comments for implementation

---

### ✅ Rule 2: Code Skeleton Rule

In every `code-skeleton.md`, write:

* File names
* Folder paths
* Function names
* API routes
* DB schema references
* Comments describing logic

Example style:

```ts
// Step 1: Validate user input
// Step 2: Check user in database
// Step 3: Compare password hash
// Step 4: Generate JWT token
// Step 5: Return response
function loginUser() {
  // developer will write code here
}
```

---

### ✅ Rule 3: MCA-Level Algorithm Design

Create algorithms that look academic and professional:

* Modular algorithms
* Flow-based logic
* Time complexity mention
* Security considerations
* Scalability notes

Example:

```
Algorithm: Random Question Paper Generation (RQPG)

Input: Question Pool, Difficulty Ratio, Topic Weightage
Output: Randomized Question Set

Steps:
1. Filter questions by subject.
2. Categorize by difficulty.
3. Apply weightage distribution.
4. Shuffle questions using Fisher-Yates algorithm.
5. Validate uniqueness.
6. Return final question set.

Complexity: O(n)
```

---

## 🧱 7. MCA 2nd Year Level Architecture (Mandatory)

Use:

* 3-tier architecture
* RBAC (Role-Based Access Control)
* REST API design
* Clean Architecture principles
* SOLID principles
* MVC / Modular architecture
* DDD (Domain Driven Design - light version)

---

## 🧪 8. Testing Structure (Mandatory)

Create:

```
/tests/
 ├── unit/
 ├── integration/
 ├── e2e/
```

Each module must have test skeletons.

---

## 🗄️ 9. Database Design (Mandatory)

Create schemas for:

* Users
* Roles
* Exams
* Questions
* Options
* Answers
* Results
* Logs
* Notifications

Include ER logic in documentation.

---

## 🚀 10. Final Goal

The project must be designed so that:

* Every module is independent
* Every feature is documented
* Every file contains step-by-step comments
* Developer only needs to replace comments with real code
* The project looks like a real MCA research-level system

---

## 🧾 Final Instruction to Cursor

> Generate all folders, files, and documentation automatically.
> Fill every markdown file with structured content, algorithms, flow, pseudo-code, and comments.
> Do not leave any file empty.
> Follow MCA-level academic tone and professional system design.

---

