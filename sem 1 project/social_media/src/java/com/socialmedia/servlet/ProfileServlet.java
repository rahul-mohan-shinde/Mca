package com.socialmedia.servlet;

import com.socialmedia.dao.FollowDAO;
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

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private PostDAO postDAO;
    private FollowDAO followDAO;
    
    @Override
    public void init() throws ServletException {
        postDAO = new PostDAO();
        followDAO = new FollowDAO();
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
        
        // Current user ki posts get karo
        List<Post> userPosts = postDAO.getPostsByUser(user.getUserId(), user.getUserId());
        int followersCount = followDAO.getFollowersCount(user.getUserId());
        int followingCount = followDAO.getFollowingCount(user.getUserId());
        
        // Data request mein set karo
        request.setAttribute("userPosts", userPosts);
        request.setAttribute("followersCount", followersCount);
        request.setAttribute("followingCount", followingCount);
        request.setAttribute("postsCount", userPosts.size());
        
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}