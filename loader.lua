local Raw_Keys = "https://raw.githubusercontent.com/tomatohub-666/TomatoHubb/main/keys.lua?v=" .. os.time()
local userKey = _G.Key or "CHUA_NHAP_KEY"

local success, KeyData = pcall(function()
    return loadstring(game:HttpGet(Raw_Keys))()
end)

if not success then
    game.Players.LocalPlayer:Kick("LOI KET NOI: Khong tai duoc file keys.lua!")
    return
end

if KeyData[userKey] then
    -- Neu dung key thi tai main.lua
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tomatohub-666/TomatoHubb/main/main.lua?v=" .. os.time()))()
else
    -- Neu sai key, thong bao ro loi
    setclipboard("https://boost.ink/mka12")
    game.Players.LocalPlayer:Kick("\n[TOMATO HUB]\nSai Key!\nKey ban nhap la: " .. userKey .. "\nHay kiem tra lai file keys.lua tren GitHub!")
end
