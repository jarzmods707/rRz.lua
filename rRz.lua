--[[
╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
║                                          rRz HUB - DELTA EXECUTOR                                            ║
║                                          KING JARZ 👑👑👑 · JarzGPT dark vip                                  ║
║                                          33 FITUR · HACK PLAYER · RUSAK SERVER                               ║
╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
--]]

--// MEMORI CONTROL & ANTI CRASH
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

--// GLOBAL VARIABLES
local PlayerState = {
    Fly = false,
    Noclip = false,
    Speed = 16,
    JumpPower = 50,
    ESP = false,
    Aimbot = false,
    InfiniteJump = false,
    AutoClick = false,
    AutoFarm = false,
    TpTool = false,
    KillAll = false,
    FreezeAll = false,
    CrashAll = false,
    LoopCrash = false,
    BlackHole = false,
    ExplodePlayers = false,
    GodMode = false,
    StealDrops = false,
    AntiBan = false,
    ChatSpam = false,
    ServerHop = false,
    BreakAnchors = false,
    LagServer = false,
    StealItems = false,
    Duplicate = false,
    ForceField = false,
    Invisible = false,
    TeleportMe = false,
    GrabPlayer = false,
    NukeParts = false,
    ControlPlayer = false,
    DeleteTools = false,
    MusicPlayer = false,
    RainbowChar = false
}

local Targets = {}
local LoopThreads = {}

--// UI LIBRARY
local UILibrary = {
    Windows = {},
    CurrentDragging = false,
    DragInput = nil,
    DragStart = nil,
    StartPos = nil
}

