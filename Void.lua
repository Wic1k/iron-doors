local success, spawner = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()
end)

if not success or not spawner then
    error("Failed to load spawner.")
end

local initialEntityConfig = {
    Entity = {
        Name = "",
        Asset = "rbxassetid://17613503845",
        HeightOffset = 1
    },
    Lights = {
        Flicker = {
            Enabled = true,
            Duration = 60
        },
        Shatter = true,
        Repair = false
    },
    Earthquake = {
        Enabled = true
    },
    CameraShake = {
        Enabled = true,
        Range = 100,
        Values = {2, 20, 0.2, 1}
    },
    Movement = {
        Speed = 111,
        Delay = 1,
        Reversed = false
    },
    Rebounding = {
        Enabled = false,
        Type = "Ambush",
        Min = 1,
        Max = 1,
        Delay = 1
    },
    Damage = {
        Enabled = false,
        Range = 1,
        Amount = 1
    },
    Crucifixion = {
        Enabled = false,
        Range = 1,
        Resist = false,
        Break = false
    },
    Death = {
        Type = nil,
        Hints = {},
        Cause = ""
    }
}

local success, newEntity = pcall(function()
    return spawner.Create(initialEntityConfig)
end)

if success and newEntity then
    newEntity:Run()
  end
