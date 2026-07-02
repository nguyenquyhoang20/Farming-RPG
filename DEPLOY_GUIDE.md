# 🚀 Deploy to GitHub Pages

## 📦 Build Game trong Unity

### Bước 1: WebGL Build Settings

1. **File → Build Settings**
2. **Switch Platform → WebGL**
3. **Player Settings:**
   ```
   Resolution and Presentation:
   - WebGL Template: Default (hoặc Minimal)
   - Default Canvas Width: 1280
   - Default Canvas Height: 720
   
   Publishing Settings:
   - Compression Format: Gzip
   - Enable Exceptions: None
   - Data Caching: Enabled
   
   Other Settings:
   - Color Space: Linear (nếu không lỗi)
   - Auto Graphics API: Enabled
   - Managed Stripping Level: High
   - IL2CPP Code Generation: Faster runtime
   ```

### Bước 2: Build Game

1. **File → Build Settings → Build**
2. **Chọn folder output: `Build`** (QUAN TRỌNG - phải đặt tên là "Build")
3. **Chờ build hoàn thành** (5-15 phút)
4. **Kiểm tra folder Build có các file:**
   ```
   Build/
   ├── index.html
   ├── Build/
   │   ├── Build.data.gz (hoặc .unityweb)
   │   ├── Build.framework.js.gz
   │   ├── Build.loader.js
   │   └── Build.wasm.gz
   └── TemplateData/
       └── style.css
   ```

## 🌐 Deploy to GitHub

### Bước 1: Create GitHub Repository

1. Vào https://github.com/new
2. Tạo repo mới: `rogue-rush` (hoặc tên bạn muốn)
3. **KHÔNG** check "Add a README file"
4. Create repository

### Bước 2: Push Code lên GitHub

```bash
# Trong folder project của bạn

# Initialize git (nếu chưa có)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit - Rogue Rush WebGL game"

# Add remote (thay YOUR_USERNAME bằng GitHub username của bạn)
git remote add origin https://github.com/YOUR_USERNAME/rogue-rush.git

# Push to main branch
git branch -M main
git push -u origin main
```

### Bước 3: Enable GitHub Pages

1. Vào repository trên GitHub
2. **Settings** → **Pages** (menu bên trái)
3. **Source:** Chọn "GitHub Actions"
4. Save

### Bước 4: Build và Deploy

**Cách 1: Automatic Deploy (Recommended)**

GitHub Actions đã được setup sẵn. Mỗi lần push code:

```bash
# Build game trong Unity vào folder Build/
# Sau đó:
git add Build/
git commit -m "Update WebGL build"
git push
```

GitHub Actions sẽ tự động deploy!

**Cách 2: Manual Deploy**

Nếu không dùng Actions:

1. Settings → Pages
2. Source: Deploy from a branch
3. Branch: main
4. Folder: /Build
5. Save

## 🔗 Access Your Game

Sau khi deploy xong (2-3 phút):

```
https://YOUR_USERNAME.github.io/rogue-rush/
```

Ví dụ:
```
https://johndoe.github.io/rogue-rush/
```

## ⚠️ Common Issues

### Issue 1: Game không load

**Fix: Compression Headers**

GitHub Pages cần config để serve file .gz đúng cách.

Tạo file `.htaccess` trong folder Build:

```apache
<IfModule mod_mime.c>
  AddEncoding gzip .gz
  AddType application/gzip .gz
  
  <FilesMatch "\.data\.gz$">
    AddType application/octet-stream .gz
  </FilesMatch>
  
  <FilesMatch "\.js\.gz$">
    AddType application/javascript .gz
  </FilesMatch>
  
  <FilesMatch "\.wasm\.gz$">
    AddType application/wasm .gz
  </FilesMatch>
</IfModule>
```

### Issue 2: 404 Error

**Kiểm tra:**
- Folder phải tên là "Build" (có chữ B hoa)
- File index.html phải ở trong Build/
- GitHub Pages đã enabled
- Đợi 2-3 phút sau khi enable

### Issue 3: Brotli Compression

Nếu dùng Brotli thay vì Gzip:

