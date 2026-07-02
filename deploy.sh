#!/bin/bash

# 🎮 Rogue Rush - Quick Deploy Script
# Deploy your WebGL build to GitHub Pages

echo "🎮 Rogue Rush - GitHub Pages Deployment"
echo "========================================"
echo ""

# Check if Build folder exists
if [ ! -d "Build" ]; then
    echo "❌ Error: Build folder not found!"
    echo "📝 Please build your game in Unity first:"
    echo "   File → Build Settings → Build → Select 'Build' folder"
    exit 1
fi

# Check if index.html exists
if [ ! -f "Build/index.html" ]; then
    echo "❌ Error: Build/index.html not found!"
    echo "📝 Please ensure your Unity build is complete"
    exit 1
fi

echo "✅ Build folder found"
echo ""

# Check git status
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "📝 Initializing git repository..."
    git init
    git branch -M main
    echo ""
fi

# Add and commit
echo "📦 Adding files to git..."
git add .

echo "💾 Committing changes..."
COMMIT_MSG="WebGL build update - $(date '+%Y-%m-%d %H:%M:%S')"
git commit -m "$COMMIT_MSG"

echo ""
echo "🚀 Pushing to GitHub..."

# Check if remote exists
if ! git remote | grep -q "origin"; then
    echo ""
    echo "⚠️  No remote repository configured!"
    echo "📝 Please add your GitHub repository:"
    echo ""
    echo "   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git"
    echo ""
    echo "Then run this script again."
    exit 1
fi

git push origin main

echo ""
echo "✅ Deployment complete!"
echo ""
echo "🌐 Your game will be live in 2-3 minutes at:"
echo "   https://YOUR_USERNAME.github.io/YOUR_REPO/"
echo ""
echo "📊 Check deployment status:"
echo "   https://github.com/YOUR_USERNAME/YOUR_REPO/actions"
echo ""
echo "🎯 Don't forget to enable GitHub Pages in repository settings!"
echo "   Settings → Pages → Source: GitHub Actions"
echo ""
