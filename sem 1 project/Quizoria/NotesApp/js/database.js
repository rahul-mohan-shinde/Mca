// IndexedDB Database Manager
class NotesDatabase {
    constructor() {
        this.dbName = 'NotesAppDB';
        this.dbVersion = 1;
        this.db = null;
    }

    // Initialize database
    async init() {
        return new Promise((resolve, reject) => {
            const request = indexedDB.open(this.dbName, this.dbVersion);

            request.onerror = () => reject(request.error);
            request.onsuccess = () => {
                this.db = request.result;
                resolve(this.db);
            };

            request.onupgradeneeded = (event) => {
                const db = event.target.result;

                // Users store
                if (!db.objectStoreNames.contains('users')) {
                    const userStore = db.createObjectStore('users', { keyPath: 'username' });
                    userStore.createIndex('username', 'username', { unique: true });
                }

                // Notes store
                if (!db.objectStoreNames.contains('notes')) {
                    const notesStore = db.createObjectStore('notes', { keyPath: 'id', autoIncrement: true });
                    notesStore.createIndex('title', 'title', { unique: false });
                    notesStore.createIndex('author', 'author', { unique: false });
                    notesStore.createIndex('createdAt', 'createdAt', { unique: false });
                }

                // Files store
                if (!db.objectStoreNames.contains('files')) {
                    const filesStore = db.createObjectStore('files', { keyPath: 'id', autoIncrement: true });
                    filesStore.createIndex('noteId', 'noteId', { unique: false });
                }
            };
        });
    }

    // User operations
    async saveUser(user) {
        const transaction = this.db.transaction(['users'], 'readwrite');
        const store = transaction.objectStore('users');
        return store.put(user);
    }

    async getUser(username) {
        return new Promise((resolve, reject) => {
            const transaction = this.db.transaction(['users'], 'readonly');
            const store = transaction.objectStore('users');
            const request = store.get(username);

            request.onsuccess = () => resolve(request.result);
            request.onerror = () => reject(request.error);
        });
    }

    async getAllUsers() {
        return new Promise((resolve, reject) => {
            const transaction = this.db.transaction(['users'], 'readonly');
            const store = transaction.objectStore('users');
            const request = store.getAll();

            request.onsuccess = () => resolve(request.result);
            request.onerror = () => reject(request.error);
        });
    }

    // Note operations
    async saveNote(note) {
        return new Promise((resolve, reject) => {
            const transaction = this.db.transaction(['notes'], 'readwrite');
            const store = transaction.objectStore('notes');
            
            note.createdAt = note.createdAt || new Date().toISOString();
            note.updatedAt = new Date().toISOString();
            
            const request = store.add(note);

            request.onsuccess = () => resolve(request.result);
            request.onerror = () => reject(request.error);
        });
    }

    async getNote(id) {
        return new Promise((resolve, reject) => {
            const transaction = this.db.transaction(['notes'], 'readonly');
            const store = transaction.objectStore('notes');
            const request = store.get(id);

            request.onsuccess = () => resolve(request.result);
            request.onerror = () => reject(request.error);
        });
    }

    async getAllNotes() {
        return new Promise((resolve, reject) => {
            const transaction = this.db.transaction(['notes'], 'readonly');
            const store = transaction.objectStore('notes');
            const request = store.getAll();

            request.onsuccess = () => {
                const notes = request.result;
                // Sort by creation date (newest first)
                notes.sort((a, b) => new Date(b.createdAt) - new Date(a.createdAt));
                resolve(notes);
            };
            request.onerror = () => reject(request.error);
        });
    }

    async deleteNote(id) {
        return new Promise((resolve, reject) => {
            const transaction = this.db.transaction(['notes', 'files'], 'readwrite');
            const noteStore = transaction.objectStore('notes');
            const fileStore = transaction.objectStore('files');
            
            // Delete note
            const deleteNoteRequest = noteStore.delete(id);
            
            // Delete associated files
            const index = fileStore.index('noteId');
            const getFilesRequest = index.getAll(id);
            
            getFilesRequest.onsuccess = () => {
                getFilesRequest.result.forEach(file => {
                    fileStore.delete(file.id);
                });
            };

            deleteNoteRequest.onsuccess = () => resolve();
            deleteNoteRequest.onerror = () => reject(deleteNoteRequest.error);
        });
    }

    // File operations
    async saveFile(fileData) {
        return new Promise((resolve, reject) => {
            const transaction = this.db.transaction(['files'], 'readwrite');
            const store = transaction.objectStore('files');
            const request = store.add(fileData);

            request.onsuccess = () => resolve(request.result);
            request.onerror = () => reject(request.error);
        });
    }

    async getFilesByNoteId(noteId) {
        return new Promise((resolve, reject) => {
            const transaction = this.db.transaction(['files'], 'readonly');
            const store = transaction.objectStore('files');
            const index = store.index('noteId');
            const request = index.getAll(noteId);

            request.onsuccess = () => resolve(request.result);
            request.onerror = () => reject(request.error);
        });
    }

    async getFile(id) {
        return new Promise((resolve, reject) => {
            const transaction = this.db.transaction(['files'], 'readonly');
            const store = transaction.objectStore('files');
            const request = store.get(id);

            request.onsuccess = () => resolve(request.result);
            request.onerror = () => reject(request.error);
        });
    }
}

// Create global database instance
const notesDB = new NotesDatabase();

