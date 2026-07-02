@echo off
REM 🎮 Rogue Rush - Quick Deploy Script for Windows
REM Deploy your WebGL build to GitHub Pages

echo.
echo 🎮 Rogue Rush - GitHub Pages Deployment
echo ========================================
echo.

REM Check if Build folder exists
if not exist "Build" (
    echo ❌ Error: Build folder not found!
    echo 📝 Please build your game in Unity first:
    echo    File → Build Settings → Build → Select 'Build' folder
    pause
    exit /b 1
)

REM Check if index.html exists
if not exist "Build\index.html" (
    echo ❌ Error: Build\index.html not found!
    echo 📝 Please ensure your Unity build is complete
    pause
    exit /b 1
)

echo ✅ Build folder found
echo.

REM Check git status
git rev-parse --git-dir >nul 2>&1
if errorlevel 1 (
    echo 📝 Initializing git repository...
    git init
    git branch -M main
    echo.
)

REM Add and commit
echo 📦 Adding files to git...
git add .

echo 💾 Committing changes...
set COMMIT_MSG=WebGL build update - %date% %time%
git commit -m "%COMMIT_MSG%"

echo.
echo 🚀 Pushing to GitHub...

REM Check if remote exists
git remote | findstr "origin" >nul
if errorlevel 1 (
    echo.
    echo ⚠️  No remote repository configured!
    echo 📝 Please add your GitHub repository:
    echo.
    echo    git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
    echo.
    echo Then run this script again.
    pause
    exit /b 1
)

git push origin main

echo.
echo ✅ Deployment complete!
echo.
echo 🌐 Your game will be live in 2-3 minutes at:
echo    https://YOUR_USERNAME.github.io/YOUR_REPO/
echo.
echo 📊 Check deployment status:
echo    https://github.com/YOUR_USERNAME/YOUR_REPO/actions
echo.
echo 🎯 Don't forget to enable GitHub Pages in repository settings!
echo    Settings → Pages → Source: GitHub Actions
echo.
pause
