-- Access the Lighting service
local Lighting = game:GetService("Lighting")

-- Set the fog properties to create a more mysterious effect
Lighting.FogStart = 5 -- Start fog closer for a sense of being surrounded
Lighting.FogEnd = 200 -- Extend fog far to give the sense of endless space
Lighting.FogColor = Color3.new(0.5, 0.5, 0.5) -- Muted gray fog color for an eerie feel

-- Adjust the lighting for a more surreal, liminal atmosphere
Lighting.Brightness = 0.5 -- Low brightness to make the environment dim and empty
Lighting.OutdoorAmbient = Color3.new(0.2, 0.2, 0.2) -- Very dim ambient light for an unsettling tone
Lighting.ClockTime = 12 -- Noon time gives a strange, flat lighting quality

-- Add a thick, almost smothering atmosphere
local Atmosphere = Instance.new("Atmosphere", Lighting)
Atmosphere.Density = 1.2 -- Very dense fog for an immersive, suffocating effect
Atmosphere.Offset = 0.3 -- Fog appears closer to the player, creating an enclosed feeling
Atmosphere.Glare = 0.4 -- Increased glare for a dreamlike haze
Atmosphere.Haze = 3 -- More haze for a blurred, unsharp environment

-- Remove all existing sounds in the game
for _, obj in pairs(game.Workspace:GetDescendants()) do
    if obj:IsA("Sound") then
        obj:Destroy() -- Destroy any existing Sound instances
    end
end

-- Play an eerie, ambient sound to heighten the liminal atmosphere
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://5356133579" -- Choose an unsettling or atmospheric music track
sound.Parent = game.Workspace
sound:Play() -- Start playing the music

-- Create a ScreenGui for the text
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Function to create the text labels
local function createTextLabel(position, text)
    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = screenGui
    textLabel.Size = UDim2.new(0, 200, 0, 50) -- Size of each text block
    textLabel.Position = position
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.TextColor3 = Color3.new(1, 0, 0) -- Red text for intensity
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextStrokeTransparency = 0.8 -- Strong text outline
    textLabel.TextTransparency = 0 -- Initially visible

    return textLabel
end

-- Generate 50 instances of the message, filling the entire screen
local columns = 5
local rows = 10
local offsetX = 0.2
local offsetY = 0.1
local textLabels = {} -- Store references to text labels for fading

for row = 1, rows do
    for col = 1, columns do
        local position = UDim2.new(col * offsetX, 0, row * offsetY, 0)
        local textLabel = createTextLabel(position, "Something bad will happen soon.")
        table.insert(textLabels, textLabel) -- Store the text label for later fading
    end
end

-- Fade all the text labels out after covering the screen
for _, textLabel in pairs(textLabels) do
    game:GetService("TweenService"):Create(
        textLabel,
        TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
        {TextTransparency = 1}
    ):Play()
end

-- Wait for the initial text to fade out
task.wait(5)

-- Now create the second message, positioning it closer to the bottom
local secondMessage = createTextLabel(UDim2.new(0.4, 0, 0.85, 0), "Trust nobody.")
game:GetService("TweenService"):Create(
    secondMessage,
    TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), -- No delay
    {TextTransparency = 0}
):Play()

-- Fade the second message after 2 seconds
task.wait(2)
game:GetService("TweenService"):Create(
    secondMessage,
    TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
    {TextTransparency = 1}
):Play()

-- Destroy the GUI after the second text fades away
task.wait(5) -- Wait for the second text to fade out completely
screenGui:Destroy()

print("Liminal atmosphere applied with overwhelming text and fade-out effect.")
