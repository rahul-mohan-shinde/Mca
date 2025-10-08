package com.socialmedia.servlet;

import com.socialmedia.dao.FollowDAO;
import com.socialmedia.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/follow")
public class FollowServlet extends HttpServlet {
    private FollowDAO followDAO;
    
    @Override
    public void init() throws ServletException {
        followDAO = new FollowDAO();
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
        
        try {
            int followingId = Integer.parseInt(request.getParameter("followingId"));
            String action = request.getParameter("action");
            
            boolean success = false;
            
            if ("follow".equals(action)) {
                success = followDAO.followUser(user.getUserId(), followingId);
            } else if ("unfollow".equals(action)) {
                success = followDAO.unfollowUser(user.getUserId(), followingId);
            } else if ("toggle".equals(action)) {
                success = followDAO.toggleFollow(user.getUserId(), followingId);
            }
            
            if (success) {
                response.getWriter().write("success");
            } else {
                response.getWriter().write("error");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("error");
        }
    }
}