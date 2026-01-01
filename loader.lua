-- [[ TOMATO HUB - OFFICIAL LOADER 2026 ]]

local Link_Get_Key = "https://link-center.net/2612670/N024m9czsWoj"
local Raw_Keys = "https://raw.githubusercontent.com/tomatohub-666/TomatoHubb/main/Keys.lua"
local Raw_Main = "https://raw.githubusercontent.com/tomatohub-666/TomatoHubb/main/main.lua"

local function Notify(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 7
    })
end

-- 1. Tải dữ liệu Key
local success, KeyData = pcall(function()
    return loadstring(game:HttpGet(Raw_Keys))()
end)

if not success or type(KeyData) ~= "table" then
    game.Players.LocalPlayer:Kick("\n🍅 Tomato Hub\nLỗi: Không thể tải danh sách Key!\nHãy kiểm tra lại file Keys.lua")
    return
end

-- 2. Kiểm tra Key
local userKey = _G.Key

if userKey and KeyData[userKey] then
    local info = KeyData[userKey]
    local currentTime = os.time()

    -- Kiểm tra hết hạn
    if currentTime > info.Expire then
        if setclipboard then setclipboard(Link_Get_Key) end
        game.Players.LocalPlayer:Kick("\n🍅 Tomato Hub\nKey của bạn đã hết hạn!\nLink Get Key đã được copy.")
        return
    end

    -- Đăng nhập thành công
    Notify("🍅 THÀNH CÔNG", "Rank: " .. info.Type .. "\nĐang tải script chính...")
    
    -- 3. Chạy file main.lua
    local main_success, main_code = pcall(function()
        return game:HttpGet(Raw_Main)
    end)

    if main_success then
        loadstring(main_code)()
    else
        warn("🍅 Lỗi: Không thể tải nội dung main.lua")
    end
else
    -- Nếu sai Key hoặc chưa nhập Key
    if setclipboard then setclipboard(Link_Get_Key) end
    Notify("🍅 THÔNG BÁO", "Vui lòng nhập Key vào _G.Key trước khi chạy!")
    
    task.wait(2)
    game.Players.LocalPlayer:Kick("\n🍅 Tomato Hub 🍅\nSai Key hoặc chưa nhập Key!\nLink Get Key đã được copy vào bộ nhớ của bạn.")
end
