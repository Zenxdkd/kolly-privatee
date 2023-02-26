-- LEAKED BY 2017#0001 SUCK DICK LOSER PASTED ASS SRCIPT LOLOLO
getgenv().Gorus = {
    Options = {
        ["Notifications"] = false,
        ["Intro"] = true,
    },
    Silent = {
        ["Enabled"] = true,
        ["UseKeybind"] = true,
        ["Keybind"] = "p",
        ["Predict"] = true,
        ["Prediction"] = 0.119,
        ["Aimpart"] = "UpperTorso",
        ["NearestCursorAimpart"] = true,
    }, 
    Camlock = {
        ["Enabled"] = true,
        ["Keybind"] = "q",
        ["Predict"] = true,
        ["Prediction"] = 0.1267,
        ["SmoothnessValue"] = 0.0181,
        ["Shake"] = false,
        ["ShakeValue"] = 1,
        ["Aimpart"] = "HumanoidRootPart",
        ["NearestCursorAimpart"] = true,
    },
    Custom = {
        ["Shake"] = false,
        ["Smoothness"] = false,
        ["AirShakeValue"] = 4,
        ["AirSmoothnessValue"] = 0.1155,
        ["GroundShakeValue"] = 10,
        ["GroundSmoothnessValue"] = 0.0576,
    },
    Fov = {
        Silent = {
            ["Visible"] = false,
            ["Filled"] = false,
            ["Size"] = 20,
            ["Thickness"] = 2.5,
            ["Transparency"] = 0.15,
            ["Sides"] = 100,
            ["Color"] = Color3.fromRGB(0, 0, 0),
        },
        Camlock = {
            ["Visible"] = false,
            ["Filled"] = false,
            ["Size"] = 20,
            ["Thickness"] = 3,
            ["Transparency"] = 0.25,
            ["Sides"] = 100,
            ["Color"] = Color3.fromRGB(0, 0, 0),
        },
    },
    Checks = {
        ["Wall"] = true,
        ["Knocked"] = false,
        ["DisableOnDeath"] = true,
        ["DisableOutsideFov"] = false,
        ["AntiGroundShots"] = false,
    },
    Resolver = {
        ["Enabled"] = false,
    },
    Macro = {
        ["Enabled"] = true,
        ["Keybind"] = "h", 
        ["Type"] = "Normal",
    },
    AutoPrediction = {
        ["Enabled"] = true,
        ["P20"] = 0.12588,
        ["P30"] = 0.11911,
        ["P40"] = 0.12471,
        ["P50"] = 0.12766,
        ["P60"] = 0.12731,
        ["P70"] = 0.12951,
        ["P80"] = 0.13181,
        ["P90"] = 0.13573,
        ["P100"] = 0.13334,
        ["P110"] = 0.14552,
        ["P120"] = 0.14376,
        ["P130"] = 0.15669,
        ["P140"] = 0.12234,
        ["P150"] = 0.15214,
        ["P160"] = 0.16262,
        ["P170"] = 0.19231,
        ["P180"] = 0.19284,
        ["P190"] = 0.16594,
        ["P200"] = 0.16942,
        ["P250"] = 0.16514,
        ["P300"] = 0.16782,
    },
    Range = {
        ["Enabled"] = false,
        ["Type"] = "Fov",
        ["CloseDetection"] = 25,
        ["MidDetection"] = 60,
        ["FarDetection"] = 115,
        ["VeryFarDetection"] = math.huge,
        ["CloseFov"] = 60,
        ["ClosePrediction"] = 0.121,
        ["MidFov"] = 45,
        ["MidPrediction"] = 0.127,
        ["FarFov"] = 35,
        ["FarPrediction"] = 0.131,
        ["VeryFarFov"] = 20,
        ["VeryFarPrediction"] = 0.134,
    },
    GunFov = {
        ["Enabled"] = false,
        ["DoubleBarrel"] = 22.5,
        ["Revolver"] = 27.5,
        ["Shotgun"] = 35,
        ["TacticalShotgun"] = 35,
        ["Smg"] = 25,
        ["Silencer"] = 32.5,
    },
}

local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;

if getgenv().LuaBotloaded == true then
    if getgenv().Gorus.Options.Notifications == true then

