<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Font Awesome CDN for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<style>
/* Top Navigation */
.insta-top-nav {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 56px;
  background: #fff;
  border-bottom: 1px solid #dbdbdb;
  display: flex;
  justify-content: space-between;
  align-items: center;
  z-index: 1000;
  padding: 0 16px;
}
.insta-top-left {
  display: flex;
  align-items: center;
}
.insta-logo {
  font-size: 28px;
  color: #e1306c;
  margin-right: 8px;
}
.insta-title {
  font-weight: bold;
  font-size: 20px;
  color: #222;
}
.insta-top-right i {
  font-size: 20px;
  margin-left: 18px;
  color: #222;
  cursor: pointer;
}

/* Spacer */
.insta-spacer-top { height:56px; }
.insta-spacer-bottom { height:56px; }

/* Bottom Navigation */
.insta-bottom-nav {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 56px;
  background: #fff;
  border-top: 1px solid #dbdbdb;
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  z-index: 1000;
}
.insta-bottom-nav .nav-btn {
  display: flex;
  flex-direction: column;
  align-items: center;
  color: #222;
  text-decoration: none;
  font-size: 18px;
  width: 60px;
}
.insta-bottom-nav .nav-btn i {
  font-size: 22px;
}
.insta-bottom-nav .nav-btn span {
  font-size: 10px;
  margin-top: 2px;
}
.insta-bottom-nav .nav-btn:active,
.insta-bottom-nav .nav-btn:hover {
  color: #e1306c;
}
body {
  margin:0;
  padding:0;
}
</style>

<!-- Top Navigation Bar -->
<nav class="insta-top-nav">
  <div class="insta-top-left">
    <i class="fab fa-instagram insta-logo"></i>
    <span class="insta-title">Social Media</span>
  </div>
  <div class="insta-top-right">
    <i class="fas fa-search"></i>
    <i class="far fa-heart"></i>
    <i class="far fa-paper-plane"></i>
  </div>
</nav>
<div class="insta-spacer-top"></div>

<!-- Bottom Navigation Bar -->
<nav class="insta-bottom-nav">
  <a href="home.jsp" class="nav-btn"><i class="fas fa-home"></i><span>Home</span></a>
  <a href="search.jsp" class="nav-btn"><i class="fas fa-search"></i><span>Search</span></a>
  <a href="reels.jsp" class="nav-btn"><i class="fas fa-video"></i><span>Reels</span></a>
  <a href="profile.jsp" class="nav-btn"><i class="far fa-user"></i><span>Profile</span></a>
</nav>
<div class="insta-spacer-bottom"></div>
