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
	-- ESP Script for Roblox (with the Hack Menu intact)
	local Players = game:GetService("Players")
	local Camera = game:GetService("Workspace").CurrentCamera
	local LocalPlayer = game.Players.LocalPlayer


	-- Function to create ESP box around a player
	local function createESP(player)
		local espBox = Instance.new("Frame")
		espBox.Size = UDim2.new(0, 200, 0, 50)
		espBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		espBox.BackgroundTransparency = 0.5
		espBox.BorderSizePixel = 0
		espBox.AnchorPoint = Vector2.new(0.5, 0.5)
		espBox.Visible = true
		espBox.Parent = menuGui:WaitForChild("HackMenu"):WaitForChild("ScreenGui")

		-- Create text label for the player's name
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = player.Name
		textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		textLabel.TextSize = 20
		textLabel.Parent = espBox

		-- Update ESP box position to follow player
		game:GetService("RunService").RenderStepped:Connect(function()
			if player.Character and player.Character:FindFirstChild("Head") then
				local playerPosition = player.Character.Head.Position
				local screenPosition, onScreen = Camera:WorldToScreenPoint(playerPosition)
				if onScreen then
					espBox.Position = UDim2.new(0, screenPosition.X, 0, screenPosition.Y)
				else
					espBox.Position = UDim2.new(0, -1000, 0, -1000)  -- Move off-screen if the player is out of view
				end
			end
		end)

		-- Update ESP box text to show distance
		game:GetService("RunService").RenderStepped:Connect(function()
			if player.Character and player.Character:FindFirstChild("Head") then
				local playerPosition = player.Character.Head.Position
				local distance = math.round((playerPosition - LocalPlayer.Character.HumanoidRootPart.Position).magnitude)
				textLabel.Text = player.Name .. " - " .. distance .. "m"
			end
		end)
	end

	-- Loop through all players and create ESP
	Players.PlayerAdded:Connect(function(player)
		if player ~= game.Players.LocalPlayer then
			createESP(player)
		end
	end)

	-- Create ESP for existing players
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= game.Players.LocalPlayer then
			createESP(player)
		end
	end



end)

freecamButton.MouseButton1Click:Connect(function()
	print("Freecam Activated!")
	-- Paste your Freecam code here
end)

noclipButton.MouseButton1Click:Connect(function()
	print("NoClip Activated!")
	-- Paste your NoClip code here
end)


