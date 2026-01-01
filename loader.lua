-- [[ TOMATO HUB - PROTECTED LOADER 2026 ]]

-- Hàm giải mã link (Giúp giấu link GitHub của bạn khỏi mắt thường)
local function Decrypt(data)
    local str = ""
    for i = 1, #data, 2 do
        str = str .. string.char(tonumber(data:sub(i, i + 1), 16))
    end
    return str
end

-- Dữ liệu đã được mã hóa Hex
local Link_Get_Key = "https://link-center.net/2612670/N024m9czsWoj"
local Raw_Keys = Decrypt("68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f746f6d61746f6875622d3636362f546f6d61746f487562622f6d61696e2f4b6579732e6c7561")
local Raw_Main = Decrypt("68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f746f6d61746f6875622d3636362f546f6d61746f487562622f6d61696e2f6d61696e2e6c7561")

local function Notify(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 7
    })
end

-- Chống soi code cơ bản
local function AntiSoi()
    local _ = "TomatoHub_" .. math.random(100,999)
    if getgenv()[_] then return end
    getgenv()[_] = true
end
AntiSoi()

-- 1. Tải dữ liệu Key
local success, KeyData = pcall(function()
    return loadstring(game:HttpGet(Raw_Keys))()
end)

if not success or type(KeyData) ~= "table" then
    game.Players.LocalPlayer:Kick("\n🍅 Tomato Hub\nLỗi: Không thể kết nối Server!")
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
        game.Players.LocalPlayer:Kick("\n🍅 Tomato Hub\nKey của bạn đã hết hạn!")
        return
    end

    -- Đăng nhập thành công
    Notify("🍅 THÀNH CÔNG", "Rank: " .. info.Type .. "\nĐang khởi chạy...")
    
    -- 3. Chạy file main.lua
    local main_success, main_code = pcall(function()
        return game:HttpGet(Raw_Main)
    end)

    if main_success then
        loadstring(main_code)()
    else
        warn("🍅 Lỗi: 0x01")
    end
else
    -- Nếu sai Key hoặc chưa nhập Key
    if setclipboard then setclipboard(Link_Get_Key) end
    Notify("🍅 THÔNG BÁO", "Link Get Key đã được copy!")
    
    task.wait(2)
    game.Players.LocalPlayer:Kick("\n🍅 Tomato Hub 🍅\nSai Key! Vui lòng dán link vào trình duyệt để lấy key.")
end
