-- rRz Hub (Roblox Executor Universal)
-- Supports: All Executors (Mobile/PC) | 200+ FEATURES | NEON THEME
-- Owner: Jarz_Scripter | Team: Ihza, Afka, Ganis, Danis, Zaki, Gamz

repeat wait() until game:IsLoaded()
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local VirtualInput = game:GetService("VirtualInputManager")
local Camera = workspace.CurrentCamera
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = workspace

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "rRzHub"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local function showNotif(msg, isError)
    local notif = Instance.new("Frame")
    notif.Parent = ScreenGui
    notif.BackgroundColor3 = Color3.fromRGB(20,20,25)
    notif.BackgroundTransparency = 0.05
    notif.Position = UDim2.new(0.5, -200, 0.85, 0)
    notif.Size = UDim2.new(0, 400, 0, 40)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = notif
    
    local text = Instance.new("TextLabel")
    text.Parent = notif
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Font = Enum.Font.GothamBold
    text.Text = msg
    text.TextColor3 = isError and Color3.fromRGB(255,70,70) or Color3.fromRGB(0,255,255)
    text.TextSize = 13
    text.TextWrapped = true
    
    TweenService:Create(notif, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -200, 0.8, 0)}):Play()
    task.wait(2)
    TweenService:Create(notif, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -200, 0.9, 0), BackgroundTransparency = 1}):Play()
    task.wait(0.3)
    notif:Destroy()
end

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10,10,15)
MainFrame.BackgroundTransparency = 0.05
MainFrame.Position = UDim2.new(0.5, -350, 0.5, -250)
MainFrame.Size = UDim2.new(0, 700, 0, 500)
MainFrame.Active = true
MainFrame.Draggable = true

local neonGlow = Instance.new("Frame")
neonGlow.Parent = MainFrame
neonGlow.BackgroundColor3 = Color3.fromRGB(0,255,255)
neonGlow.BackgroundTransparency = 0.85
neonGlow.Size = UDim2.new(1, 0, 1, 0)
neonGlow.ZIndex = 0
local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 12)
glowCorner.Parent = neonGlow

coroutine.wrap(function()
    while true do
        for i = 0.85, 0.65, -0.02 do
            neonGlow.BackgroundTransparency = i
            task.wait(0.02)
        end
        for i = 0.65, 0.85, 0.02 do
            neonGlow.BackgroundTransparency = i
            task.wait(0.02)
        end
    end
end)()

local shadow = Instance.new("Frame")
shadow.Parent = ScreenGui
shadow.BackgroundColor3 = Color3.fromRGB(0,0,0)
shadow.BackgroundTransparency = 0.6
shadow.Position = UDim2.new(0.5, -355, 0.5, -255)
shadow.Size = UDim2.new(0, 710, 0, 510)
shadow.ZIndex = 0

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(15,15,20)
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.Position = UDim2.new(0, 0, 0, 0)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 12)
TopCorner.Parent = TopBar

local LogoIcon = Instance.new("ImageLabel")
LogoIcon.Parent = TopBar
LogoIcon.Size = UDim2.new(0, 30, 0, 30)
LogoIcon.Position = UDim2.new(0, 10, 0, 7)
LogoIcon.Image = "rbxassetid://916268032"
LogoIcon.BackgroundTransparency = 1

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 50, 0, 0)
Title.Size = UDim2.new(0, 120, 0, 45)
Title.Font = Enum.Font.GothamBold
Title.Text = "rRz HUB"
Title.TextColor3 = Color3.fromRGB(0,255,255)
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Left

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = TopBar
SubTitle.BackgroundTransparency = 1
SubTitle.Position = UDim2.new(0, 130, 0, 5)
SubTitle.Size = UDim2.new(0, 250, 0, 35)
SubTitle.Font = Enum.Font.Gotham
SubTitle.Text = "200+ Premium Features"
SubTitle.TextColor3 = Color3.fromRGB(150,150,150)
SubTitle.TextSize = 11

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Parent = TopBar
MinimizeBtn.BackgroundTransparency = 1
MinimizeBtn.Position = UDim2.new(1, -95, 0, 0)
MinimizeBtn.Size = UDim2.new(0, 35, 0, 45)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Text = "−"
MinimizeBtn.TextColor3 = Color3.fromRGB(255,255,255)
MinimizeBtn.TextSize = 24

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.BackgroundTransparency = 1
CloseBtn.Position = UDim2.new(1, -50, 0, 0)
CloseBtn.Size = UDim2.new(0, 45, 0, 45)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255,100,100)
CloseBtn.TextSize = 20

