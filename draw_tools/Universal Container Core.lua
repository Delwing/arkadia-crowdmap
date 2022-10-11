-------------------  Universal Container  -------------------
-- arguments:
-- windowName (unique window name)
-- title (header of window)
-- posx (x position)
-- posy (y position)
-- contentWidth
-- contentHeight
-- (width and height are not total size of window. Borders size are added to total size)
-- autoclose (true/false - if true window closes when other window opens)
-- container ("" - relative to main window, otherwise relative to existing container, you can put nest one window in another using as argument uniWindowsTable.otherWindow.content)
-- methods:
-- uniWindowsTable.windowName.open() (opens window)
-- uniWindowsTable.windowName.close() (closes window)
-- example: acrowdmap.draw_tools.addNewWindow("testowo2", "Titlek 2", 210, 10, 200, 200, false, "")

function acrowdmap.draw_tools.addNewWindow(windowName, title, posx, posy, contentWidth, contentHeight, autoclose, container)

    -- creates table if doesnt exist
    local uniWindowsTable = acrowdmap.draw_tools["uniWindowsTable"]
    uniWindowsTable.namesTable = type(uniWindowsTable.namesTable) == "table" and uniWindowsTable.namesTable or {}

    -- creates closeAllWindows function
    uniWindowsTable.closeAllWindows = function()
        for k, v in ipairs(uniWindowsTable.namesTable) do
            if uniWindowsTable[v].autoclose then
                uniWindowsTable[v].close()
            end
        end
    end

    -- exit if name already exists
    for k, v in ipairs(uniWindowsTable.namesTable) do
        if v == windowName then
            cecho("Nazwa okna " .. windowName .. " juz istnieje.\n")
            return
        end
    end

    -- adding window
    uniWindowsTable.namesTable[#uniWindowsTable.namesTable + 1] = windowName

    if type(container) == "string" then
        uniWindowsTable[windowName] = Geyser.Container:new({
            name = windowName,
            x = posx,
            y = posy,
            width = contentWidth + 60,
            height = contentHeight + 98
        })
    else
        uniWindowsTable[windowName] = Geyser.Container:new({
            name = windowName,
            x = posx,
            y = posy,
            width = contentWidth + 60,
            height = contentHeight + 98
        }, container)
    end

    uniWindowsTable[windowName].autoclose = autoclose

    uniWindowsTable[windowName].title = Geyser.Label:new({
        name = windowName .. "Title",
        x = 0, y = 18,
        width = "100%", height = "30",
        fgColor = "#d1b493",
        message = [[<center>]] .. title .. [[</center>]],
        fontSize = 10
    }, uniWindowsTable[windowName])
    uniWindowsTable[windowName].title:setStyleSheet([[
    background-image : url(]] .. acrowdmap.img_path .. [[background-01.png);
    border-bottom: 2 solid "#907b6b";
    text-transform: uppercase;
    font-weight: 500;
  ]]);

    uniWindowsTable[windowName].bg = Geyser.Label:new({
        name = windowName .. "Bg",
        x = 0, y = 0,
        width = "100%", height = "100%",
    }, uniWindowsTable[windowName])
    uniWindowsTable[windowName].bg:setStyleSheet([[
    background-color: #211e1a;
    background-image : url(]] .. acrowdmap.img_path .. [[background-02.png);
    margin: 48 20 20 20;
  ]]);

    uniWindowsTable[windowName].content = Geyser.Label:new({
        name = windowName .. "Content",
        x = 30, y = 58,
        width = uniWidth, height = uniHeight
    }, uniWindowsTable[windowName])
    uniWindowsTable[windowName].content:setStyleSheet([[
    background-color: transparent;
  ]]);

    uniWindowsTable[windowName].borders = Geyser.Label:new({
        name = windowName .. "Borders",
        x = 0, y = 0,
        width = "100%", height = "100%"
    }, uniWindowsTable[windowName])
    uniWindowsTable[windowName].borders:setStyleSheet([[
    background-color: transparent;
    border-style: solid;
    border-width: 94px;
    border-image: url(]] .. acrowdmap.img_path .. [[uni-container-borders.png) 94 repeat;
  ]]);

    uniWindowsTable[windowName].btnExit = Geyser.Label:new({
        name = windowName .. "BtnExit",
        x = -27, y = 0,
        width = 27, height = 27
    }, uniWindowsTable[windowName])
    uniWindowsTable[windowName].btnExit:setStyleSheet([[
    QLabel{
      background-color: transparent;
      background-image : url(]] .. acrowdmap.img_path .. [[btn-exit.png);
    }
    QLabel:hover{
      background-image : url(]] .. acrowdmap.img_path .. [[btn-exit-hover.png);
    }
  ]]);

    --  Open Method  --
    uniWindowsTable[windowName].open = function()
        uniWindowsTable.closeAllWindows()
        uniWindowsTable[windowName]:show()
    end

    --  Close Handler  --
    uniWindowsTable[windowName].close = function()
        uniWindowsTable[windowName]:hide()
    end
    setLabelClickCallback(windowName .. "BtnExit", "acrowdmap.draw_tools.uniWindowsTable." .. windowName .. ".close")

end


