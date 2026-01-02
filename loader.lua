-- [[ TOMATO HUB - DEBUG LOADER ]]
local Link_Get_Key = "https://link-center.net/2612670/N024m9czsWoj" -- Thay bằng link của bạn
local Raw_Keys = "https://raw.githubusercontent.com/tomatohub-666/TomatoHubb/main/keys.lua"
local Raw_Main = "https://raw.githubusercontent.com/tomatohub-666/TomatoHubb/main/main.lua"

local userKey = _G.Key

local success, KeyData = pcall(function()
    return loadstring(game:HttpGet(Raw_Keys))()
end)

if not success then
    game.Players.LocalPlayer:Kick("Loi: Khong the tai file Keys.lua tu GitHub!")
    return
end

if userKey and KeyData[userKey] then
    local info = KeyData[userKey]
    local currentTime = os.time()

    if type(info.Expire) == "number" and currentTime > info.Expire then
        setclipboard(Link_Get_Key)
        game.Players.LocalPlayer:Kick("Key het han! Link da copy vao bo nho.")
        return
    end

    -- Nếu mọi thứ OK, tải script chính
    loadstring(game:HttpGet(Raw_Main))()
else
    -- Sai Key
    setclipboard(Link_Get_Key)
    game.Players.LocalPlayer:Kick("Sai Key hoac chua nhap Key! Hay nhap vao _G.Key")
end
