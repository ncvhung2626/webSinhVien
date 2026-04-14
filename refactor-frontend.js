const fs = require('fs');
const path = require('path');

const baseDir = path.join(__dirname, 'public', 'admin');

function walk(dir, callback) {
  fs.readdirSync(dir).forEach(f => {
    let dirPath = path.join(dir, f);
    let isDirectory = fs.statSync(dirPath).isDirectory();
    if (isDirectory) {
        if (!dirPath.includes('vendor')) walk(dirPath, callback);
    } else {
        callback(path.join(dir, f));
    }
  });
}

walk(baseDir, (filePath) => {
  if (filePath.endsWith('.js') || filePath.endsWith('.html')) {
    let content = fs.readFileSync(filePath, 'utf8');

    // Replace absolute URLs with relative ones mapped to /api/admin/
    // Ex: http://localhost:3000/sinh-vien -> /api/admin/sinh-vien
    content = content.replace(/http:\/\/localhost:3000\/?/g, '/api/admin/');

    // In login.html, redirection index2.html should be index.html or admin/index.html
    if (filePath.endsWith('login.html')) {
        content = content.replace(/'index2\.html'/g, "'index.html'");
        content = content.replace(/"index2\.html"/g, '"index.html"');
    }

    fs.writeFileSync(filePath, content);
  }
});

// Rename index2.html to index.html
const index2Path = path.join(baseDir, 'index2.html');
const indexPath = path.join(baseDir, 'index.html');
if (fs.existsSync(index2Path)) {
    if (fs.existsSync(indexPath)) {
        fs.unlinkSync(indexPath);
    }
    fs.renameSync(index2Path, indexPath);
}

console.log('Frontend refactoring completed');
