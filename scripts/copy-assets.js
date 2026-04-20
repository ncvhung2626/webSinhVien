const fs = require('fs');
const path = require('path');

function copyFolderSync(from, to) {
    if (!fs.existsSync(to)) {
        fs.mkdirSync(to, { recursive: true });
    }
    fs.readdirSync(from).forEach(element => {
        const stat = fs.lstatSync(path.join(from, element));
        if (stat.isFile()) {
            fs.copyFileSync(path.join(from, element), path.join(to, element));
        } else if (stat.isDirectory()) {
            copyFolderSync(path.join(from, element), path.join(to, element));
        }
    });
}

const source = path.join(__dirname, '..', 'public');
const destination = path.join(__dirname, '..', 'dist');

console.log(`Copying assets from ${source} to ${destination}...`);

try {
    copyFolderSync(source, destination);
    console.log('Assets copied successfully!');
} catch (err) {
    console.error('Error copying assets:', err);
    process.exit(1);
}
