// Notes Manager
class NotesManager {
    constructor() {
        this.notes = [];
    }

    async createNote(title, description, files, author) {
        // Save note
        const note = {
            title: title,
            description: description,
            author: author,
            filesCount: files.length,
            createdAt: new Date().toISOString(),
            updatedAt: new Date().toISOString()
        };

        const noteId = await notesDB.saveNote(note);

        // Save files
        for (const file of files) {
            await this.saveFile(file, noteId);
        }

        return noteId;
    }

    async saveFile(file, noteId) {
        return new Promise((resolve, reject) => {
            const reader = new FileReader();

            reader.onload = async (event) => {
                const fileData = {
                    noteId: noteId,
                    name: file.name,
                    type: file.type,
                    size: file.size,
                    data: event.target.result, // Base64 encoded data
                    uploadedAt: new Date().toISOString()
                };

                try {
                    await notesDB.saveFile(fileData);
                    resolve(fileData);
                } catch (error) {
                    reject(error);
                }
            };

            reader.onerror = () => reject(reader.error);
            
            // Read file as data URL (base64)
            reader.readAsDataURL(file);
        });
    }

    async getAllNotes() {
        this.notes = await notesDB.getAllNotes();
        
        // Load files for each note
        for (const note of this.notes) {
            note.files = await notesDB.getFilesByNoteId(note.id);
        }
        
        return this.notes;
    }

    async deleteNote(noteId) {
        await notesDB.deleteNote(noteId);
        this.notes = this.notes.filter(note => note.id !== noteId);
    }

    async getNote(noteId) {
        const note = await notesDB.getNote(noteId);
        if (note) {
            note.files = await notesDB.getFilesByNoteId(noteId);
        }
        return note;
    }

    searchNotes(query) {
        const lowerQuery = query.toLowerCase();
        return this.notes.filter(note => 
            note.title.toLowerCase().includes(lowerQuery) ||
            note.description.toLowerCase().includes(lowerQuery) ||
            note.author.toLowerCase().includes(lowerQuery)
        );
    }

    // File preview helpers
    getFilePreview(file) {
        const fileExtension = file.name.split('.').pop().toLowerCase();
        
        switch (fileExtension) {
            case 'txt':
                return this.previewTextFile(file);
            case 'pdf':
                return this.previewPDFFile(file);
            case 'mp4':
            case 'avi':
            case 'mov':
                return this.previewVideoFile(file);
            case 'ppt':
            case 'pptx':
                return this.previewPPTFile(file);
            case 'doc':
            case 'docx':
                return this.previewWordFile(file);
            default:
                return this.previewGenericFile(file);
        }
    }

    previewTextFile(file) {
        return new Promise((resolve) => {
            const reader = new FileReader();
            reader.onload = (e) => {
                const text = e.target.result;
                resolve({
                    type: 'text',
                    content: text,
                    name: file.name
                });
            };
            reader.readAsText(new Blob([this.base64ToBlob(file.data, file.type)]));
        });
    }

    previewPDFFile(file) {
        return {
            type: 'pdf',
            url: file.data,
            name: file.name
        };
    }

    previewVideoFile(file) {
        return {
            type: 'video',
            url: file.data,
            name: file.name
        };
    }

    previewPPTFile(file) {
        return {
            type: 'ppt',
            url: file.data,
            name: file.name
        };
    }

    previewWordFile(file) {
        return {
            type: 'word',
            url: file.data,
            name: file.name
        };
    }

    previewGenericFile(file) {
        return {
            type: 'generic',
            url: file.data,
            name: file.name,
            size: this.formatFileSize(file.size)
        };
    }

    base64ToBlob(base64, mimeType) {
        const byteCharacters = atob(base64.split(',')[1]);
        const byteNumbers = new Array(byteCharacters.length);
        for (let i = 0; i < byteCharacters.length; i++) {
            byteNumbers[i] = byteCharacters.charCodeAt(i);
        }
        const byteArray = new Uint8Array(byteNumbers);
        return new Blob([byteArray], { type: mimeType });
    }

    formatFileSize(bytes) {
        if (bytes === 0) return '0 Bytes';
        const k = 1024;
        const sizes = ['Bytes', 'KB', 'MB', 'GB'];
        const i = Math.floor(Math.log(bytes) / Math.log(k));
        return Math.round(bytes / Math.pow(k, i) * 100) / 100 + ' ' + sizes[i];
    }
}

// Create global notes manager instance
const notesManager = new NotesManager();