```bash
# Trong Unity Build Settings
Compression Format: Brotli

# Sau đó cần config server headers
# GitHub Pages không support Brotli tốt
# → Nên dùng Gzip!
```

**Fix: Chuyển về Gzip**
- Player Settings → Publishing Settings
- Compression Format: Gzip
- Build lại

### Issue 4: CORS Errors

Nếu gặp CORS errors với assets:

1. Đảm bảo tất cả assets trong folder Build/
2. Không load resources từ external URLs
3. Check Console errors trong browser

## 🎮 Test Locally Trước Khi Deploy

```bash
# Option 1: Python
cd Build
python -m http.server 8000

# Option 2: Node.js
npx http-server Build -p 8000

# Option 3: PHP
cd Build
php -S localhost:8000

# Mở browser: http://localhost:8000
```

**QUAN TRỌNG:** 
- Không double-click index.html
- Phải dùng web server
- File:// protocol không work với WebGL

## 📊 GitHub Pages Limits

- ✅ Storage: 1 GB
- ✅ Bandwidth: 100 GB/month
- ✅ Builds: 10 per hour
- ✅ Free hosting
- ✅ HTTPS enabled

**Rogue Rush WebGL build thường:**
- Size: 20-50 MB
- Hoàn toàn OK cho GitHub Pages!

## 🔧 Optimize Build Size

### Compression
```
Player Settings → Publishing Settings:
- Compression Format: Gzip (best for GitHub Pages)
- Code Optimization: Size
```

### Stripping
```
Other Settings:
- Managed Stripping Level: High
- Strip Engine Code: Yes
- Optimization: Size
```

### Assets
```
- Compress textures (ASTC/ETC2)
- Compress audio (Vorbis)
- Use Addressables
- Remove unused assets
```

## 🌟 Custom Domain (Optional)

Nếu muốn dùng domain riêng (ví dụ: roguerush.com):

1. Mua domain (Google Domains, Namecheap, etc.)
2. GitHub Settings → Pages → Custom domain
3. Add CNAME record:
   ```
   CNAME @ YOUR_USERNAME.github.io
   ```
4. Wait for DNS propagation (24-48 hours)

## 📱 Mobile Support

WebGL build này hỗ trợ mobile:

```csharp
// Đã có sẵn trong PlayerController
// Touch controls cho mobile
if (Input.touchCount > 0)
{
    Touch touch = Input.GetTouch(0);
    // Handle touch
}
```

## 🎯 Share Your Game

Sau khi deploy:

```
Portfolio: https://YOUR_USERNAME.github.io/rogue-rush/
GitHub Repo: https://github.com/YOUR_USERNAME/rogue-rush
```

Add vào:
- LinkedIn profile
- Resume/CV
- Portfolio website
- Reddit (r/Unity3D, r/WebGames)
- Twitter
- itch.io (có thể embed)

## 📈 Analytics (Optional)

Thêm Google Analytics vào index.html:

```html
<!-- Trong Build/index.html, trước </head> -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

## ✅ Deployment Checklist

Pre-Deploy:
- [ ] Game tested locally
- [ ] WebGL build hoàn thành
- [ ] Build folder tên "Build"
- [ ] index.html trong Build/
- [ ] File size < 100MB

Deploy:
- [ ] Code pushed to GitHub
- [ ] GitHub Pages enabled
- [ ] GitHub Actions chạy thành công
- [ ] Game accessible via URL

Post-Deploy:
- [ ] Test game trên GitHub Pages
- [ ] Check mobile compatibility
- [ ] Share link với bạn bè
- [ ] Add to portfolio

## 🚀 Quick Deploy Script

Tạo file `deploy.sh`:

```bash
#!/bin/bash

echo "🎮 Deploying Rogue Rush to GitHub Pages..."

# Build đã có trong Unity
# Chỉ cần commit và push

git add Build/
git commit -m "Update WebGL build - $(date)"
git push origin main

echo "✅ Deployed! Check GitHub Actions for status"
echo "🌐 Game will be live at: https://YOUR_USERNAME.github.io/rogue-rush/"
```

Chạy:
```bash
chmod +x deploy.sh
./deploy.sh
```

---

**Happy Deploying! 🎉**

**Game của bạn sẽ live trong vài phút!**
