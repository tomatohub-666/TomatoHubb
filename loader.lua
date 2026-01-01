-- [[ TOMATO HUB - LOADER SYSTEM ]]

local Link_Get_Key = "https://link-center.net/2612670/N024m9czsWoj"
local Raw_Keys = "https://raw.githubusercontent.com/tomatohub-666/TomatoHubb/main/Keys.lua"
local Raw_Main = "https://raw.githubusercontent.com/tomatohub-666/TomatoHubb/main/main.lua"

local function Notify(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 10
    })
end

-- 1. Tải dữ liệu Key từ GitHub
local success, KeyData = pcall(function()
    return loadstring(game:HttpGet(Raw_Keys))()
end)

if not success or type(KeyData) ~= "table" then
    game.Players.LocalPlayer:Kick("🍅 Lỗi hệ thống: Không thể tải danh sách Key!")
    return
end

-- 2. Kiểm tra Key người dùng nhập
local userKey = _G.Key

if KeyData[userKey] then
    local info = KeyData[userKey]
    local currentTime = os.time()

    -- Kiểm tra hết hạn (Timestamp)
    if currentTime > info.Expire then
        if setclipboard then setclipboard(Link_Get_Key) end
        game.Players.LocalPlayer:Kick("\n🍅 Tomato Hub 🍅\nKey của bạn đã hết hạn!\nLink Get Key đã được copy.")
        return
    end

    -- Nếu Key đúng
    Notify("🍅 ĐĂNG NHẬP THÀNH CÔNG", "Chào mừng " .. info.Type .. "! Đang tải script...")
    
    -- 3. Tải Script chính (main.lua)
    local main_success, main_script = pcall(function()
        return game:HttpGet(Raw_Main)
    end)

    if main_success then
        loadstring(main_script)()
    else
        warn("🍅 Lỗi: Không thể tải file main.lua từ GitHub!")
    end
else
    -- Nếu Key sai hoặc chưa nhập
    if setclipboard then setclipboard(Link_Get_Key) end
    Notify("🍅 SAI KEY!", "Hãy dán link vào trình duyệt để lấy Key!")
    
    task.wait(2)
    game.Players.LocalPlayer:Kick("\n🍅 Tomato Hub 🍅\nSai Key! Link Get Key đã được copy vào bộ nhớ của bạn.\nLink: " .. Link_Get_Key)
end
