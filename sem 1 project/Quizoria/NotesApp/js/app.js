// Main Application Controller
class App {
    constructor() {
        this.init();
    }

    async init() {
        try {
            // Initialize auth
            await authManager.init();

            // Set up event listeners
            this.setupEventListeners();

            // Check authentication status
            if (authManager.isAuthenticated()) {
                this.showDashboard();
            } else {
                this.showLogin();
            }
        } catch (error) {
            console.error('Initialization error:', error);
            alert('Error initializing app: ' + error.message);
        }
    }

    setupEventListeners() {
        // Login form
        const loginForm = document.getElementById('loginForm');
        loginForm.addEventListener('submit', (e) => this.handleLogin(e));

        // Signup button
        document.getElementById('signupBtn').addEventListener('click', () => this.handleSignup());

        // Logout button
        document.getElementById('logoutBtn').addEventListener('click', () => this.handleLogout());

        // Note form
        const noteForm = document.getElementById('noteForm');
        noteForm.addEventListener('submit', (e) => this.handleCreateNote(e));

        // Search
        document.getElementById('searchNotes').addEventListener('input', (e) => this.handleSearch(e));

        // Modal close
        document.querySelector('.close').addEventListener('click', () => this.closeModal());
        window.addEventListener('click', (e) => {
            const modal = document.getElementById('noteModal');
            if (e.target === modal) {
                this.closeModal();
            }
        });
    }

    async handleLogin(e) {
        e.preventDefault();
        
        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;
        const isAdmin = document.getElementById('isAdmin').checked;

        try {
            await authManager.login(username, password, isAdmin);
            this.showDashboard();
            document.getElementById('loginForm').reset();
        } catch (error) {
            alert(error.message);
        }
    }

    async handleSignup() {
        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;
        const isAdmin = document.getElementById('isAdmin').checked;

        if (!username || !password) {
            alert('Please enter username and password');
            return;
        }

        try {
            await authManager.signup(username, password, isAdmin);
            alert('Account created successfully! Please login.');
            document.getElementById('loginForm').reset();
        } catch (error) {
            alert(error.message);
        }
    }

    handleLogout() {
        authManager.logout();
        this.showLogin();
    }

    async handleCreateNote(e) {
        e.preventDefault();

        const title = document.getElementById('noteTitle').value;
        const description = document.getElementById('noteDescription').value;
        const filesInput = document.getElementById('noteFiles');
        const files = Array.from(filesInput.files);
        const author = authManager.getCurrentUser().username;

        if (!title.trim()) {
            alert('Please enter a note title');
            return;
        }

        try {
            await notesManager.createNote(title, description, files, author);
            document.getElementById('noteForm').reset();
            alert('Note created successfully!');
            await this.loadNotes();
        } catch (error) {
            console.error('Error creating note:', error);
            alert('Error creating note: ' + error.message);
        }
    }

    async handleSearch(e) {
        const query = e.target.value;
        const notes = query.trim() 
            ? notesManager.searchNotes(query)
            : await notesManager.getAllNotes();
        this.displayNotes(notes);
    }

    async loadNotes() {
        const notes = await notesManager.getAllNotes();
        this.displayNotes(notes);
    }

    displayNotes(notes) {
        const notesList = document.getElementById('notesList');

        if (notes.length === 0) {
            notesList.innerHTML = `
                <div class="empty-state">
                    <h3>No notes found</h3>
                    <p>Create your first note to get started!</p>
                </div>
            `;
            return;
        }

        notesList.innerHTML = notes.map(note => `
            <div class="note-card" onclick="app.showNoteDetail(${note.id})">
                <h3>${this.escapeHtml(note.title)}</h3>
                <div class="note-meta">
                    By: ${this.escapeHtml(note.author)} 
                    ${note.author === 'admin' ? '<span class="author-badge">Admin</span>' : ''}
                    | Created: ${new Date(note.createdAt).toLocaleDateString()}
                </div>
                <div class="note-description">
                    ${this.escapeHtml(note.description || 'No description')}
                </div>
                ${note.filesCount > 0 ? `
                    <span class="note-files-count">${note.filesCount} file(s)</span>
                ` : ''}
                <div class="note-actions">
                    ${authManager.isAdmin() || note.author === authManager.getCurrentUser().username ? `
                        <button class="btn btn-danger" onclick="app.deleteNote(${note.id}, event)">Delete</button>
                    ` : ''}
                </div>
            </div>
        `).join('');
    }

