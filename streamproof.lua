local hwidtable = loadstring(game:HttpGet("https://raw.githubusercontent.com/Zenxdkd/test/main/fullstreamproofwhitelist.lua"))()
local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
local hwid_whitelisted = false

for i, v in pairs(hwidtable) do
    if v == hwid then
        hwid_whitelisted = true
        print("loading script...")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zenxdkd/kolly-privatee/main/klxofullstremeable.lua"))()
        break
    end
end

if not hwid_whitelisted then
    game.Players.LocalPlayer:Kick("dumb ass")
end
