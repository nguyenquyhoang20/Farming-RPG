# 🎮 WebGL Build Folder

## 📦 This folder contains your Unity WebGL build

After building your game in Unity, this folder should contain:

```
Build/
├── index.html              # Main HTML file
├── Build/                  # Game data folder
│   ├── Build.data.gz       # Game assets
│   ├── Build.framework.js.gz
│   ├── Build.loader.js     # WebGL loader
│   └── Build.wasm.gz       # WebAssembly
└── TemplateData/          # UI assets
    ├── style.css
    ├── favicon.ico
    └── ... (icons, etc.)
```

## 🚀 How to Build

1. Open your Unity project
2. **File → Build Settings**
3. Select **WebGL** platform
4. Click **Build**
5. **Choose this `Build` folder** as the output location
6. Wait for build to complete (5-15 minutes)

## 🌐 Deploy to GitHub Pages

After building:

```bash
# Windows
deploy.bat

# Mac/Linux
chmod +x deploy.sh
./deploy.sh
```

Or manually:

```bash
git add Build/
git commit -m "Update WebGL build"
git push origin main
```

## ✅ Verify Build

Your build is ready when you have:
- ✅ index.html file
- ✅ Build/ subfolder with .data.gz and .wasm.gz files
- ✅ TemplateData/ folder with style.css

## 🧪 Test Locally

Before deploying, test locally:

```bash
# Python
cd Build
python -m http.server 8000

# Node.js
npx http-server Build -p 8000

# Then open: http://localhost:8000
```

**⚠️ Important:** 
- Do NOT double-click index.html
- Must use a web server
- file:// protocol doesn't work with WebGL

## 📝 Build Settings

Recommended Unity WebGL settings:

```
Player Settings:
├── Resolution and Presentation
│   ├── Default Canvas Width: 1280
│   └── Default Canvas Height: 720
├── Publishing Settings
│   ├── Compression Format: Gzip ✅
│   ├── Enable Exceptions: None
│   └── Data Caching: Enabled
└── Other Settings
    ├── Managed Stripping Level: High
    └── Code Optimization: Size
```

## 🎯 After Deploy

Your game will be live at:
```
https://YOUR_USERNAME.github.io/YOUR_REPO/
```

Check deployment status:
```
https://github.com/YOUR_USERNAME/YOUR_REPO/actions
```

---

**See [DEPLOY_GUIDE.md](../DEPLOY_GUIDE.md) for detailed instructions**
