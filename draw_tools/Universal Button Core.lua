------------------  Universal Button  ---------------
-- table of objects:
-- {buttonText, posX, posY, fontColor, backgroundColor, container, callbackFunction}
-- buttonText (text seen on button)
-- posX (x position)
-- posY (y position)
-- fontColor ("light"/"dark"
-- backgroundColor (color name, rgb(), #hex)
-- container ("" - relative to main window, otherwise relative to existing container)
-- callbackFunction (function called on click)
--[=====[ example:
acrowdmap.draw_tools.addButtons(
  {"test1", 10, 40, "light", "green", tempContainer, function() cecho("tescik8\n") end},
  {"test2", 10, 110, "dark", "orange", "", function() cecho("tescik3\n") end}
)
--]=====]

function acrowdmap.draw_tools.addButtons(...)
    if #arg == 0 then
        cecho("No buttons defined.\n")
        return
    end

    -- creates table if doesnt exist
    local uniButtonsTable = acrowdmap.draw_tools["uniButtonsTable"]
    --uniButtonsTable = type(uniButtonsTable) == "table" and uniButtonsTable or {}

    -- adding buttons
    local currBtnName = ""
    for k, v in ipairs(arg) do
        local btnColor = "#d1b493"
        if v[4] == "dark" then
            btnColor = "#000000"
        end

        currBtnName = "btn" .. table.size(uniButtonsTable) + 1

        if type(v[6]) == "string" then
            uniButtonsTable[currBtnName] = Geyser.Label:new({
                name = currBtnName,
                x = v[2], y = v[3],
                width = 164, height = 27,
                fgColor = btnColor,
                fontSize = 10,
                message = [[<center>]] .. v[1] .. [[</center>]]
            })
        else
            uniButtonsTable[currBtnName] = Geyser.Label:new({
                name = currBtnName,
                x = v[2], y = v[3],
                width = 164, height = 27,
                fgColor = btnColor,
                fontSize = 10,
                message = [[<center>]] .. v[1] .. [[</center>]]
            }, v[6])
        end

        uniButtonsTable[currBtnName]:setStyleSheet([[
      QLabel{
        background-color: ]] .. v[5] .. [[;
        background-image : url(]] .. acrowdmap.img_path .. [[btn-universal.png);
        text-transform: uppercase;
        font-weight: 500;
      }
      QLabel:hover{
        background-image : url(]] .. acrowdmap.img_path .. [[btn-universal-hover.png);
      }
    ]]);

        uniButtonsTable[currBtnName].func = v[7]
        setLabelClickCallback(currBtnName, "acrowdmap.draw_tools.uniButtonsTable." .. currBtnName .. ".func")

    end

end


