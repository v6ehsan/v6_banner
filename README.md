# Dynamic Neon Banner (AMX Mod X) 🌈

![Banner Preview](https://i.postimg.cc/9QV9RpCz/p-v6-b-01.png)

**Version:** 2.0.0  
**Author:** V6 EhSaN  
**Community:** DeVzoNe  

A **lightweight, fully dynamic, and non-conflicting AMX Mod X plugin** that displays an animated **neon HUD banner** showing **server name, current map, and player count**.

---

## 🚀 Features

- **Dynamic Server Info**:
  - Server Name (`hostname`) is now dynamic
  - Current Map
  - Players / Max Slots

- **Smooth Neon Animation** with optional **fade-in/out pulse effect**.
- **9 Color Modes** (previously fixed purple)
- Lightweight, **non-conflicting** with other plugins
- Fully customizable and extendable

---

## 🛠 Installation

1. Place the plugin `.amxx` file into:

```
addons/amxmodx/plugins/
```

2. Ensure required libraries are included in your `plugins.ini`:

```
v6_banner.amxx
```

3. Restart the server. The banner will automatically appear for all players.

---

## ⚙ Configuration

- **Set Color Mode** (1–9):

```c
new ColorMode = 1; // 1 = Purple Neon (default)
```

- **Adjust Animation Speed & Fade**:

```c
set_task(0.08, "ShowBanner", _, _, _, "b"); // update interval
g_alpha += 0.10; // fade increment
```

- The plugin automatically updates **hostname, map, and player count**.

---

## 💻 Example Usage

```c
public plugin_init()
{
    register_plugin("Dynamic Neon Banner", "2.0.0", "V6 EhSaN");
    get_cvar_string("hostname", g_hostname, charsmax(g_hostname));
    set_task(0.08, "ShowBanner", _, _, _, "b");
}

public ShowBanner()
{
    // ... plugin code handles neon animation & dynamic info
}
```

---

## 📸 Screenshots

![Banner on Server](https://i.postimg.cc/nrwQ6td0/10-6.jpg)
![Map & Players Info](https://i.postimg.cc/2yXBPfH9/10-7.jpg)

---

## 📝 Changelog

### [2.0.0] - 2025-11-11
- Smooth neon fade-in/out animation added
- Server Name (`hostname`) is now dynamic
- Added 9 Color Modes (previously fixed purple)
- Dynamic server info: Map & Player Count added
- README updated with screenshots and download link
- Fixed channel conflict bugs


### [1.0.0] - 2025-07-20
- Initial release
- Basic neon banner (fixed purple color)

---

## 🙌 Credits

- Developed & Personalized by **V6 EhSaN**  
- Community: **DeVzoNe**

---

## 🌐 Links

🔗 Discord: Join Server  
🔗 GitHub: v6_banner  
🔗 YouTube: @v6ehsan  
🔽 [Download ZIP](https://github.com/USERNAME/dynamic_neon_banner/releases/latest/download/dynamic_neon_banner_v2.0.zip)

---

## 📄 License

This plugin is free to use and modify for **non-commercial projects**.  
Please keep credits to **V6 EhSaN** when sharing or editing.

