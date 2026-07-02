# 🚀 GitHub Pages Quick Start - 5 Phút Deploy!

## ✅ Prerequisites

- Unity 2021.3 LTS đã cài
- Game đã build xong
- GitHub account

## 📦 Bước 1: Build Game (trong Unity)

```
1. File → Build Settings
2. Platform: WebGL
3. Player Settings:
   - Compression Format: Gzip ✅
   - Code Stripping: High
   
4. Click "Build"
5. Choose folder: "Build" (QUAN TRỌNG!)
6. Wait 5-15 minutes...
7. Done! ✅
```

Kiểm tra folder Build có:
- ✅ index.html
- ✅ Build/ subfolder
- ✅ TemplateData/ folder

## 🌐 Bước 2: Push to GitHub

### Lần đầu tiên:

```bash
# 1. Create repo trên GitHub.com
# Name: rogue-rush (hoặc tên bạn muốn)

# 2. Trong folder project:
git init
git add .
git commit -m "Initial commit - WebGL game"

# 3. Add remote (thay YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/rogue-rush.git

# 4. Push
git branch -M main
git push -u origin main
```

### Lần sau (update build):

**Windows:**
```bash
deploy.bat
```

**Mac/Linux:**
```bash
chmod +x deploy.sh
./deploy.sh
```

Hoặc manual:
```bash
git add Build/
git commit -m "Update build"
git push
```

## ⚙️ Bước 3: Enable GitHub Pages

1. Vào repository trên GitHub
2. **Settings** → **Pages** (menu trái)
3. **Source:** "GitHub Actions" ✅
4. Save

Done! 🎉

## 🎮 Bước 4: Play Your Game!

Sau 2-3 phút, game sẽ live tại:

```
https://YOUR_USERNAME.github.io/rogue-rush/
```

Ví dụ:
```
https://johndoe.github.io/rogue-rush/
```

## 🔍 Check Status

View deployment:
```
https://github.com/YOUR_USERNAME/rogue-rush/actions
```

Nếu có ✅ green checkmark = Success!

## ⚠️ Troubleshooting

### Game không load?

**Check 1: Files đúng chưa?**
```
Build/
├── index.html ✅
├── Build/ ✅
└── TemplateData/ ✅
```

**Check 2: GitHub Pages enabled?**
- Settings → Pages → Source: "GitHub Actions" ✅

**Check 3: Build settings đúng?**
- Compression: Gzip (NOT Brotli)
- Platform: WebGL ✅

**Check 4: Đợi deployment**
- Thường mất 2-5 phút
- Check Actions tab cho status

### 404 Error?

```bash
# Ensure Build folder is pushed
git add Build/
git commit -m "Add Build folder"
git push
```

### Blank page?

```bash
# Test locally first
cd Build
python -m http.server 8000
# Open: http://localhost:8000

# If works locally → push to GitHub
# If doesn't work → rebuild in Unity
```

## 📝 Update Build Workflow

Mỗi khi update game:

```
1. Build lại trong Unity vào folder "Build"
2. Run deploy.bat (Windows) hoặc deploy.sh (Mac/Linux)
3. Đợi 2-3 phút
4. Refresh browser
5. Done! ✅
```

## 🎯 Share Your Game

Add links này vào portfolio:

```markdown
🎮 Live Demo: https://YOUR_USERNAME.github.io/rogue-rush/
📦 Source Code: https://github.com/YOUR_USERNAME/rogue-rush
```

## 📊 Build Settings Tối Ưu

```
Resolution and Presentation:
├── Default Canvas Width: 1280
├── Default Canvas Height: 720
└── WebGL Template: Default

Publishing Settings:
├── Compression Format: Gzip ✅
├── Data Caching: Enabled
└── Enable Exceptions: None

Other Settings:
├── Color Space: Linear
├── Managed Stripping Level: High
└── IL2CPP Code Generation: Faster runtime
```

## 🚀 One-Line Deploy

Sau khi setup xong:

```bash
# Windows
deploy.bat

# Mac/Linux  
./deploy.sh
```

That's it! 🎉

## ✅ Final Checklist

Deploy lần đầu:
- [ ] Unity WebGL build complete
- [ ] Build folder có index.html
- [ ] GitHub repo created
- [ ] Code pushed to GitHub
- [ ] GitHub Pages enabled (Actions)
- [ ] Game accessible via URL

Mỗi lần update:
- [ ] Build trong Unity
- [ ] Run deploy script
- [ ] Wait 2-3 minutes
- [ ] Test live URL

## 🎊 Success!

Game của bạn giờ đã:
- ✅ Hosted FREE trên GitHub Pages
- ✅ HTTPS enabled tự động
- ✅ Fast CDN delivery
- ✅ 100 GB bandwidth/month
- ✅ Accessible worldwide

Share với bạn bè và add vào portfolio! 🎮

---

**Total time: ~5 phút! 🚀**

**Questions? Check [DEPLOY_GUIDE.md](DEPLOY_GUIDE.md) for detailed guide**
