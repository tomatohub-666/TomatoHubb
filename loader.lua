-- [[ TOMATO HUB - NO KEY SYSTEM ]]
print("Tomato Hub: Dang tai script...")

-- Thêm mã os.time để phá cache GitHub, đảm bảo luôn tải bản mới nhất
local version = os.time()
local Raw_Main = "https://raw.githubusercontent.com/tomatohub-666/TomatoHubb/main/main.lua?v=" .. version

local success, err = pcall(function()
    loadstring(game:HttpGet(Raw_main))()
end)

if success then
    print("Tomato Hub: Da tai thanh cong!")
else
    warn("Loi khi tai Main Script: " .. tostring(err))
-- Sửa lại đoạn cuối của loader.lua
local success, err = pcall(function()
    local content = game:HttpGet(Raw_Main)
    local func = loadstring(content)
    if func then
        func()
    else
        warn("Khong the bien dich code trong main.lua")
    end
end)
