-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create Main Button
local mainButton = Instance.new("TextButton")
mainButton.Size = UDim2.new(0, 250, 0, 50)
mainButton.Position = UDim2.new(0, 10, 0, 10)
mainButton.Text = "Hacks ▼"
mainButton.Parent = screenGui
mainButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainButton.TextColor3 = Color3.fromRGB(0, 255, 0)

local mainCorner =Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainButton

-- Create Dropdown Frame
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 250, 0, 150)
menuFrame.Position = UDim2.new(0, 10, 0, 70)
menuFrame.Visible = false
menuFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
menuFrame.Parent = screenGui
menuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local mainCorner =Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = menuFrame

-- Toggle Menu
mainButton.MouseButton1Click:Connect(function()
	menuFrame.Visible = not menuFrame.Visible
end)

-- Create ESP Button
local espButton = Instance.new("TextButton")
espButton.Size = UDim2.new(1, 0, 0, 25)
espButton.Position = UDim2.new(0, 0 , 0, 0)
espButton.Text = "ESP"
espButton.Parent = menuFrame
espButton.BackgroundColor3=Color3.fromRGB(40,40,40)
espButton.TextColor3 = Color3.fromRGB(0, 255, 0)
local buttonCorner =Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 10)
buttonCorner.Parent = espButton
-- Create Freecam Button
local freecamButton = Instance.new("TextButton")
freecamButton.Size = UDim2.new(1, 0, 0, 25)
freecamButton.Position = UDim2.new(0, 0, 0, 40)
freecamButton.Text = "Freecam"
freecamButton.Parent = menuFrame
freecamButton.BackgroundColor3=Color3.fromRGB(40,40,40)
freecamButton.TextColor3 = Color3.fromRGB(0, 255, 0)
local buttonCorner =Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 10)
buttonCorner.Parent = freecamButton
-- Create NoClip Button
local noclipButton = Instance.new("TextButton")
noclipButton.Size = UDim2.new(1, 0, 0, 25)
noclipButton.Position = UDim2.new(0, 0, 0, 80)
noclipButton.Text = "NoClip"
noclipButton.Parent = menuFrame
noclipButton.BackgroundColor3=Color3.fromRGB(40,40,40)
noclipButton.TextColor3 = Color3.fromRGB(0, 255, 0)
local buttonCorner =Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 10)
buttonCorner.Parent = noclipButton

-- Functions for hacks (you can paste real code later)
espButton.MouseButton1Click:Connect(function()
	-- Constantly Updating Name + Outline ESP (Fixed Full Working Version)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local function createNameESP(player)
    local character = player.Character
    if character and not character:FindFirstChild("ESPName") then
        local head = character:FindFirstChild("Head")
        if head then
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ESPName"
            billboard.Adornee = head
            billboard.ExtentsOffset = Vector3.new(0, 1, 0)
            billboard.Size = UDim2.new(4, 0, 1, 0)
            billboard.AlwaysOnTop = true

            local nameTag = Instance.new("TextLabel")
            nameTag.Size = UDim2.new(1, 0, 1, 0)
            nameTag.BackgroundTransparency = 1
            nameTag.Text = player.Name
            nameTag.TextColor3 = Color3.new(1, 0, 0) -- Red
            nameTag.TextStrokeTransparency = 0
            nameTag.TextStrokeColor3 = Color3.new(0, 0, 0) -- Black outline
            nameTag.Font = Enum.Font.SourceSansBold
            nameTag.TextScaled = true
            nameTag.Parent = billboard

            billboard.Parent = character
        end
    end
end

local function createBoxESP(player)
    local character = player.Character
    if character and not character:FindFirstChild("ESPBox") then
        -- Only create if HumanoidRootPart exists to avoid timing issues
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local highlight = Instance.new("Highlight")
            highlight.Name = "ESPBox"
            highlight.Adornee = character
            highlight.FillTransparency = 1
            highlight.OutlineTransparency = 0
            highlight.OutlineColor = Color3.new(1, 0, 0) -- Red outline
            highlight.Parent = character
        end
    end
end

-- This will properly reconnect on character respawn too
local function setupPlayer(player)
    player.CharacterAdded:Connect(function()
        repeat task.wait() until player.Character and player.Character:FindFirstChild("Head") and player.Character:FindFirstChild("HumanoidRootPart")
        createNameESP(player)
        createBoxESP(player)
    end)

    -- Also try to create immediately if possible
    if player.Character then
        createNameESP(player)
        createBoxESP(player)
    end
end

-- Main loop
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        setupPlayer(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        setupPlayer(player)
    end
end)



end)

freecamButton.MouseButton1Click:Connect(function()
	print("Freecam Activated!")
	-- Paste your Freecam code here
end)

noclipButton.MouseButton1Click:Connect(function()
	print("NoClip Activated!")
	-- Paste your NoClip code here
end)


