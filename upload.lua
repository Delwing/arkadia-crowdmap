acrowdmap.upload = acrowdmap.upload or {}

function acrowdmap.upload:init()
    self.saveHandler = scripts.event_register:force_register_event_handler(self.saveHandler, "mapSave", function()
        self:check_lock()
    end)
end

function acrowdmap.upload:check_lock()
    if acrowdmap.github.hasLock then
        cechoLink("<orange>Masz zalozonego locka. Kliknij <cornflower_blue>tutaj<orange>, aby zaktualizowac mape.\n", function()
            acrowdmap.github.hasLock = false
            acrowdmap.github:upload_changes()
        end, "Zaktualizuj mape", true)
    end
end

local minute = 1000 * 60
local hour = minute * 60
local lockTimes = {
    { label = "godzina", time = hour },
    { label = "2 godziny", time = hour * 2 },
    { label = "4 godziny", time = hour * 4 },
    { label = "8 godzin", time = hour * 8 },
}

function acrowdmap.upload:show_upload_msg()
    local current_version = getMapUserData("version") or "0.0.0"
    HttpClient:get("https://api.github.com/repos/Delwing/arkadia-mapa/releases/latest", {}, function(response)
        if response.tag_name == current_version  then
            cecho("\n <orange> Arkadia Crowdmap Upload\n\n  (1) Musisz miec uprawnienia do wrzucania map\n  (2) Pamietaj aby po rozpoczeciu locka pobrac aktualna wersje mapy z serwera.\n  (3) Twoja wersja: <green>" .. current_version .. "<orange>, wersja na serwerze: <green>" .. response.tag_name .. "<orange>\n  (4) Zaloz lock:\n")
            for k,v in pairs(lockTimes) do
                echo("        ")
                cechoLink("- <cornflower_blue>".. v.label .."<reset>\n", function() acrowdmap.github:lock(v.time) end, "Zaloz lock", true)
            end
            echo("\n")
            if acrowdmap.github.hasLock then
                echo("        ")
                cechoLink("- <cornflower_blue>Zdejmij lock<reset>\n", function() acrowdmap.github:release() end, "Zdejmij lock", true)
            end
        else
            cecho("\n <orange> Arkadia Crowdmap - pobierz aktualna wersje mapy przed zalozeniem locka. Twoja wersja: <green>" .. current_version .. "<orange>, wersja na serwerze: <green>" .. response.tag_name .. "<reset>")
        end
    end, function() scripts:print_log("Cos poszlo nie tak ze sprawdzaniem ostatniej wersji mapy, zglos blad.") end)
end

acrowdmap.upload:init()

function alias_func_map_sync_mapup()
    acrowdmap.upload:show_upload_msg()
end
