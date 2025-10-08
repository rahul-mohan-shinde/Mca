package com.socialmedia.servlet;

import com.socialmedia.dao.PostDAO;
import com.socialmedia.model.Post;
import com.socialmedia.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/create-post")
public class CreatePostServlet extends HttpServlet {
    private PostDAO postDAO;
    
    @Override
    public void init() throws ServletException {
        postDAO = new PostDAO();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String content = request.getParameter("content");
        String imageUrl = request.getParameter("imageUrl");
        
        if (content == null || content.trim().isEmpty()) {
            session.setAttribute("errorMessage", "Post content cannot be empty!");
            response.sendRedirect("create_post.jsp");
            return;
        }
        
        Post post = new Post(user.getUserId(), content.trim());
        if (imageUrl != null && !imageUrl.trim().isEmpty()) {
            post.setImageUrl(imageUrl.trim());
        }
        
        boolean success = postDAO.createPost(post);
        
        if (success) {
            session.setAttribute("successMessage", "Post created successfully!");
            response.sendRedirect("feed"); // ✅ Feed par redirect karo
        } else {
            session.setAttribute("errorMessage", "Failed to create post. Please try again.");
            response.sendRedirect("create_post.jsp");
        }
    }
}