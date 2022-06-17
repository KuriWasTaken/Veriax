if not game:IsLoaded() then
    game.Loaded:wait()
end


local engine = loadstring(game:HttpGet("https://raw.githubusercontent.com/KuriWasTaken/Veriax/main/Verisions/1.1/Scripts/Engine.lua"))()
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/KuriWasTaken/Veriax/main/Verisions/1.1/UILibrary.lua"))()

local windows = {
    Local = UI:createTab("Local"),
    Weapons = UI:createTab("Weapons"),
    Vehicles = UI:createTab("Vehicles"),
    MISC = UI:createTab("MISC");
}

local Local = {
    walkSpeed = 16,
    jumpPower = 50,
    NoRagdoll = false,
    Gravity = 180,
    Fly = false,
    flightSpeed = 16;
}

--//Flight Script\\--
game:GetService('UserInputService').InputBegan:connect(function(key, gpe)
    if key.KeyCode == Enum.KeyCode.LeftShift then
        Temp_Up = true
    end
    if key.KeyCode == Enum.KeyCode.LeftControl then
        Temp_Down = true
    end
end)

game:GetService('UserInputService').InputEnded:connect(function(key, gpe)
    if key.KeyCode == Enum.KeyCode.LeftShift then
        Temp_Up = false
    end
    if key.KeyCode == Enum.KeyCode.LeftControl then
        Temp_Down = false
    end
end)

spawn(function()
    while true do
        wait()
        pcall(function()
            if Local.Fly == true then
                game:GetService("Workspace").Gravity = 0
                Me = game.Players.LocalPlayer.Character
                if Temp_Up == true then
                    Me.HumanoidRootPart.Velocity = Vector3.new(Me.HumanoidRootPart.Velocity.X,40,Me.HumanoidRootPart.Velocity.Z)
                end
                if Temp_Down == true then
                    Me.HumanoidRootPart.Velocity = Vector3.new(Me.HumanoidRootPart.Velocity.X,-40,Me.HumanoidRootPart.Velocity.Z)
                end
                if Temp_Down == false and Temp_Up == false then
                    if Me.HumanoidRootPart.Velocity.Y ~= 0 then
                        Me.HumanoidRootPart.Velocity = Vector3.new(Me.HumanoidRootPart.Velocity.X,0,Me.HumanoidRootPart.Velocity.Z)
                    end
                end
                else
                    game.Workspace.Gravity = Local.Gravity
            end
        end)
    end
end)
--//End of flight script\\--


--Local Tab
windows.Local:createSlider("WalkSpeed", 100, function(a)
    Local.walkSpeed = a
end)

windows.Local:createSlider("JumpPower", 200, function(a)
    Local.jumpPower = a
end)

windows.Local:createSlider("Gravity", 200, function(a)
    Local.Gravity = a
    game.Workspace.Gravity = a
end)

windows.Local:createToggle("NoRagdoll", function(a)
    Local.NoRagdoll = a
    if a == true then
        for _,v in pairs(getgc(true)) do
            if typeof(v) == "table" then
                if rawget(v, 'Ragdoll') then 
                  v.Ragdoll = function(...) 
                    return wait(9e9) 
                  end 
                end
            end
        end
    else
        for _,v in pairs(getgc(true)) do
            if typeof(v) == "table" then
                if rawget(v, 'Ragdoll') then 
                    v.Ragdoll = engine.Backups.Ragdoll
                end
            end
        end
    end
end)

windows.Local:createToggle("Fly", function(a)
    Local.Fly = a
end)

windows.Local:createSlider("FlightSpeed", 100, function(a)
    Local.flightSpeed = a
end)

--Weapons
windows.Weapons:createToggle("No Shoot Delay", function(a)
    if a == true then
        for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
            local gun = require(v)
            gun.FireFreq = math.huge
        end
    else
        for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
            local gun = require(v)
            gun.FireFreq = 1
        end
    end
end)

windows.Weapons:createToggle("Full Auto", function(a)
    if a == true then
        for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
            local gun = require(v)
            gun.FireAuto = true
        end
    else
        for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
            local gun = require(v)
            gun.FireAuto = false
        end
    end
end)

windows.Weapons:createToggle("No Recoil", function(a)
    if a == true then
        for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
            local gun = require(v)
            gun.CamShakeMagnitude = 0
        end
    else
        for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
            local gun = require(v)
            gun.CamShakeMagnitude = 1
        end
    end
end)

