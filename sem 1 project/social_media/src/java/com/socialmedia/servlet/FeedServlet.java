package com.socialmedia.servlet;

import com.socialmedia.dao.PostDAO;
import com.socialmedia.model.Post;
import com.socialmedia.model.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/feed")
public class FeedServlet extends HttpServlet {
    private PostDAO postDAO;
    
    @Override
    public void init() throws ServletException {
        postDAO = new PostDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        // Get all posts for feed
        List<Post> posts = postDAO.getAllPosts(user.getUserId());
        request.setAttribute("posts", posts);
        
        // Success/error messages forward karo
        String successMessage = (String) session.getAttribute("successMessage");
        String errorMessage = (String) session.getAttribute("errorMessage");
        
        if (successMessage != null) {
            request.setAttribute("successMessage", successMessage);
            session.removeAttribute("successMessage");
        }
        
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            session.removeAttribute("errorMessage");
        }
        
        request.getRequestDispatcher("feed.jsp").forward(request, response);
    }
}