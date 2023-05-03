--a
local SToggle = false

-- //SILENT + FOV

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
    Circle.Visible = nukeradio.FOV["Visible"]
    Circle.Radius = nukeradio.FOV["Radius"] * 3
    Circle.Position = Vector2.new(Mouse.X, Mouse.Y)
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
            if nukeradio.Silent.Enabled and nukeradio.Silent.ClosestPart == true then
                nukeradio.Silent["Part"] = tostring(GetClosestBodyPart(Prey.Character))
            end
        end
    end
end)

-- resolver

if nukeradio.Silent.Enabled
    if not uwuCheckAnti(STarget) then
        mainevent:FireServer(namecalltype, STarget.Character[SPart].Position + (STarget.Character[SPart].Velocity * uwuSilentMain.Prediction))
    else
        mainevent:FireServer(namecalltype, STarget.Character[SPart].Position + ((STarget.Character.Humanoid.MoveDirection * STarget.Character.Humanoid.WalkSpeed) * uwuSilentMain.Prediction))
    end
end

local grmt = getrawmetatable(game)
local backupindex = grmt.__index
setreadonly(grmt, false)

grmt.__index = newcclosure(function(self, v)
    if (nukeradio.Silent.Enabled and Mouse and tostring(v) == "Hit") then

        Prey = ClosestPlrFromMouse()

        if Prey then
            local endpoint = game.Players[tostring(Prey)].Character[nukeradio.Silent["Part"]].CFrame + (
                game.Players[tostring(Prey)].Character[nukeradio.Silent["Part"]].Velocity * nukeradio.Silent.Pred
            )
            return (tostring(v) == "Hit" and endpoint)
        end
    end
    return backupindex(self, v)
end)

-- // Tracer/Tracer + UnlockOnDeath + shake + shake value here

local CC = game.Workspace.CurrentCamera
local Mouse = game.Players.LocalPlayer:GetMouse()
local Plr


Mouse.KeyDown:Connect(function(Key)
    local Keybind = getgenv().nukeradio.Tracer.Key:lower()
    if (Key == Keybind) then
        if getgenv().nukeradio.Tracer.Enabled == true then
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
    if getgenv().nukeradio.Tracer.Enabled == true and Plr and Plr.Character ~= nil then
        if getgenv().nukeradio.Misc.UnlockedOnDeath then
            if Plr.Character.BodyEffects["K.O"].Value then Plr = nil end
        end
        if getgenv().nukeradio.Misc.Shake then
            local Main = CFrame.new(Camera.CFrame.p,Plr.Character[getgenv().nukeradio.Tracer.Part].Position + Plr.Character[getgenv().nukeradio.Tracer.Part].Velocity * getgenv().nukeradio.Tracer.Pred +
            Vector3.new(
                math.random(-getgenv().nukeradio.Misc.ShakeValue, getgenv().nukeradio.Misc.ShakeValue),
                math.random(-getgenv().nukeradio.Misc.ShakeValue, getgenv().nukeradio.Misc.ShakeValue),
                math.random(-getgenv().nukeradio.Misc.ShakeValue, getgenv().nukeradio.Misc.ShakeValue)
            ) * 0.1)
            Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().nukeradio.Tracer.Smoothness, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        else
            local Main = CFrame.new(Camera.CFrame.p,Plr.Character[getgenv().nukeradio.Tracer.Part].Position + Plr.Character[getgenv().nukeradio.Tracer.Part].Velocity * getgenv().nukeradio.Tracer.Pred)
            Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().nukeradio.Tracer.Smoothness, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if getgenv().nukeradio.Tracer.Enabled and Plr ~= nil and (Plr.Character) then
            getgenv().nukeradio.Tracer.Part = tostring(GetNearestPartToCursorOnCharacter(Plr.Character))
        end
    end
end)



-- //Resolver + wallcheck here

local WallCheck = function(destination, ignore)
    if getgenv().nukeradio.Misc.WallCheck then
        local Origin = Camera.CFrame.p
        local CheckRay = Ray.new(Origin, destination - Origin)
        local Hit = game.workspace:FindPartOnRayWithIgnoreList(CheckRay, ignore)
        return Hit == nil
    else
        return true
    end
