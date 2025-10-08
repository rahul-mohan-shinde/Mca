<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Post - Social Media</title>
    <style>
        body { 
            font-family: 'Segoe UI', Arial, sans-serif; 
            margin: 0; 
            padding: 0; 
            background: #f0f2f5; 
        }
        .navbar { 
            background: #1877f2; 
            color: white; 
            padding: 15px 20px; 
            display: flex; 
            justify-content: space-between;
            align-items: center;
        }
        .navbar a { 
            color: white; 
            text-decoration: none; 
            margin: 0 15px;
            padding: 8px 15px;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .navbar a:hover {
            background: rgba(255,255,255,0.2);
        }
        .container { 
            max-width: 600px; 
            margin: 30px auto; 
            padding: 0 20px; 
        }
        .create-post-card { 
            background: white; 
            border-radius: 15px; 
            padding: 30px; 
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .form-group { 
            margin-bottom: 20px; 
        }
        label { 
            display: block; 
            margin-bottom: 8px; 
            font-weight: 600;
            color: #1c1e21;
        }
        textarea { 
            width: 100%; 
            height: 120px; 
            padding: 15px; 
            border: 2px solid #e4e6eb; 
            border-radius: 10px; 
            font-size: 16px;
            font-family: inherit;
            resize: vertical;
            transition: border-color 0.3s;
        }
        textarea:focus {
            outline: none;
            border-color: #1877f2;
        }
        .file-upload { 
            border: 2px dashed #e4e6eb; 
            border-radius: 10px; 
            padding: 30px; 
            text-align: center; 
            cursor: pointer;
            transition: all 0.3s;
            background: #fafbfc;
        }
        .file-upload:hover {
            border-color: #1877f2;
            background: #f0f8ff;
        }
        .file-upload.dragover {
            border-color: #1877f2;
            background: #e7f3ff;
        }
        .file-input { 
            display: none; 
        }
        .file-preview { 
            margin-top: 15px; 
            text-align: center;
        }
        .file-preview img { 
            max-width: 100%; 
            max-height: 300px; 
            border-radius: 10px; 
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .btn { 
            background: #1877f2; 
            color: white; 
            padding: 12px 30px; 
            border: none; 
            border-radius: 8px; 
            cursor: pointer; 
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s;
        }
        .btn:hover {
            background: #166fe5;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(24, 119, 242, 0.3);
        }
        .btn:disabled {
            background: #ccc;
            cursor: not-allowed;
            transform: none;
        }
        .error { 
            color: #e74c3c; 
            margin-bottom: 15px; 
            padding: 10px;
            background: #ffeaea;
            border-radius: 5px;
            border: 1px solid #ffcdd2;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="feed">← Back to Feed</a>
        <strong>Create New Post</strong>
        <div></div> <!-- Empty div for spacing -->
    </div>

    <div class="container">
        <div class="create-post-card">
            <h2 style="text-align: center; margin-bottom: 25px; color: #1c1e21;">📝 Create New Post</h2>
            
            <%-- Error Message --%>
            <%
                String errorMessage = (String) session.getAttribute("errorMessage");
                if (errorMessage != null) {
                    session.removeAttribute("errorMessage");
            %>
                <div class="error">
                    ❌ <%= errorMessage %>
                </div>
            <% } %>

            <form action="create-post" method="post" enctype="multipart/form-data" id="postForm">
                <!-- Content -->
                <div class="form-group">
                    <label for="content">What's on your mind? 💭</label>
                    <textarea id="content" name="content" placeholder="Share your thoughts, experiences, or ideas..." required></textarea>
                </div>
                
                <!-- Image Upload -->
                <div class="form-group">
                    <label for="image">Add Photo (Optional) 📷</label>
                    <div class="file-upload" id="fileUploadArea">
                        <input type="file" id="image" name="image" accept="image/*" class="file-input">
                        <div style="font-size: 48px; margin-bottom: 10px;">📁</div>
                        <h3 style="margin: 10px 0; color: #65676b;">Click to upload photo</h3>
                        <p style="color: #8a8d91; margin: 0;">or drag and drop</p>
                        <p style="color: #8a8d91; font-size: 12px; margin-top: 5px;">PNG, JPG, JPEG up to 5MB</p>
                    </div>
                    <div class="file-preview" id="filePreview"></div>
                </div>
                
                <button type="submit" class="btn" style="width: 100%;">Post</button>
            </form>
        </div>
    </div>

    <script>
    // File upload functionality
    document.addEventListener('DOMContentLoaded', function() {
        const fileInput = document.getElementById('image');
        const fileUploadArea = document.getElementById('fileUploadArea');
        const filePreview = document.getElementById('filePreview');
        const form = document.getElementById('postForm');
        
        // Click on upload area triggers file input
        fileUploadArea.addEventListener('click', function() {
            fileInput.click();
        });
        
        // File input change event
        fileInput.addEventListener('change', function(e) {
            handleFileSelection(e.target.files[0]);
        });
        
        // Drag and drop functionality
        fileUploadArea.addEventListener('dragover', function(e) {
            e.preventDefault();
            fileUploadArea.classList.add('dragover');
        });
        
        fileUploadArea.addEventListener('dragleave', function() {
            fileUploadArea.classList.remove('dragover');
        });
        
        fileUploadArea.addEventListener('drop', function(e) {
            e.preventDefault();
            fileUploadArea.classList.remove('dragover');
            
            if (e.dataTransfer.files.length > 0) {
                handleFileSelection(e.dataTransfer.files[0]);
                fileInput.files = e.dataTransfer.files;
            }
        });
        
        // File selection handler
        function handleFileSelection(file) {
            if (!file) return;
            
            // File validation
            if (!file.type.startsWith('image/')) {
                alert('❌ Please select an image file (PNG, JPG, JPEG)');
                return;
            }
            
            if (file.size > 5 * 1024 * 1024) {
                alert('❌ File size must be less than 5MB');
                return;
            }
            
            // Preview image
            const reader = new FileReader();
            reader.onload = function(e) {
                filePreview.innerHTML = `
                    <div style="margin-bottom: 10px;">
                        <strong>Selected Image:</strong> ${file.name}
                    </div>
                    <img src="${e.target.result}" alt="Preview">
                    <button type="button" onclick="removeImage()" style="margin-top: 10px; background: #e74c3c; color: white; border: none; padding: 5px 10px; border-radius: 5px; cursor: pointer;">
                        Remove Image
                    </button>
                `;
            };
            reader.readAsDataURL(file);
        }
        
        // Remove image function
        window.removeImage = function() {
            fileInput.value = '';
            filePreview.innerHTML = '';
        };
        
        // Form submission loading state
        form.addEventListener('submit', function() {
            const submitBtn = form.querySelector('button[type="submit"]');
            submitBtn.innerHTML = '⏳ Posting...';
            submitBtn.disabled = true;
        });
    });
    
    // Character counter
    document.getElementById('content').addEventListener('input', function() {
        const maxLength = 1000;
        const currentLength = this.value.length;
        const counter = document.getElementById('charCounter') || createCounter();
        
        counter.textContent = `${currentLength}/${maxLength} characters`;
        
        if (currentLength > maxLength) {
            counter.style.color = '#e74c3c';
        } else {
            counter.style.color = '#65676b';
        }
    });
    
    function createCounter() {
        const counter = document.createElement('div');
        counter.id = 'charCounter';
        counter.style.textAlign = 'right';
        counter.style.fontSize = '12px';
        counter.style.color = '#65676b';
        counter.style.marginTop = '5px';
        document.getElementById('content').parentNode.appendChild(counter);
        return counter;
    }
    </script>
</body>
</html>