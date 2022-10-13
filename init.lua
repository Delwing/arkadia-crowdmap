acrowdmap = acrowdmap or {}

if table.contains(getPackages(),"map_sync") then
    uninstallPackage("map_sync")
    scripts:print_log("Map Sync nie jest juz potrzebny.")
end

if table.contains(scripts.plugins, "arkadia-mapsync") then
    scripts.plugins_installer:uninstall("arkadia-mapsync")
    scripts:print_log("Map Sync nie jest juz potrzebny.")
end

scripts.plugins_update_check:github_check_version("arkadia-crowdmap", "Delwing")

function alias_func_map_sync_mapsync_help()
    cecho("\n                     <tomato>Arkadia Crowdmap     \n")
    echo("                     --------------     \n")
    echo("\n")
    echo("  Pomoc, komendy i opis dzialania na tej stronie: ")
    cechoLink("<cornflower_blue>tutaj<reset>", function() openUrl("https://github.com/Delwing/arkadia-mapa/wiki") end, "klik", true)
    echo("\n")
    echo("\n")
end

return {
    "base64",
    "upload",
    "github",
    "draw_tools",
    "draw_tools",
    "draw_tools/Universal Button Core",
    "draw_tools/Universal Container Core",
    "draw_tools/Universal Icon",
    "draw_tools/Buttons defined",
    "draw_tools/button_listener",
    "draw_tools/gui/main",
    "draw_tools/gui/mapper tools",
    "draw_tools/gui/switch"
}