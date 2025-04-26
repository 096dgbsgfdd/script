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
-- No fog button
local noFogButton = Instance.new("TextButton")
noFogButton.Size = UDim2.new(1, 0, 0, 25)
noFogButton.Position = UDim2.new(0, 0, 0, 120)
noFogButton.Text = "No fog"
noFogButton.Parent = menuFrame
noFogButton.BackgroundColor3=Color3.fromRGB(40,40,40)
noFogButton.TextColor3 = Color3.fromRGB(0, 255, 0)
local buttonCorner =Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 10)
buttonCorner.Parent = noFogButton

local invisibleButton = Instance.new("TextButton")
invisibleButton.Size = UDim2.new(1, 0, 0, 25)
invisibleButton.Position = UDim2.new(0, 0, 0, 160)
invisibleButton.Text = "invisible"
invisibleButton.Parent = menuFrame
invisibleButton.BackgroundColor3=Color3.fromRGB(40,40,40)
invisibleButton.TextColor3 = Color3.fromRGB(0, 255, 0)
local buttonCorner =Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 10)
buttonCorner.Parent = invisibleButton

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
-- Freecam for PC (Fixed W/S + Proper Arrow Look Inversion)

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Variables
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local speed = 50
local sensitivity = 0.25
local rotationSpeed = 1.5
local moveDirection = Vector3.zero
local rotation = Vector2.zero
local freecamActive = true

-- Save original camera settings
local originalCameraType = camera.CameraType

-- Activate Freecam
camera.CameraType = Enum.CameraType.Scriptable
camera.CFrame = player.Character and player.Character:FindFirstChild("Head") and player.Character.Head.CFrame or CFrame.new(0, 10, 0)

-- Key Presses
local keysPressed = {}

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	keysPressed[input.KeyCode] = true
end)

UserInputService.InputEnded:Connect(function(input)
	keysPressed[input.KeyCode] = false
end)

-- Mouse Movement
UserInputService.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		rotation += Vector2.new(-input.Delta.y, -input.Delta.x) * (sensitivity / 10)
	end
end)

-- GUI Button to Return Camera
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local returnButton = Instance.new("TextButton")
returnButton.Size = UDim2.new(0, 120, 0, 40)
returnButton.Position = UDim2.new(0, 10, 0, 10)
returnButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
returnButton.Text = "Return Camera"
returnButton.Parent = screenGui

returnButton.MouseButton1Click:Connect(function()
	freecamActive = false
	camera.CameraType = originalCameraType
	screenGui:Destroy()
end)

-- Update Loop
RunService.RenderStepped:Connect(function(deltaTime)
	if not freecamActive then return end

	moveDirection = Vector3.new(
		(keysPressed[Enum.KeyCode.D] and 1 or 0) - (keysPressed[Enum.KeyCode.A] and 1 or 0),
		(keysPressed[Enum.KeyCode.E] and 1 or 0) - (keysPressed[Enum.KeyCode.Q] and 1 or 0),
		(keysPressed[Enum.KeyCode.W] and 1 or 0) - (keysPressed[Enum.KeyCode.S] and 1 or 0)
	)

	-- Rotation with Arrow Keys (Fixed Vertical Inversion)
	if keysPressed[Enum.KeyCode.Left] then
		rotation = rotation + Vector2.new(0, rotationSpeed)
	end
	if keysPressed[Enum.KeyCode.Right] then
		rotation = rotation + Vector2.new(0, -rotationSpeed)
	end
	if keysPressed[Enum.KeyCode.Up] then
		rotation = rotation + Vector2.new(rotationSpeed, 0) -- UP now looks DOWN
	end
	if keysPressed[Enum.KeyCode.Down] then
		rotation = rotation + Vector2.new(-rotationSpeed, 0) -- DOWN now looks UP
	end

	-- Apply Rotation
	local camRot = CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), 0)
	local camPos = camera.CFrame.Position
	camera.CFrame = camRot + camPos

	-- Apply Movement
	local moveVector = (camera.CFrame.LookVector * moveDirection.Z + camera.CFrame.RightVector * moveDirection.X + camera.CFrame.UpVector * moveDirection.Y) * speed * deltaTime
	camera.CFrame = camera.CFrame + moveVector
end)

end)

noclipButton.MouseButton1Click:Connect(function()
	print("NoClip Activated!")
	-- Paste your NoClip code here
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local noclip = false

-- Create a text label to show Noclip status
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NoclipIndicator"
screenGui.Parent = StarterGui

local noclipLabel = Instance.new("TextLabel")
noclipLabel.Size = UDim2.new(0, 200, 0, 50)
noclipLabel.Position = UDim2.new(0, 10, 0, 10)
noclipLabel.BackgroundTransparency = 0.5
noclipLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
noclipLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipLabel.Text = "Noclip: OFF"
noclipLabel.TextSize = 20
noclipLabel.TextStrokeTransparency = 0.5
noclipLabel.Parent = screenGui

-- Toggle noclip with "N"
UserInputService.InputBegan:Connect(function(input, isProcessed)
    if isProcessed then return end
    if input.KeyCode == Enum.KeyCode.N then
        noclip = not noclip
        if noclip then
            noclipLabel.Text = "Noclip: ON"
        else
            noclipLabel.Text = "Noclip: OFF"
        end
    end
end)

RunService.Stepped:Connect(function()
    if noclip then
        character = player.Character or player.CharacterAdded:Wait()
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end)

end)
nofogButton.MouseButton1Click:Connect(function()
	
	
local Lighting = game:GetService("Lighting")

-- Remove basic fog
Lighting.FogEnd = 1000000
Lighting.FogStart = 0
end)

invisibleButton.MouseButton1Click:Connect(function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local UserInputService = game:GetService("UserInputService")

-- Define the custom key to toggle invisibility
local toggleKey = Enum.KeyCode.M  -- Change this to the key you prefer

-- Function to make the character invisible
local function makeInvisible()
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then  -- Make sure it's a physical part of the character
            part.Transparency = 1  -- Set transparency to 100% (invisible)
            part.CanCollide = false  -- Disable collisions
            part.CastShadow = false  -- Disable shadows for the parts
        end
    end
    print("Character is now invisible.")
end

-- Function to make the character visible again
local function makeVisible()
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Transparency = 0  -- Set transparency back to visible (0%)
            part.CanCollide = true  -- Enable collisions
            part.CastShadow = true  -- Re-enable shadows
        end
    end
    print("Character is now visible.")
end

-- Check for key press and toggle invisibility
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end  -- Ignore if the game has already processed the input

    if input.KeyCode == toggleKey then
        -- Toggle between invisible and visible
        if character and character:FindFirstChild("Humanoid") then
            local isInvisible = true
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") and part.Transparency == 0 then
                    isInvisible = false
                    break
                end
            end
            if isInvisible then
                makeVisible()
            else
                makeInvisible()
            end
        end
    end
end)

-- Reset character and humanoid references if the player respawns
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
end)

end)