    async showNoteDetail(noteId) {
        const note = await notesManager.getNote(noteId);
        if (!note) return;

        document.getElementById('modalTitle').textContent = note.title;
        document.getElementById('modalDescription').textContent = note.description || 'No description';
        
        // Display metadata
        const metadata = document.getElementById('modalMetadata');
        metadata.innerHTML = `
            <strong>Author:</strong> ${note.author} ${note.author === 'admin' ? '<span class="author-badge">Admin</span>' : ''}<br>
            <strong>Created:</strong> ${new Date(note.createdAt).toLocaleString()}<br>
            <strong>Updated:</strong> ${new Date(note.updatedAt).toLocaleString()}<br>
            <strong>Files:</strong> ${note.filesCount || 0}
        `;

        // Display files
        const modalFiles = document.getElementById('modalFiles');
        if (note.files && note.files.length > 0) {
            modalFiles.innerHTML = '<h3>Files:</h3>';
            
            for (const file of note.files) {
                const filePreview = await this.createFilePreview(file);
                modalFiles.innerHTML += filePreview;
            }
        } else {
            modalFiles.innerHTML = '<p>No files attached</p>';
        }

        document.getElementById('noteModal').style.display = 'block';
    }

    async createFilePreview(file) {
        const fileExtension = file.name.split('.').pop().toLowerCase();
        const fileSize = notesManager.formatFileSize(file.size);

        let previewHTML = `
            <div class="file-item">
                <h4>${this.escapeHtml(file.name)}</h4>
                <div class="file-info">Type: ${file.type} | Size: ${fileSize}</div>
                <div class="file-preview">
        `;

        // Create preview based on file type
        if (fileExtension === 'txt') {
            try {
                const blob = notesManager.base64ToBlob(file.data, file.type);
                const text = await new Promise((resolve) => {
                    const reader = new FileReader();
                    reader.onload = (e) => resolve(e.target.result);
                    reader.readAsText(blob);
                });
                previewHTML += `<pre>${this.escapeHtml(text)}</pre>`;
            } catch (error) {
                previewHTML += `<p>Error loading file content</p>`;
            }
        } else if (['mp4', 'avi', 'mov'].includes(fileExtension)) {
            previewHTML += `<video controls><source src="${file.data}" type="${file.type}"></video>`;
        } else if (fileExtension === 'pdf') {
            previewHTML += `<iframe src="${file.data}"></iframe>`;
        } else if (['ppt', 'pptx', 'doc', 'docx'].includes(fileExtension)) {
            previewHTML += `
                <p>This file type cannot be previewed in browser</p>
                <a href="${file.data}" download="${file.name}" class="file-link">Download File</a>
            `;
        } else {
            previewHTML += `
                <p>File preview not available</p>
                <a href="${file.data}" download="${file.name}" class="file-link">Download File</a>
            `;
        }

        previewHTML += `</div></div>`;
        return previewHTML;
    }

    closeModal() {
        document.getElementById('noteModal').style.display = 'none';
    }

    async deleteNote(noteId, event) {
        event.stopPropagation();
        
        if (!confirm('Are you sure you want to delete this note?')) {
            return;
        }

        try {
            await notesManager.deleteNote(noteId);
            await this.loadNotes();
            alert('Note deleted successfully!');
        } catch (error) {
            console.error('Error deleting note:', error);
            alert('Error deleting note: ' + error.message);
        }
    }

    showLogin() {
        document.getElementById('loginSection').style.display = 'block';
        document.getElementById('dashboardSection').style.display = 'none';
        document.getElementById('logoutBtn').style.display = 'none';
        document.getElementById('userInfo').textContent = '';
    }

    async showDashboard() {
        document.getElementById('loginSection').style.display = 'none';
        document.getElementById('dashboardSection').style.display = 'block';
        
        const user = authManager.getCurrentUser();
        document.getElementById('userInfo').textContent = `Logged in as: ${user.username} (${user.role})`;
        document.getElementById('logoutBtn').style.display = 'block';
        
        // Update create note title
        const createNoteTitle = document.getElementById('createNoteTitle');
        createNoteTitle.textContent = authManager.isAdmin() 
            ? 'Create/Upload Note (Admin)' 
            : 'Create New Note';
        
        // Show/hide file upload based on user role
        const fileUploadGroup = document.getElementById('fileUploadGroup');
        fileUploadGroup.style.display = authManager.isAdmin() || user.role === 'admin' ? 'block' : 'block';
        
        await this.loadNotes();
    }

    escapeHtml(text) {
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }
}

// Initialize app when DOM is loaded
let app;
document.addEventListener('DOMContentLoaded', () => {
    app = new App();
});

