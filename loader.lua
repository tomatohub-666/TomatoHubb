-- [[ TOMATO HUB - TESTER ]]
print("--- DANG KIEM TRA LOADER ---")

_G.Key = _G.Key or "" -- Tránh lỗi nếu bạn quên nhập Key

local Raw_Keys = "https://raw.githubusercontent.com/tomatohub-666/TomatoHubb/main/keys.lua"
local Raw_Main = "https://raw.githubusercontent.com/tomatohub-666/TomatoHubb/main/main.lua"

-- 1. Thu tai file Keys
local success, KeyData = pcall(function()
    return loadstring(game:HttpGet(Raw_Keys))()
end)

if not success then
    warn("Loi: Khong the ket noi den GitHub de lay Key!")
    return
end

-- 2. Kiem tra Key
if KeyData[_G.Key] then
    print("Key dung! Dang tai Main Script...")
    
    -- 3. Tai Main Script
    local mainSuccess, err = pcall(function()
        loadstring(game:HttpGet(Raw_Main))()
    end)
    
    if not mainSuccess then
        warn("Loi trong file Main.lua: " .. tostring(err))
    end
else
    print("Key ban nhap la: " .. tostring(_G.Key))
    game.Players.LocalPlayer:Kick("Sai Key! Vui long lay key tai: https://boost.ink/mka12")
end
