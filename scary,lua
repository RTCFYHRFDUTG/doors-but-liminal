-- Access the Lighting service
local Lighting = game:GetService("Lighting")

-- Set the fog properties
Lighting.FogStart = 10 -- Distance where the fog starts
Lighting.FogEnd = 100 -- Distance where the fog ends
Lighting.FogColor = Color3.new(0.7, 0.7, 0.7) -- Light gray fog color

-- Optional: Adjust the lighting for a more immersive fog effect
Lighting.Brightness = 1
Lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5) -- Dim ambient light
Lighting.ClockTime = 6 -- Set a twilight time for added effect

-- Add some atmosphere
local Atmosphere = Instance.new("Atmosphere", Lighting)
Atmosphere.Density = 0.8 -- High density for thick fog
Atmosphere.Offset = 0.5 -- Makes fog appear closer
Atmosphere.Glare = 0.2 -- Adds a slight glare effect
Atmosphere.Haze = 2 -- Additional haze for realism

-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Parent = screenGui
textLabel.Size = UDim2.new(0.6, 0, 0.1, 0) -- Width 60% of screen, height 10%
textLabel.Position = UDim2.new(0.2, 0, 0.9, 0) -- Center horizontally, near the bottom
textLabel.AnchorPoint = Vector2.new(0.5, 0.5) -- Anchor to the center of the label
textLabel.BackgroundTransparency = 1
textLabel.Text = "Script synced according to game."
textLabel.TextColor3 = Color3.new(1, 1, 1) -- White
textLabel.TextScaled = true
textLabel.Font = Enum.Font.SourceSansBold

-- Make the text fade out after 3 seconds
game:GetService("TweenService"):Create(
    textLabel,
    TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
    {TextTransparency = 1}
):Play()

-- Destroy the GUI after 3 seconds
task.wait(3)
screenGui:Destroy()

print("Foggy atmosphere and GUI feedback applied!")