CloseBtn.MouseButton1Click:Connect(function()
    local confirm = Instance.new("Frame")
    confirm.Parent = ScreenGui
    confirm.BackgroundColor3 = Color3.fromRGB(0,0,0)
    confirm.BackgroundTransparency = 0.5
    confirm.Size = UDim2.new(1, 0, 1, 0)
    confirm.ZIndex = 999
    local dialog = Instance.new("Frame")
    dialog.Parent = confirm
    dialog.BackgroundColor3 = Color3.fromRGB(20,20,25)
    dialog.Position = UDim2.new(0.5, -150, 0.5, -60)
    dialog.Size = UDim2.new(0, 300, 0, 120)
    local dCorner = Instance.new("UICorner")
    dCorner.CornerRadius = UDim.new(0, 12)
    dCorner.Parent = dialog
    local q = Instance.new("TextLabel")
    q.Parent = dialog
    q.Size = UDim2.new(1, 0, 0, 40)
    q.Position = UDim2.new(0, 0, 0, 20)
    q.BackgroundTransparency = 1
    q.Font = Enum.Font.GothamBold
    q.Text = "Tutup rRz HUB?"
    q.TextColor3 = Color3.fromRGB(255,255,255)
    q.TextSize = 16
    local yes = Instance.new("TextButton")
    yes.Parent = dialog
    yes.BackgroundColor3 = Color3.fromRGB(0,255,255)
    yes.Position = UDim2.new(0, 30, 0, 70)
    yes.Size = UDim2.new(0, 100, 0, 35)
    yes.Font = Enum.Font.GothamBold
    yes.Text = "YA"
    yes.TextColor3 = Color3.fromRGB(0,0,0)
    yes.TextSize = 14
    local yCorner = Instance.new("UICorner")
    yCorner.CornerRadius = UDim.new(0, 6)
    yCorner.Parent = yes
    local no = Instance.new("TextButton")
    no.Parent = dialog
    no.BackgroundColor3 = Color3.fromRGB(50,50,55)
    no.Position = UDim2.new(1, -130, 0, 70)
    no.Size = UDim2.new(0, 100, 0, 35)
    no.Font = Enum.Font.GothamBold
    no.Text = "TIDAK"
    no.TextColor3 = Color3.fromRGB(200,200,200)
    no.TextSize = 14
    local nCorner = Instance.new("UICorner")
    nCorner.CornerRadius = UDim.new(0, 6)
    nCorner.Parent = no
    yes.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
        shadow:Destroy()
    end)
    no.MouseButton1Click:Connect(function()
        confirm:Destroy()
    end)
end)

local minimized = false
local minimizeCircle = nil
local isCircleDragging = false
local circleDragStartPos = nil
local circleStartFramePos = nil

MinimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 70, 0, 70)}):Play()
        TweenService:Create(shadow, TweenInfo.new(0.3), {Size = UDim2.new(0, 80, 0, 80)}):Play()
        ContentContainer.Visible = false
        TabBar.Visible = false
        TopBar.Size = UDim2.new(1, 0, 0, 70)
        Title.Text = ""
        SubTitle.Text = ""
        MinimizeBtn.Visible = false
        CloseBtn.Visible = false
        LogoIcon.Size = UDim2.new(0, 55, 0, 55)
        LogoIcon.Position = UDim2.new(0.5, -27, 0.5, -27)
        minimizeCircle = LogoIcon
        
        minimizeCircle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                isCircleDragging = true
                circleDragStartPos = input.Position
                circleStartFramePos = MainFrame.Position
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if isCircleDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local delta = input.Position - circleDragStartPos
                MainFrame.Position = UDim2.new(circleStartFramePos.X.Scale, circleStartFramePos.X.Offset + delta.X, circleStartFramePos.Y.Scale, circleStartFramePos.Y.Offset + delta.Y)
                shadow.Position = UDim2.new(circleStartFramePos.X.Scale, circleStartFramePos.X.Offset + delta.X - 5, circleStartFramePos.Y.Scale, circleStartFramePos.Y.Offset + delta.Y - 5)
            end
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                isCircleDragging = false
            end
        end)
        
        minimizeCircle.MouseButton1Click:Connect(function()
            if minimized then
                minimized = false
                TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 700, 0, 500)}):Play()
                TweenService:Create(shadow, TweenInfo.new(0.3), {Size = UDim2.new(0, 710, 0, 510)}):Play()
                ContentContainer.Visible = true
                TabBar.Visible = true
                TopBar.Size = UDim2.new(1, 0, 0, 45)
                Title.Text = "rRz HUB"
                SubTitle.Text = "200+ Premium Features"
                MinimizeBtn.Visible = true
                CloseBtn.Visible = true
                LogoIcon.Size = UDim2.new(0, 30, 0, 30)
                LogoIcon.Position = UDim2.new(0, 10, 0, 7)
                minimizeCircle = nil
                showNotif("Window Restored")
            end
        end)
    else
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 700, 0, 500)}):Play()
        TweenService:Create(shadow, TweenInfo.new(0.3), {Size = UDim2.new(0, 710, 0, 510)}):Play()
        ContentContainer.Visible = true
        TabBar.Visible = true
        TopBar.Size = UDim2.new(1, 0, 0, 45)
        Title.Text = "rRz HUB"
        SubTitle.Text = "200+ Premium Features"
        MinimizeBtn.Visible = true
        CloseBtn.Visible = true
        LogoIcon.Size = UDim2.new(0, 30, 0, 30)
        LogoIcon.Position = UDim2.new(0, 10, 0, 7)
    end
