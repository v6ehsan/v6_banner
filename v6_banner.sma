//|===================================================================================|
//|       ██╗░░░██╗░█████╗░    ███████╗██╗░░██╗░██████╗░█████╗░███╗░░██╗              |
//|       ██║░░░██║██╔═══╝░    ██╔════╝██║░░██║██╔════╝██╔══██╗████╗░██║              |
//|       ╚██╗░██╔╝██████╗░    █████╗░░███████║╚█████╗░███████║██╔██╗██║              |
//|       ░╚████╔╝░██╔══██╗    ██╔══╝░░██╔══██║░╚═══██╗██╔══██║██║╚████║              |
//|       ░░╚██╔╝░░╚█████╔╝    ███████╗██║░░██║██████╔╝██║░░██║██║░╚███║              |
//|       ░░░╚═╝░░░░╚════╝░    ╚══════╝╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝╚═╝░░╚══╝              |
//|===================================================================================|
//|=========----|_ Dynamic Live Info (ServerName , Map , Slots) _|----================|
//|===================================================================================|
// Developed & Personalized by: V6 EhSaN
// Optimized, Non-Conflicting, and Lightweight
//------------------------------
#include <amxmodx>
#include <amxmisc>
//------------------------------

//===================================================================================|
//===============----|_ ColorMode Guide (1–9) _|----=========================|
//===================================================================================|
// 1 = Purple Neon (Default)
// 2 = Red Neon
// 3 = Blue Neon
// 4 = Green Neon
// 5 = Yellow / Gold
// 6 = Cyan / Light Blue
// 7 = Pink / Magenta
// 8 = Orange
// 9 = White Neon
//---------------v--------------

// Set color using number 1–9
new ColorMode = 1;

new Float:g_phase;
new bool:g_fadeIn = true;
new Float:g_alpha = 0.0;

new g_hostname[64];
new g_lastHostname[64];


public plugin_init()
{
    register_plugin("Dynamic Neon Banner", "v2.0", "V6 EhSaN");

    // get initial hostname
    get_cvar_string("hostname", g_hostname, charsmax(g_hostname));
    copy(g_lastHostname, charsmax(g_lastHostname), g_hostname);

    // smooth neon animation every 0.08 sec
    set_task(0.08, "ShowBanner", _, _, _, "b");
}
//------------------------------


//===================================================================================|
//================----|_ Show Neon Banner _|----============================|
//===================================================================================|
public ShowBanner()
{
    g_phase += 0.18;
    if (g_phase > 6.28) g_phase = 0.0;

    new r, g, b;
    switch (ColorMode)
    {
        case 1: { r = floatround(200 + 55 * floatsin(g_phase)); g = floatround(60 + 25 * floatcos(g_phase)); b = 255; }
        case 2: { r = 255; g = floatround(40 + 30 * floatsin(g_phase)); b = floatround(40 + 20 * floatcos(g_phase)); }
        case 3: { r = floatround(40 + 30 * floatsin(g_phase)); g = floatround(60 + 20 * floatsin(g_phase)); b = 255; }
        case 4: { r = floatround(40 + 30 * floatsin(g_phase)); g = 255; b = floatround(40 + 20 * floatsin(g_phase)); }
        case 5: { r = 255; g = 220; b = floatround(40 + 20 * floatsin(g_phase)); }
        case 6: { r = floatround(40 + 20 * floatsin(g_phase)); g = 255; b = 255; }
        case 7: { r = 255; g = floatround(40 + 20 * floatsin(g_phase)); b = 255; }
        case 8: { r = 255; g = 140; b = floatround(40 + 20 * floatsin(g_phase)); }
        case 9: { r = 255; g = 255; b = 255; }
    }

    // Pulse Fade Effect
    if (g_fadeIn) g_alpha += 0.10; else g_alpha -= 0.10;
    if (g_alpha >= 1.0) { g_alpha = 1.0; g_fadeIn = false; }
    else if (g_alpha <= 0.0) { g_alpha = 0.0; g_fadeIn = true; }

    new adjusted_r = floatround(r * g_alpha);
    new adjusted_g = floatround(g * g_alpha);
    new adjusted_b = floatround(b * g_alpha);

    // check hostname update
    get_cvar_string("hostname", g_hostname, charsmax(g_hostname));
    if (!equal(g_hostname, g_lastHostname))
    {
        copy(g_lastHostname, charsmax(g_lastHostname), g_hostname);
    }

    // dynamic map / players / hostname
    new mapname[32], players, maxplayers;
    get_mapname(mapname, charsmax(mapname));
    players = get_playersnum();
    maxplayers = get_maxplayers();

    new infoText[160];
    format(infoText, charsmax(infoText), "%s | Map: %s | Players: %d/%d", g_lastHostname, mapname, players, maxplayers);

    set_hudmessage(adjusted_r, adjusted_g, adjusted_b, -1.0, 0.07, 2, 0.05, 0.05, 0.05, 0.05, 3);
    show_hudmessage(0, infoText);
}
//------------------------------
