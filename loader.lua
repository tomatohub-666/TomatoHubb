local Raw_Keys = "https://raw.githubusercontent.com/tomatohub-666/TomatoHubb/main/keys.lua"
local Raw_Main = "https://raw.githubusercontent.com/tomatohub-666/TomatoHubb/main/main.lua"

local userKey = _G.Key

local success, KeyData = pcall(function()
    return loadstring(game:HttpGet(Raw_Keys))()
end)

if success and KeyData[userKey] then
    -- Nếu Key tồn tại trong danh sách, cho phép chạy luôn
    warn("Key hop le! Dang tai main script...")
    loadstring(game:HttpGet(Raw_Main))()
else
    -- Nếu không tìm thấy Key
    setclipboard("https://boost.ink/mka12")
    game.Players.LocalPlayer:Kick("Sai Key! Key ban vua nhap la: " .. tostring(userKey))
end