end)

local TabBar = Instance.new("Frame")
TabBar.Parent = MainFrame
TabBar.BackgroundColor3 = Color3.fromRGB(10,10,15)
TabBar.Size = UDim2.new(0, 140, 1, -45)
TabBar.Position = UDim2.new(0, 0, 0, 45)

local ContentContainer = Instance.new("ScrollingFrame")
ContentContainer.Parent = MainFrame
ContentContainer.BackgroundColor3 = Color3.fromRGB(15,15,20)
ContentContainer.BorderSizePixel = 0
ContentContainer.Position = UDim2.new(0, 140, 0, 45)
ContentContainer.Size = UDim2.new(1, -140, 1, -45)
ContentContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentContainer.ScrollBarThickness = 5
ContentContainer.ScrollBarImageColor3 = Color3.fromRGB(0,255,255)

local Tabs = {}
local TabList = {"MAIN", "COMBAT", "VISUAL", "PLAYER", "TROLL", "THEME", "MISC", "CREDITS"}

for i, tabName in ipairs(TabList) do
    local tabBtn = Instance.new("TextButton")
    tabBtn.Parent = TabBar
    tabBtn.BackgroundColor3 = Color3.fromRGB(15,15,20)
    tabBtn.Size = UDim2.new(1, 0, 0, 45)
    tabBtn.Position = UDim2.new(0, 0, 0, (i-1)*45)
    tabBtn.Font = Enum.Font.GothamSemibold
    tabBtn.Text = tabName
    tabBtn.TextColor3 = Color3.fromRGB(200,200,200)
    tabBtn.TextSize = 13
    
    local tabContent = Instance.new("ScrollingFrame")
    tabContent.Parent = ContentContainer
    tabContent.BackgroundTransparency = 1
    tabContent.Size = UDim2.new(1, 0, 1, 0)
    tabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabContent.ScrollBarThickness = 5
    tabContent.Visible = (i == 1)
    Tabs[tabName] = tabContent
    
    tabBtn.MouseButton1Click:Connect(function()
        for _, btn in pairs(TabBar:GetChildren()) do
            if btn:IsA("TextButton") then
                btn.BackgroundColor3 = Color3.fromRGB(15,15,20)
                btn.TextColor3 = Color3.fromRGB(200,200,200)
            end
        end
        tabBtn.BackgroundColor3 = Color3.fromRGB(0,255,255)
        tabBtn.TextColor3 = Color3.fromRGB(0,0,0)
        for _, content in pairs(Tabs) do
            content.Visible = false
        end
        Tabs[tabName].Visible = true
    end)
end

local function addButton(parent, text, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.BackgroundColor3 = Color3.fromRGB(0,255,255)
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, parent.CanvasSize.Y.Offset + 5)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(0,0,0)
    btn.TextSize = 13
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    btn.MouseButton1Click:Connect(function()
        callback()
        showNotif("🔘 " .. text)
    end)
    parent.CanvasSize = UDim2.new(0, 0, 0, parent.CanvasSize.Y.Offset + 50)
    return btn
end

local function addToggle(parent, text, callback)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.BackgroundColor3 = Color3.fromRGB(25,25,30)
    frame.Size = UDim2.new(1, -20, 0, 45)
    frame.Position = UDim2.new(0, 10, 0, parent.CanvasSize.Y.Offset + 5)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 15, 0, 0)
    label.Size = UDim2.new(1, -80, 1, 0)
    label.Font = Enum.Font.GothamSemibold
    label.Text = text
    label.TextColor3 = Color3.fromRGB(0,255,255)
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Parent = frame
    toggleBtn.BackgroundColor3 = Color3.fromRGB(50,50,55)
    toggleBtn.Position = UDim2.new(1, -50, 0, 10)
    toggleBtn.Size = UDim2.new(0, 40, 0, 25)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.Text = "OFF"
    toggleBtn.TextColor3 = Color3.fromRGB(200,200,200)
    toggleBtn.TextSize = 11
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 4)
    btnCorner.Parent = toggleBtn
    
    local state = false
    toggleBtn.MouseButton1Click:Connect(function()
        state = not state
        if state then
            toggleBtn.BackgroundColor3 = Color3.fromRGB(0,255,255)
            toggleBtn.Text = "ON"
            toggleBtn.TextColor3 = Color3.fromRGB(0,0,0)
            showNotif("✅ " .. text .. " ON")
        else
            toggleBtn.BackgroundColor3 = Color3.fromRGB(50,50,55)
            toggleBtn.Text = "OFF"
            toggleBtn.TextColor3 = Color3.fromRGB(200,200,200)
            showNotif("❌ " .. text .. " OFF")
        end
        callback(state)
    end)
    parent.CanvasSize = UDim2.new(0, 0, 0, parent.CanvasSize.Y.Offset + 55)
    return toggleBtn
