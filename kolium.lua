if getgenv().lloaded == true then
    return
   end
   getgenv().lloaded = true
   
       local Aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/FederalAlt/Tigger/main/lalala"))()
       
       Aiming.TeamCheck(false)
       
       
       
       local Workspace = game:GetService("Workspace")
       
       local Players = game:GetService("Players")
       
       local RunService = game:GetService("RunService")
       
       local UserInputService = game:GetService("UserInputService")
       
       
       
       local LocalPlayer = Players.LocalPlayer
       
       local Mouse = LocalPlayer:GetMouse()
       
       local CurrentCamera = Workspace.CurrentCamera
       
       
       ---------------------------------------------------------------
       local DaHoodSettings = {
           SilentAim = getgenv().Kolium.Silent.Enabled,
           Prediction = getgenv().K.Silent.Prediction,
       }
       Aiming.FOV = getgenv().K.Fov.Silent.Radius  
       Aiming.ShowFOV = getgenv().K.Fov.Silent.Visible
       Aiming.FOVColour = getgenv().K.Fov.Silent.Color
       Aiming.HitChance = getgenv().K.Silent.HitChance
       Aiming.VisibleCheck = getgenv().K.Checks.Wall.Silent 
       Aiming.SelectedPart = getgenv().K.Silent.Aimpart
       function Aiming.Check()
       
           if not (Aiming.Enabled == true and Aiming.Selected ~= LocalPlayer and Aiming.SelectedPart ~= nil) then
       
               return false
       
           end
       
           local Character = Aiming.Character(Aiming.Selected)
       
           local KOd = Character:WaitForChild("BodyEffects")["K.O"].Value
       
           local Grabbed = Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
       
           if getgenv().K.Checks.Knocked.Silent and (KOd or Grabbed) then
       
               return false
       
           end
       
           return true
       
       end
     task.spawn(function()
       
           while task.wait() do
       
               if getgenv().K.Silent.Resolver and Aiming.Selected ~= nil and (Aiming.Selected.Character)  then
       
                   local oldVel = game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Velocity
       
                   game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Velocity = Vector3.new(oldVel.X, -0, oldVel.Z)
       
               end 
       
           end
       
       end)
   
       game:GetService("RunService").Heartbeat:Connect(
                                   function()
                                       if
                                           getgenv().K.Range.Enabled == true and Aiming.Selected ~= nil and (Aiming.Selected.Character) then
                                           if
                                               (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                   game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                   20
                                            then
                                                if getgenv().K.Range.Type.Fov then
                                               Aiming.FOV = getgenv().K.Range.CloseFov
                                               end
                                               if getgenv().K.Range.Type.Prediction then
                                                   getgenv().K.Silent.Prediction = getgenv().K.Range.ClosePrediction
                                             end
                                               
                                           elseif
                                               (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                   game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                   60
                                            then
                                               
                                               if getgenv().K.Range.Type.Fov then
                                               Aiming.FOV = getgenv().K.Range.MidFov
                                               end
                                               if getgenv().K.Range.Type.Prediction then
                                                   getgenv().K.Silent.Prediction = getgenv().K.Range.MidPrediction
                                             end
                                           elseif
                                               (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                   game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                   110
                                            then
                                              if getgenv().K.Range.Type.Fov then
                                               Aiming.FOV = getgenv().K.Range.FarFov
                                               end
                                               if getgenv().K.Range.Type.Prediction then
                                                   getgenv().K.Silent.Prediction = getgenv().K.Range.FarPrediction
                                             end
                                               elseif 
                                               (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                   game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                   math.huge
                                            then
                                              
                                               if getgenv().K.Range.Type.Fov then
                                               Aiming.FOV = getgenv().K.Range.VeryFarFov
                                               end
                                               if getgenv().K.Range.Type.Prediction then
                                                   getgenv().K.Silent.Prediction = getgenv().K.Range.VeryFarPrediction
                                             end
                                           end
                                       end
                                   end
                               )
       
       
       
       local __index
       
       __index = hookmetamethod(game, "__index", function(t, k)
       
           if (t:IsA("Mouse") and (k == "Hit" or k == "Target") and Aiming.Check()) then
       
               local SelectedPart = Aiming.SelectedPart
       
               if (DaHoodSettings.SilentAim and (k == "Hit" or k == "Target")) then
       
                   local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)
       
                   return (k == "Hit" and Hit or SelectedPart)
       
               end
       
           end
       
       
       
           return __index(t, k)
       
       end)
       
   Mouse.KeyDown:Connect(function(Key)
       local Keybind = getgenv().K.Silent.Keybind:lower()
       if (Key == Keybind) then
               if Aiming.Enabled == true then
                   Aiming.Enabled = false
               else
                   Aiming.Enabled = true
       end 
     end 
   end)
   
   
       local Plr  = nil
       
       local Players, Client, Mouse, RS, Camera =
           game:GetService("Players"),
           game:GetService("Players").LocalPlayer,
           game:GetService("Players").LocalPlayer:GetMouse(),
           game:GetService("RunService"),
           game:GetService("Workspace").CurrentCamera
       
       local TracerCircle = Drawing.new("Circle")
       
       TracerCircle.Color = getgenv().K.Fov.Tracer.Color
       TracerCircle.Thickness = 1
       
       local UpdateFOV = function ()
           if ( not TracerCircle) then
               return TracerCircle
           end
           TracerCircle.Visible  = getgenv().K.Fov.Tracer.Visible
           TracerCircle.Radius   = getgenv().K.Fov.Tracer.Radius * 3
           TracerCircle.Color = getgenv().K.Fov.Tracer.Color
           TracerCircle.Position = Vector2.new(Mouse.X, Mouse.Y + (game:GetService("GuiService"):GetGuiInset().Y))
           return TracerCircle
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
       
       local ClosestPlrFromMouse2 = function()
           local Target, Closest = nil, TracerCircle.Radius * 1.27
           
           for _ ,v in pairs(Players:GetPlayers()) do
               if (v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart")) then
                   if getgenv().K.Checks.Wall.Tracer then
                       local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                       local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
               
                       if (Distance < Closest and OnScreen) and WallCheck(v.Character.HumanoidRootPart.Position, {Client, v.Character}) then
                           Closest = Distance
                           Target = v
                       end
                       end
                   end
               end
           return Target
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
           local Keybind = getgenv().K.Tracer.Keybind:lower()
           if (Key == Keybind) then
               if getgenv().K.Tracer.Enabled == true then
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
   
       RS.Heartbeat:Connect(function()
           if getgenv().K.Tracer.Enabled == true then
               if getgenv().K.Tracer.Resolver == true and Plr and Plr.Character and Plr.Character:WaitForChild(getgenv().K.Tracer.AimPart) and Plr.Character:WaitForChild("HumanoidRootPart").Velocity.magnitude > 70 then
                   pcall(function()
                       local TargetVelv3 = Plr.Character[getgenv().K.Tracer.AimPart]
                       TargetVelv3.Velocity = Vector3.new(0, 0, 0)
                       TargetVelv3.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                   end)
               end
               if getgenv().K.Tracer.Resolver == true and Plr and Plr.Character and Plr.Character:WaitForChild(getgenv().K.Tracer.AimPart)then
                   pcall(function()
                       local TargetVelv4 = Plr.Character[getgenv().K.Tracer.AimPart]
                       TargetVelv4.Velocity = Vector3.new(TargetVelv4.Velocity.X, 0, TargetVelv4.Velocity.Z)
                       TargetVelv4.AssemblyLinearVelocity = Vector3.new(TargetVelv4.Velocity.X, 0, TargetVelv4.Velocity.Z)
                   end)
               end
           end
       end)
   
       RS.RenderStepped:Connect(function()
           if getgenv().K.Tracer.Enabled == true then
               if getgenv().K.Checks.Knocked.Tracer == true and Plr and Plr.Character then 
                   local KOd = Plr.Character:WaitForChild("BodyEffects")["K.O"].Value
                   local Grabbed = Plr.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
                   if KOd or Grabbed then
                       Plr = nil
                       IsTargetting = false
                   end
               end
               if getgenv().K.Checks.Knocked.Tracer == true and Plr and Plr.Character:FindFirstChild("Humanoid") then
                   if Plr.Character.Humanoid.health < 0.1 then
                       Plr = nil
                       IsTargetting = false
                   end
               end
               if getgenv().K.Tracer.Predict and Plr and Plr.Character and Plr.Character:FindFirstChild(getgenv().K.Tracer.AimPart) then
                   if getgenv().K.Tracer.Shake then
                       local Main = CFrame.new(Camera.CFrame.p,Plr.Character[getgenv().K.Tracer.AimPart].Position + Plr.Character[getgenv().K.Tracer.AimPart].Velocity * getgenv().K.Tracer.Prediction +
                       Vector3.new(
                           math.random(-getgenv().K.Tracer.ShakeValue.X, getgenv().K.Tracer.ShakeValue.X),
                           math.random(-getgenv().K.Tracer.ShakeValue.Y, getgenv().K.Tracer.ShakeValue.Y),
                           math.random(-getgenv().K.Tracer.ShakeValue.Z, getgenv().K.Tracer.ShakeValue.Z)
                       ) * 0.1)
                       Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().K.Tracer.Smoothness, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
                   else
                       local Main = CFrame.new(Camera.CFrame.p,Plr.Character[getgenv().K.Tracer.AimPart].Position + Plr.Character[getgenv().K.Tracer.AimPart].Velocity * getgenv().K.Tracer.Prediction)
                       Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().K.Tracer.Smoothness, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
                   end
               elseif getgenv().K.Tracer.Predict == false and Plr and Plr.Character and Plr.Character:FindFirstChild(getgenv().K.Tracer.AimPart) then
                   if getgenv().K.Tracer.Shake then
                       local Main = CFrame.new(Camera.CFrame.p,Plr.Character[getgenv().K.Tracer.AimPart].Position +
                       Vector3.new(
                           math.random(-getgenv().K.Tracer.ShakeValue.X, getgenv().K.Tracer.ShakeValue.X),
                           math.random(-getgenv().K.Tracer.ShakeValue.Y, getgenv().K.Tracer.ShakeValue.Y),
                           math.random(-getgenv().K.Tracer.ShakeValue.Z, getgenv().K.Tracer.ShakeValue.Z)
                       ) * 0.1)
                       Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().K.Tracer.Smoothness, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
                   else
                       local Main = CFrame.new(Camera.CFrame.p,Plr.Character[getgenv().K.Tracer.AimPart].Position)
                       Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().K.Tracer.Smoothness, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
                   end
               end
           end
       end)
   
       task.spawn(function ()
           while task.wait() do
               if Plr then
                   if getgenv().K.Tracer.Enabled and (Plr.Character) and getgenv().K.Tracer.NearestPart then
                       getgenv().K.Tracer.AimPart = tostring(GetClosestBodyPartV2(Plr.Character))
                   end
               if getgenv().K.Silent.Enabled then
                   getgenv().K.Silent.AimPart = tostring(GetClosestBodyPartV2)
               end
               end
   end
       end)
       
   
       
   
       while getgenv().K.Silent.AutoPrediction == true do
           local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
           local pingValue = string.split(ping, " ")[1]
           local pingNumber = tonumber(pingValue)
               if pingNumber < 30 then
               getgenv().K.Silent.Prediction = 0.12588
               elseif pingNumber < 40 then
                   getgenv().K.Silent.Prediction = 0.11911
               elseif pingNumber < 50 then
                   getgenv().K.Silent.Prediction = 0.12471
               elseif pingNumber < 60 then
                   getgenv().K.Silent.Prediction = 0.12766
               elseif pingNumber < 70 then
                   getgenv().K.Silent.Prediction = 0.12731
               elseif pingNumber < 80 then
                   getgenv().K.Silent.Prediction = 0.12951
               elseif pingNumber < 90 then
                   getgenv().K.Silent.Prediction = 0.13181
               elseif pingNumber < 100 then
                   getgenv().K.Silent.Prediction = 0.13573
               elseif pingNumber < 110 then
                   getgenv().K.Silent.Prediction = 0.13334
               elseif pingNumber < 120 then
                   getgenv().K.Silent.Prediction = 0.14552
               elseif pingNumber < 130 then
                   getgenv().K.Silent.Prediction = 0.14376
               elseif pingNumber < 140 then
                   getgenv().K.Silent.Prediction = 0.15669
               elseif pingNumber < 150 then
                   getgenv().K.Silent.Prediction = 0.12234
               elseif pingNumber < 160 then
                   getgenv().K.Silent.Prediction = 0.15214
               elseif pingNumber < 170 then
                   getgenv().K.Silent.Prediction = 0.16262
               elseif pingNumber < 180 then
                   getgenv().K.Silent.Prediction = 0.19231
               elseif pingNumber < 190 then
                   getgenv().K.Silent.Prediction = 0.19284
               elseif pingNumber < 200 then
                   getgenv().K.Silent.Prediction = 0.16594
               elseif pingNumber < 210 then
                   getgenv().K.Silent.Prediction = 0.16942
           
           end
           wait(1)
       end
   