windows.Weapons:createToggle("No Spread", function(a)
    if a == true then
        for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
            local gun = require(v)
            gun.BulletSpread = 0.06
        end
    else
        for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
            local gun = require(v)
            gun.BulletSpread = 0
        end
    end
end)

windows.Weapons:createToggle("Instant Reload", function(a)
    if a == true then
        for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
            local gun = require(v)
            gun.ReloadTime = 0
        end
    else
        for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
            local gun = require(v)
            gun.ReloadTime = 1
        end
    end
end)
--Just fires all click detectors cuz I am lazy
windows.Weapons:createButton("Get Weapons", function()
    for i,v in pairs(workspace:GetDescendants()) do
        if v:IsA("ClickDetector") then
        fireclickdetector(v)
        end
    end
end)

--Vehicles


local Vehicles = {
    CarHeight = 2,
    CarSpeed = 20,
    TurnSpeed = 1,
    InfNitro = false,
    AntiTirePop = false;
}

local mouse = game:GetService('Players').LocalPlayer:GetMouse()
local function hotkeyHandler(key)
    if (key == 'q') then
        if Vehicles.InfNitro == true then
            for _, v in next, getgc(true) do
                if (type(v) == 'table' and rawget(v, 'Nitro')) then
                    v.Nitro = 250
                end
            end
        end
    end
end
  
mouse.KeyDown:connect(hotkeyHandler)

windows.Vehicles:createSlider("Car Height", 500, function(a)
    Vehicles.CarHeight = a
end)

windows.Vehicles:createSlider("Car Speed", 500, function(a)
    Vehicles.CarSpeed = a
end)

windows.Vehicles:createSlider("Turn Speed", 20, function(a)
    Vehicles.TurnSpeed = a
end)

windows.Vehicles:createToggle("Inf Nitro", function(a)
    Vehicles.InfNitro = a
end)

windows.Vehicles:createToggle("Anti Tire Pop", function(a)
    Vehicles.AntiTirePop = a
end)

--MISC

local OpenDoors = false

windows.MISC:createToggle("No cell time", function(a)
    if a then
        engine.OtherValues.Time.Cell = 0
    else
        engine.OtherValues.Time.Cell = 20
    end
end)

windows.MISC:createToggle("No Tazer", function(a)
    if a then
        engine.OtherValues.Time.Stunned = 0
    else
        engine.OtherValues.Time.Stunned = 2.5
    end
end)

windows.MISC:createToggle("No TeamSwitch Delay", function(a)
    if a then
        engine.OtherValues.Time.BetweenTeamChange = 0
    else
        engine.OtherValues.Time.BetweenTeamChange = 24
    end
end)

windows.MISC:createToggle("No Wait", function(a)
    if a then
        for i,v in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
            v.Timed = false;
        end
    else
        for i,v in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
            v.Timed = true;
        end
    end
end)

windows.MISC:createToggle("No Slow Falling", function(a)
    function deadFunction() --Lazy solution
        return false 
    end    
        
    
    if a then
        require(game:GetService("ReplicatedStorage").Game.Paraglide).IsFlying = deadFunction()
    else
        require(game:GetService("ReplicatedStorage").Game.Paraglide).IsFlying = engine.Backups.IsFlying()
    end
end)

windows.MISC:createToggle("Open All Doors loop", function(a)
    OpenDoors = a
end)


game:GetService("RunService").RenderStepped:Connect(function()
    local lplr = game.Players.LocalPlayer
    if Local.Fly == false then
        lplr.Character.Humanoid.WalkSpeed = Local.walkSpeed
    else
        lplr.Character.Humanoid.WalkSpeed = Local.flightSpeed
    end
    lplr.Character.Humanoid.JumpPower = Local.jumpPower

    engine.GetVehiclePacket().GarageEngineSpeed = Vehicles.CarSpeed
    engine.GetVehiclePacket().Height = Vehicles.CarHeight
    engine.GetVehiclePacket().TurnSpeed = Vehicles.TurnSpeed

    if Vehicles.AntiTirePop then
        engine.GetVehiclePacket().TirePopDuration = 0
    end
end)

while wait(3) do
    if OpenDoors == true then
        for i,v in next, engine.Doors do 
            engine.OpenDoor(v)
        end
    end
end
