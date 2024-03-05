acrowdmap.github = acrowdmap.github or {}

local base64 = require("arkadia-crowdmap.base64")

local client_id = "Iv1.69a5bcc964a15d53"
local code_url = "https://github.com/login/device/code"
local token_url = "https://github.com/login/oauth/access_token"
local store_key = "github"
local data = { client_id = client_id, scope = "repo" }
local json_headers = {
    ["Accept"] = "application/json",
    ["Content-Type"] = "application/json"
}
local repository = "Delwing/arkadia-mapa"
local basicApi = "https://api.github.com/"
local repositoryApi = "https://api.github.com/repos/" .. repository
local lockApi = "https://arkadia-crowdmap-locks-byqu.vercel.app"

function acrowdmap.github:init()
    
end

function acrowdmap.github:authorize(routine)
    local state = scripts.state_store:get(store_key)
    if state and state.token then
        self.token = state.token
        coroutine.resume(routine)
    else 
        HttpClient:post(code_url, data, json_headers, function(response) self:on_code_receive(response, routine) end)
    end
end

function acrowdmap.github:on_code_receive(response, routine)
    tempTimer(1, function() openUrl(response.verification_uri) end)

    setClipboardText(response.user_code)

    cecho("=========================================================================\n")
    cecho(" Wklej ponizszy kod w przegladarce (zostal wlasnie skopiowany do schowka)\n")
    cecho("\n")
    cecho("  <yellow>" .. response.user_code .. "<reset>\n")
    cecho("\n")
    cecho("=========================================================================\n")

    self.timer = tempTimer(response.interval + 1, function() self:poll_for_code(response.device_code, routine) end, true)
    self.timer2 = tempTimer(response.expires_in + 1, function() if self.timer then killTimer(self.timer) end end)
end

function acrowdmap.github:poll_for_code(device_code, routine)
    HttpClient:post(token_url, {
        device_code = device_code,
        client_id = client_id,
        grant_type = "urn:ietf:params:oauth:grant-type:device_code"
    }, json_headers, function(response) self:accept_token(response.access_token, routine) end, function(er) display(er) end)
end

function acrowdmap.github:accept_token(token, routine)
    if token then
        killTimer(self.timer)
        killTimer(self.timer2)
        self.token = token
        scripts.state_store:set(store_key, { token = self.token })
        if routine then
            tempTimer(0.1, function() coroutine.resume(routine) end)
        end
    end
end

function acrowdmap.github:authorized_call(callback)
    self:authorize(callback)
end

function acrowdmap.github:get_headers()
    return {
        ["Authorization"] = "Bearer " .. self.token
    }
end

function acrowdmap.github:get_json_headers()
    return table.update(self:get_headers(), json_headers)
end

function acrowdmap.github:getDataBasicApi(location, callback, errorCallback)
    local routine = coroutine.create(function()
        HttpClient:get(string.format("%s/%s", basicApi, location), self:get_headers(), callback, errorCallback)
    end)
    self:authorize(routine)
end

function acrowdmap.github:getData(location, callback, errorCallback)
    local routine = coroutine.create(function()
        HttpClient:get(string.format("%s/%s", repositoryApi, location), self:get_headers(), callback, errorCallback)
    end)
    self:authorize(routine)
end

function acrowdmap.github:postData(location, content, callback, errorCallback)
    local routine = coroutine.create(function()
        HttpClient:post(string.format("%s/%s", repositoryApi, location), content, self:get_headers(), callback, errorCallback)
    end)
    self:authorize(routine)
end

function acrowdmap.github:putData(location, content, callback, errorCallback)
    local routine = coroutine.create(function()
        HttpClient:put(string.format("%s/%s", repositoryApi, location), content, self:get_headers(), callback, errorCallback)
    end)
    self:authorize(routine)
end

function acrowdmap.github:upload_changes()
    local branch_name = "development"
    self:create_branch(branch_name, function(response)
        local sha = response.object.sha
        self:get_current_map_sha(sha, function(file_sha) self:upload_map(file_sha, branch_name) end)
    end)
end

function acrowdmap.github:create_branch(branch_name, callback)
    scripts.installer:save_map()
    self:getData("git/refs/heads/master", function(response)
        self:postData("git/refs", {
            ["ref"] = "refs/heads/" .. branch_name,
            ["sha"] = response.object.sha
        }, function(response)
            callback(response)
        end, function()
            scripts:print_url("Aktualnie istnieja oczekajace zmiany -> <cornflower_blue>https://github.com/" .. repository .. "/pulls<reset>", function()
                openUrl("https://github.com/" .. repository .. "/pulls")
            end, "Otworz")
        end)
    end)
end

function acrowdmap.github:get_current_map_sha(sha, callback)
    self:getData("contents/map_master3.dat?ref=" .. sha, function(response)
        callback(response.sha)
    end)
end

function acrowdmap.github:upload_map(sha, branch_name)
    local map = io.open(getMudletHomeDir() .. "/" .. "map_master3.dat", "rb")
    if map then
        scripts:print_log("Wysylam mape i tworze PR")
        local content = base64.encode(map:read("*a"))
        self:putData("contents/map_master3.dat", {
                content = content,
                message = "update map",
                branch = branch_name,
                sha = sha
        }, function()
            self:create_pr(branch_name)
            self:release()
        end)
        map:close()
    end
end

function acrowdmap.github:create_pr(branch_name)
    openUrl(string.format("https://github.com/" .. repository .. "/compare/master...%s?quick_pull=1&title=Map%%20update", branch_name))
end

function acrowdmap.github:lock(time)
    if not time then
        scripts:print_log("Podaj czas locka.")
    end
    local routine = coroutine.create(function()
        HttpClient:post(lockApi .. "/api/lock", { lock = time }, self:get_json_headers(), function(resp)
            scripts:print_log(resp.message)
            self.hasLock = resp.result
            end, function(response, msg)
            scripts:print_log("Nie moge zalozyc locka. " .. msg)
        end)
    end)
    self:authorize(routine)
end

function acrowdmap.github:release()
    scripts:print_log("Zdejmuje locka.")
    local routine = coroutine.create(function()
        HttpClient:post(lockApi .. "/api/release", {}, self:get_json_headers(), function(resp)
            scripts:print_log(resp.message)
            self.hasLock = false
        end, function(response, msg)
            scripts:print_log("Nie moge zdjac locka. " .. msg)
        end)
    end)
    self:authorize(routine)
end

acrowdmap.github:init()