Notify({
Description = "Settings From Script Updated.";
Title = "Gorus";
Duration = 1.5;
});
        return
    end
    end
    getgenv().LuaBotloaded = true
    
    if getgenv().Gorus.Options.Notifications == true then

Notify({
Description = "Checking Assets";
Title = "Gorus";
Duration = 1.5;
});
wait(2)
Notify({
Description = "Checking User";
Title = "Gorus";
Duration = 1.5;
});
wait(2)
Notify({
Description = "Gorus Loaded Enjoy";
Title = "Gorus";
Duration = 1.5;
});
end
wait(1)
local targ = nil
local Plr  = nil

local Players, Client, Mouse, RS, Camera =
    game:GetService("Players"),
    game:GetService("Players").LocalPlayer,
    game:GetService("Players").LocalPlayer:GetMouse(),
    game:GetService("RunService"),
    game:GetService("Workspace").CurrentCamera

local silentcircle = Drawing.new("Circle")

local tracercircle = Drawing.new("Circle")

silentcircle.Transparency = getgenv(). Advati.Fov.Silent.Transparency
silentcircle.Thickness = getgenv().Gorus.Fov.Silent.Thickness
silentcircle.Color = getgenv().Gorus.Fov.Silent.Color
silentcircle.Filled = getgenv().Gorus.Fov.Silent.Filled

tracercircle.Transparency = getgenv().Gorus.Fov.Camlock.Transparency
tracercircle.Thickness = getgenv().Gorus.Fov.Camlock.Thickness
tracercircle.Color = getgenv().Gorus.Fov.Camlock.Color
tracercircle.Filled = getgenv().Gorus.Fov.Camlock.Filled

local UpdateFOV = function ()
    if (not silentcircle and not tracercircle) then
        return silentcircle and tracercircle
    end
    tracercircle.Visible  = getgenv().Gorus.Fov.Camlock.Visible
    tracercircle.Radius   = getgenv().Gorus.Fov.Camlock.Size * 2
    tracercircle.Filled = getgenv().Gorus.Fov.Camlock.Filled
    tracercircle.Thickness = getgenv().Gorus.Fov.Camlock.Thickness
    tracercircle.Transparency = getgenv().Gorus.Fov.Camlock.Transparency
    tracercircle.Position = Vector2.new(Mouse.X, Mouse.Y + (game:GetService("GuiService"):GetGuiInset().Y))
    tracercircle.Color = getgenv().Gorus.Fov.Camlock.Color
    tracercircle.NumSides = getgenv().Gorus.Fov.Camlock.Sides
    
    silentcircle.Visible  = getgenv().Gorus.Fov.Silent.Visible
    silentcircle.Radius   = getgenv().Gorus.Fov.Silent.Size * 2
    silentcircle.Filled = getgenv().Gorus.Fov.Silent.Filled
    silentcircle.Thickness = getgenv().Gorus.Fov.Silent.Thickness
    silentcircle.Transparency = getgenv().Gorus.Fov.Silent.Transparency
    silentcircle.Position = Vector2.new(Mouse.X, Mouse.Y + (game:GetService("GuiService"):GetGuiInset().Y))
    silentcircle.Color = getgenv().Gorus.Fov.Silent.Color
    silentcircle.NumSides = getgenv().Gorus.Fov.Silent.Sides
    return silentcircle and tracercircle
end

RS.Heartbeat:Connect(UpdateFOV)

local WallCheck = function(destination, ignore)
    local Origin    = Camera.CFrame.p
    local CheckRay  = Ray.new(Origin, destination - Origin)
    local Hit       = game.workspace:FindPartOnRayWithIgnoreList(CheckRay, ignore)
    return Hit      == nil
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

