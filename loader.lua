local Games = {
    [131623223084840] = "https://raw.githubusercontent.com/Blitsik/VAEB-HUB/refs/heads/main/sab.lua", -- Steal a brainrot
    [109983668079237] = "https://raw.githubusercontent.com/Blitsik/VAEB-HUB/refs/heads/main/gm.lua", -- Escape Tsunami for brainrots
    [119987266683883] = "https://pastebin.com/raw/0s3aMs9K" -- Survive LAVA for brainrots
}

local URL = Games[game.PlaceId]

if URL then 
    loadstring(game:HttpGet(URL))() 
end
