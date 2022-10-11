----------------  Universal Icon  -----------------------
-- arguments:
-- iconName (unique icon name)
-- posX (x position)
-- posY (y position)
-- iconWidth
-- iconHeight
-- title (header of icon)
-- titleOffsetX (offet of title along x direction)
-- titleOffsetY (offet of title along y direction)
-- titleFontSize
-- titleColor (color name, rgb(), #hex)
-- titleAligmentHorizontal (AlignLeft, AlignRight, AlignHCenter)
-- titleAligmentVertical (AlignTop, AlignBottom, AlignVCenter)
-- img (image file name)
-- hoverImg (image on hover file name)
-- container ("" - relative to main window, otherwise relative to existing container)
-- iconClickCallback (function called on click)
-- methods:
-- uniIconsTable.iconName.changeTitle() (changes header)
-- example: acrowdmap.draw_tools.addNewIcon("icon1", 20, 20, 123, 115, "test", 0, 0, 26, "white", "AlignLeft", "AlignVCenter", "btn-map.png", "btn-map-hover.png", container, function() cecho("test\n") end)

function acrowdmap.draw_tools.addNewIcon(iconName, posX, posY, iconWidth, iconHeight, title, titleOffsetX, titleOffsetY, titleFontSize, titleColor, titleAligmentHorizontal, titleAligmentVertical, img, hoverImg, container, iconClickCallback)

    -- creates table if doesnt exist
    local uniIconsTable = acrowdmap.draw_tools["uniIconsTable"]
    uniIconsTable = type(uniIconsTable) == "table" and uniIconsTable or {}
    uniIconsTable.namesTable = type(uniIconsTable.namesTable) == "table" and uniIconsTable.namesTable or {}

    -- exit if name already exists
    for k, v in ipairs(uniIconsTable.namesTable) do
        if v == iconName then
            cecho("Nazwa ikony " .. iconName .. " juz istnieje.\n")
            return
        end
    end

    -- adding icon
    uniIconsTable.namesTable[#uniIconsTable.namesTable + 1] = iconName

    if type(container) == "string" then
        uniIconsTable[iconName] = Geyser.Label:new({
            name = iconName,
            x = posX, y = posY,
            width = iconWidth, height = iconHeight,
            fgColor = titleColor,
            fontSize = titleFontSize,
            message = title
        })
    else
        uniIconsTable[iconName] = Geyser.Label:new({
            name = iconName,
            x = posX, y = posY,
            width = iconWidth, height = iconHeight,
            fgColor = titleColor,
            fontSize = titleFontSize,
            message = title
        }, container)
    end

    uniIconsTable[iconName]:setStyleSheet([[
    QLabel{
      background-color: transparent;
      background-image : url(]] .. acrowdmap.img_path .. img .. [[);
      padding-top: ]] .. titleOffsetY .. [[;
      padding-left: ]] .. titleOffsetX .. [[;
      qproperty-alignment: ']] .. titleAligmentHorizontal .. [[ | ]] .. titleAligmentVertical .. [[';
    }
    QLabel:hover{
      background-image : url(]] .. acrowdmap.img_path .. hoverImg .. [[);
    }
  ]]);

    uniIconsTable[iconName].func = iconClickCallback
    setLabelClickCallback(iconName, "acrowdmap.draw_tools.uniIconsTable." .. iconName .. ".func")

    uniIconsTable[iconName].changeTitle = function(newTitle)
        uniIconsTable[iconName]:echo(newTitle)
    end

end


