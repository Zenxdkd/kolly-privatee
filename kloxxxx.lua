game:GetService("StarterGui"):SetCore("SendNotification", {Title = "9XN RUNS U NIGGAS!", Text = "9XN ASKING FOR COMP", Duration = 4,});

getgenv().KLOX = {
    Silent = {
        Enabled = true,
        Part = "HumanoidRootPart",
        Pred = 0.11,
        ClosestPart = true,
    },
    FOV = {
        Visible = false,
        Radius = 20
    },
    Tracer = {
        Key = "Q",
        Enabled = true,
        Pred = 0.01,
        Part = "HumanoidRootPart",
        Smoothness = 0.009
    },
    Misc = {
        UnlockedOnDeath = true,
        Shake = false,
        ShakeValue = 0.58
    },
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/matas3535/PoopLibrary/main/Library.lua"))() -- Could Also Save It In Your Workspace And Do loadfile("Library.lua")()

local Window = Library:New({Name = "| KLOX Private | uwu >.<  ", Size = Vector2.new(489, 570), Accent = Color3.fromRGB(7, 0, 255)})
--
local Aimbot = Window:Page({Name = "Aimbot"})
local Settings = Window:Page({Name = "Settings"})
--
local uwuAimbot = Aimbot:Section({Name = "Main", Side = "Left"})
local uwuMisc = Aimbot:Section({Name = "Misc", Side = "Right"})
local uwuSettings = Aimbot:Section({Name = "Settings", Side = "Left"})
--
local Settings_Main = Settings:Section({Name = "Main", Side = "Left"})
-- // Aimbot
uwuAimbot:Toggle({
Name = "Enabled",
Default = true,
Pointer = "AimbotMain_Enabled",
Callback = function(v)
print(v)
getgenv().KLOX.Tracer.Enabled = v  
    
end
})

uwuAimbot:Toggle({
Name = "ShowFov",
Default = false,
Pointer = "AimbotMain_Enabled",
Callback = function(v)
print(v)
getgenv().KLOX.FOV["Visible"] = v  
        
end
})

uwuMisc:Toggle({
Name = "Shake",
Default = false,
Pointer = "Shake_Enabled",
Callback = function(v)
print(v)
getgenv().KLOX.Misc.Shake = v  
            
end
})

uwuMisc:Toggle({
Name = "UnlockOnDeath",
Default = false,
Pointer = "UnlockOnDeath_Enabled",
Callback = function(v)
print(v)
getgenv().KLOX.Misc.UnlockedOnDeath = v  
                
end
})

uwuSettings:Slider({Name = "Smoothness",
Minimum = 0.001,
Maximum = 1.5,
Default = 0.027,
Decimals = 0.001,
Pointer = "AimbotMain_Smoothness",
Callback = function(v)
getgenv().KLOX.Tracer.Smoothness = v
 
end  
})

uwuSettings:Slider({Name = "FOV Radius",
Minimum = 0.01,
Maximum = 100,
Default = 30,
Decimals = 0.01,
Pointer = "AimbotMain_Radius",
Callback = function(v)
getgenv().KLOX.FOV["Radius"] = v  
 
end  
})

uwuSettings:Slider({Name = "Shake Value",
Minimum = 0.5,
Maximum = 100,
Default = 34.91,
Decimals = 0.001,
Pointer = "AimbotMain_Booty",
Callback = function(v)
getgenv().KLOX.Misc.ShakeValue = v
  
end  
})

uwuSettings:Slider({Name = "Tracer Prediction",
Minimum = 0.001,
Maximum = 10,
Default = 0.190,
Decimals = 0.001,
Pointer = "AimbotMain_Booty",
Callback = function(v)
getgenv().KLOX.Tracer.Pred = v
  
end  
})

uwuSettings:Slider({Name = "Silent Prediction",
Minimum = 0.10,
Maximum = 0.195,
Default = 0.125,
Decimals = 0.001,
Pointer = "AimbotMain_Booty",
Callback = function(v)
getgenv().KLOX.Misc.ShakeValue = v
  
end  
})


Settings_Main:ConfigBox({})
Settings_Main:ButtonHolder({Buttons = {{"Load", function() end}, {"Save", function() end}}})
Settings_Main:Label({Name = "Unloading will fully unload\neverything, so save your\nconfig before unloading.", Middle = true})
Settings_Main:Button({Name = "Unload", Callback = function() Window:Unload() end})
-- // Initialisation
Window:Initialize()



--- the code shit

local Players, Client, Mouse, RS, Camera =
game:GetService("Players"),
game:GetService("Players").LocalPlayer,
game:GetService("Players").LocalPlayer:GetMouse(),
game:GetService("RunService"),
game.Workspace.CurrentCamera

local Circle = Drawing.new("Circle")
Circle.Color = Color3.new(1,1,1)
Circle.Thickness = 1

local UpdateFOV = function ()
if (not Circle) then
    return Circle
end
Circle.Visible = getgenv().KLOX.FOV["Visible"]
Circle.Radius = getgenv().KLOX.FOV["Radius"] * 3
Circle.Position = Vector2.new(Mouse.X, Mouse.Y + (game:GetService("GuiService"):GetGuiInset().Y))
return Circle
end

RS.Heartbeat:Connect(UpdateFOV)

ClosestPlrFromMouse = function()
local Target, Closest = nil, 1/0

for _ ,v in pairs(Players:GetPlayers()) do
    if (v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart")) then
        local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
        local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude

        if (Circle.Radius > Distance and Distance < Closest and OnScreen) then
            Closest = Distance
            Target = v
        end
    end
end
return Target
end

local WTS = function (Object)
local ObjectVector = Camera:WorldToScreenPoint(Object.Position)
return Vector2.new(ObjectVector.X, ObjectVector.Y)
end

local IsOnScreen = function (Object)
local IsOnScreen = Camera:WorldToScreenPoint(Object.Position)
return IsOnScreen
end

local FilterObjs = function (Object)
if string.find(Object.Name, "Gun") then
    return
end
if table.find({"Part", "MeshPart", "BasePart"}, Object.ClassName) then
    return true
end
end

local GetClosestBodyPart = function (character)
local ClosestDistance = 1/0
local BodyPart = nil
if (character and character:GetChildren()) then
    for _,  x in next, character:GetChildren() do
        if FilterObjs(x) and IsOnScreen(x) then
            local Distance = (WTS(x) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
            if (Circle.Radius > Distance and Distance < ClosestDistance) then
                ClosestDistance = Distance
                BodyPart = x
            end
        end
    end
end
return BodyPart
end

local Prey

task.spawn(function ()
while task.wait() do
    if Prey then
        if getgenv().KLOX.Silent.Enabled and getgenv().KLOX.Silent.ClosestPart == true then
            getgenv().KLOX.Silent["Part"] = tostring(GetClosestBodyPart(Prey.Character))
        end
    end
end
end)

local grmt = getrawmetatable(game)
local backupindex = grmt.__index
setreadonly(grmt, false)

grmt.__index = newcclosure(function(self, v)
if (getgenv().KLOX.Silent.Enabled and Mouse and tostring(v) == "Hit") then

    Prey = ClosestPlrFromMouse()

    if Prey then
        local endpoint = game.Players[tostring(Prey)].Character[getgenv().KLOX.Silent["Part"]].CFrame + (
            game.Players[tostring(Prey)].Character[getgenv().KLOX.Silent["Part"]].Velocity * getgenv().KLOX.Silent.Pred
        )
        return (tostring(v) == "Hit" and endpoint)
    end
end
return backupindex(self, v)
end)

local CC = game.Workspace.CurrentCamera
local Mouse = game.Players.LocalPlayer:GetMouse()
local Plr


Mouse.KeyDown:Connect(function(Key)
    local Keybind = getgenv().KLOX.Tracer.Key:lower()
    if (Key == Keybind) then
        if getgenv().KLOX.Tracer.Enabled == true then
            IsTargetting = not IsTargetting
            if IsTargetting then
                Plr = GetClosest()
            else
                if Plr ~= nil then
                    Plr = nil
                end
            end
        end
    end
end)

function GetClosest()
    local closestPlayer
    local shortestDistance = math.huge
    for i, v in pairs(game.Players:GetPlayers()) do
        pcall(function()

            if v ~= game.Players.LocalPlayer and v.Character and
                v.Character:FindFirstChild("Humanoid") then
                local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                local magnitude =
                (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
                if (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end)
    end
    return closestPlayer
end

local function IsOnScreen(Object)
    local IsOnScreen = game.Workspace.CurrentCamera:WorldToScreenPoint(Object.Position)
    return IsOnScreen
end

local function Filter(Object)
    if string.find(Object.Name, "Gun") then
        return
    end
    if Object:IsA("Part") or Object:IsA("MeshPart") then
        return true
    end
end

local function WTSPos(Position)
    local ObjectVector = game.Workspace.CurrentCamera:WorldToScreenPoint(Position)
    return Vector2.new(ObjectVector.X, ObjectVector.Y)
end

local function WTS(Object)
    local ObjectVector = game.Workspace.CurrentCamera:WorldToScreenPoint(Object.Position)
    return Vector2.new(ObjectVector.X, ObjectVector.Y)
end

function GetNearestPartToCursorOnCharacter(character)
    local ClosestDistance = math.huge
    local BodyPart = nil

    if (character and character:GetChildren()) then
        for k,  x in next, character:GetChildren() do
            if Filter(x) and IsOnScreen(x) then
                local Distance = (WTS(x) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
    
                if Distance < ClosestDistance then
                    ClosestDistance = Distance
                    BodyPart = x
                end
            end
        end
    end

    return BodyPart
end

game.RunService.Heartbeat:Connect(function()
    if getgenv().KLOX.Tracer.Enabled == true and Plr and Plr.Character ~= nil then
        if getgenv().KLOX.Misc.UnlockedOnDeath then
            if Plr.Character.BodyEffects["K.O"].Value then Plr = nil end
        end
        if getgenv().KLOX.Misc.Shake then
            local Main = CFrame.new(Camera.CFrame.p,Plr.Character[getgenv().KLOX.Tracer.Part].Position + Plr.Character[getgenv().KLOX.Tracer.Part].Velocity * getgenv().KLOX.Tracer.Pred +
            Vector3.new(
                math.random(-getgenv().KLOX.Misc.ShakeValue, getgenv().KLOX.Misc.ShakeValue),
                math.random(-getgenv().KLOX.Misc.ShakeValue, getgenv().KLOX.Misc.ShakeValue),
                math.random(-getgenv().KLOX.Misc.ShakeValue, getgenv().KLOX.Misc.ShakeValue)
            ) * 0.1)
            Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().KLOX.Tracer.Smoothness, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        else
            local Main = CFrame.new(Camera.CFrame.p,Plr.Character[getgenv().KLOX.Tracer.Part].Position + Plr.Character[getgenv().KLOX.Tracer.Part].Velocity * getgenv().KLOX.Tracer.Pred)
            Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().KLOX.Tracer.Smoothness, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if getgenv().KLOX.Tracer.Enabled and Plr ~= nil and (Plr.Character) then
            getgenv().KLOX.Tracer.Part = tostring(GetNearestPartToCursorOnCharacter(Plr.Character))
        end
    end
end)
