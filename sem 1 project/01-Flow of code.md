
# Project flow & file map — Java Servlet + SQL backend + HTML/CSS/JS frontend

Achha — main aapko ek clear, practical flow deta hoon jisme file/servlet names, DB schema, endpoints, UI pages aur step-by-step user flows sab diya hai. Aap ise seedha use karke project bana sakte ho.

---

# 1) High-level architecture

* Frontend: HTML / CSS / JS (static files or JSP for dynamic rendering)
* Backend: Java Servlets (MVC style)
* Database: MySQL (ya PostgreSQL)
* Session: HttpSession for logged-in user
* Communication: form submit / fetch (AJAX) for like/follow without full reload

---

# 2) Recommended project folder structure

```
/MySocialApp
 ├─ /src
 │   ├─ /com/myapp/servlets
 │   │    ├─ SignupServlet.java
 │   │    ├─ LoginServlet.java
 │   │    ├─ LogoutServlet.java
 │   │    ├─ FeedServlet.java
 │   │    ├─ ProfileServlet.java
 │   │    ├─ EditProfileServlet.java
 │   │    ├─ CreatePostServlet.java
 │   │    ├─ DeletePostServlet.java
 │   │    ├─ LikeServlet.java
 │   │    ├─ FollowServlet.java
 │   │    ├─ SearchServlet.java
 │   │    └─ ApiServlet (optional unified API)
 │   ├─ /com/myapp/dao
 │   │    ├─ DBUtil.java
 │   │    ├─ UserDAO.java
 │   │    ├─ PostDAO.java
 │   │    ├─ FollowDAO.java
 │   │    ├─ LikeDAO.java
 │   │    └─ CommentDAO.java (optional)
 │   └─ /com/myapp/models
 │        ├─ User.java
 │        ├─ Post.java
 │        └─ ...
 ├─ /WebContent (or /webapp)
 │   ├─ index.jsp
 │   ├─ login.jsp
 │   ├─ signup.jsp
 │   ├─ feed.jsp
 │   ├─ profile.jsp
 │   ├─ edit_profile.jsp
 │   ├─ create_post.jsp
 │   ├─ /css/style.css
 │   ├─ /js/app.js
 │   └─ /images
 └─ web.xml
```

---

# 3) Database schema (MySQL) — basic tables

```sql
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL, -- store hashed password (bcrypt)
  fullname VARCHAR(100),
  bio VARCHAR(500),
  avatar_url VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  content TEXT,
  media_url VARCHAR(255), -- optional
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE follows (
  follower_id INT NOT NULL,
  following_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (follower_id, following_id),
  FOREIGN KEY (follower_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (following_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE likes (
  user_id INT NOT NULL,
  post_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id, post_id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE
);

CREATE TABLE dislikes (optional) (
  user_id INT NOT NULL,
  post_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id, post_id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE
);

-- Indexes for performance
CREATE INDEX idx_posts_user ON posts(user_id);
CREATE INDEX idx_likes_post ON likes(post_id);
CREATE INDEX idx_follows_following ON follows(following_id);
```

> Note: aap `dislikes` table bana sakte ho ya `likes` table me `vote` column (1 for like, -1 for dislike) rakh sakte ho. Simpler approach: alag `likes` and `dislikes`.

---

# 4) Servlets / Endpoints (file name → purpose → params / responses)

* `SignupServlet.java`

  * URL: `/signup` (POST)
  * Params: username, email, password, fullname, bio
  * Action: validate → hash password → insert into `users` → redirect to login or auto login

* `LoginServlet.java`

  * URL: `/login` (POST)
  * Params: usernameOrEmail, password
  * Action: verify hash → set `HttpSession.setAttribute("userId", id)` → redirect to `/feed`

* `LogoutServlet.java`

  * URL: `/logout` (GET/POST)
  * Action: invalidate session → redirect to `/login.jsp`

