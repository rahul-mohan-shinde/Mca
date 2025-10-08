package com.socialmedia.filter;

import com.socialmedia.model.User;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class SessionFilter implements Filter {
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("✅ SessionFilter initialized");
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        
        String requestURI = httpRequest.getRequestURI();
        
        // Public URLs jo session required nahi
        boolean isPublicURL = requestURI.endsWith("login.jsp") ||
                             requestURI.endsWith("signup.jsp") ||
                             requestURI.endsWith("login") ||
                             requestURI.endsWith("signup") ||
                             requestURI.contains("/css/") ||
                             requestURI.contains("/js/") ||
                             requestURI.contains("/images/");
        
        if (!isPublicURL) {
            // Check if user is logged in
            if (session == null || session.getAttribute("user") == null) {
                System.out.println("🚫 Session expired or not logged in - Redirecting to login");
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
                return;
            } else {
                // Session hai, user info log karo
                User user = (User) session.getAttribute("user");
                System.out.println("✅ User session active: " + user.getUsername() + " - " + requestURI);
            }
        }
        
        chain.doFilter(request, response);
    }
    
    @Override
    public void destroy() {
        System.out.println("✅ SessionFilter destroyed");
    }
}