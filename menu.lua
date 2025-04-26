-- [[ Mobile Hack Menu by ChatGPT ]] --

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Menu GUI
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "HackMenu"

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ScreenGui
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.Padding = UDim.new(0, 10)

local function createButton(text)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0, 200, 0, 50)
	button.Position = UDim2.new(0, 20, 0, 20)
	button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	button.TextColor3 = Color3.new(1, 1, 1)
	button.TextSize = 20
	button.Text = text
	button.Parent = ScreenGui
	return button
end

-- Variables
local espEnabled = false
local freecamEnabled = false
local noclipEnabled = false
local connections = {}
local freecamControls = {}
local moveDirection = Vector3.new()
local moveSpeed = 3
local sensitivity = 0.5
local rotation = Vector2.new()
local holdingPhase = false

-- ESP Function
local function createESP(player)
	if player.Character then
		local highlight = Instance.new("Highlight")
		highlight.Name = "ESPHighlight"
		highlight.FillColor = Color3.new(1, 0, 0)
		highlight.OutlineColor = Color3.new(1, 1, 1)
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.Parent = player.Character
	end
end

local function updateESP()
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			if not player.Character then continue end
			if not player.Character:FindFirstChild("ESPHighlight") then
				createESP(player)
			end
		end
	end
end

-- Freecam Controls
local function createMovementButtons()
	local directions = {
		{"Forward", Vector3.new(0, 0, -1)},
		{"Back", Vector3.new(0, 0, 1)},
		{"Left", Vector3.new(-1, 0, 0)},
		{"Right", Vector3.new(1, 0, 0)},
		{"Up", Vector3.new(0, 1, 0)},
		{"Down", Vector3.new(0, -1, 0)}
	}
	for i, data in ipairs(directions) do
		local btn = createButton(data[1])
		btn.Position = UDim2.new(0, 20, 0, 60 + (i*60))
		btn.Visible = false
		btn.MouseButton1Down:Connect(function()
			moveDirection = data[2]
		end)
		btn.MouseButton1Up:Connect(function()
			moveDirection = Vector3.new()
		end)
		table.insert(freecamControls, btn)
	end
end

-- Freecam Logic
RunService.RenderStepped:Connect(function(dt)
	if freecamEnabled then
		local move = moveDirection * moveSpeed * dt
		local camCF = Camera.CFrame
		local newCF = camCF + (camCF.RightVector * move.X) + (camCF.UpVector * move.Y) + (camCF.LookVector * move.Z)
		Camera.CFrame = newCF
	end
end)

-- Noclip Logic
RunService.Stepped:Connect(function()
	if noclipEnabled and holdingPhase and LocalPlayer.Character then
		for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
end)

-- Buttons
local espButton = createButton("Toggle ESP")
espButton.MouseButton1Click:Connect(function()
	espEnabled = not espEnabled
	if espEnabled then
		table.insert(connections, RunService.RenderStepped:Connect(updateESP))
	else
		for _, plr in pairs(Players:GetPlayers()) do
			if plr.Character and plr.Character:FindFirstChild("ESPHighlight") then
				plr.Character:FindFirstChild("ESPHighlight"):Destroy()
			end
		end
		for _, conn in pairs(connections) do conn:Disconnect() end
		connections = {}
	end
end)

local freecamButton = createButton("Toggle Freecam")
freecamButton.MouseButton1Click:Connect(function()
	freecamEnabled = not freecamEnabled
	Camera.CameraType = freecamEnabled and Enum.CameraType.Scriptable or Enum.CameraType.Custom
	for _, btn in pairs(freecamControls) do
		btn.Visible = freecamEnabled
	end
end)

local noclipButton = createButton("Toggle Noclip")
noclipButton.MouseButton1Click:Connect(function()
	noclipEnabled = not noclipEnabled
end)

local phaseButton = createButton("Phase (Hold)")
phaseButton.MouseButton1Down:Connect(function()
	holdingPhase = true
end)
phaseButton.MouseButton1Up:Connect(function()
	holdingPhase = false
end)

local resetButton = createButton("Reset Camera")
resetButton.MouseButton1Click:Connect(function()
	freecamEnabled = false
	noclipEnabled = false
	holdingPhase = false
	Camera.CameraType = Enum.CameraType.Custom
	moveDirection = Vector3.new()
	for _, btn in pairs(freecamControls) do
		btn.Visible = false
	end
end)

createMovementButtons()

-- Final UI setup
ScreenGui.ResetOnSpawn = false