* `FeedServlet.java`

  * URL: `/feed` (GET)
  * Action: fetch posts from users the logged-in user follows (or all if no follows) with counts → forward to `feed.jsp`

* `CreatePostServlet.java`

  * URL: `/post/create` (POST)
  * Params: content, (media)
  * Action: save post → redirect to feed / return JSON if AJAX

* `DeletePostServlet.java`

  * URL: `/post/delete` (POST)
  * Params: postId
  * Check owner → delete

* `ProfileServlet.java`

  * URL: `/profile` (GET) e.g. `/profile?userId=123` or `/profile/{username}`
  * Action: show user profile, posts, counts (followers, following, likes on posts) → `profile.jsp`

* `EditProfileServlet.java`

  * URL: `/profile/edit` (POST)
  * Params: fullname, bio, avatar (file)
  * Action: update `users` table

* `LikeServlet.java`

  * URL: `/post/like` (POST, AJAX)
  * Params: postId
  * Action: toggle insert/delete in `likes` → return JSON `{likesCount: n, liked: true/false}`

* `FollowServlet.java`

  * URL: `/user/follow` (POST, AJAX)
  * Params: targetUserId
  * Action: toggle follow/unfollow in `follows` → return JSON `{followersCount: n, following: true/false}`

* `SearchServlet.java`

  * URL: `/search` (GET)
  * Params: q (query) → search users or posts

* `ApiServlet.java` (optional)

  * Group small AJAX operations under `/api/*`

---

# 5) Frontend pages & files (names + role)

* `login.jsp` — login form (POST `/login`)
* `signup.jsp` — sign up form (POST `/signup`)
* `index.jsp` — if not logged in, show feed preview & login/signup links
* `feed.jsp` — main feed, shows posts, like & follow buttons; loads `js/app.js` for AJAX
* `profile.jsp` — user profile, edit button if owner
* `edit_profile.jsp` — edit profile form (POST `/profile/edit`)
* `create_post.jsp` — form to create post (POST `/post/create`)
* `css/style.css` — shared styles
* `js/app.js` — AJAX calls: like, follow, create post async, update counts in UI
* `images/avatars/` — user avatars (or store URL)

---

# 6) UI Action flows (step by step)

### Signup → Login flow

1. User opens `signup.jsp` → fills details → submits to `/signup` (POST).
2. `SignupServlet` validates; if ok, INSERT into `users`. Redirect to `login.jsp`.
3. User logs in at `login.jsp` → `/login` → `LoginServlet` verifies password → sets `session.setAttribute("userId", id)` → redirect `/feed`.

### Create post flow

1. On `feed.jsp` user clicks "New Post" → open `create_post.jsp` or modal.
2. Submit to `/post/create`. `CreatePostServlet` inserts row in `posts`.
3. Redirect to `/feed` or return JSON with new post markup (AJAX) and append to DOM.

### Like / Dislike flow (AJAX)

1. User clicks like button. `js/app.js` sends `POST /post/like` with `postId`.
2. `LikeServlet` checks if (user, post) exists in `likes`: if exists → DELETE (unlike), else INSERT.
3. Return `{likesCount, liked:true/false}`. JS updates button and count.

### Follow / Unfollow flow (AJAX)

1. On `profile.jsp`, click Follow. `js/app.js` sends `POST /user/follow` with `targetUserId`.
2. `FollowServlet` toggles row in `follows`. Compute `followersCount` with `SELECT COUNT(*)` or maintain cached counter.
3. Return `{followersCount, following:true/false}`. JS updates button and follower count.

### Edit profile flow

1. `edit_profile.jsp` form submits to `/profile/edit`.
2. `EditProfileServlet` updates `users` table (fullname, bio, avatar). Redirect to `/profile?userId=...`.

---

# 7) Key SQL queries & tips (counts & efficient patterns)

* Get likes count for a post:

```sql
SELECT COUNT(*) FROM likes WHERE post_id = ?;
```