end

GetClosestToMouse = function()
    local Target, Closest = nil, 1 / 0

    for _, v in pairs(Players:GetPlayers()) do
        if (v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart")) then
            local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
            local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude

            if
                (Circle.Radius > Distance and Distance < Closest and OnScreen and
                    WallCheck(v.Character.HumanoidRootPart.Position, {Client, v.Character}))
             then
                Closest = Distance
                Target = v
            end
        end
    end
    return Target
end

getgenv().KLOX = {
     Resolver = {
             Enabled = true,
      },
}



RS.Heartbeat:Connect(function()
    if  getgenv().nukeradio.Resolver.Enabled then
        pcall(function()
            for i,v in pairs(game.Players:GetChildren()) do
                if v ~= game.Players.LocalPlayer  then
                    local hrp = v.Character.HumanoidRootPart
                    hrp.Velocity =  Vector3.new(0.1,-0,0.34) *(0.11^00)
                    hrp.AssemblyLinearVelocity = Vector3.new(0,0,0) *(0^0)
                    hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)    
                    hrp.AssemblyLinearVelocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z) 
                end
            end
        end)
    end
    end)


-- //Macro here


local Player = game:GetService("Players").LocalPlayer
        local Mouse = Player:GetMouse()
        local SpeedGlitch = false
        Mouse.KeyDown:Connect(function(Key)
            if getgenv().nukeradio.Macro.Type == "3Person" and getgenv().nukeradio.Macro.Enabled == true and Key == getgenv().nukeradio.Macro.Keybind then
                SpeedGlitch = not SpeedGlitch
                if SpeedGlitch == true then
                    repeat game:GetService("RunService").Heartbeat:wait()
                        keypress(0x49)
                        game:GetService("RunService").Heartbeat:wait()

                        keypress(0x4F)
                        game:GetService("RunService").Heartbeat:wait()

                        keyrelease(0x49)
                        game:GetService("RunService").Heartbeat:wait()

                        keyrelease(0x4F)
                        game:GetService("RunService").Heartbeat:wait()

                    until SpeedGlitch == false
                end
            end
        end)
        
        
        
        local Player = game:GetService("Players").LocalPlayer
        local Mouse = Player:GetMouse()
        local SpeedGlitch = false
        Mouse.KeyDown:Connect(function(Key)
            if getgenv().nukeradio.Macro.Type == "1Person" and getgenv().nukeradio.Macro.Enabled == true and Key == getgenv().nukeradio.Macro.Keybind then
                SpeedGlitch = not SpeedGlitch
                if SpeedGlitch == true then
                    repeat game:GetService("RunService").Heartbeat:wait()
                            game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                                 game:GetService("RunService").Heartbeat:wait()
                                 game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                                 game:GetService("RunService").Heartbeat:wait()
                    until SpeedGlitch == false
                end
            end
        end)


-- anti aim viewer

local function uwuCheckAnti(targ) -- // Anti-aim detection
    if (targ.Character.HumanoidRootPart.Velocity.Y < -5 and targ.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall) or targ.Character.HumanoidRootPart.Velocity.Y < -50 then
        return true
    elseif targ and (targ.Character.HumanoidRootPart.Velocity.X > 35 or targ.Character.HumanoidRootPart.Velocity.X < -35) then
        return true
    elseif targ and targ.Character.HumanoidRootPart.Velocity.Y > 60 then
        return true
    elseif targ and (targ.Character.HumanoidRootPart.Velocity.Z > 35 or targ.Character.HumanoidRootPart.Velocity.Z < -35) then
        return true
    else
        return false
    end
end


-- togle

uis.InputBegan:Connect(function(k,t)
    if not t then
        print("hello")

        elseif k.KeyCode == Enum.KeyCode[nukeradio.Silent.Toggle:upper()]
            if SToggle then
                SToggle = false
                if uwuMain.Notifications then
                    SendNotification("silent disabled")
                end
            else
                SToggle = true
                if uwuMain.Notifications then
                    SendNotification("silent enabled")
                end
            end
        end
    end
end)