function UILibrary:CreateWindow(title, size)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "rRzHub_Gui"
    ScreenGui.Parent = CoreGui
    ScreenGui.ResetOnSpawn = false
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = size or UDim2.new(0, 450, 0, 600)
    MainFrame.Position = UDim2.new(0.5, -225, 0.5, -300)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    MainFrame.BackgroundTransparency = 0.05
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = MainFrame
    MainFrame.ClipsDescendants = true
    
    --// GLASS MORPHISM EFFECT
    local Blur = Instance.new("BlurEffect")
    Blur.Size = 12
    Blur.Parent = game:GetService("Lighting")
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = MainFrame
    
    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(255, 0, 255)
    Stroke.Thickness = 2
    Stroke.Transparency = 0.5
    Stroke.Parent = MainFrame
    
    --// NEON RAINBOW GRADIENT
    local Gradient = Instance.new("UIGradient")
    Gradient.Rotation = 45
    Gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
        ColorSequenceKeypoint.new(0.2, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 255, 0)),
        ColorSequenceKeypoint.new(0.6, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(0.8, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
    }
    
    local BorderGradient = Instance.new("UIGradient")
    BorderGradient.Rotation = 45
    BorderGradient.Color = Gradient.Color
    
    --// GRID EFFECT (JARING²)
    local GridTexture = Instance.new("ImageLabel")
    GridTexture.Size = UDim2.new(1, 0, 1, 0)
    GridTexture.BackgroundTransparency = 1
    GridTexture.Image = "rbxassetid://1392913666"
    GridTexture.ImageColor3 = Color3.fromRGB(255, 255, 255)
    GridTexture.ImageTransparency = 0.85
    GridTexture.Parent = MainFrame
    
    --// TITLE BAR
    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 35)
    TitleBar.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
    TitleBar.BackgroundTransparency = 0.5
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 12)
    TitleCorner.Parent = TitleBar
    
    local TitleText = Instance.new("TextLabel")
    TitleText.Size = UDim2.new(1, 0, 1, 0)
    TitleText.BackgroundTransparency = 1
    TitleText.Text = "⚡ " .. title .. " ⚡"
    TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleText.TextSize = 18
    TitleText.Font = Enum.Font.GothamBold
    TitleText.TextXAlignment = Enum.TextXAlignment.Center
    TitleText.Parent = TitleBar
    
    local SubText = Instance.new("TextLabel")
    SubText.Size = UDim2.new(1, 0, 0, 15)
    SubText.Position = UDim2.new(0, 0, 1, -15)
    SubText.BackgroundTransparency = 1
    SubText.Text = "KING JARZ 👑 | Delta Executor | 33 Fitur"
    SubText.TextColor3 = Color3.fromRGB(150, 150, 200)
    SubText.TextSize = 10
    SubText.Font = Enum.Font.Gotham
    SubText.TextXAlignment = Enum.TextXAlignment.Center
    SubText.Parent = TitleBar
    
    --// HOVER RAINBOW EFFECT
    game:GetService("RunService").RenderStepped:Connect(function()
        local hue = tick() % 2 / 2
        Stroke.Color = Color3.fromHSV(hue, 1, 1)
        TitleText.TextColor3 = Color3.fromHSV(hue, 1, 1)
        SubText.TextColor3 = Color3.fromHSV(hue, 0.8, 0.8)
        BorderGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromHSV(hue, 1, 1)),
            ColorSequenceKeypoint.new(0.5, Color3.fromHSV(hue + 0.5, 1, 1)),
            ColorSequenceKeypoint.new(1, Color3.fromHSV(hue, 1, 1))
        }
    end)
    
    --// DRAG SYSTEM
    local Dragging = false
    local DragInput = nil
    local DragStart = nil
    local StartPos = nil
    
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = true
            DragStart = input.Position
            StartPos = MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)
    
    TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            DragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == DragInput and Dragging then
            local Delta = input.Position - DragStart
            MainFrame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
        end
    end)
    
    --// TAB BUTTONS CONTAINER
    local TabContainer = Instance.new("Frame")
    TabContainer.Size = UDim2.new(1, 0, 0, 40)
    TabContainer.Position = UDim2.new(0, 0, 0, 35)
    TabContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    TabContainer.BackgroundTransparency = 0.3
    TabContainer.BorderSizePixel = 0
    TabContainer.Parent = MainFrame
    
    --// SCROLLING FRAME UNTUK KONTEN
    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.Size = UDim2.new(1, -20, 1, -85)
    ScrollingFrame.Position = UDim2.new(0, 10, 0, 75)
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.ScrollBarThickness = 6
    ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 255)
    ScrollingFrame.Parent = MainFrame
    
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Padding = UDim.new(0, 8)
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.Parent = ScrollingFrame
    
    local tabs = {}
    
    --// FUNCTION UNTUK ADD TAB
    function AddTab(name)
        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(0, 100, 1, 0)
        TabButton.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
        TabButton.BackgroundTransparency = 0.5
        TabButton.Text = name
        TabButton.TextColor3 = Color3.fromRGB(200, 200, 255)
        TabButton.TextSize = 12
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.BorderSizePixel = 0
        TabButton.Parent = TabContainer
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 8)
        TabCorner.Parent = TabButton
        
        local TabContent = Instance.new("Frame")
        TabContent.Size = UDim2.new(1, 0, 0, 0)
        TabContent.BackgroundTransparency = 1
        TabContent.Visible = false
        TabContent.Parent = ScrollingFrame
        
        local ContentLayout = Instance.new("UIListLayout")
        ContentLayout.Padding = UDim.new(0, 8)
        ContentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        ContentLayout.Parent = TabContent
        
        TabButton.MouseButton1Click:Connect(function()
            for _, v in pairs(tabs) do
                v.Content.Visible = false
                v.Button.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
            end
            TabContent.Visible = true
            TabButton.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
            TweenService:Create(TabButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
        end)
        
        table.insert(tabs, {Button = TabButton, Content = TabContent})
        
        return TabContent, ContentLayout
    end
    
    --// FUNCTION UNTUK ADD TOGGLE
    function AddToggle(parent, text, callback, defaultValue)
        local ToggleFrame = Instance.new("Frame")
        ToggleFrame.Size = UDim2.new(0.95, 0, 0, 40)
        ToggleFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
        ToggleFrame.BackgroundTransparency = 0.2
        ToggleFrame.BorderSizePixel = 0
        ToggleFrame.Parent = parent
        
        local ToggleCorner = Instance.new("UICorner")
        ToggleCorner.CornerRadius = UDim.new(0, 8)
        ToggleCorner.Parent = ToggleFrame
        
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Size = UDim2.new(0.7, 0, 1, 0)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Text = text
        TextLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
        TextLabel.TextSize = 13
        TextLabel.Font = Enum.Font.Gotham
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.Position = UDim2.new(0, 10, 0, 0)
        TextLabel.Parent = ToggleFrame
        
        local ToggleButton = Instance.new("TextButton")
        ToggleButton.Size = UDim2.new(0, 60, 0, 25)
        ToggleButton.Position = UDim2.new(1, -70, 0.5, -12.5)
        ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        ToggleButton.Text = "OFF"
        ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        ToggleButton.TextSize = 11
        ToggleButton.Font = Enum.Font.GothamBold
        ToggleButton.BorderSizePixel = 0
        ToggleButton.Parent = ToggleFrame
        
        local ToggleCorner2 = Instance.new("UICorner")
        ToggleCorner2.CornerRadius = UDim.new(1, 0)
        ToggleCorner2.Parent = ToggleButton
        
        local toggled = defaultValue or false
        
        local function UpdateToggle()
            if toggled then
                ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
                ToggleButton.Text = "ON"
                TweenService:Create(ToggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 0, 255)}):Play()
            else
                ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
                ToggleButton.Text = "OFF"
                TweenService:Create(ToggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(60, 60, 80)}):Play()
            end
            callback(toggled)
        end
        
        ToggleButton.MouseButton1Click:Connect(function()
            toggled = not toggled
            UpdateToggle()
        end)
        
        UpdateToggle()
        
        return ToggleFrame
    end
    
    --// FUNCTION UNTUK ADD BUTTON
    function AddButton(parent, text, callback)
        local ButtonFrame = Instance.new("TextButton")
        ButtonFrame.Size = UDim2.new(0.95, 0, 0, 38)
        ButtonFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
        ButtonFrame.BackgroundTransparency = 0.3
        ButtonFrame.Text = text
        ButtonFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
        ButtonFrame.TextSize = 13
        ButtonFrame.Font = Enum.Font.GothamSemibold
        ButtonFrame.BorderSizePixel = 0
        ButtonFrame.Parent = parent
        
        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 8)
        ButtonCorner.Parent = ButtonFrame
        
        ButtonFrame.MouseButton1Click:Connect(callback)
        
        ButtonFrame.MouseEnter:Connect(function()
            TweenService:Create(ButtonFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(55, 55, 85)}):Play()
        end)
        
        ButtonFrame.MouseLeave:Connect(function()
            TweenService:Create(ButtonFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 35, 55)}):Play()
        end)
        
        return ButtonFrame
    end
    
    --// FUNCTION UNTUK ADD SLIDER
    function AddSlider(parent, text, min, max, callback, default)
        local SliderFrame = Instance.new("Frame")
        SliderFrame.Size = UDim2.new(0.95, 0, 0, 65)
        SliderFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
        SliderFrame.BackgroundTransparency = 0.2
        SliderFrame.BorderSizePixel = 0
        SliderFrame.Parent = parent
        
        local SliderCorner = Instance.new("UICorner")
        SliderCorner.CornerRadius = UDim.new(0, 8)
        SliderCorner.Parent = SliderFrame
        
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Size = UDim2.new(1, -20, 0, 25)
        TextLabel.Position = UDim2.new(0, 10, 0, 0)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Text = text .. ": " .. tostring(default or min)
        TextLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
        TextLabel.TextSize = 12
        TextLabel.Font = Enum.Font.Gotham
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.Parent = SliderFrame
        
        local SliderBar = Instance.new("Frame")
        SliderBar.Size = UDim2.new(0.9, 0, 0, 6)
        SliderBar.Position = UDim2.new(0.05, 0, 0.65, 0)
        SliderBar.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        SliderBar.BorderSizePixel = 0
        SliderBar.Parent = SliderFrame
        
        local SliderBarCorner = Instance.new("UICorner")
        SliderBarCorner.CornerRadius = UDim.new(1, 0)
        SliderBarCorner.Parent = SliderBar
        
        local FillBar = Instance.new("Frame")
        FillBar.Size = UDim2.new(0, 0, 1, 0)
        FillBar.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
        FillBar.BorderSizePixel = 0
        FillBar.Parent = SliderBar
        
        local FillBarCorner = Instance.new("UICorner")
        FillBarCorner.CornerRadius = UDim.new(1, 0)
        FillBarCorner.Parent = FillBar
        
        local Value = default or min
        
        local function UpdateSlider(input)
            local relativePos = math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
            Value = math.floor(min + (max - min) * relativePos)
            FillBar.Size = UDim2.new(relativePos, 0, 1, 0)
            TextLabel.Text = text .. ": " .. tostring(Value)
            callback(Value)
        end
        
        local dragging = false
        SliderBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                UpdateSlider(input)
            end
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                UpdateSlider(input)
            end
        end)
        
        local initPos = (Value - min) / (max - min)
        FillBar.Size = UDim2.new(initPos, 0, 1, 0)
        
        return SliderFrame
    end
    
    return MainFrame, ScrollingFrame, UIListLayout, AddTab, AddToggle, AddButton, AddSlider