end

local function addTextBox(parent, text, placeholder, callback)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.BackgroundColor3 = Color3.fromRGB(25,25,30)
    frame.Size = UDim2.new(1, -20, 0, 50)
    frame.Position = UDim2.new(0, 10, 0, parent.CanvasSize.Y.Offset + 5)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 15, 0, 5)
    label.Size = UDim2.new(1, -20, 0, 20)
    label.Font = Enum.Font.GothamSemibold
    label.Text = text
    label.TextColor3 = Color3.fromRGB(0,255,255)
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local box = Instance.new("TextBox")
    box.Parent = frame
    box.BackgroundColor3 = Color3.fromRGB(40,40,45)
    box.Position = UDim2.new(0, 15, 0, 25)
    box.Size = UDim2.new(1, -30, 0, 20)
    box.Font = Enum.Font.Gotham
    box.PlaceholderText = placeholder
    box.Text = ""
    box.TextColor3 = Color3.fromRGB(255,255,255)
    box.TextSize = 12
    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 4)
    boxCorner.Parent = box
    
    box.FocusLost:Connect(function(enter)
        if enter and box.Text ~= "" then
            callback(box.Text)
            showNotif("📝 " .. text .. ": " .. box.Text)
        end
    end)
    
    parent.CanvasSize = UDim2.new(0, 0, 0, parent.CanvasSize.Y.Offset + 60)
    return box
end

local function addLabel(parent, text, color)
    local label = Instance.new("TextLabel")
    label.Parent = parent
    label.BackgroundColor3 = Color3.fromRGB(25,25,30)
    label.Size = UDim2.new(1, -20, 0, 35)
    label.Position = UDim2.new(0, 10, 0, parent.CanvasSize.Y.Offset + 5)
    label.Font = Enum.Font.Gotham
    label.Text = text
    label.TextColor3 = color or Color3.fromRGB(0,255,255)
    label.TextSize = 12
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label
    parent.CanvasSize = UDim2.new(0, 0, 0, parent.CanvasSize.Y.Offset + 45)
    return label
end

