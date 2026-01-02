-- Xóa code cũ trong loader.lua và dán đoạn này vào
local version = os.time() -- Tạo mã phiên bản ngẫu nhiên để phá cache
local Raw_Keys = "https://raw.githubusercontent.com/tomatohub-666/TomatoHubb/main/keys.lua?v=" .. version
local Raw_Main = "https://raw.githubusercontent.com/tomatohub-666/TomatoHubb/main/main.lua?v=" .. version

local userKey = _G.Key or "KHONG_CO_DU_LIEU"

-- Tải dữ liệu Key
local success, KeyData = pcall(function()
    return loadstring(game:HttpGet(Raw_Keys))()
end)

if not success or type(KeyData) ~= "table" then
    game.Players.LocalPlayer:Kick("LOI: File Keys.lua tren GitHub bi loi cu phap hoac chua cap nhat!")
    return
end

-- Kiểm tra Key
if KeyData[userKey] then
    warn("TOMATO HUB: Key hop le! Dang tai Script...")
    loadstring(game:HttpGet(Raw_Main))()
else
    -- Thông báo cực chi tiết khi bị Kick
    setclipboard("https://boost.ink/mka12")
    local errorMessage = "\n[SAI KEY]\n" ..
                         "Key ban nhap: " .. tostring(userKey) .. "\n" ..
                         "Hay dam bao ban da go dung tung ky tu!"
    game.Players.LocalPlayer:Kick(errorMessage)
end
