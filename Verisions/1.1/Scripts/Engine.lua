--Cool engine script

local Veriax = {}
Veriax.Doors = {}
Veriax.Backups = {}
Veriax.OtherValues = {}

Veriax.OtherValues.Time = require(game:GetService("ReplicatedStorage").Resource.Settings).Time
Veriax.Backups.IsFlying = require(game:GetService("ReplicatedStorage").Game.Paraglide).IsFlying

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
                Veriax.AddCashScam = v
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

return Veriax
