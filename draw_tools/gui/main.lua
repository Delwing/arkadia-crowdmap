function acrowdmap.draw_tools.init_main_icons()

    -- main icons --
    -- tools
    local uiDefs = acrowdmap.draw_tools.uiDefs

    uiDefs.iconToolsVisible = true
    uiDefs.iconToolsToggle = function()
        if uiDefs.iconToolsVisible then
            uiDefs.toolsContainer:hide()
            uiDefs.iconToolsVisible = false
        else
            uiDefs.toolsContainer:show()
            uiDefs.iconToolsVisible = true
        end
    end

    -- don't use for now
    --acrowdmap.draw_tools.addNewIcon("iconTools", -112, 120, 64, 64, "", 0, 0, 18, "white", "AlignHCenter", "AlignVCenter", "tools-64.png", "tools-64-hover.png", "", uiDefs.iconToolsToggle)

    -- icon's toolbars
    uiDefs.toolsContainer = Geyser.Container:new({
        name = "uiDefs.toolsContainer",
        x = 0,
        y = 0,
        width = 164 * 2,
        height = 32
    })

    uiDefs.toolsLabel = Geyser.Label:new({
        name = "uiDefs.toolsLabel",
        x = 0, y = 0,
        width = "100%", height = "100%"
    }, uiDefs.toolsContainer)
    uiDefs.toolsLabel:setStyleSheet([[
    background-color: #0a0a0a;
  ]])

end

