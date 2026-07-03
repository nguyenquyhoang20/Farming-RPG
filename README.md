# 🎮 Farming RPG

A Unity 2D Farming RPG game — an educational project built while following a Udemy course. Demonstrates Unity 2D fundamentals, scene management, inventory systems, and more.

[![Deploy to GitHub Pages](https://github.com/nguyenquyhoang20/Farming-RPG/actions/workflows/deploy.yml/badge.svg)](https://github.com/nguyenquyhoang20/Farming-RPG/actions/workflows/deploy.yml)

## 🎯 Play Online

**Live Demo:** [https://nguyenquyhoang20.github.io/Farming-RPG/](https://nguyenquyhoang20.github.io/Farming-RPG/)

## 🎮 Controls

- **WASD** - Move
- **Mouse** - Aim
- **Left Click / Space** - Shoot
- **R** - Reload
- **1, 2, 3** - Switch weapons
- **Mouse Wheel** - Cycle weapons
- **ESC** - Pause

## 🎯 Overview

Rogue Rush is a fast-paced action game designed for WebGL deployment with production-ready architecture. The project demonstrates industry-standard practices including service layer pattern, object pooling, async resource loading, and data-driven design.

## 🛠️ Tech Stack

| Feature | Technology |
|---------|-----------|
| Animation | DOTween |
| Async Operations | UniTask |
| Data Management | ScriptableObjects |
| Resource Loading | Addressables |
| Architecture | SOLID Principles |
| Optimization | Object Pooling + Sprite Atlas |
| Build Target | WebGL |

## 🏗️ Architecture

### Service Layer Pattern
- **AudioService**: Centralized audio management
- **PoolService**: Generic object pooling system
- **LoadingService**: Async scene and asset loading
- **UIService**: UI state management and animations

### Event System
Observer pattern with C# Actions for decoupled communication:
```csharp
public static Action<int> OnScoreChanged;
public static Action<Enemy> OnEnemyDefeated;
```

### Data-Driven Design
ScriptableObjects for designer-friendly tweaking:
- WeaponData
- EnemyData
- WaveData
- LevelConfig

### Pseudo-ECS Pattern
Centralized update managers instead of per-instance Update():
```csharp
EnemyManager.UpdateAll() // Updates all enemies in one call
ProjectileManager.UpdateAll() // Batch processing
```

## ⚡ Optimization Techniques

### Graphics
✅ Sprite Atlas for reduced draw calls  
✅ Compressed textures (ASTC/ETC2)  
✅ Shared materials  
✅ Batching-friendly design  

### CPU
✅ Object pooling (bullets, enemies, VFX)  
✅ Centralized update managers  
✅ Cached component references  

### Memory
✅ Addressables with proper release  
✅ Avoid Instantiate/Destroy spam  
✅ Zero-allocation patterns where possible  

## 🎨 Art Style

**Stylized Low Poly** approach for optimal WebGL performance:
- Flat colors
- Simple geometry
- Minimal shader complexity
- No heavy post-processing

## 🌐 WebGL Build

Optimized build settings:
- Gzip compression enabled
- Stripped engine code
- Minimal WebGL template
- Texture compression
- Code stripping level: High

## 📁 Folder Structure

```
Project/
├── Runtime/
│   ├── Core/              # GameManager, Bootstrap
│   ├── Gameplay/          # Player, Enemy, Weapon
│   ├── UI/                # Menus, HUD, Popups
│   ├── Systems/           # Update managers, spawners
│   ├── Managers/          # Feature-specific managers
│   ├── Services/          # Service layer
│   ├── Data/              # Runtime data structures
│   ├── Pooling/           # Generic pool system
│   └── Utilities/         # Helpers, extensions
├── ScriptableObjects/     # Data assets
├── Addressables/          # Async-loaded assets
├── Art/                   # Sprites, models, materials
├── Audio/                 # Sound effects, music
└── ThirdParty/            # External packages
```

## 🎬 Loading Flow

1. **Boot Scene**: Preload critical assets
2. **Async Loading**: Progress bar with UniTask
3. **Gameplay Scene**: Main game loop

## 🎮 Gameplay Features

### Core Mechanics
- Fast-paced combat
- Wave-based enemy spawning
- Weapon variety with data-driven stats
- Score and combo system

### Polish Features
✅ Floating damage text  
✅ Hit flash feedback  
✅ Screen shake on impact  
✅ Weapon recoil animation  
✅ Combo UI with DOTween  
✅ Animated CTA for playable ads  

## 📱 Playable Ads Flow

```
30s Gameplay
    ↓
Almost Win Moment
    ↓
Fail State
    ↓
CTA Popup (DOTween)
    ↓
"Play Now" Button
```

## 🚀 Getting Started

### For Players
Just visit the [live demo](https://YOUR_USERNAME.github.io/rogue-rush/) and play!

### For Developers

1. Open project in Unity 2021.3 LTS or newer
2. Install required packages:
   - DOTween (via Package Manager)
   - UniTask (via Package Manager)
   - Addressables (via Package Manager)
3. Open `Scenes/Boot` scene
4. Press Play

See [SETUP.md](SETUP.md) for detailed setup instructions.

## 📦 Build Instructions

### Build WebGL

1. File → Build Settings → WebGL
2. Player Settings:
   - Compression: Gzip
   - Code Stripping: High
   - Managed Stripping Level: High
3. Build to `Build/` folder

### Deploy to GitHub Pages

**Quick Deploy:**
```bash
# Windows
deploy.bat

# Mac/Linux
chmod +x deploy.sh
./deploy.sh
```

**Manual Deploy:**
```bash
git add .
git commit -m "Update build"
git push origin main
```

See [DEPLOY_GUIDE.md](DEPLOY_GUIDE.md) for detailed deployment instructions.

## 🎯 Production Mindset

This project demonstrates:
- **Clean Architecture**: Separation of concerns
- **Scalability**: Easy to add new weapons, enemies, levels
- **Maintainability**: Clear folder structure and naming
- **Performance**: Optimization from day one
- **Designer-Friendly**: Data-driven with ScriptableObjects

## 📚 Documentation

- **[README.md](README.md)** - This file
- **[ARCHITECTURE.md](ARCHITECTURE.md)** - Deep dive into architecture
- **[QUICKSTART.md](QUICKSTART.md)** - 5-minute setup guide
- **[SETUP.md](SETUP.md)** - Full setup instructions
- **[GAMEPLAY_GUIDE.md](GAMEPLAY_GUIDE.md)** - Implementation guide
- **[DEPLOY_GUIDE.md](DEPLOY_GUIDE.md)** - GitHub Pages deployment
- **[PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)** - Complete project summary

## 🏆 Features

- ✅ Wave-based combat system
- ✅ Multiple weapons with unique stats
- ✅ Enemy AI with chase and attack
- ✅ Score and combo system
- ✅ Health and ammo management
- ✅ Weapon switching
- ✅ Reload mechanics
- ✅ Camera shake effects
- ✅ Floating damage text
- ✅ Pause menu
- ✅ Game over screen
- ✅ Loading screens
- ✅ Playable ads CTA

## 📚 Credits & Attribution

> **Educational Project Notice**
>
> This game was developed by **Nguyen Quy Hoang** as a learning exercise,
> following a Farming RPG course on **Udemy**.
>
> - **Course Assets** (sprites, audio, artwork): Property of the course instructor. All rights reserved.
> - **Student Code**: Written by me while learning. Shared here for portfolio purposes only.
> - **Not for redistribution or commercial use.**

## 📄 License

See [LICENSE](LICENSE) for details. This is an educational project — course assets belong to their respective owners.

## 📞 Contact

- **GitHub**: [@nguyenquyhoang20](https://github.com/nguyenquyhoang20)

---

**Educational project — Built to learn Unity 2D game development** 🌱

**Play now:** [https://nguyenquyhoang20.github.io/Farming-RPG/](https://nguyenquyhoang20.github.io/Farming-RPG/)
