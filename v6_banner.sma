// ██╗░░░██╗░█████╗░    ███████╗██╗░░██╗░██████╗░█████╗░███╗░░██╗
// ██║░░░██║██╔═══╝░    ██╔════╝██║░░██║██╔════╝██╔══██╗████╗░██║
// ╚██╗░██╔╝██████╗░    █████╗░░███████║╚█████╗░███████║██╔██╗██║
// ░╚████╔╝░██╔══██╗    ██╔══╝░░██╔══██║░╚═══██╗██╔══██║██║╚████║
// ░░╚██╔╝░░╚█████╔╝    ███████╗██║░░██║██████╔╝██║░░██║██║░╚███║
// ░░░╚═╝░░░░╚════╝░    ╚══════╝╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝╚═╝░░╚══╝
//
// ----------------------------------------------------------
// 💎 EVAN SERVER | MATCH — NEON ONE-LINE PULSE BANNER 💎
// 🌈 Ultra Neon Purple Theme + Smooth Pulse Light Effect
// 🧠 Dynamic Live Info (Map, Players, Slots)
// ⚡ Optimized, Non-Conflicting, and Lightweight
// ✨ Designed & Coded by: V6 EHSAN
// ----------------------------------------------------------
//
// 💬 Description :
// Displays a stylish one-line neon HUD banner at the top of the screen.
//
// 🔹 Shows Server Name + Map + Player Count
// 🔹 Fast Purple Pulse Light Animation
// 🔹 Smooth Fade Effect & HUD-safe
// 🔹 Works on CS 1.6 / HLDS / ReHLDS
// ----------------------------------------------------------

#include <amxmodx>

new Float:g_phase
new bool:g_fadeIn = true
new Float:g_alpha = 0.0

public plugin_init() {
    register_plugin("Neon OneLine Banner", "1.0", "V6 EHSAN")

    // 🔹 Update every 0.08s for smooth neon pulse
    set_task(0.08, "ShowBanner", _, _, _, "b")
}

// ----------------------------------------------------------
// 🌈 Neon Pulse + Dynamic Info (Single Line)
// ----------------------------------------------------------
public ShowBanner() {
    g_phase += 0.18
    if (g_phase > 6.28)
        g_phase = 0.0

    // 💜 Neon purple tone
    new r = floatround(200 + 55 * floatsin(g_phase))
    new g = floatround(60 + 25 * floatcos(g_phase))
    new b = 255

    // 💫 Fast fade-in/out pulse
    if (g_fadeIn)
        g_alpha += 0.10
    else
        g_alpha -= 0.10

    if (g_alpha >= 1.0) {
        g_alpha = 1.0
        g_fadeIn = false
    } else if (g_alpha <= 0.0) {
        g_alpha = 0.0
        g_fadeIn = true
    }

    new adjusted_r = floatround(r * g_alpha)
    new adjusted_g = floatround(g * g_alpha)
    new adjusted_b = floatround(b * g_alpha)

    // 📊 Live server info
    new mapname[32], players, maxplayers
    get_mapname(mapname, charsmax(mapname))
    players = get_playersnum()
    maxplayers = get_maxplayers()

    // 🔹 English info text
    new infoText[160]
    format(infoText, charsmax(infoText), "★ Evan Server | Match ★ | Map: %s | Players: %d/%d", mapname, players, maxplayers)

    // ✨ Display centered at top of the screen
    set_hudmessage(adjusted_r, adjusted_g, adjusted_b, -1.0, 0.07, 2, 0.05, 0.05, 0.05, 0.05, 3)
    show_hudmessage(0, infoText)
}

