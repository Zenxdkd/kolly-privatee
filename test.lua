-- Table to store user IDs and their respective keys
local keyTable = {
    ["11983311"] = "KLOXOWNER",
}
 
-- Function to check if the provided key matches the user's key
local function checkKey(userId, key)
    return keyTable[userId] == key
end
 
-- Get the local player's UserId
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local userId = tostring(localPlayer.UserId)


-- Check if the key is correct
if checkKey(userId, key) then
    -- The key is correct, execute the script here
    print("Correct key, executing script...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Zenxdkd/test/main/kloxwithavchanger.lua"))()
else
    -- The key is incorrect, kick the user from the game
    localPlayer:Kick("Incorrect key")
end