local ClosestPlrFromMouse = function()
    local Target, Closest = nil, 1/0
    
    for _ ,v in pairs(Players:GetPlayers()) do
    	if getgenv().Gorus.Checks.Wall then
    		if (v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart")) then
    			local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
    			local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
    
    			if (silentcircle.Radius * 1.27 > Distance and Distance < Closest and OnScreen) and WallCheck(v.Character.HumanoidRootPart.Position, {Client, v.Character}) then
    				Closest = Distance
    				Target = v
    	

    			end
    		end
    	else
    		if (v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart")) then
    			local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
    			local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
    
    			if (silentcircle.Radius * 1.27 > Distance and Distance < Closest and OnScreen) then
    				Closest = Distance
    				Target = v
    			end
    		end
    	end
    end
    return Target
end

local ClosestPlrFromMouse2 = function()
    local Target, Closest = nil, tracercircle.Radius * 1.27
    
    for _ ,v in pairs(Players:GetPlayers()) do
    	if (v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart")) then
        	if getgenv().Gorus.Checks.Wall then
        		local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
        		local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
        
        		if (Distance < Closest and OnScreen) and WallCheck(v.Character.HumanoidRootPart.Position, {Client, v.Character}) then
        			Closest = Distance
        			Target = v
        		end
        	    else
        			local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
        			local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
        
        			if (Distance < Closest and OnScreen) then
        				Closest = Distance
        				Target = v
        			end
        		end
            end
        end
    return Target
end

local GetClosestBodyPart = function (character)
    local ClosestDistance = 1/0
    local BodyPart = nil
    
    if (character and character:GetChildren()) then
        for _,  x in next, character:GetChildren() do
            if FilterObjs(x) and IsOnScreen(x) then
                local Distance = (WTS(x) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if (silentcircle.Radius * 1.27 > Distance and Distance < ClosestDistance) then
                    ClosestDistance = Distance
                    BodyPart = x
                end
            end
        end
    end
    return BodyPart
end

local GetClosestBodyPartV2 = function (character)
    local ClosestDistance = 1/0
    local BodyPart = nil
    
    if (character and character:GetChildren()) then
        for _,  x in next, character:GetChildren() do
            if FilterObjs(x) and IsOnScreen(x) then
                local Distance = (WTS(x) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if (Distance < ClosestDistance) then
                    ClosestDistance = Distance
                    BodyPart = x
                end
            end
        end
    end
    return BodyPart
end

Mouse.KeyDown:Connect(function(Key)
    local Keybind = getgenv().Gorus.Camlock.Keybind:lower()
    if (Key == Keybind) then
        if getgenv().Gorus.Camlock.Enabled == true then
            IsTargetting = not IsTargetting
            if IsTargetting then
                Plr = ClosestPlrFromMouse2()
            else
                if Plr ~= nil then
                    Plr = nil
                    IsTargetting = false
                end
            end
        end
    end
end)

Mouse.KeyDown:Connect(function(Key)
    local Keybind = getgenv().Gorus.Silent.Keybind:lower()
    if (Key == Keybind) and getgenv().Gorus.Silent.UseKeybind == true then
            if getgenv().Gorus.Silent.Enabled == true then
				getgenv().Gorus.Silent.Enabled = false
				if getgenv().Gorus.Options.Notifications == true then
				    
local Notify = AkaliNotif.Notify;
				Notify({
Description = "Silent Disabled";
Title = "Advati";
Duration = 1.5;
});
end 
                
            else
				getgenv().Gorus.Silent.Enabled = true
				if getgenv().Gorus.Options.Notifications == true then
				    
local Notify = AkaliNotif.Notify;
				Notify({
Description = "Silent Enabled";
Title = "Advati";
Duration = 1.5;
});
end
                
            end
        end
    end
)






                            



local grmt = getrawmetatable(game)
local backupindex = grmt.__index
setreadonly(grmt, false)

grmt.__index = newcclosure(function(self, v)
    if (getgenv().Gorus.Silent.Enabled and Mouse and tostring(v) == "Hit") then
        if targ and targ.Character then
    		if getgenv().Gorus.Silent.Predict then
    			local endpoint = game.Players[tostring(targ)].Character[getgenv().Gorus.Silent.Aimpart].CFrame + (
    				game.Players[tostring(targ)].Character[getgenv().Gorus.Silent.Aimpart].Velocity * getgenv().Gorus.Silent.Prediction
    			)
    			return (tostring(v) == "Hit" and endpoint)
    		else
    			local endpoint = game.Players[tostring(targ)].Character[getgenv().Gorus.Silent.Aimpart].CFrame
    			return (tostring(v) == "Hit" and endpoint)
    		end
        end
    end
    return backupindex(self, v)
end)



RS.Heartbeat:Connect(function()
	if getgenv().Gorus.Silent.Enabled then
	    if targ and targ.Character and targ.Character:WaitForChild(getgenv().Gorus.Silent.Aimpart) then
            if getgenv().Gorus.Resolver.Enabled == true and targ.Character:WaitForChild("HumanoidRootPart").Velocity.magnitude > 70 then            
                pcall(function()
                    local TargetVel = targ.Character[getgenv().Gorus.Silent.Aimpart]
                    TargetVel.Velocity = Vector3.new(0, 0, 0)
                    TargetVel.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            
                end)
            end
            if getgenv().Gorus.Checks.AntiGroundShots == true and targ.Character:FindFirstChild("Humanoid") == Enum.HumanoidStateType.Freefall then
                pcall(function()
                    local TargetVelv5 = targ.Character[getgenv().Gorus.Silent.Aimpart]
                    TargetVelv5.Velocity = Vector3.new(TargetVelv5.Velocity.X, (TargetVelv5.Velocity.Y * 5), TargetVelv5.Velocity.Z)
                    TargetVelv5.AssemblyLinearVelocity = Vector3.new(TargetVelv5.Velocity.X, (TargetVelv5.Velocity.Y * 5), TargetVelv5.Velocity.Z)
                end)
            end
            
            if getgenv().Gorus.Resolver.Enabled == true then            
                pcall(function()
                    local TargetVelv2 = targ.Character[getgenv().Gorus.Silent.Aimpart]
                    TargetVelv2.Velocity = Vector3.new(TargetVelv2.Velocity.X, 0, TargetVelv2.Velocity.Z)
                    TargetVelv2.AssemblyLinearVelocity = Vector3.new(TargetVelv2.Velocity.X, 0, TargetVelv2.Velocity.Z)
                end)
            end
	    end
	end
	



if getgenv().Gorus.Custom.Shake == true then
       if Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
       
           getgenv().Gorus.Camlock.ShakeValue = getgenv().Gorus.Custom.AirShakeValue
       else
        getgenv().Gorus.Camlock.ShakeValue  = getgenv().Gorus.Custom.GroundShakeValue

  end
end

if getgenv().Gorus.Custom.Smoothness == true then
       if Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
       
           getgenv().Gorus.Camlock.SmoothnessValue = getgenv().Gorus.Custom.AirSmoothnessValue
       else
        getgenv().Gorus.Camlock.SmoothnessValue = getgenv().Gorus.Custom.GroundSmoothnessValue
  end
end




    if getgenv().Gorus.Camlock.Enabled == true then
        if getgenv().Gorus.Resolver.Enabled == true and Plr and Plr.Character and Plr.Character:WaitForChild(getgenv().Gorus.Camlock.Aimpart) and Plr.Character:WaitForChild("HumanoidRootPart").Velocity.magnitude > 70 then
            pcall(function()
                local TargetVelv3 = Plr.Character[getgenv().Gorus.Camlock.Aimpart]
                TargetVelv3.Velocity = Vector3.new(0, 0, 0)
                TargetVelv3.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            end)
        end
        if getgenv().Gorus.Checks.AntiGroundShots == true and Plr.Character:FindFirstChild("Humanoid") == Enum.HumanoidStateType.Freefall then
                pcall(function()
                    local TargetVelv5 = Plr.Character[getgenv().Gorus.Camlock.Aimpart]
                    TargetVelv5.Velocity = Vector3.new(TargetVelv5.Velocity.X, (TargetVelv5.Velocity.Y * 5), TargetVelv5.Velocity.Z)
                    TargetVelv5.AssemblyLinearVelocity = Vector3.new(TargetVelv5.Velocity.X, (TargetVelv5.Velocity.Y * 5), TargetVelv5.Velocity.Z)
                end)
        end
    
        if getgenv().Gorus.Resolver.Enabled == true and Plr and Plr.Character and Plr.Character:WaitForChild(getgenv().Gorus.Camlock.Aimpart) then
            pcall(function()
                local TargetVelv4 = Plr.Character[getgenv().Gorus.Camlock.Aimpart]
                TargetVelv4.Velocity = Vector3.new(TargetVelv4.Velocity.X, 0, TargetVelv4.Velocity.Z)
                TargetVelv4.AssemblyLinearVelocity = Vector3.new(TargetVelv4.Velocity.X, 0, TargetVelv4.Velocity.Z)
            end)
        end
    end
end)

RS.RenderStepped:Connect(function()
	if getgenv().Gorus.Silent.Enabled then
        if getgenv().Gorus.Checks.Knocked == true and targ and targ.Character then 
            local KOd = targ.Character:WaitForChild("BodyEffects")["K.O"].Value
            local Grabbed = targ.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
            if KOd or Grabbed then
                targ = nil
            end
        end
	end
    if getgenv().Gorus.Camlock.Enabled == true then
        if getgenv().Gorus.Checks.Knocked == true and Plr and Plr.Character then 
            local KOd = Plr.Character:WaitForChild("BodyEffects")["K.O"].Value
            local Grabbed = Plr.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
            if KOd or Grabbed then
                Plr = nil
                IsTargetting = false
            end
        end
        
		if getgenv().Gorus.Checks.DisableOnDeath == true and Plr and Plr.Character:FindFirstChild("Humanoid") then
			if Plr.Character.Humanoid.health < 2 then
				Plr = nil
				IsTargetting = false
			end
		end
		if getgenv().Gorus.Checks.DisableOnDeath == true and Plr and Plr.Character:FindFirstChild("Humanoid") then
			if Client.Character.Humanoid.health < 2 then
				Plr = nil
				IsTargetting = false
			end
		end
        if getgenv().Gorus.Checks.DisableOutsideFov == true and Plr and Plr.Character and Plr.Character:WaitForChild("HumanoidRootPart") then
            if
            Camlock.Radius <
                (Vector2.new(
                    Camera:WorldToScreenPoint(Plr.Character.HumanoidRootPart.Position).X,
                    Camera:WorldToScreenPoint(Plr.Character.HumanoidRootPart.Position).Y
                ) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
             then
                Plr = nil
                IsTargetting = false
            end
        end
		if getgenv().Gorus.Camlock.Predict and Plr and Plr.Character and Plr.Character:FindFirstChild(getgenv().Gorus.Camlock.Aimpart) then
			if getgenv().Gorus.Camlock.Shake then
				local Main = CFrame.new(Camera.CFrame.p,Plr.Character[getgenv().Gorus.Camlock.Aimpart].Position + Plr.Character[getgenv().Gorus.Camlock.Aimpart].Velocity * getgenv().Gorus.Camlock.Prediction+
				Vector3.new(
					math.random(-getgenv().Gorus.Camlock.ShakeValue, getgenv().Gorus.Camlock.ShakeValue),
					math.random(-getgenv().Gorus.Camlock.ShakeValue, getgenv().Gorus.Camlock.ShakeValue),
					math.random(-getgenv().Gorus.Camlock.ShakeValue, getgenv().Gorus.Camlock.ShakeValue)
				) * 0.1)
				Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().Gorus.Camlock.SmoothnessValue / 2, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
			else
    			local Main = CFrame.new(Camera.CFrame.p,Plr.Character[getgenv().Gorus.Camlock.Aimpart].Position + Plr.Character[getgenv().Gorus.Camlock.Aimpart].Velocity * getgenv().Gorus.Camlock.Prediction)
    			Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().Gorus.Camlock.SmoothnessValue / 2, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
			end
		elseif getgenv().Gorus.Camlock.Predict == false and Plr and Plr.Character and Plr.Character:FindFirstChild(getgenv().Gorus.Camlock.Aimpart) then
			if getgenv().Gorus.Camlock.Shake then
				local Main = CFrame.new(Camera.CFrame.p,Plr.Character[getgenv().Gorus.Camlock.Aimpart].Position +
				Vector3.new(
					math.random(-getgenv().Gorus.Camlock.ShakeValue, getgenv().Gorus.Camlock.ShakeValue),
					math.random(-getgenv().Gorus.Camlock.ShakeValue, getgenv().Gorus.Camlock.ShakeValue),
					math.random(-getgenv().Gorus.Camlock.ShakeValue, getgenv().Gorus.Camlock.ShakeValue)
				) * 0.1)
				Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().Gorus.Camlock.SmoothnessValue / 2, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
		    else
    			local Main = CFrame.new(Camera.CFrame.p,Plr.Character[getgenv().Gorus.Camlock.Aimpart].Position)
    			Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().Gorus.Camlock.SmoothnessValue / 2, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
		    end
		end
	end
end)

task.spawn(function ()
    while task.wait() do
    	if getgenv().Gorus.Silent.Enabled then
            targ = ClosestPlrFromMouse()
    	end
        if Plr then
            if getgenv().Gorus.Camlock.Enabled and (Plr.Character) and getgenv().Gorus.Camlock.NearestCursorAimpart then
                getgenv().Gorus.Camlock.Aimpart = tostring(GetClosestBodyPartV2(Plr.Character))
            end
        end
        if targ then
            if getgenv().Gorus.Silent.Enabled and (targ.Character) and getgenv().Gorus.Silent.NearestCursorAimpart then
                getgenv().Gorus.Silent.Aimpart = tostring(GetClosestBodyPart(targ.Character))
            end
        end
    end
end)

getgenv().uhpoop = {
    ["Enabled"] = (getgenv().Gorus.GunFov.Enabled),
    ["Double-Barrel SG"] = {["FOV"] = (getgenv().Gorus.GunFov.DoubleBarrel)}, --// Db
    ["DoubleBarrel"] = {["FOV"] = (getgenv().Gorus.GunFov.DoubleBarrel)}, --// Db
    ["Revolver"] = {["FOV"] = (getgenv().Gorus.GunFov.Revolver)}, --// Rev
    ["SMG"] = {["FOV"] = (getgenv().Gorus.GunFov.Smg)}, --// Uzi/Smg
    ["Shotgun"] = {["FOV"] = (getgenv().Gorus.GunFov.Shotgun)}, --// Sg
    ["TacticalShotgun"] = {["FOV"] = (getgenv().Gorus.GunFov.TacticalShotgun)}, --// Tac
    ["Silencer"] = {["FOV"] = (getgenv().Gorus.GunFov.Silencer)}, -- smg
    
}                 

local Script = {Functions = {}}
    Script.Functions.getToolName = function(name)
        local split = string.split(string.split(name, "[")[2], "]")[1]
        return split
    end
    Script.Functions.getEquippedWeaponName = function()
        if (Client.Character) and Client.Character:FindFirstChildWhichIsA("Tool") then
           local Tool =  Client.Character:FindFirstChildWhichIsA("Tool")
           if string.find(Tool.Name, "%[") and string.find(Tool.Name, "%]") and not string.find(Tool.Name, "Wallet") and not string.find(Tool.Name, "Phone") then
              return Script.Functions.getToolName(Tool.Name)
           end
        end
        return nil
    end
    RS.RenderStepped:Connect(function()
    if Script.Functions.getEquippedWeaponName() ~= nil then
        local WeaponSettings = getgenv().uhpoop[Script.Functions.getEquippedWeaponName()]
        if WeaponSettings ~= nil and getgenv().Gorus.GunFov.Enabled == true then
            getgenv().Gorus.Fov.Silent.Size = WeaponSettings.FOV
        else
            getgenv().Gorus.Fov.Silent.Size = getgenv().Gorus.Fov.Silent.Size
        end
    end
end)

local Aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/GravesFr/opensourceskidded/main/s"))()
Aiming.TeamCheck(false)



local Workspace = game:GetService("Workspace")

local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")



local LocalPlayer = Players.LocalPlayer

local Mouse = LocalPlayer:GetMouse()

local CurrentCamera = Workspace.CurrentCamera


Aiming.FOV = 50
--------------------------------------------------
--------------------------------------------------- -fov 5.5-6.6 is legit

function Aiming.Check()
    if not (Aiming.Enabled == true and Aiming.Selected ~= LocalPlayer and Aiming.SelectedPart ~= nil) then
        return false
    end
end


game:GetService("RunService").Heartbeat:Connect(
                                function()
                                    if
                                        getgenv().Gorus.Range.Enabled == true and getgenv().Gorus.Range.Type == "Fov" and Aiming.Selected ~= nil and (Aiming.Selected.Character) and targ and targ.Character then
                                        if
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().Gorus.Range.CloseDetection
                                         then
                                            getgenv().Gorus.Fov.Silent.Size = getgenv().Gorus.Range.CloseFov
                                            
                                        elseif
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().Gorus.Range.MidDetection
                                         then
                                            getgenv().Gorus.Fov.Silent.Size = getgenv().Gorus.Range.MidFov
                                        elseif
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().Gorus.Range.FarDetection
                                         then
                                            getgenv().Gorus.Fov.Silent.Size = getgenv().Gorus.Range.FarFov
                                        elseif
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().Gorus.Range.VeryFarDetection
                                         then
                                            getgenv().Gorus.Fov.Silent.Size = getgenv().Gorus.Range.VeryFarFov
                                        end
                                    end
                                end
                            )
                            
                            game:GetService("RunService").Heartbeat:Connect(
                                function()
                                    if
                                        getgenv().Gorus.Range.Enabled == true and getgenv().Gorus.Range.Type == "Prediction" and Aiming.Selected ~= nil and (Aiming.Selected.Character) and targ and Plr.Character then
                                        if
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().Gorus.Range.CloseDetection
                                         then
                                            getgenv().Gorus.Silent.Prediction= getgenv().Gorus.Range.ClosePrediction
                                            
                                        elseif
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().Gorus.Range.MidDetection
                                         then
                                            getgenv().Gorus.Silent.Prediction= getgenv().Gorus.Range.MidPrediction
                                        elseif
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().Gorus.Range.FarDetection
                                         then
                                            getgenv().Gorus.Silent.Prediction= getgenv().Gorus.Range.FarPrediction
                                        elseif
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().Gorus.Range.VeryFarDetection
                                         then
                                            getgenv().Gorus.Silent.Prediction= getgenv().Gorus.Range.VeryFarPrediction
                                        end
                                    end
                                end
                            )
                            
                            game:GetService("RunService").Heartbeat:Connect(
                                function()
                                    if
                                        getgenv().Gorus.Range.Enabled == true and getgenv().Gorus.Range.Type == "Both" and Aiming.Selected ~= nil and (Aiming.Selected.Character) and targ and Plr.Character then
                                        if
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().Gorus.Range.CloseDetection
                                         then
                                            getgenv().Gorus.Fov.Silent.Size = getgenv().Gorus.Range.CloseFov
                                            getgenv().Gorus.Silent.Prediction= getgenv().Gorus.Range.ClosePrediction
                                            
                                        elseif
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().Gorus.Range.MidDetection
                                         then
                                            getgenv().Gorus.Fov.Silent.Size = getgenv().Gorus.Range.MidFov
                                            getgenv().Gorus.Silent.Prediction= getgenv().Gorus.Range.MidPrediction
                                        elseif
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().Gorus.Range.FarDetection
                                         then
                                            getgenv().Gorus.Fov.Silent.Size = getgenv().Gorus.Range.FarFov
                                            getgenv().Gorus.Silent.Prediction= getgenv().Gorus.Range.FarPrediction
                                        elseif
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().Gorus.Range.VeryFarDetection
                                         then
                                            getgenv().Gorus.Fov.Silent.Size = getgenv().Gorus.Range.VeryFarFov
                                            getgenv().Gorus.Silent.Prediction= getgenv().Gorus.Range.VeryFarPrediction
                                        end
                                    end
                                end
                            )



local Player = game:GetService("Players").LocalPlayer
            local Mouse = Player:GetMouse()
            local SpeedGlitch = false
            Mouse.KeyDown:Connect(function(Key)
                if getgenv().Gorus.Macro.Type == "Normal" and getgenv().Gorus.Macro.Enabled == true and Key == getgenv().Gorus.Macro.Keybind then
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
                if getgenv().Gorus.Macro.Type == "Shift" and getgenv().Gorus.Macro.Enabled == true and Key == getgenv().Gorus.Macro.Keybind then
                    SpeedGlitch = not SpeedGlitch
                    if SpeedGlitch == true then
                        repeat game:GetService("RunService").Heartbeat:wait()

                            keypress(0xA0)
                            game:GetService("RunService").Heartbeat:wait()

                            keypress(0xA0)
                            game:GetService("RunService").Heartbeat:wait()

                            keyrelease(0xA0)
                            game:GetService("RunService").Heartbeat:wait()

                            keyrelease(0xA0)
                            game:GetService("RunService").Heartbeat:wait()

                        until SpeedGlitch == false
                    end
                end
            end)
            
      if getgenv().Gorus.Resolver.Enabled == true then 
          local hrp
local resolver = game:GetService("RunService")

demiseuwu.Heartbeat:Connect(function()
    pcall(function()
        for i,v in pairs(game.Players:GetChildren()) do
            if v ~= game.Players.LocalPlayer  then
                hrp = v.Character.HumanoidRootPart
                hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
            end
        end
    end)
end)
end
            
            

    while getgenv().Gorus.AutoPrediction.Enabled == true do
    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    local pingValue = string.split(ping, " ")[1]
    local pingNumber = tonumber(pingValue)
end   
   
    if pingNumber < 30 then
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P20)
        Gorus.Silent.Prediction = (getgenv().Gorus.AutoPrediction.P20)
    elseif pingNumber < 40 then
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P30)
        Gorus.Silent.Prediction= (getgenv().Gorus.AutoPrediction.P30)
    elseif pingNumber < 50 then
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P40)
        Gorus.Silent.Prediction= (getgenv().Gorus.AutoPrediction.P40)
    elseif pingNumber < 60 then
end
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P50)
        Gorus.Silent.Prediction= (getgenv().Gorus.AutoPrediction.P50)
    elseif pingNumber < 70 then
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P60)
        Gorus.Silent.Prediction= (getgenv().Gorus.AutoPrediction.P60)
    elseif pingNumber < 80 then
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P70)
        Gorus.Silent.Prediction = (getgenv().Gorus.AutoPrediction.P70)
    elseif pingNumber < 90 then
