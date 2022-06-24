local Veriax = {}
Veriax.Doors = {}
Veriax.Backups = {}
Veriax.OtherValues = {}
Veriax.engineFunctions = {}


Veriax.OtherValues.Time = require(game:GetService("ReplicatedStorage").Resource.Settings).Time


for i, v in pairs(getgc(true)) do
    if type(v) == "table" then
        if rawget(v, "Event") and rawget(v, "Fireworks") then
            Veriax.em = v.em
            Veriax.GetVehiclePacket = v.GetVehiclePacket
            Veriax.Fireworks = v.Fireworks
            Veriax.Network = v.Event
        elseif rawget(v, "State") and rawget(v, "OpenFun") then
            table.insert(Veriax.Doors, v)
        elseif rawget(v, "Ragdoll") then
            Veriax.Backups.Ragdoll = v.Ragdoll
        end
    elseif type(v) == "function" then
        if getfenv(v).script == game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript then
            local con = getconstants(v)
            if table.find(con, "SequenceRequireState") then
                Veriax.OpenDoor = v
            elseif table.find(con, "Play") and table.find(con, "Source") and table.find(con, "FireServer") then
                Veriax.PlaySound = v
            elseif table.find(con, "PlusCash") then
                Veriax.PlusCash = v
            elseif table.find(con, "Punch") then
                Veriax.GuiFunc = v
            end
        end
    end
end
local gmt = getrawmetatable(game)
setreadonly(gmt, false)
local oldIndex = gmt.__index
gmt.__index = newcclosure(function(self, b)
    if b == "WalkSpeed" then
        return 16
    end
    if b == "JumpPower" then 
        return 50
    end 
    return oldIndex(self,b)
end)

Veriax.engineFunctions.Teleport = function(position)
    for i,v in pairs(game:GetService("Workspace").Vehicles:GetChildren()) do
        if v:FindFirstChild("Seat") then
            if v.Seat.PlayerName.Value == "" and v.Name == "Camaro" then
                local dist = (v.PrimaryPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                if dist <= 200 then
                    if v:FindFirstChild("Passenger") then
                        v.Passenger:Destroy()
                    end
                    local tween = game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(5), {CFrame = CFrame.new(v.PrimaryPart.Position.X, v.PrimaryPart.Position.Y, v.PrimaryPart.Position.Z)})
                    tween:Play()
                    tween.Completed:Wait()
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    break
                end
            end
        end
    end
    
    
    wait(1)
    local CFrameEnd = position
    local Time = 10 
    for i,v in pairs(game:GetService("Workspace").Vehicles:GetChildren()) do
        if v:FindFirstChild("Seat") then
            if v.Seat.PlayerName.Value == game:GetService("Players").LocalPlayer.Name then
                local StartTween =  game:GetService("TweenService"):Create(v.PrimaryPart, TweenInfo.new(2, Enum.EasingStyle.Linear), {CFrame = CFrame.new(v.PrimaryPart.Position.X, 200, v.PrimaryPart.Position.Z)})
                StartTween:Play()
                StartTween.Completed:Wait()
                
                local tween = game:GetService("TweenService"):Create(v.PrimaryPart, TweenInfo.new(Time, Enum.EasingStyle.Linear), {CFrame = CFrame.new(CFrameEnd.X, 200, CFrameEnd.Z)})
                tween:Play()
                tween.Completed:Wait()
                
                local FinalTween = game:GetService("TweenService"):Create(v.PrimaryPart, TweenInfo.new(2, Enum.EasingStyle.Linear), {CFrame = CFrame.new(CFrameEnd.X, CFrameEnd.Y-40, CFrameEnd.Z)})
                FinalTween:Play()
                FinalTween.Completed:Wait()
                --game:GetService("Players").LocalPlayer.Humanoid:Jump()
            end
        end
    end
end


return Veriax
