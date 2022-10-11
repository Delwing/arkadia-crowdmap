function acrowdmap.draw_tools.draw_tools_on()
    if acrowdmap.draw_tools.draw_tools_turned_on == nil then
        acrowdmap.draw_tools.init_main_icons()
        acrowdmap.draw_tools.init_tools()
    else
        acrowdmap.draw_tools.uiDefs.toolsContainer:show()
    end
end

function acrowdmap.draw_tools.draw_tools_off()
    acrowdmap.draw_tools.uiDefs.toolsContainer:hide()
end

function acrowdmap.draw_tools.draw_tools_switch()
    if not acrowdmap.draw_tools.draw_tools_turned_on then
        acrowdmap.draw_tools.draw_tools_on()
        acrowdmap.draw_tools.draw_tools_turned_on = true
    else
        acrowdmap.draw_tools.draw_tools_off()
        acrowdmap.draw_tools.draw_tools_turned_on = false
    end
end

