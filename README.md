# Dynamic Neon Banner v1.0.0

### 🌈 Overview
A stylish and lightweight AMXX plugin that displays a **single-line neon banner** at the top of the screen.  
It shows your **server name, map, and player count** in a glowing **purple-blue neon effect** with smooth light pulsing —  
perfect for modern servers and tournament setups.

---

## ✨ Features

✅ One-line dynamic info:  
`★ Evan Server | Match ★ | Map: de_dust2 | Players: 8/32`

✅ 100% clean and safe code — no backdoors.

✅ Smooth neon pulse animation (purple-blue gradient)  
✅ Lightweight & HUD-safe (no overlaps or flicker)  
✅ Auto-updates live map and player info  
✅ Centered on top of the screen  
✅ Fully customizable (colors, speed, layout)  
✅ Works on all GoldSrc servers (CS 1.6, Condition Zero, HLDM)

---

## ⚙️ Requirements

| Dependency | Version | Description |
|-------------|----------|-------------|
| **AMX Mod X** | `1.9.0+` | Required for plugin to compile and run |
| **ReHLDS / ReGameDLL_CS** | *(optional but recommended)* | Improves performance and HUD refresh |
| **Compiler** | `AMXX Studio` or `amxxpc.exe` | To compile the `.sma` source into `.amxx` |

---

## 📦 Installation

1. Copy the file:
   ```
   v6_banner.amxx
   ```
   into:
   ```
   cstrike/addons/amxmodx/plugins/
   ```

2. Edit:
   ```
   cstrike/addons/amxmodx/configs/plugins.ini
   ```
   and add this line:
   ```
   v6_banner.amxx
   ```

3. Restart your server or change map.

---

## 🧩 Configuration

You can modify the following values in the `.sma` file before compiling:

| Variable | Description | Default |
|-----------|--------------|----------|
| `set_task(0.08, ...)` | Neon pulse update speed | `0.08 sec` |
| `0.07` (HUD Y-pos) | Vertical position of banner | `0.07` |
| `r, g, b` formula | Base color wave | Purple tone |

Example snippet:
```c
set_hudmessage(adjusted_r, adjusted_g, adjusted_b, -1.0, 0.07, 2, 0.05, 0.05, 0.05, 0.05, 3)
```

---

## 👑 Credits

**Developer:** V6 EHSAN  
**Design Concept:** Evan Server Project  
**Version:** `1.0`  
**Type:** AMXX Plugin  
**Language:** Pawn (AMX Mod X)  

🧩 “Lightweight. Elegant. Neon-powered.”

---

## 🌐 Links

🔗 **Discord:** [Join Server](https://discord.com/invite/ENMnprrc8Y)  
🔗 **GitHub:** [v6_banner](https://github.com/itsV6/v6_banner_v4.2)  
🔗 **YouTube:** [@v6ehsan](https://www.youtube.com/@v6ehsan)

---

## 📄 License

This plugin is **free to use and modify** for non-commercial projects.  
Please keep credits to `V6 EHSAN` when sharing or editing.

---

© 2025 — V6 EHSAN | Evan Server Project
