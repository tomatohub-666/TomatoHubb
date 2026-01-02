-- [[ TOMATO HUB - NO KEY SYSTEM ]]
print("Tomato Hub: Dang tai script...")

-- Thêm mã os.time để phá cache GitHub, đảm bảo luôn tải bản mới nhất
local version = os.time()
local Raw_Main = "https://raw.githubusercontent.com/tomatohub-666/TomatoHubb/main/main.lua?v=" .. version

local success, err = pcall(function()
    loadstring(game:HttpGet(Raw_Main))()
end)

if success then
    print("Tomato Hub: Da tai thanh cong!")
else
    warn("Loi khi tai Main Script: " .. tostring(err))
end