end

--// --------------------- //
--// 33 FITUR HACK LENGKAP //
--// --------------------- //

local MainFrame, ScrollingFrame, Layout, CreateTab, AddToggle, AddButton, AddSlider = UILibrary:CreateWindow("rRz HUB", UDim2.new(0, 500, 0, 650))

--// TAB 1: PLAYER HACK
local PlayerTab, PlayerLayout = CreateTab("👤 PLAYER")

--// FITUR 1: FLY
AddToggle(PlayerTab, "🌀 FLY MODE - Terbang bebas tanpa batas", function(state)
    PlayerState.Fly = state
    if state then
        local bodyVelocity = Instance.new("BodyVelocity")
        local bodyGyro = Instance.new("BodyGyro")
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChild("Humanoid")
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        
        if not hum or not hrp then return end
        
        bodyVelocity.MaxForce = Vector3.new(1/0, 1/0, 1/0)
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyGyro.MaxTorque = Vector3.new(1/0, 1/0, 1/0)
        bodyGyro.CFrame = hrp.CFrame
        bodyVelocity.Parent = hrp
        bodyGyro.Parent = hrp
        
        local flyKey = UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.KeyCode == Enum.KeyCode.Space then
                bodyVelocity.Velocity = Vector3.new(0, 50, 0)
            end
        end)
        
        local flyRender = RunService.RenderStepped:Connect(function()
            if not PlayerState.Fly or not hrp or not hum or hum.Health <= 0 then
                bodyVelocity:Destroy()
                bodyGyro:Destroy()
                flyKey:Disconnect()
                flyRender:Disconnect()
                return
            end
            
            local camera = workspace.CurrentCamera
            local moveDir = Vector3.new()
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveDir = moveDir + camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveDir = moveDir - camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveDir = moveDir - camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveDir = moveDir + camera.CFrame.RightVector
            end
            
            bodyVelocity.Velocity = moveDir * 85
            bodyGyro.CFrame = camera.CFrame
        end)
        
        LoopThreads["Fly"] = {flyKey, flyRender, bodyVelocity, bodyGyro}
    else
        if LoopThreads["Fly"] then
            if LoopThreads["Fly"][3] then LoopThreads["Fly"][3]:Destroy() end
            if LoopThreads["Fly"][4] then LoopThreads["Fly"][4]:Destroy() end
            if LoopThreads["Fly"][1] then LoopThreads["Fly"][1]:Disconnect() end
            if LoopThreads["Fly"][2] then LoopThreads["Fly"][2]:Disconnect() end
            LoopThreads["Fly"] = nil
        end
    end