* Get follower count:

```sql
SELECT COUNT(*) FROM follows WHERE following_id = ?;
```

* Check if current user liked a post (to mark button):

```sql
SELECT 1 FROM likes WHERE post_id = ? AND user_id = ? LIMIT 1;
```

* Feed: posts by people the user follows + own posts:

```sql
SELECT p.*, u.username, u.avatar_url
FROM posts p
JOIN users u ON p.user_id = u.id
WHERE p.user_id IN (
  SELECT following_id FROM follows WHERE follower_id = ?
) OR p.user_id = ?
ORDER BY p.created_at DESC
LIMIT 50;
```

* Add indexes on `likes(post_id)`, `follows(following_id)`, `posts(user_id, created_at)`.

---

# 8) Security & best practices

* Passwords: always store hashed (bcrypt). Never plain text.
* Session fixation: regenerate session id after login.
* Prevent XSS: escape user content before rendering, or use safe rendering (JSP `<c:out>`).
* CSRF: protect POST endpoints (CSRF tokens) or ensure same-site cookies.
* Validate file uploads (avatar/media): size, type, store outside webroot or use cloud storage.
* PreparedStatements for all DB queries (avoid SQL injection).

---

# 9) Minimal DAO method list (UserDAO / PostDAO)

`UserDAO`:

* `createUser(User u)`
* `getUserById(int id)`
* `getUserByUsername(String username)`
* `updateProfile(User u)`
* `authenticate(usernameOrEmail, password)`

`PostDAO`:

* `createPost(Post p)`
* `getPostsForFeed(int userId, int limit)`
* `getPostsByUser(int userId)`
* `deletePost(int postId, int userId)`

`FollowDAO`:

* `isFollowing(followerId, followingId)`
* `follow(followerId, followingId)`
* `unfollow(followerId, followingId)`
* `countFollowers(userId)`

`LikeDAO`:

* `toggleLike(userId, postId)`
* `countLikes(postId)`
* `hasLiked(userId, postId)`

---

# 10) Example simple AJAX flow in `js/app.js` (pseudo)

```js
// Like button click
async function toggleLike(postId, btnElement) {
  const res = await fetch('/post/like', {
    method: 'POST',
    headers: {'Content-Type': 'application/json'},
    body: JSON.stringify({postId})
  });
  const data = await res.json();
  btnElement.querySelector('.count').innerText = data.likesCount;
  btnElement.classList.toggle('liked', data.liked);
}
```

---

# 11) Minimal `web.xml` mappings (example)

```xml
<servlet>
  <servlet-name>LoginServlet</servlet-name>
  <servlet-class>com.myapp.servlets.LoginServlet</servlet-class>
</servlet>
<servlet-mapping>
  <servlet-name>LoginServlet</servlet-name>
  <url-pattern>/login</url-pattern>
</servlet-mapping>
<!-- similarly map /signup, /feed, /post/create, /post/like, /user/follow ... -->
```

---

# 12) Development checklist (stepwise)

1. Setup project (Maven/Tomcat), DB connection (`DBUtil`).
2. Create `users` table & DAO; implement signup + login + session.
3. Build `feed.jsp` + `FeedServlet` showing static posts.
4. Implement `posts` table + create post functionality.
5. Implement `likes` table + `LikeServlet` + AJAX.
6. Implement `follows` table + `FollowServlet` + profile pages.
7. Add edit profile, avatars, and search.
8. Polish CSS, responsive design, and security checks.

---

Agar chaho to main abhi aapke liye:

* 1. **Complete SQL script** with sample data,
* 2. **Example servlet code** for `SignupServlet` and `LoginServlet`,
* 3. **Example `feed.jsp` + `js/app.js` snippet** for like/follow AJAX — ye teenon bana kar de sakta hoon.

Batao kaunsa chahiye pehle — main turant code + SQL bhej dunga.
