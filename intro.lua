local Intro = {}
local TS = game:GetService("TweenService")

local triggered = false

function Intro.caption()
    if triggered then return end
    triggered = true

    local MainGame = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
    
    MainGame.caption("Loaded...", true)
    task.wait(2)
    MainGame.caption("Have Fun (=", true)
    task.wait(2)
    MainGame.caption("you're in hell", true)

    local info = {
        Title = "Welcome!",
        Description = "Iron Doors Script",
        Reason = "survive...",
        Icon = "http://www.roblox.com/asset/?id=138713951280811"
    }

    local gui = game.Players.LocalPlayer.PlayerGui.MainUI
    local ach = gui.AchievementsHolder.Achievement:Clone()
    
    ach.Name = "LiveAchievement"
    ach.Visible = true
    ach.Size = UDim2.new(0,0,0,0)
    ach.Frame.Position = UDim2.new(1.1, 0, 0, 0)
    ach.Parent = gui.AchievementsHolder

    ach.Frame.Details.Title.Text = info.Title
    ach.Frame.Details.Desc.Text = info.Description
    ach.Frame.Details.Reason.Text = info.Reason
    ach.Frame.ImageLabel.Image = info.Icon
    ach.Frame.ImageLabel.BackgroundTransparency = 1

    ach.Sound:Play()
    ach:TweenSize(UDim2.new(1,0,0.2,0), "In", "Quad", 0.8, true)
    task.wait(0.8)
    ach.Frame:TweenPosition(UDim2.new(0,0,0,0), "Out", "Quad", 0.5, true)

    TS:Create(ach.Frame.Glow, TweenInfo.new(1, "Quad", "In"), {ImageTransparency = 1}):Play()

    task.wait(8)
    ach.Frame:TweenPosition(UDim2.new(1.1,0,0,0), "In", "Quad", 0.5, true)
    task.wait(0.5)
    ach:TweenSize(UDim2.new(1,0,-0.1,0), "InOut", "Quad", 0.5, true)
    task.wait(0.5)
    ach:Destroy()
end


function Intro.intro()
    local player = game.Players.LocalPlayer
    local sg = Instance.new("ScreenGui")
    sg.IgnoreGuiInset = true
    sg.Parent = player.PlayerGui

    local black = Instance.new("Frame")
    black.Size = UDim2.new(1,0,1,0)
    black.BackgroundColor3 = Color3.new(0,0,0)
    black.Parent = sg

    local decal = Instance.new("ImageLabel")
    decal.Size = UDim2.new(0.5,0,0.5,0)
    decal.Position = UDim2.new(0.25,0,0.25,0)
    decal.BackgroundTransparency = 1
    decal.Image = "rbxassetid://92537129824930"
    decal.ImageColor3 = Color3.fromRGB(103,255,196)
    decal.ScaleType = Enum.ScaleType.Fit
    decal.ImageTransparency = 1
    decal.Parent = sg

    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9145201982"
    sound.Volume = 1.2
    sound.Parent = sg

    for _, obj in game:GetDescendants() do
        if obj:IsA("Sound") and obj ~= sound then
            obj:SetAttribute("WasPlaying", obj.Playing)
            obj.Playing = false
        end
    end

    task.wait(1.2)
    sound:Play()
    task.wait(0.7)

    TS:Create(decal, TweenInfo.new(1, "Quad", "In"), {ImageTransparency = 0}):Play()

    task.wait(3.5)

    local fadeOut = TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    TS:Create(decal, fadeOut, {ImageTransparency = 1}):Play()
    TS:Create(black, fadeOut, {BackgroundTransparency = 1}):Play()

    task.wait(2.0)
  
    for _, obj in game:GetDescendants() do
        if obj:IsA("Sound") and obj ~= sound then
            obj.Playing = obj:GetAttribute("WasPlaying") or false
        end
    end

    sound.Ended:Wait()
    sg:Destroy()
end

return Intro
