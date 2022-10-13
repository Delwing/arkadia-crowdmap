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