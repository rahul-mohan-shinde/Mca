package com.socialmedia.servlet;

import com.socialmedia.dao.LikeDAO;
import com.socialmedia.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/like")
public class LikeServlet extends HttpServlet {
    private LikeDAO likeDAO;
    
    @Override
    public void init() throws ServletException {
        likeDAO = new LikeDAO();
        System.out.println("✅ LikeServlet initialized - AJAX version");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("=== AJAX LIKE REQUEST ===");
        
        // ✅ IMPORTANT: Set response type to plain text
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        // Debug session
        System.out.println("Session User: " + (user != null ? user.getUsername() : "NULL"));
        
        if (user == null) {
            System.out.println("❌ User not logged in");
            response.getWriter().write("error:not_logged_in");
            return;
        }
        
        try {
            // Get parameters
            String postIdStr = request.getParameter("postId");
            String action = request.getParameter("action");
            
            System.out.println("Raw parameters - postId: " + postIdStr + ", action: " + action);
            
            // Validate parameters
            if (postIdStr == null || postIdStr.trim().isEmpty()) {
                System.out.println("❌ Missing postId");
                response.getWriter().write("error:missing_post_id");
                return;
            }
            
            if (action == null || action.trim().isEmpty()) {
                System.out.println("❌ Missing action");
                response.getWriter().write("error:missing_action");
                return;
            }
            
            int postId = Integer.parseInt(postIdStr);
            int userId = user.getUserId();
            
            System.out.println("Processing - Post: " + postId + ", User: " + userId + ", Action: " + action);
            
            boolean success;
            
            if ("toggle".equals(action)) {
                success = likeDAO.toggleLike(postId, userId);
                System.out.println("Toggle result: " + success);
            } else {
                System.out.println("❌ Invalid action: " + action);
                response.getWriter().write("error:invalid_action");
                return;
            }
            
            if (success) {
                System.out.println("✅ Like operation successful");
                response.getWriter().write("success");
            } else {
                System.out.println("❌ Like operation failed");
                response.getWriter().write("error:operation_failed");
            }
            
        } catch (NumberFormatException e) {
            System.err.println("❌ Invalid postId format: " + e.getMessage());
            response.getWriter().write("error:invalid_post_id");
        } catch (Exception e) {
            System.err.println("❌ Unexpected error: " + e.getMessage());
            e.printStackTrace();
            response.getWriter().write("error:server_error");
        }
        
        System.out.println("=== AJAX LIKE REQUEST COMPLETED ===");
        
        // ✅ IMPORTANT: DO NOT call sendRedirect or forward here
        // Let the response be handled by the AJAX call
    }
}