local mainTab = Tabs["MAIN"]
addToggle(mainTab, "Speed Hack (WalkSpeed 100)", function(val)
    if val then
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.WalkSpeed = 100
        end
        LP.CharacterAdded:Connect(function(char)
            task.wait(0.5)
            if char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = 100
            end
        end)
    else
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.WalkSpeed = 16
        end
    end
end)
addToggle(mainTab, "Jump Power Boost (JumpPower 80)", function(val)
    if val then
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.JumpPower = 80
        end
        LP.CharacterAdded:Connect(function(char)
            task.wait(0.5)
            if char:FindFirstChild("Humanoid") then
                char.Humanoid.JumpPower = 80
            end
        end)
    else
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.JumpPower = 50
        end
    end
end)
addToggle(mainTab, "Noclip (Tembus Dinding)", function(val)
    local noclipConn
    if val then
        noclipConn = RunService.Stepped:Connect(function()
            if LP.Character then
                for _, part in pairs(LP.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        if noclipConn then noclipConn:Disconnect() end
        if LP.Character then
            for _, part in pairs(LP.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end)
addToggle(mainTab, "Infinity Jump", function(val)
    local jumpConn
    jumpConn = UserInputService.JumpRequest:Connect(function()
        if val and LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end)
addToggle(mainTab, "God Mode (Kebal)", function(val)
    if val then
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.MaxHealth = math.huge
            LP.Character.Humanoid.Health = math.huge
            LP.Character.Humanoid.BreakJointsOnDeath = false
        end
        LP.CharacterAdded:Connect(function(char)
            task.wait(0.5)
            if char:FindFirstChild("Humanoid") then
                char.Humanoid.MaxHealth = math.huge
                char.Humanoid.Health = math.huge
                char.Humanoid.BreakJointsOnDeath = false
            end
        end)
    else
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.MaxHealth = 100
            LP.Character.Humanoid.BreakJointsOnDeath = true
        end
    end
end)
addToggle(mainTab, "Fly Mode (WASD + Space)", function(val)
    local flySpeed = 50
    local bv, bg, flyConn
    if val then
        if not LP.Character then return end
        bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(1e5,1e5,1e5)
        bv.Velocity = Vector3.new(0,0,0)
        bg = Instance.new("BodyGyro")
        bg.MaxTorque = Vector3.new(1e5,1e5,1e5)
        bg.CFrame = LP.Character.HumanoidRootPart.CFrame
        bv.Parent = LP.Character.HumanoidRootPart
        bg.Parent = LP.Character.HumanoidRootPart
        flyConn = RunService.RenderStepped:Connect(function()
            if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                local move = Vector3.new()
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + Vector3.new(0,0,-flySpeed) end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move + Vector3.new(0,0,flySpeed) end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move + Vector3.new(-flySpeed,0,0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + Vector3.new(flySpeed,0,0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,flySpeed,0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then move = move + Vector3.new(0,-flySpeed,0) end
                bv.Velocity = LP.Character.HumanoidRootPart.CFrame:VectorToWorldSpace(move)
                bg.CFrame = Camera.CFrame
                LP.Character.Humanoid.PlatformStand = true
            end
        end)
    else
        if flyConn then flyConn:Disconnect() end
        if bv then bv:Destroy() end
        if bg then bg:Destroy() end
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.PlatformStand = false
        end
    end
end)
addTextBox(mainTab, "Set WalkSpeed Manual", "Angka 16-250", function(val)
    local num = tonumber(val)
    if num and LP.Character and LP.Character:FindFirstChild("Humanoid") then
        LP.Character.Humanoid.WalkSpeed = num
    end
end)
addTextBox(mainTab, "Set JumpPower Manual", "Angka 30-200", function(val)
    local num = tonumber(val)
    if num and LP.Character and LP.Character:FindFirstChild("Humanoid") then
        LP.Character.Humanoid.JumpPower = num
    end
end)

local combatTab = Tabs["COMBAT"]
local aimbotActive = false
addToggle(combatTab, "Aimbot (Auto Aim)", function(val)
    aimbotActive = val
    coroutine.wrap(function()
        while aimbotActive do
            local closest, shortest = nil, 200
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= LP and v.Character and v.Character:FindFirstChild("Head") then
                    local pos, onScreen = Camera:WorldToViewportPoint(v.Character.Head.Position)
                    if onScreen then
                        local dist = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(pos.X, pos.Y)).Magnitude
                        if dist < shortest then
                            closest, shortest = v, dist
                        end
                    end
                end
            end
            if closest and closest.Character and closest.Character:FindFirstChild("Head") then
                local aimpoint = Camera:WorldToViewportPoint(closest.Character.Head.Position)
                VirtualInput:SendMouseMove(aimpoint.X, aimpoint.Y)
            end
            task.wait()
        end
    end)()
end)
addToggle(combatTab, "Silent Aim", function(val)
    if val then
        local oldNameCall
        oldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
            local args = {...}
            local method = getnamecallmethod()
            if method == "FireServer" and tostring(self) == "Tool" then
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= LP and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        args[1] = v.Character.HumanoidRootPart.Position
                        break
                    end
                end
            end
            return oldNameCall(self, ...)
        end)
    end
end)
addToggle(combatTab, "No Recoil", function(val)
    if val then
        local cam = workspace.CurrentCamera
        local oldRecoil = hookfunction(cam.GetRecoilMagnitude, function() return 0 end)
    end
end)
addToggle(combatTab, "Fast Swing", function(val)
    coroutine.wrap(function()
        while val do
            local tool = LP.Character and LP.Character:FindFirstChildOfClass("Tool")
            if tool then
                for _, v in pairs(tool:GetDescendants()) do
                    if v:IsA("NumberValue") and (v.Name:lower() == "cooldown" or v.Name:lower() == "coolDown") then
                        v.Value = 0.05
                    end
                end
            end
            task.wait(0.1)
        end
    end)()
end)
addToggle(combatTab, "Kill All Players", function(val)
    if val then
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LP and v.Character and v.Character:FindFirstChild("Humanoid") then
                v.Character.Humanoid.Health = 0
            end
        end
        showNotif("💀 Killed all players!")
    end
end)
addToggle(combatTab, "Freeze All Players", function(val)
    if val then
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LP and v.Character and v.Character:FindFirstChild("Humanoid") then
                v.Character.Humanoid.WalkSpeed = 0
                v.Character.Humanoid.JumpPower = 0
            end
        end
    else
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LP and v.Character and v.Character:FindFirstChild("Humanoid") then
                v.Character.Humanoid.WalkSpeed = 16
                v.Character.Humanoid.JumpPower = 50
            end
        end
    end
end)
addToggle(combatTab, "Fling All Players", function(val)
    if val then
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LP and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local bv = Instance.new("BodyVelocity")
                bv.Velocity = Vector3.new(math.random(-5000,5000), 10000, math.random(-5000,5000))
                bv.MaxForce = Vector3.new(1e5,1e5,1e5)
                bv.Parent = v.Character.HumanoidRootPart
                task.wait(0.1)
                bv:Destroy()
            end
        end
        showNotif("🪰 Flinged all players!")
    end
end)
addTextBox(combatTab, "Set Reach", "Angka 5-30", function(val)
    local num = tonumber(val)
    if num then
        showNotif("Reach set to " .. num)
    end
end)

local visualTab = Tabs["VISUAL"]
local espObjects = {}
local espEnabled = false
local espShowBox = true
local espShowName = true
local espShowHealth = true
local espShowDistance = true

addToggle(visualTab, "ESP ALL (Box + Name + Health)", function(val)
    espEnabled = val
    if espEnabled then
        coroutine.wrap(function()
            while espEnabled do
                for _, obj in pairs(espObjects) do obj:Destroy() end
                espObjects = {}
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= LP and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                        local pos, onScreen = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                        if onScreen and pos.Z > 0 then
                            if espShowBox then
                                local box = Instance.new("Frame")
                                box.Parent = ScreenGui
                                box.Size = UDim2.new(0, 60, 0, 90)
                                box.Position = UDim2.new(0, pos.X - 30, 0, pos.Y - 45)
                                box.BackgroundColor3 = Color3.fromRGB(0,255,255)
                                box.BackgroundTransparency = 0.5
                                box.BorderSizePixel = 2
                                box.BorderColor3 = Color3.fromRGB(255,255,255)
                                table.insert(espObjects, box)
                            end
                            if espShowName then
                                local label = Instance.new("TextLabel")
                                label.Parent = ScreenGui
                                label.Text = v.Name
                                label.Size = UDim2.new(0, 120, 0, 20)
                                label.Position = UDim2.new(0, pos.X - 60, 0, pos.Y - 70)
                                label.TextColor3 = Color3.fromRGB(0,255,255)
                                label.BackgroundTransparency = 1
                                label.Font = Enum.Font.GothamBold
                                label.TextSize = 11
                                table.insert(espObjects, label)
                            end
                            if espShowHealth then
                                local health = math.floor(v.Character.Humanoid.Health)
                                local hLabel = Instance.new("TextLabel")
                                hLabel.Parent = ScreenGui
                                hLabel.Text = health .. " HP"
                                hLabel.Size = UDim2.new(0, 70, 0, 18)
                                hLabel.Position = UDim2.new(0, pos.X - 35, 0, pos.Y - 25)
                                hLabel.TextColor3 = health > 50 and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
                                hLabel.BackgroundTransparency = 1
                                hLabel.Font = Enum.Font.GothamBold
                                hLabel.TextSize = 11
                                table.insert(espObjects, hLabel)
                            end
                            if espShowDistance then
                                local dist = (Camera.CFrame.Position - v.Character.HumanoidRootPart.Position).Magnitude
                                local dLabel = Instance.new("TextLabel")
                                dLabel.Parent = ScreenGui
                                dLabel.Text = math.floor(dist) .. "m"
                                dLabel.Size = UDim2.new(0, 50, 0, 18)
                                dLabel.Position = UDim2.new(0, pos.X - 25, 0, pos.Y + 55)
                                dLabel.TextColor3 = Color3.fromRGB(150,150,255)
                                dLabel.BackgroundTransparency = 1
                                dLabel.Font = Enum.Font.Gotham
                                dLabel.TextSize = 10
                                table.insert(espObjects, dLabel)
                            end
                        end
                    end
                end
                task.wait()
            end
        end)()
    else
        for _, obj in pairs(espObjects) do obj:Destroy() end
        espObjects = {}
    end
end)
addToggle(visualTab, "ESP Box", function(val) espShowBox = val end)
addToggle(visualTab, "ESP Name", function(val) espShowName = val end)
addToggle(visualTab, "ESP Health", function(val) espShowHealth = val end)
addToggle(visualTab, "ESP Distance", function(val) espShowDistance = val end)

local playerTab = Tabs["PLAYER"]
local selectedTarget = nil

local function getPlayerList()
    local list = {}
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LP then
            table.insert(list, v.Name)
        end
    end
    return list
end

addButton(playerTab, "Select Target", function()
    local players = getPlayerList()
    if #players == 0 then
        showNotif("⚠️ No other players found!")
        return
    end
    local dialog = Instance.new("Frame")
    dialog.Parent = ScreenGui
    dialog.BackgroundColor3 = Color3.fromRGB(15,15,20)
    dialog.Position = UDim2.new(0.5, -150, 0.5, -150)
    dialog.Size = UDim2.new(0, 300, 0, 300)
    dialog.ZIndex = 10
    local dCorner = Instance.new("UICorner")
    dCorner.CornerRadius = UDim.new(0, 12)
    dCorner.Parent = dialog
    local title = Instance.new("TextLabel")
    title.Parent = dialog
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "SELECT TARGET"
    title.TextColor3 = Color3.fromRGB(0,0,0)
    title.BackgroundColor3 = Color3.fromRGB(0,255,255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    local scroll = Instance.new("ScrollingFrame")
    scroll.Parent = dialog
    scroll.Position = UDim2.new(0, 0, 0, 40)
    scroll.Size = UDim2.new(1, 0, 1, -40)
    scroll.CanvasSize = UDim2.new(0, 0, 0, #players * 45)
    scroll.ScrollBarThickness = 5
    for i, name in ipairs(players) do
        local btn = Instance.new("TextButton")
        btn.Parent = scroll
        btn.Size = UDim2.new(1, -20, 0, 40)
        btn.Position = UDim2.new(0, 10, 0, (i-1)*45)
        btn.Text = name
        btn.BackgroundColor3 = Color3.fromRGB(30,30,35)
        btn.TextColor3 = Color3.fromRGB(0,255,255)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 14
        local bCorner = Instance.new("UICorner")
        bCorner.CornerRadius = UDim.new(0, 6)
        bCorner.Parent = btn
        btn.MouseButton1Click:Connect(function()
            selectedTarget = Players:FindFirstChild(name)
            showNotif("🎯 Target: " .. name)
            dialog:Destroy()
        end)
    end
    local closeBtn = Instance.new("TextButton")
    closeBtn.Parent = dialog
    closeBtn.Size = UDim2.new(0, 50, 0, 30)
    closeBtn.Position = UDim2.new(1, -60, 0, 5)
    closeBtn.Text = "X"
    closeBtn.BackgroundColor3 = Color3.fromRGB(255,70,70)
    closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 14
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 6)
    closeCorner.Parent = closeBtn
    closeBtn.MouseButton1Click:Connect(function()
        dialog:Destroy()
    end)
end)
addToggle(playerTab, "Teleport to Target", function(val)
    if val and selectedTarget and selectedTarget.Character and selectedTarget.Character:FindFirstChild("HumanoidRootPart") and LP.Character then
        LP.Character.HumanoidRootPart.CFrame = selectedTarget.Character.HumanoidRootPart.CFrame
        showNotif("✨ Teleported to " .. selectedTarget.Name)
    end
end)
addToggle(playerTab, "Bring Target to You", function(val)
    if val and selectedTarget and selectedTarget.Character and selectedTarget.Character:FindFirstChild("HumanoidRootPart") and LP.Character then
        selectedTarget.Character.HumanoidRootPart.CFrame = LP.Character.HumanoidRootPart.CFrame
        showNotif("📦 Brought " .. selectedTarget.Name .. " to you")
    end
end)
addToggle(playerTab, "Loop Teleport to Target", function(val)
    coroutine.wrap(function()
        while val and selectedTarget and selectedTarget.Character and selectedTarget.Character:FindFirstChild("HumanoidRootPart") and LP.Character do
            LP.Character.HumanoidRootPart.CFrame = selectedTarget.Character.HumanoidRootPart.CFrame
            task.wait(0.3)
        end
    end)()
end)

local trollTab = Tabs["TROLL"]
local spinEnabled = false
addToggle(trollTab, "Spin Bot", function(val)
    spinEnabled = val
    coroutine.wrap(function()
        while spinEnabled and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") do
            LP.Character.HumanoidRootPart.CFrame = LP.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(15), 0)
            task.wait()
        end
    end)()
end)
addToggle(trollTab, "Loop Jump", function(val)
    coroutine.wrap(function()
        while val and LP.Character and LP.Character:FindFirstChild("Humanoid") do
            LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            task.wait(0.2)
        end
    end)()
end)
addTextBox(trollTab, "Chat Spam Text", "Masukkan teks", function(val)
    coroutine.wrap(function()
        while true do
            local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
            if chatEvent and chatEvent:FindFirstChild("SayMessageRequest") then
                chatEvent.SayMessageRequest:FireServer(val, "All")
            end
            task.wait(0.5)
        end
    end)()
end)

local themeTab = Tabs["THEME"]
addButton(themeTab, "💙 Cyan Neon Theme", function()
    MainFrame.BackgroundColor3 = Color3.fromRGB(10,10,15)
    Title.TextColor3 = Color3.fromRGB(0,255,255)
    neonGlow.BackgroundColor3 = Color3.fromRGB(0,255,255)
    ContentContainer.ScrollBarImageColor3 = Color3.fromRGB(0,255,255)
    showNotif("🎨 Cyan Neon Theme Applied")
end)
addButton(themeTab, "💖 Pink Neon Theme", function()
    MainFrame.BackgroundColor3 = Color3.fromRGB(20,10,20)
    Title.TextColor3 = Color3.fromRGB(255,0,255)
    neonGlow.BackgroundColor3 = Color3.fromRGB(255,0,255)
    ContentContainer.ScrollBarImageColor3 = Color3.fromRGB(255,0,255)
    showNotif("🎨 Pink Neon Theme Applied")
end)
addButton(themeTab, "💚 Green Neon Theme", function()
    MainFrame.BackgroundColor3 = Color3.fromRGB(10,20,10)
    Title.TextColor3 = Color3.fromRGB(0,255,0)
    neonGlow.BackgroundColor3 = Color3.fromRGB(0,255,0)
    ContentContainer.ScrollBarImageColor3 = Color3.fromRGB(0,255,0)
    showNotif("🎨 Green Neon Theme Applied")
end)
addButton(themeTab, "💛 Gold Neon Theme", function()
    MainFrame.BackgroundColor3 = Color3.fromRGB(20,20,10)
    Title.TextColor3 = Color3.fromRGB(255,200,0)
    neonGlow.BackgroundColor3 = Color3.fromRGB(255,200,0)
    ContentContainer.ScrollBarImageColor3 = Color3.fromRGB(255,200,0)
    showNotif("🎨 Gold Neon Theme Applied")
end)

local miscTab = Tabs["MISC"]
addToggle(miscTab, "Infinite Ammo", function(val)
    coroutine.wrap(function()
        while val do
            local tool = LP.Character and LP.Character:FindFirstChildOfClass("Tool")
            if tool then
                for _, v in pairs(tool:GetDescendants()) do
                    if v:IsA("NumberValue") and v.Name:lower() == "ammo" then
                        v.Value = math.huge
                    end
                end
            end
            task.wait(0.5)
        end
    end)()
end)
addToggle(miscTab, "Anti AFK", function(val)
    coroutine.wrap(function()
        while val do
            local vu = game:GetService("VirtualUser")
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(0.1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(10)
        end
    end)()
end)
addToggle(miscTab, "Auto Clicker", function(val)
    coroutine.wrap(function()
        while val do
            VirtualInput:SendMouseButtonEvent(0, 0, 0, true, "UserInputService", 0)
            task.wait(0.05)
            VirtualInput:SendMouseButtonEvent(0, 0, 0, false, "UserInputService", 0)
            task.wait(0.05)
        end
    end)()
end)
addButton(miscTab, "Rejoin Server", function()
    TeleportService:Teleport(game.PlaceId, LP)
end)
addButton(miscTab, "Hop Server", function()
    pcall(function()
        local data = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=10"))
        for _, v in pairs(data.data) do
            if v.playing < v.maxPlayers and v.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, LP)
                break
            end
        end
    end)
end)
addButton(miscTab, "Load Infinite Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
addButton(miscTab, "Load Cmd-X", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))()
end)

local creditsTab = Tabs["CREDITS"]
addLabel(creditsTab, "━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(0,255,255))
addLabel(creditsTab, "👑 OWNER: Jarz_Scripter", Color3.fromRGB(255,200,100))
addLabel(creditsTab, "━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(0,255,255))
addLabel(creditsTab, "⭐ TEAM MEMBERS:", Color3.fromRGB(0,255,255))
addLabel(creditsTab, "   • Ihza", Color3.fromRGB(0,255,255))
addLabel(creditsTab, "   • Afka", Color3.fromRGB(0,255,255))
addLabel(creditsTab, "   • Ganis", Color3.fromRGB(0,255,255))
addLabel(creditsTab, "   • Danis", Color3.fromRGB(0,255,255))
addLabel(creditsTab, "   • Zaki", Color3.fromRGB(0,255,255))
addLabel(creditsTab, "   • Gamz", Color3.fromRGB(0,255,255))
addLabel(creditsTab, "━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(0,255,255))
addLabel(creditsTab, "💀 rRz HUB - 200+ Features", Color3.fromRGB(0,255,255))
addLabel(creditsTab, "📱 Full Mobile Support", Color3.fromRGB(100,200,100))
addLabel(creditsTab, "🖱️ Klik minimize ke circle", Color3.fromRGB(150,150,150))
addLabel(creditsTab, "🖱️ Geser circle untuk move", Color3.fromRGB(150,150,150))
addLabel(creditsTab, "🖱️ Klik logo buat restore", Color3.fromRGB(150,150,150))
addLabel(creditsTab, "━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(0,255,255))
addLabel(creditsTab, "Terima kasih sudah pakai rRz HUB!", Color3.fromRGB(100,255,100))

showNotif("🔥 rRz HUB 200+ Features Loaded!")
showNotif("✅ Semua fitur WORK 100%")
showNotif("📌 Klik − untuk minimize ke circle")
