const fs = require('fs');
const path = require('path');

const baseDir = path.join(__dirname, 'src', 'api-admin');

function walk(dir, callback) {
  fs.readdirSync(dir).forEach(f => {
    let dirPath = path.join(dir, f);
    let isDirectory = fs.statSync(dirPath).isDirectory();
    isDirectory ? walk(dirPath, callback) : callback(path.join(dir, f));
  });
}

walk(baseDir, (filePath) => {
  if (filePath.endsWith('.ts')) {
    let content = fs.readFileSync(filePath, 'utf8');

    // Rename Auth to AdminAuth
    if (filePath.includes('admin-auth')) {
        content = content.replace(/Auth/g, 'AdminAuth');
        content = content.replace(/@Controller\(\)/g, "@Controller('api/admin')");
    }
    // Dashboard
    else if (filePath.includes('dashboard')) {
        content = content.replace(/Dashboard/g, 'AdminDashboard');
        content = content.replace(/@Controller\(\)/g, "@Controller('api/admin')");
    }
    // SinhVien
    else if (filePath.includes('sinh-vien')) {
        content = content.replace(/SinhVien/g, 'AdminSinhVien');
        content = content.replace(/@Controller\('sinh-vien'\)/g, "@Controller('api/admin/sinh-vien')");
    }
    // GiangVien
    else if (filePath.includes('giang-vien')) {
        content = content.replace(/GiangVien/g, 'AdminGiangVien');
        content = content.replace(/@Controller\('giang-vien'\)/g, "@Controller('api/admin/giang-vien')");
    }
    // LopHocPhan
    else if (filePath.includes('lop-hoc-phan')) {
        content = content.replace(/LopHocPhan/g, 'AdminLopHocPhan');
        content = content.replace(/@Controller\(\)/g, "@Controller('api/admin')");
    }
    // PhanCongGiangDay
    else if (filePath.includes('phan-cong-giang-day')) {
        content = content.replace(/PhanCongGiangDay/g, 'AdminPhanCongGiangDay');
        content = content.replace(/PhanCongService/g, 'AdminPhanCongGiangDayService');
        content = content.replace(/phanCongService/g, 'adminPhanCongService');
        content = content.replace(/@Controller\(\)/g, "@Controller('api/admin')");
    }
    // SuKien
    else if (filePath.includes('su-kien')) {
        content = content.replace(/SuKien/g, 'AdminSuKien');
        content = content.replace(/@Controller\(\)/g, "@Controller('api/admin')");
    }

    fs.writeFileSync(filePath, content);
  }
});
console.log('Refactoring completed properly');
