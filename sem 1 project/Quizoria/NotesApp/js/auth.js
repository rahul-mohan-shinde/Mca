// Authentication Manager
class AuthManager {
    constructor() {
        this.currentUser = null;
        this.isInitialized = false;
    }

    async init() {
        if (this.isInitialized) return;
        
        // Initialize database
        await notesDB.init();
        
        // Check for existing session
        const savedUser = localStorage.getItem('currentUser');
        if (savedUser) {
            this.currentUser = JSON.parse(savedUser);
        }

        // Create default admin if not exists
        await this.createDefaultAdmin();
        
        this.isInitialized = true;
    }

    async createDefaultAdmin() {
        const admin = await notesDB.getUser('admin');
        if (!admin) {
            await notesDB.saveUser({
                username: 'admin',
                password: 'admin123', // In production, this should be hashed
                role: 'admin',
                createdAt: new Date().toISOString()
            });
        }
    }

    async signup(username, password, isAdmin = false) {
        // Check if user exists
        const existingUser = await notesDB.getUser(username);
        if (existingUser) {
            throw new Error('Username already exists');
        }

        // Create new user
        const user = {
            username: username,
            password: password, // In production, this should be hashed
            role: isAdmin ? 'admin' : 'user',
            createdAt: new Date().toISOString()
        };

        await notesDB.saveUser(user);
        return user;
    }

    async login(username, password, isAdmin = false) {
        const user = await notesDB.getUser(username);
        
        if (!user) {
            throw new Error('User not found');
        }

        if (user.password !== password) {
            throw new Error('Incorrect password');
        }

        // Check role if admin login is requested
        if (isAdmin && user.role !== 'admin') {
            throw new Error('Admin access required');
        }

        this.currentUser = user;
        localStorage.setItem('currentUser', JSON.stringify(user));
        return user;
    }

    logout() {
        this.currentUser = null;
        localStorage.removeItem('currentUser');
    }

    isAuthenticated() {
        return this.currentUser !== null;
    }

    isAdmin() {
        return this.currentUser && this.currentUser.role === 'admin';
    }

    getCurrentUser() {
        return this.currentUser;
    }
}

// Create global auth instance
const authManager = new AuthManager();

