package com.socialmedia.servlet;

import com.socialmedia.dao.PostDAO;
import com.socialmedia.model.Post;
import com.socialmedia.model.User;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/create-post")  // ✅ Yehi URL pattern rahega
@MultipartConfig(
    maxFileSize = 1024 * 1024 * 10,      // 10MB max file size
    maxRequestSize = 1024 * 1024 * 50,   // 50MB max request size
    fileSizeThreshold = 1024 * 1024      // 1MB memory threshold
)
public class FileUploadServlet extends HttpServlet {
    private PostDAO postDAO;
    
    // Upload directory
    private static final String UPLOAD_DIR = "uploads";
    
    @Override
    public void init() throws ServletException {
        postDAO = new PostDAO();
        
        // Upload directory create karo
        String appPath = getServletContext().getRealPath("");
        String uploadPath = appPath + File.separator + UPLOAD_DIR;
        
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
            System.out.println("✅ Upload directory created: " + uploadPath);
        }
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
        
        if (content == null || content.trim().isEmpty()) {
            session.setAttribute("errorMessage", "Post content cannot be empty!");
            response.sendRedirect("create_post.jsp");
            return;
        }
        
        try {
            // File upload handle karo
            String imageUrl = handleFileUpload(request);
            
            // Post create karo
            Post post = new Post(user.getUserId(), content.trim());
            if (imageUrl != null) {
                post.setImageUrl(imageUrl);
            }
            
            boolean success = postDAO.createPost(post);
            
            if (success) {
                session.setAttribute("successMessage", "Post created successfully!");
            } else {
                session.setAttribute("errorMessage", "Failed to create post. Please try again.");
            }
            
            response.sendRedirect("feed");
            
        } catch (Exception e) {
            System.err.println("❌ Error creating post: " + e.getMessage());
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error uploading file: " + e.getMessage());
            response.sendRedirect("create_post.jsp");
        }
    }
    
    private String handleFileUpload(HttpServletRequest request) throws IOException, ServletException {
        Part filePart = request.getPart("image");
        
        // Agar koi file nahi upload ki toh return null
        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }
        
        // File validation
        String fileName = getFileName(filePart);
        if (fileName == null || fileName.isEmpty()) {
            return null;
        }
        
        // File type validation
        String fileType = filePart.getContentType();
        if (!fileType.startsWith("image/")) {
            throw new ServletException("Only image files are allowed!");
        }
        
        // File size validation (5MB max)
        if (filePart.getSize() > 5 * 1024 * 1024) {
            throw new ServletException("File size must be less than 5MB!");
        }
        
        // Unique filename generate karo
        String fileExtension = "";
        int dotIndex = fileName.lastIndexOf('.');
        if (dotIndex > 0) {
            fileExtension = fileName.substring(dotIndex);
        }
        
        String uniqueFileName = UUID.randomUUID().toString() + fileExtension;
        
        // Upload path
        String appPath = getServletContext().getRealPath("");
        String uploadPath = appPath + File.separator + UPLOAD_DIR;
        
        // Ensure directory exists
        Files.createDirectories(Paths.get(uploadPath));
        
        // File save karo
        Path filePath = Paths.get(uploadPath, uniqueFileName);
        Files.copy(filePart.getInputStream(), filePath);
        
        System.out.println("✅ File uploaded: " + uniqueFileName);
        
        // Relative URL return karo
        return UPLOAD_DIR + "/" + uniqueFileName;
    }
    
    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return null;
    }
}