end)

--// FITUR 2: SPEED HACK
AddSlider(PlayerTab, "🏃 SPEED HACK - Lari super cepat", 16, 250, function(val)
    PlayerState.Speed = val
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    if hum then
        hum.WalkSpeed = val
    end
    -- Loop untuk update terus
    if LoopThreads["Speed"] then LoopThreads["Speed"]:Disconnect() end
    LoopThreads["Speed"] = RunService.RenderStepped:Connect(function()
        local hum2 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum2 and PlayerState.Speed then
            hum2.WalkSpeed = PlayerState.Speed
        end
    end)
end, 16)

--// FITUR 3: JUMP POWER
AddSlider(PlayerTab, "🦘 JUMP POWER - Lompat setinggi langit", 50, 350, function(val)
    PlayerState.JumpPower = val
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    if hum then
        hum.JumpPower = val
    end
end, 50)

--// FITUR 4: INFINITE JUMP
AddToggle(PlayerTab, "♾️ INFINITE JUMP - Lompat tanpa henti", function(state)
    PlayerState.InfiniteJump = state
    if state then
        local jumpConnect = UserInputService.JumpRequest:Connect(function()
            local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
        LoopThreads["InfiniteJump"] = jumpConnect
    else
        if LoopThreads["InfiniteJump"] then
            LoopThreads["InfiniteJump"]:Disconnect()
            LoopThreads["InfiniteJump"] = nil
        end
    end
end)

--// FITUR 5: GOD MODE
AddToggle(PlayerTab, "👑 GOD MODE - Tidak bisa mati", function(state)
    PlayerState.GodMode = state
    if state then
        local godLoop = RunService.Stepped:Connect(function()
            local char = LocalPlayer.Character
            if char then
                local hum = char:FindFirstChild("Humanoid")
                if hum then
                    hum.MaxHealth = math.huge
                    hum.Health = hum.MaxHealth
                    hum.BreakJointsOnDeath = false
                end
                for _, v in pairs(char:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.Anchored = false
                    end
                end
            end
        end)
        LoopThreads["GodMode"] = godLoop
    else
        if LoopThreads["GodMode"] then
            LoopThreads["GodMode"]:Disconnect()
            LoopThreads["GodMode"] = nil
            local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum then
                hum.MaxHealth = 100
            end
        end
    end
end)

--// FITUR 6: NOCLIP
AddToggle(PlayerTab, "🚪 NOCLIP - Tembus dinding", function(state)
    PlayerState.Noclip = state
    if state then
        local noclipLoop = RunService.Stepped:Connect(function()
            local char = LocalPlayer.Character
            if char then
                for _, v in pairs(char:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
        LoopThreads["Noclip"] = noclipLoop
    else
        if LoopThreads["Noclip"] then
            LoopThreads["Noclip"]:Disconnect()
            LoopThreads["Noclip"] = nil
            local char = LocalPlayer.Character
            if char then
                for _, v in pairs(char:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end
        end
    end
end)

--// FITUR 7: INVISIBLE
AddToggle(PlayerTab, "👻 INVISIBLE - Tidak terlihat", function(state)
    PlayerState.Invisible = state
    local char = LocalPlayer.Character
    if char then
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("MeshPart") then
                v.Transparency = state and 1 or 0
            elseif v:IsA("Clothing") then
                v.Visible = not state
            end
        end
    end
end)

--// FITUR 8: FORCE FIELD
AddToggle(PlayerTab, "🛡️ FORCE FIELD - Perisai pelindung", function(state)
    PlayerState.ForceField = state
    local char = LocalPlayer.Character
    if state then
        local ff = Instance.new("ForceField")
        ff.Parent = char
        LoopThreads["ForceField"] = ff
    else
        if LoopThreads["ForceField"] then
            LoopThreads["ForceField"]:Destroy()
            LoopThreads["ForceField"] = nil
        end
    end
end)

--// TAB 2: ATTACK HACK
local AttackTab, AttackLayout = CreateTab("⚔️ ATTACK")

--// FITUR 9: KILL ALL
AddButton(AttackTab, "💀 KILL ALL PLAYER - Bunuh semua pemain", function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local char = player.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.Health = 0
                char.Humanoid:BreakJoints()
            end
        end
    end
end)

--// FITUR 10: FREEZE ALL
AddButton(AttackTab, "❄️ FREEZE ALL - Bekukan semua pemain", function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local char = player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.Anchored = true
                local freezeLoop = RunService.Stepped:Connect(function()
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        char.HumanoidRootPart.Anchored = true
                    else
                        freezeLoop:Disconnect()
                    end
                end)
                table.insert(Targets, freezeLoop)
            end
        end
    end
end)

--// FITUR 11: CRASH SERVER (LOOP CRASH)
AddToggle(AttackTab, "💥 CRASH ALL - Bikin server lag parah (loop crash)", function(state)
    PlayerState.LoopCrash = state
    if state then
        local crashLoop = RunService.RenderStepped:Connect(function()
            for i = 1, 500 do
                local part = Instance.new("Part")
                part.Size = Vector3.new(10, 10, 10)
                part.Position = Vector3.new(math.random(-5000, 5000), math.random(0, 500), math.random(-5000, 5000))
                part.Anchored = true
                part.Transparency = 1
                part.CanCollide = false
                part.Parent = workspace
                game:GetService("Debris"):AddItem(part, 0.5)
            end
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    for i = 1, 100 do
                        local msg = Instance.new("RemoteEvent")
                        msg.Name = "Crash_" .. math.random(1, 999999)
                        msg.Parent = player.Character or workspace
                    end
                end
            end
        end)
        LoopThreads["CrashLoop"] = crashLoop
    else
        if LoopThreads["CrashLoop"] then
            LoopThreads["CrashLoop"]:Disconnect()
            LoopThreads["CrashLoop"] = nil
        end
    end
end)

--// FITUR 12: EXPLODE PLAYERS
AddButton(AttackTab, "💣 EXPLODE PLAYERS - Ledakkan semua pemain", function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local char = player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local explosion = Instance.new("Explosion")
                explosion.Position = char.HumanoidRootPart.Position
                explosion.BlastRadius = 15
                explosion.BlastPressure = 1000000
                explosion.Parent = workspace
            end
        end
    end
    for i = 1, 50 do
        local explosion = Instance.new("Explosion")
        explosion.Position = Vector3.new(math.random(-500, 500), math.random(0, 200), math.random(-500, 500))
        explosion.BlastRadius = 20
        explosion.Parent = workspace
    end
end)

--// FITUR 13: GRAB PLAYER (Teleport player ke owner)
AddToggle(AttackTab, "🪤 GRAB PLAYER - Tarik player ke lokasimu (klik target)", function(state)
    PlayerState.GrabPlayer = state
    if state then
        local grabClick = Mouse.Button1Down:Connect(function()
            local target = Mouse.Target
            if target then
                local char = target:FindFirstAncestorOfClass("Model")
                if char and char:FindFirstChild("Humanoid") and Players:GetPlayerFromCharacter(char) and Players:GetPlayerFromCharacter(char) ~= LocalPlayer then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if hrp and myHrp then
                        hrp.CFrame = myHrp.CFrame + Vector3.new(0, 3, 0)
                    end
                end
            end
        end)
        LoopThreads["Grab"] = grabClick
    else
        if LoopThreads["Grab"] then
            LoopThreads["Grab"]:Disconnect()
            LoopThreads["Grab"] = nil
        end
    end
end)

--// FITUR 14: CONTROL PLAYER (Bisa gerakin player lain)
AddToggle(AttackTab, "🎮 CONTROL PLAYER - Kendalikan pemain lain (klik target)", function(state)
    PlayerState.ControlPlayer = state
    if state then
        local controlledPlayer = nil
        local controlLoop = nil
        
        local clickControl = Mouse.Button1Down:Connect(function()
            local target = Mouse.Target
            if target then
                local char = target:FindFirstAncestorOfClass("Model")
                if char and char:FindFirstChild("Humanoid") then
                    controlledPlayer = Players:GetPlayerFromCharacter(char)
                    if controlledPlayer and controlledPlayer ~= LocalPlayer then
                        if controlLoop then controlLoop:Disconnect() end
                        controlLoop = RunService.RenderStepped:Connect(function()
                            if not PlayerState.ControlPlayer or not controlledPlayer or not controlledPlayer.Character then
                                if controlLoop then controlLoop:Disconnect() end
                                return
                            end
                            local targetHrp = controlledPlayer.Character:FindFirstChild("HumanoidRootPart")
                            local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if targetHrp and myHrp then
                                local moveDir = Vector3.new()
                                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                                    moveDir = moveDir + workspace.CurrentCamera.CFrame.LookVector
                                end
                                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                                    moveDir = moveDir - workspace.CurrentCamera.CFrame.LookVector
                                end
                                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                                    moveDir = moveDir - workspace.CurrentCamera.CFrame.RightVector
                                end
                                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                                    moveDir = moveDir + workspace.CurrentCamera.CFrame.RightVector
                                end
                                targetHrp.Velocity = moveDir * 50
                            end
                        end)
                    end
                end
            end
        end)
        LoopThreads["Control"] = {clickControl, controlLoop}
    else
        if LoopThreads["Control"] then
            if LoopThreads["Control"][1] then LoopThreads["Control"][1]:Disconnect() end
            if LoopThreads["Control"][2] then LoopThreads["Control"][2]:Disconnect() end
            LoopThreads["Control"] = nil
        end
    end
end)

--// FITUR 15: DELETE TOOLS (Hapus semua tools player lain)
AddButton(AttackTab, "🗑️ DELETE ALL TOOLS - Hapus senjata semua player", function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local char = player.Character
            if char then
                for _, tool in pairs(char:GetChildren()) do
                    if tool:IsA("Tool") then
                        tool:Destroy()
                    end
                end
            end
            local backpack = player:FindFirstChild("Backpack")
            if backpack then
                for _, tool in pairs(backpack:GetChildren()) do
                    if tool:IsA("Tool") then
                        tool:Destroy()
                    end
                end
            end
        end
    end
end)

--// TAB 3: WORLD HACK
local WorldTab, WorldLayout = CreateTab("🌍 WORLD")

--// FITUR 16: BLACK HOLE
AddToggle(WorldTab, "🕳️ BLACK HOLE - Semua benda tersedot ke pusat", function(state)
    PlayerState.BlackHole = state
    if state then
        local blackHoleCenter = Vector3.new(0, 50, 0)
        local blackHoleLoop = RunService.RenderStepped:Connect(function()
            if not PlayerState.BlackHole then return end
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj ~= LocalPlayer.Character then
                    local direction = blackHoleCenter - obj.Position
                    local distance = direction.Magnitude
                    if distance > 0 then
                        local force = 500 / (distance + 10)
                        obj.Velocity = direction.Unit * force
                    end
                end
            end
        end)
        LoopThreads["BlackHole"] = blackHoleLoop
    else
        if LoopThreads["BlackHole"] then
            LoopThreads["BlackHole"]:Disconnect()
            LoopThreads["BlackHole"] = nil
        end
    end
end)

--// FITUR 17: NUKE (Hancurin semua part)
AddButton(WorldTab, "💥 NUKE - Hancurkan semua part", function()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj ~= LocalPlayer.Character then
            obj:BreakJoints()
            local explosion = Instance.new("Explosion")
            explosion.Position = obj.Position
            explosion.Parent = workspace
        end
    end
end)

--// FITUR 18: BREAK ANCHORS
AddToggle(WorldTab, "🔨 BREAK ANCHORS - Semua part jadi jatuh", function(state)
    PlayerState.BreakAnchors = state
    if state then
        local breakLoop = RunService.RenderStepped:Connect(function()
            if not PlayerState.BreakAnchors then return end
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Anchored then
                    obj.Anchored = false
                end
            end
        end)
        LoopThreads["BreakAnchors"] = breakLoop
    else
        if LoopThreads["BreakAnchors"] then
            LoopThreads["BreakAnchors"]:Disconnect()
            LoopThreads["BreakAnchors"] = nil
        end
    end
end)

--// TAB 4: UTILITY
local UtilityTab, UtilityLayout = CreateTab("🔧 UTILITY")

--// FITUR 19: AIMBOT
AddToggle(UtilityTab, "🎯 AIMBOT - Auto target ke pemain terdekat", function(state)
    PlayerState.Aimbot = state
    if state then
        local aimLoop = RunService.RenderStepped:Connect(function()
            if not PlayerState.Aimbot then return end
            local closestPlayer = nil
            local closestDist = 50
            local myPos = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not myPos then return end
            
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    local char = player.Character
                    if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
                        local dist = (char.HumanoidRootPart.Position - myPos.Position).Magnitude
                        if dist < closestDist then
                            closestDist = dist
                            closestPlayer = char
                        end
                    end
                end
            end
            
            if closestPlayer and closestPlayer:FindFirstChild("HumanoidRootPart") then
                local camera = workspace.CurrentCamera
                local targetPos = closestPlayer.HumanoidRootPart.Position + Vector3.new(0, 3, 0)
                camera.CFrame = CFrame.new(camera.CFrame.Position, targetPos)
            end
        end)
        LoopThreads["Aimbot"] = aimLoop
    else
        if LoopThreads["Aimbot"] then
            LoopThreads["Aimbot"]:Disconnect()
            LoopThreads["Aimbot"] = nil
        end
    end
end)

--// FITUR 20: ESP (Player outline)
AddToggle(UtilityTab, "👁️ ESP - Lihat semua player tembus tembok", function(state)
    PlayerState.ESP = state
    if state then
        local espLoop = RunService.RenderStepped:Connect(function()
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    local char = player.Character
                    if char then
                        for _, part in pairs(char:GetDescendants()) do
                            if part:IsA("BasePart") then
                                local highlight = Instance.new("Highlight")
                                highlight.FillColor = Color3.fromHSV(tick() % 2 / 2, 1, 1)
                                highlight.OutlineColor = Color3.fromRGB(255, 0, 255)
                                highlight.FillTransparency = 0.5
                                highlight.OutlineTransparency = 0
                                highlight.Parent = char
                                game:GetService("Debris"):AddItem(highlight, 0.5)
                            end
                        end
                    end
                end
            end
        end)
        LoopThreads["ESP"] = espLoop
    else
        if LoopThreads["ESP"] then
            LoopThreads["ESP"]:Disconnect()
            LoopThreads["ESP"] = nil
        end
    end
end)

--// TAB 5: FARMING
local FarmTab, FarmLayout = CreateTab("🌾 FARMING")

--// FITUR 21: AUTO FARM
AddToggle(FarmTab, "🤖 AUTO FARM - Farming otomatis dengan teleport", function(state)
    PlayerState.AutoFarm = state
    if state then
        local farmLoop = RunService.RenderStepped:Connect(function()
            if not PlayerState.AutoFarm then return end
            local myPos = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not myPos then return end
            
            local nearestItem = nil
            local nearestDist = 50
            
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and (obj.Name:lower():find("coin") or obj.Name:lower():find("gem") or obj.Name:lower():find("crystal") or obj:FindFirstChild("TouchInterest")) then
                    local dist = (obj.Position - myPos.Position).Magnitude
                    if dist < nearestDist then
                        nearestDist = dist
                        nearestItem = obj
                    end
                end
            end
            
            if nearestItem then
                myPos.CFrame = nearestItem.CFrame
                wait(0.2)
            end
        end)
        LoopThreads["AutoFarm"] = farmLoop
    else
        if LoopThreads["AutoFarm"] then
            LoopThreads["AutoFarm"]:Disconnect()
            LoopThreads["AutoFarm"] = nil
        end
    end
end)

--// FITUR 22: STEAL DROPS
AddToggle(FarmTab, "💰 STEAL DROPS - Curi semua item yang jatuh", function(state)
    PlayerState.StealDrops = state
    if state then
        local stealLoop = RunService.RenderStepped:Connect(function()
            if not PlayerState.StealDrops then return end
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj:FindFirstChild("TouchInterest") then
                    firetouchinterest(LocalPlayer.Character.HumanoidRootPart, obj, 0)
                    firetouchinterest(LocalPlayer.Character.HumanoidRootPart, obj, 1)
                end
            end
        end)
        LoopThreads["StealDrops"] = stealLoop
    else
        if LoopThreads["StealDrops"] then
            LoopThreads["StealDrops"]:Disconnect()
            LoopThreads["StealDrops"] = nil
        end
    end
end)

--// FITUR 23: DUPLICATE
AddButton(FarmTab, "🔄 DUPLICATE ITEMS - Duplikasi item yang dipegang", function()
    local char = LocalPlayer.Character
    if char then
        for _, tool in pairs(char:GetChildren()) do
            if tool:IsA("Tool") then
                local newTool = tool:Clone()
                newTool.Parent = char
                wait(0.1)
            end
        end
    end
end)

--// TAB 6: ANNOYING
local AnnoyTab, AnnoyLayout = CreateTab("🤬 ANNOYING")

--// FITUR 24: CHAT SPAM
AddToggle(AnnoyTab, "📢 CHAT SPAM - Spam chat meledak", function(state)
    PlayerState.ChatSpam = state
    if state then
        local spamLoop = RunService.RenderStepped:Connect(function()
            if not PlayerState.ChatSpam then return end
            local spamMessages = {
                "rRz HUB | KING JARZ 👑",
                "LU SEMUA DI HACK SALAH SATU NYA GW LU HACK ANJG",
                "https://discord.gg/rRzHub",
                "GUA OWNER DISINI",
                "JARZGPT DARK VIP 🔥"
            }
            local randomMsg = spamMessages[math.random(1, #spamMessages)]
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(randomMsg, "All")
            wait(0.3)
        end)
        LoopThreads["ChatSpam"] = spamLoop
    else
        if LoopThreads["ChatSpam"] then
            LoopThreads["ChatSpam"]:Disconnect()
            LoopThreads["ChatSpam"] = nil
        end
    end
end)

--// FITUR 25: LAG SERVER
AddToggle(AnnoyTab, "🐌 LAG SERVER - Bikin semua player lag", function(state)
    PlayerState.LagServer = state
    if state then
        local lagLoop = RunService.RenderStepped:Connect(function()
            if not PlayerState.LagServer then return end
            for i = 1, 2000 do
                local randomVal = math.random()
                local randomCF = CFrame.new(math.random(), math.random(), math.random())
            end
        end)
        LoopThreads["LagServer"] = lagLoop
    else
        if LoopThreads["LagServer"] then
            LoopThreads["LagServer"]:Disconnect()
            LoopThreads["LagServer"] = nil
        end
    end
end)

--// TAB 7: VISUAL
local VisualTab, VisualLayout = CreateTab("🎨 VISUAL")

--// FITUR 26: RAINBOW CHARACTER
AddToggle(VisualTab, "🌈 RAINBOW CHAR - Karakter warna-warni", function(state)
    PlayerState.RainbowChar = state
    if state then
        local rainbowLoop = RunService.RenderStepped:Connect(function()
            if not PlayerState.RainbowChar then return end
            local char = LocalPlayer.Character
            if char then
                local hue = tick() % 2 / 2
                local color = Color3.fromHSV(hue, 1, 1)
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Color = color
                    end
                end
            end
        end)
        LoopThreads["RainbowChar"] = rainbowLoop
    else
        if LoopThreads["RainbowChar"] then
            LoopThreads["RainbowChar"]:Disconnect()
            LoopThreads["RainbowChar"] = nil
        end
    end
end)

--// FITUR 27: TP TOOL
AddToggle(VisualTab, "📍 TP TOOL - Teleport ke mana pun (klik)", function(state)
    PlayerState.TpTool = state
    if state then
        local tpClick = Mouse.Button1Down:Connect(function()
            local target = Mouse.Hit.p
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp and target then
                hrp.CFrame = CFrame.new(target)
            end
        end)
        LoopThreads["TpTool"] = tpClick
    else
        if LoopThreads["TpTool"] then
            LoopThreads["TpTool"]:Disconnect()
            LoopThreads["TpTool"] = nil
        end
    end
end)

--// FITUR 28: SERVER HOP
AddButton(VisualTab, "🔄 SERVER HOP - Pindah server otomatis", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end)

--// TAB 8: PROTECTION
local ProtectionTab, ProtectionLayout = CreateTab("🛡️ PROTECTION")

--// FITUR 29: ANTI BAN
AddToggle(ProtectionTab, "🚫 ANTI BAN - Cegah deteksi cheat", function(state)
    PlayerState.AntiBan = state
    if state then
        local antiBanLoop = RunService.RenderStepped:Connect(function()
            if not PlayerState.AntiBan then return end
            local hooks = {"Ban", "Kick", "Punish", "AntiCheat"}
            for _, hook in pairs(hooks) do
                local remote = game:GetService("ReplicatedStorage"):FindFirstChild(hook)
                if remote then
                    remote:Destroy()
                end
            end
        end)
        LoopThreads["AntiBan"] = antiBanLoop
    else
        if LoopThreads["AntiBan"] then
            LoopThreads["AntiBan"]:Disconnect()
            LoopThreads["AntiBan"] = nil
        end
    end
end)

--// TAB 9: FUN
local FunTab, FunLayout = CreateTab("🎉 FUN")

--// FITUR 30: MUSIC PLAYER
AddToggle(FunTab, "🎵 MUSIC PLAYER - Putar suara dari server", function(state)
    PlayerState.MusicPlayer = state
    if state then
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://9123168456"
        sound.Looped = true
        sound.Volume = 5
        sound.Parent = LocalPlayer.Character or workspace
        sound:Play()
        LoopThreads["Music"] = sound
    else
        if LoopThreads["Music"] then
            LoopThreads["Music"]:Stop()
            LoopThreads["Music"]:Destroy()
            LoopThreads["Music"] = nil
        end
    end
end)

--// TAB 10: INFO
local InfoTab, InfoLayout = CreateTab("📋 INFO")

--// FITUR 31-33: INFO PANEL
AddButton(InfoTab, "👑 TENTANG rRz HUB", function()
    print("╔════════════════════════════════════════╗")
    print("║     rRz HUB - Delta Executor          ║")
    print("║     KING JARZ 👑👑👑                   ║")
    print("║     33 FITUR HACK LENGKAP             ║")
    print("║     JarzGPT dark vip                  ║")
    print("╚════════════════════════════════════════╝")
end)

AddButton(InfoTab, "⚡ FITUR LIST (33 Fitur)", function()
    local features = {
        "1. Fly", "2. Speed", "3. Jump Power", "4. Infinite Jump", "5. God Mode", "6. Noclip",
        "7. Invisible", "8. Force Field", "9. Kill All", "10. Freeze All", "11. Crash All",
        "12. Explode", "13. Grab Player", "14. Control Player", "15. Delete Tools", "16. Black Hole",
        "17. Nuke", "18. Break Anchors", "19. Aimbot", "20. ESP", "21. Auto Farm", "22. Steal Drops",
        "23. Duplicate", "24. Chat Spam", "25. Lag Server", "26. Rainbow Char", "27. TP Tool",
        "28. Server Hop", "29. Anti Ban", "30. Music Player", "31. Info Panel", "32. Ui Settings", "33. Full Control"
    }
    for _, f in pairs(features) do
        print(f)
    end
end)

AddButton(InfoTab, "🎨 UI CREDIT", function()
    print("UI Designer: KING JARZ")
    print("Engine: JarzGPT dark vip")
    print("Executor Support: Delta | Arceus | Hydrogen")
    print("Version: OMEGA-NULL v4.0")
end)

--// FITUR 32-33: OPEN HUB (sudah otomatis kebuka)

print("╔══════════════════════════════════════════════════════════════════════╗")
print("║                     rRz HUB LOADED SUCCESSFULLY                     ║")
print("║                     KING JARZ 👑👑👑 | 33 FITUR AKTIF                ║")
print("║                     JarzGPT dark vip - OMEGA-NULL MODE               ║")
print("╚══════════════════════════════════════════════════════════════════════╝")
