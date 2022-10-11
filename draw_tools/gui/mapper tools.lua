function acrowdmap.draw_tools.init_tools()

    -- Mapper - kolory
    local xStart = 0
    local yStart = 40
    local x = xStart
    local y = yStart
    local padding = 5
    local columnHeight = yStart + 24 / 2 * (27 + 5)

    acrowdmap.draw_tools.addNewWindow("windowToolsMapperKolory", "Mapper - Kolory", 0, 27, 164 * 2 + 10, columnHeight, true, acrowdmap.draw_tools.uiDefs.toolsContainer)

    acrowdmap.draw_tools.addButtons(
            { "ID Lokacji", 0, 0, "light", "#333333", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
                cecho("<orange>ID Lokacji: <reset>" .. getPlayerRoom() .. "\n")
            end },
            { "Kolor Lokacji", 164 + padding * 2, 0, "light", "#333333", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
                cecho("<orange>Kolor Lokacji: <reset>" .. getRoomEnv(getPlayerRoom()) .. "\n")
            end }
    )

    local buttons = {
        { "Las", x, y, "light", "rgb(0,128,0)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(258)
        end },
        { "Trakt", x, y, "light", "rgb(128,0,0)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(257)
        end },
        { "Miasto", x, y, "light", "rgb(128,128,128)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(272)
        end },
        { "Wies", x, y, "light", "rgb(0,128,128)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(262)
        end },
        { "Akweny wodne", x, y, "light", "rgb(0,0,255)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(268)
        end },
        { "Plaze", x, y, "dark", "rgb(170,139,89)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(303)
        end },
        { "Gory", x, y, "dark", "rgb(170,139,89)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(303)
        end },
        { "Gory z przepascia", x, y, "dark", "rgb(255,114,14)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(301)
        end },
        { "Fontanny lub woda", x, y, "light", "rgb(0,0,255)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(200)
        end },
        { "Dylizanse", x, y, "dark", "rgb(255,255,0)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(267)
        end },
        { "Porty", x, y, "dark", "rgb(255,255,0)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(267)
        end },
        { "Kowale", x, y, "dark", "rgb(0,255,0)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(266)
        end },
        { "Karczmy, budynki", x, y, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(295)
        end },
        { "Budynki - wazne!", x, y, "dark", "rgb(255,255,0)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(267)
        end },
        { "Poczty", x, y, "dark", "rgb(255,0,255)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(269)
        end },
        { "Lokacja bez swiatla", x, y, "light", "rgb(128,0,128)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(261)
        end },
        { "Startowka", x, y, "dark", "rgb(255,255,255)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(271)
        end },
        { "Bossowie, klucze", x, y, "light", "rgb(255,0,0)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(202)
        end },
        { "Niebezpieczne lokacje", x, y, "light", "rgb(255,0,0)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            setRoomEnv(amap.curr.id, 202)
        end },
        { "Lokacja laczona 1", x, y, "dark", "rgb(0,255,255)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(270)
        end },
        { "Lokacja laczona 2", x, y, "light", "rgb(0,128,128)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(262)
        end },
        { "Lokacja laczona 3", x, y, "dark", "rgb(236,167,236)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            acrowdmap.draw_tools.button_color_listener(297)
        end },
        { "Linie normalne", x, y, "light", "rgb(128,128,128)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            cecho("test\n")
        end },
        { "Linie - uwazaj!", x, y, "light", "rgb(255,0,0)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.content, function()
            cecho("test\n")
        end }
    }

    for k, v in ipairs(buttons) do
        v[2] = x
        v[3] = y
        acrowdmap.draw_tools.addButtons(v)
        y = y + 27 + padding
        if columnHeight - padding < y then
            y = yStart
            x = xStart + 164 + padding * 2
        end
    end

    acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.close()


    -- Mapper - kolory
    local xStart = 0
    local yStart = 40
    local x = xStart
    local y = yStart
    local padding = 5
    local columnHeight = yStart + 24 / 2 * (27 + 5)

    acrowdmap.draw_tools.addNewWindow("windowToolsMapperSymbole", "Mapper - Symbole", 0, 27, 164 * 2 + 10, columnHeight, true, acrowdmap.draw_tools.uiDefs.toolsContainer)

    acrowdmap.draw_tools.addButtons(
            { "Wyczysc znak", 0, 0, "light", "#333333", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
                acrowdmap.draw_tools.button_symbol_listener("")
            end },
            { "Przepasc?", 164 + padding * 2, 0, "dark", "rgb(255,114,14)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
                send("ob przepasci")
            end }
    )

    local buttons = {
        { "Poczta", x, y, "dark", "rgb(255,0,255)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_color_listener(269)
            acrowdmap.draw_tools.button_symbol_listener("P")
        end },
        { "Kowale", 0, 0, "light", "rgb(0,255,0)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_color_listener(266)
            acrowdmap.draw_tools.button_symbol_listener("K")
        end },
        { "Sklep, kandlarz", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("S")
        end },
        { "Skup", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("s")
        end },
        { "Zielarz", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("Z")
        end },
        { "Rzemieslnik", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("r")
        end },
        { "Trener zawodu", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("E")
        end },
        { "Karczma", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("T")
        end },
        { "Piekarnia", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("p")
        end },
        { "Sprzedawca zwierzat", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("a")
        end },
        { "Tablica", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("[]")
        end },
        { "Rzeznik", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("m")
        end },
        { "Biblioteka", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("B")
        end },
        { "Gildia podroznicza", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("G")
        end },
        { "Aukcje, Sklep gildiowy", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("A")
        end },
        { "Wozownia", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("W")
        end },
        { "Urna", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("u")
        end },
        { "Jubiler, zlotnik", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("J")
        end },
        { "Bank, kantor", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("$")
        end },
        { "Kasyno", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("C")
        end },
        { "Krawiec", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("k")
        end },
        { "Fryzjer", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("F")
        end },
        { "Skup ryb", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("r")
        end },
        { "Swiatynia, kapliczka", 0, 0, "dark", "rgb(239,176,73)", acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.content, function()
            acrowdmap.draw_tools.button_symbol_listener("+")
        end }
    }

    for k, v in ipairs(buttons) do
        v[2] = x
        v[3] = y
        acrowdmap.draw_tools.addButtons(v)
        y = y + 27 + padding
        if columnHeight - padding < y then
            y = yStart
            x = xStart + 164 + padding * 2
        end
    end

    acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.close()

    acrowdmap.draw_tools.addButtons(
            { "Mapper - kolory", 0, 0, "light", "#222222", acrowdmap.draw_tools.uiDefs.toolsContainer, acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperKolory.open },
            { "Mapper - symbole", 164, 0, "light", "#222222", acrowdmap.draw_tools.uiDefs.toolsContainer, acrowdmap.draw_tools.uniWindowsTable.windowToolsMapperSymbole.open }
    )

end

