# Notes App - Quizoria

यह एक comprehensive Notes Application है जो HTML, CSS, और JavaScript का उपयोग करके बनाया गया है।

## Features

### User Features:
- ✅ User और Admin दोनों notes create कर सकते हैं
- ✅ Admin multiple files upload कर सकता है (PPTs, TXT, Videos, Word files, etc.)
- ✅ सभी notes को systematically database में store किया जाता है
- ✅ Notes को search और filter कर सकते हैं
- ✅ File preview functionality (videos, text files, PDFs)
- ✅ User authentication system

### Supported File Types:
- 📄 Text Files (.txt)
- 📊 PowerPoint (.ppt, .pptx)
- 📝 Word Documents (.doc, .docx)
- 🎥 Videos (.mp4, .avi, .mov)
- 📑 PDF Files (.pdf)
- और भी कई file types

## How to Use

### Installation:
1. `NotesApp` folder को browser में खोलें
2. `index.html` file को browser में open करें
3. कोई server की जरूरत नहीं - यह directly browser में चलेगा!

### Default Admin Account:
- **Username:** `admin`
- **Password:** `admin123`

### Steps:
1. **Login/Sign Up:**
   - Admin login के लिए checkbox tick करें
   - या नया account बनाएं

2. **Create Note:**
   - Note title और description enter करें
   - Files upload करें (multiple files support)
   - "Create Note" button पर click करें

3. **View Notes:**
   - सभी notes automatically display हो जाएंगे
   - Note पर click करके details देखें
   - Files को preview या download करें

4. **Search:**
   - Search bar में query type करें
   - Notes real-time में filter हो जाएंगे

## Technology Stack

- **Frontend:** HTML5, CSS3, JavaScript (ES6+)
- **Database:** IndexedDB (Browser-based database)
- **Storage:** Local storage for user sessions

## File Structure

```
NotesApp/
├── index.html          # Main HTML file
├── css/
│   └── style.css      # Styling
├── js/
│   ├── database.js    # IndexedDB operations
│   ├── auth.js        # Authentication logic
│   ├── notes.js       # Notes management
│   └── app.js         # Main application controller
└── README.md          # This file
```

## Database Structure

### Users Store:
- username (key)
- password
- role (user/admin)
- createdAt

### Notes Store:
- id (auto-increment)
- title
- description
- author
- filesCount
- createdAt
- updatedAt

### Files Store:
- id (auto-increment)
- noteId
- name
- type
- size
- data (base64 encoded)
- uploadedAt

## Security Note

⚠️ **Important:** यह application educational purposes के लिए है। Production environment में:
- Passwords को hash करना चाहिए (bcrypt, etc.)
- Server-side validation की जरूरत है
- API authentication implement करना चाहिए

## Browser Compatibility

- Chrome/Edge (Recommended)
- Firefox
- Safari
- Opera

(IndexedDB support वाले सभी modern browsers में काम करेगा)

## Online Deployment (Code Online Karne Ke Liye)

### ⚡ सबसे आसान तरीका - Netlify:

1. **Netlify पर जाएं:**
   - https://app.netlify.com/drop पर जाएं
   - (या https://www.netlify.com पर sign up करें)

2. **Deploy करें:**
   - पूरा `NotesApp` folder को drag & drop करें
   - 30 seconds में आपका site live हो जाएगा!

3. **URL मिलेगा:**
   - Netlify automatically एक URL देगा
   - Example: `amazing-notes-app-123.netlify.app`

**वोही! बस इतना ही!** 🚀

### दूसरे तरीके:
- **Vercel:** https://vercel.com (GitHub से deploy)
- **GitHub Pages:** Repository बनाकर deploy
- **Firebase Hosting:** Google Firebase use करें
- **Surge.sh:** Command line से quick deploy

📖 Detailed guide के लिए `DEPLOYMENT.md` file देखें

---

## Future Enhancements

- Cloud storage integration
- Real-time collaboration
- Categories/Tags for notes
- Rich text editor
- File versioning
- Export notes functionality