end
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P80)
        Gorus.Silent.Prediction = (getgenv().Gorus.AutoPrediction.P80)
    elseif pingNumber < 100 then
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P90)
        Gorus.Silent.Prediction = (getgenv().Gorus.AutoPrediction.P90)
    elseif pingNumber < 110 then
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P100)
        Gorus.Silent.Prediction = (getgenv().Gorus.AutoPrediction.P100)
         elseif pingNumber < 120 then
end
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P110)
        Gorus.Silent.Prediction = (getgenv().Gorus.AutoPrediction.P110)
         elseif pingNumber < 130 then
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P120)
        Gorus.Silent.Prediction = (getgenv().Gorus.AutoPrediction.P120)
         elseif pingNumber < 140 then
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P130)
        Gorus.Silent.Prediction = (getgenv().Gorus.AutoPrediction.P130)
         elseif pingNumber < 150 then
end
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P140)
        Gorus.Silent.Prediction = (getgenv().Gorus.AutoPrediction.P140)
         elseif pingNumber < 160 then
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P150)
        Gorus.Silent.Prediction = (getgenv().Gorus.AutoPrediction.P150)
        elseif pingNumber < 170 then
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P160)
        Gorus.Silent.Prediction = (getgenv().Gorus.AutoPrediction.P160)
        elseif pingNumber < 180 then
end
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P170)
        Gorus.Silent.Prediction = (getgenv().Gorus.AutoPrediction.P170)
        elseif pingNumber < 190 then
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P180)
        Gorus.Silent.Prediction = (getgenv().Gorus.AutoPrediction.P180)
        elseif pingNumber < 200 then
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P190)
        Gorus.Silent.Prediction = (getgenv().Gorus.AutoPrediction.P190)
        elseif pingNumber < 210 then
end
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P200)
        Gorus.Silent.Prediction = (getgenv().Gorus.AutoPrediction.P200)
        elseif pingNumber < 260 then
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P250)
        Gorus.Silent.Prediction = (getgenv().Gorus.AutoPrediction.P250)
        elseif pingNumber < 310 then
        Gorus.Camlock.Prediction = (getgenv().Gorus.AutoPrediction.P300)
        Gorus.Silent.Prediction = (getgenv().Gorus.AutoPrediction.P300)
	end
 
    wait(0.5)
end