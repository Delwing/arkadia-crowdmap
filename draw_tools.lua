acrowdmap.img_path = current_plugin_path .. "/draw_tools/images/" or ""

acrowdmap["draw_tools"] = acrowdmap["draw_tools"] or {
    ["uniButtonsTable"] = {},
    ["uniWindowsTable"] = {},
    ["uniIconsTable"] = {},
    ["uiDefs"] = {},
    ["draw_tools_turned_on"] = nil -- nil if not initialized, false if turned off, true if turned on
}

function alias_func_map_sync_rysuj()
    acrowdmap.draw_tools.draw_tools_switch()
end