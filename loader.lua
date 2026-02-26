local Games = {
    [109983668079237] = "https://raw.githubusercontent.com/Blitsik/VAEB-HUB/refs/heads/main/sab.lua",
    [131623223084840] = "https://raw.githubusercontent.com/Blitsik/VAEB-HUB/refs/heads/main/gm.lua",
    [119987266683883] = "https://pastebin.com/raw/0s3aMs9K",
    [17625359962] = "https://pastebin.com/raw/rLXvC39M",
    [130594398886540] = "https://raw.githubusercontent.com/Blitsik/VAEB-HUB/refs/heads/main/gardenhrz.lua"
}

local URL = Games[game.PlaceId]
if URL then
    local success, err = pcall(function()
        local code = game:HttpGet(URL, true)
        assert(code and #code > 0, "HttpGet вернул пустой ответ")
        local fn = loadstring(code)
        assert(fn, "loadstring вернул nil")
        fn()
    end)
    if not success then
        warn("VAEB-HUB Error: " .. tostring(err))
    end
else
    warn("VAEB-HUB: PlaceId " .. tostring(game.PlaceId) .. " не найден в списке игр")
end
