-- [[ TOMATO HUB - KEYS CONFIGURATION ]]

local timeData = os.date("!*t", os.time() + 7 * 3600) -- Lấy giờ Việt Nam (GMT+7)
local hourKey = "TMH_FREE_HOUR_" .. timeData.hour .. "_" .. timeData.day .. "_" .. timeData.month

return {
    -- [KEY TỰ ĐỘNG THEO GIỜ - KHÔNG CẦN SỬA]
    [hourKey] = {Type = "Free (Hourly)", Expire = os.time() + 3600},

    -- [ADMIN]
    ["TMH_ADM_v21_99x88_#$!_VinhVien_@2026"] = {Type = "Admin", Expire = 9999999999}, -- Expire dùng số để loader dễ so sánh
    
    -- [PREMIUM - GIA HẠN THEO NGÀY]
    ["TMH_PRM_88x22_Vip_#771_Exp:2026-02-01"] = {Type = "Premium", Expire = 1738368000}, -- Quy đổi ra Timestamp
    ["TMH_PRM_11x99_Gold_#002_Exp:2026-03-15"] = {Type = "Premium", Expire = 1742016000},
    
    -- [FREE - KEY NGÀY CỐ ĐỊNH]
    ["TMH_FREE_v2.0_Daily_Exp:2026-01-05"] = {Type = "Free", Expire = 1736035200}
}
