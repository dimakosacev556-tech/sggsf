-- =========================================================================
-- MULTIHUB URAN V4 — PREMIUM DESIGNER EDITION (PREMIUM UI/UX FOR ROBLOX)
-- =========================================================================
if not game:IsLoaded() then 
    game.Loaded:Wait() 
end

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 15)
local Camera = workspace.CurrentCamera

if not PlayerGui then return end

-- Очистка старых копий
if PlayerGui:FindFirstChild("UranHub") then PlayerGui.UranHub:Destroy() end
if PlayerGui:FindFirstChild("UranBootTerminal") then PlayerGui.UranBootTerminal:Destroy() end

local HasDrawing = (typeof(Drawing) == "table" or typeof(Drawing) == "userdata") and Drawing.new ~= nil

local SG = Instance.new("ScreenGui")
SG.Name = "UranHub"
SG.ResetOnSpawn = false
SG.Parent = PlayerGui

-- =========================================================================
-- DESIGNER SYSTEM BOOTSTRAP (MODERN MINIMALIST TERMINAL)
-- =========================================================================
local BootGui = Instance.new("ScreenGui")
BootGui.Name = "UranBootTerminal"
BootGui.ResetOnSpawn = false
BootGui.Parent = PlayerGui

local CMDWindow = Instance.new("Frame")
CMDWindow.Name = "CMDWindow"
CMDWindow.Size = UDim2.new(0, 480, 0, 280)
CMDWindow.Position = UDim2.new(0.5, -240, 0.5, -140)
CMDWindow.BackgroundColor3 = Color3.fromRGB(11, 11, 14)
CMDWindow.BorderSizePixel = 0
CMDWindow.ClipsDescendants = true
CMDWindow.Parent = BootGui

local BootCorner = Instance.new("UICorner")
BootCorner.CornerRadius = UDim.new(0, 12)
BootCorner.Parent = CMDWindow

-- Тонкая неоновая обводка
local BootStroke = Instance.new("UIStroke")
BootStroke.Color = Color3.fromRGB(0, 255, 163)
BootStroke.Transparency = 0.8
BootStroke.Thickness = 1
BootStroke.Parent = CMDWindow

local CMDHeader = Instance.new("Frame")
CMDHeader.Name = "CMDHeader"
CMDHeader.Size = UDim2.new(1, 0, 0, 36)
CMDHeader.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
CMDHeader.BorderSizePixel = 0
CMDHeader.Parent = CMDWindow

local CMDTitle = Instance.new("TextLabel")
CMDTitle.Size = UDim2.new(1, -20, 1, 0)
CMDTitle.Position = UDim2.new(0, 16, 0, 0)
CMDTitle.Text = "URAN V6 // by : giantt_"
CMDTitle.TextColor3 = Color3.fromRGB(140, 140, 150)
CMDTitle.TextSize = 10
CMDTitle.Font = Enum.Font.Code
CMDTitle.TextXAlignment = Enum.TextXAlignment.Left
CMDTitle.BackgroundTransparency = 1
CMDTitle.Parent = CMDHeader

local TextContainer = Instance.new("ScrollingFrame")
TextContainer.Name = "TextContainer"
TextContainer.Size = UDim2.new(1, -32, 1, -52)
TextContainer.Position = UDim2.new(0, 16, 0, 44)
TextContainer.BackgroundTransparency = 1
TextContainer.BorderSizePixel = 0
TextContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
TextContainer.ScrollBarThickness = 2
TextContainer.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 163)
TextContainer.Parent = CMDWindow

local UIList = Instance.new("UIListLayout")
UIList.Padding = UDim.new(0, 4)
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Parent = TextContainer

local lineIndex = 0
local function AddCMDLog(text, color, delayTime)
    lineIndex = lineIndex + 1
    local LogLabel = Instance.new("TextLabel")
    LogLabel.Size = UDim2.new(1, 0, 0, 16)
    LogLabel.BackgroundTransparency = 1
    LogLabel.Text = text
    LogLabel.TextColor3 = color or Color3.fromRGB(180, 180, 190)
    LogLabel.TextSize = 11
    LogLabel.Font = Enum.Font.Code
    LogLabel.TextXAlignment = Enum.TextXAlignment.Left
    LogLabel.LayoutOrder = lineIndex
    LogLabel.Parent = TextContainer
    
    TextContainer.CanvasSize = UDim2.new(0, 0, 0, UIList.AbsoluteContentSize.Y + 16)
    TweenService:Create(TextContainer, TweenInfo.new(0.2), {CanvasPosition = Vector2.new(0, TextContainer.CanvasSize.Y.Offset)}):Play()
    
    task.wait(delayTime)
end

-- =========================================================================
-- MAIN WINDOW (PREMIUM GLASSMORPHISM DESIGN)
-- =========================================================================
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 580, 0, 400)
Main.Position = UDim2.new(0.5, -290, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(11, 11, 14)
Main.BackgroundTransparency = 0.15
Main.BorderSizePixel = 0
Main.Active = true
Main.Visible = false 
Main.Parent = SG

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 255, 163)
MainStroke.Transparency = 0.85
MainStroke.Thickness = 1
MainStroke.Parent = Main

-- Элегантный фоновый градиент (Свечение сверху вниз)
local GradFrame = Instance.new("Frame")
GradFrame.Size = UDim2.new(1, 0, 1, 0)
GradFrame.BackgroundTransparency = 0
GradFrame.BorderSizePixel = 0
GradFrame.ZIndex = 0
GradFrame.Parent = Main
Instance.new("UICorner", GradFrame).CornerRadius = UDim.new(0, 14)

local Grad = Instance.new("UIGradient")
Grad.Rotation = -90 
Grad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 163)),   
    ColorSequenceKeypoint.new(0.15, Color3.fromRGB(11, 11, 14)),  
    ColorSequenceKeypoint.new(1, Color3.fromRGB(11, 11, 14))     
})
Grad.Parent = GradFrame

-- Асинхронный поток симуляции загрузки
task.spawn(function()
    AddCMDLog("Initializing Uran Core Engine V4...", Color3.fromRGB(140, 140, 150), 0.1)
    if not HasDrawing then
        AddCMDLog("[⚠️] Drawing API missing. HUD-Effects restricted.", Color3.fromRGB(255, 107, 107), 0.1)
    else
        AddCMDLog("[✓] Drawing API Matrix successfully linked.", Color3.fromRGB(0, 255, 163), 0.05)
    end
    AddCMDLog("Connecting securely to server pipeline...", Color3.fromRGB(140, 140, 150), 0.15)
    AddCMDLog("Injecting memory hooks & silent assets...", Color3.fromRGB(0, 255, 163), 0.1)
    AddCMDLog("UI Elements compiled successfully.", Color3.fromRGB(255, 215, 0), 0.05)
    
    TweenService:Create(CMDWindow, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Size = UDim2.new(0,0,0,280), Transparency = 1}):Play()
    task.wait(0.4)
    BootGui:Destroy()
    
    if Main then
        Main.Visible = true
        Main.Size = UDim2.new(0, 520, 0, 360) -- Плавный Scale-In эффект при открытии
        TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 580, 0, 400)}):Play()
    end
end)

-- =========================================================================
-- COSMETIC HUD: AMBIENT ISOTOPES BACKGROUND
-- =========================================================================
local ChemicalContainer = Instance.new("Frame")
ChemicalContainer.Size = UDim2.new(1, 0, 1, 0)
ChemicalContainer.BackgroundTransparency = 1
ChemicalContainer.ClipsDescendants = true 
ChemicalContainer.ZIndex = 1 
ChemicalContainer.Parent = Main

local ChemicalElements = {"U", "92", "☢", "UO₂", "²³⁵U", "•"}

local function SpawnUraniumIsotope()
    if not Main.Visible then return end 
    
    local IsotopeLabel = Instance.new("TextLabel")
    IsotopeLabel.BackgroundTransparency = 1
    IsotopeLabel.TextColor3 = Color3.fromRGB(0, 255, 163) 
    IsotopeLabel.TextSize = math.random(10, 14) 
    IsotopeLabel.Font = Enum.Font.GothamBold
    IsotopeLabel.ZIndex = 1
    IsotopeLabel.Text = ChemicalElements[math.random(1, #ChemicalElements)]
    IsotopeLabel.TextTransparency = 0.85
    IsotopeLabel.Parent = ChemicalContainer

    local startX = math.random(5, 95) / 100
    IsotopeLabel.Position = UDim2.new(startX, 0, 1.1, 0)

    local tweenInfo = TweenInfo.new(math.random(6, 9), Enum.EasingStyle.Linear)
    local tween = TweenService:Create(IsotopeLabel, tweenInfo, {
        Position = UDim2.new(startX + (math.random(-8, 8) / 100), 0, -0.1, 0),
        TextTransparency = 1
    })
    tween:Play()
    tween.Completed:Connect(function() IsotopeLabel:Destroy() end)
end

task.spawn(function()
    while true do
        task.wait(0.4)
        if Main.Visible then pcall(SpawnUraniumIsotope) end
    end
end)

-- =========================================================================
-- HEADER (HEADER COMPONENT)
-- =========================================================================
local TitleFrame = Instance.new("Frame")
TitleFrame.Size = UDim2.new(1, -32, 0, 60)
TitleFrame.Position = UDim2.new(0, 16, 0, 0)
TitleFrame.BackgroundTransparency = 1
TitleFrame.ZIndex = 2
TitleFrame.Parent = Main

local ChemIcon = Instance.new("TextLabel")
ChemIcon.Size = UDim2.new(0, 32, 0, 32)
ChemIcon.Position = UDim2.new(0, 0, 0.5, -16)
ChemIcon.BackgroundColor3 = Color3.fromRGB(19, 19, 26)
ChemIcon.Text = "⁹²U"
ChemIcon.TextColor3 = Color3.fromRGB(0, 255, 163)
ChemIcon.TextSize = 12
ChemIcon.Font = Enum.Font.Code
ChemIcon.ZIndex = 2
ChemIcon.Parent = TitleFrame
Instance.new("UICorner", ChemIcon).CornerRadius = UDim.new(0, 6)
local IconStroke = Instance.new("UIStroke")
IconStroke.Color = Color3.fromRGB(0, 255, 163)
IconStroke.Transparency = 0.7
IconStroke.Parent = ChemIcon

local Title1 = Instance.new("TextLabel")
Title1.Size = UDim2.new(0, 200, 1, 0)
Title1.Position = UDim2.new(0, 44, 0, 0)
Title1.Text = "URAN <font color='rgb(0, 255, 163)'>V6</font>"
Title1.RichText = true
Title1.TextColor3 = Color3.fromRGB(255, 255, 255)
Title1.TextSize = 16
Title1.Font = Enum.Font.GothamBold
Title1.TextXAlignment = Enum.TextXAlignment.Left
Title1.BackgroundTransparency = 1
Title1.ZIndex = 2
Title1.Parent = TitleFrame

local Title2 = Instance.new("TextLabel")
Title2.Size = UDim2.new(0, 250, 1, 0)
Title2.Position = UDim2.new(1, -250, 0, 0)
Title2.Text = "Fetching active realm..."
Title2.TextColor3 = Color3.fromRGB(110, 110, 120)
Title2.TextSize = 12
Title2.Font = Enum.Font.Gotham
Title2.TextXAlignment = Enum.TextXAlignment.Right
Title2.BackgroundTransparency = 1
Title2.ZIndex = 2
Title2.Parent = TitleFrame

task.spawn(function()
    local success, info = pcall(function() return MarketplaceService:GetProductInfo(game.PlaceId) end)
    if success and info then
        Title2.Text = string.upper(info.Name)
    else
        Title2.Text = "UNKNOWN REALM"
    end
end)

-- =========================================================================
-- NAVIGATION PANEL (SIDEBAR) & CONTENT CONTAINER
-- =========================================================================
local Tabs = Instance.new("Frame")
Tabs.Name = "Tabs"
Tabs.Size = UDim2.new(0, 150, 1, -84)
Tabs.Position = UDim2.new(0, 16, 0, 68)
Tabs.BackgroundTransparency = 1
Tabs.ZIndex = 2
Tabs.Parent = Main

local TL = Instance.new("UIListLayout", Tabs)
TL.Padding = UDim.new(0, 6)

local Cont = Instance.new("Frame")
Cont.Name = "Cont"
Cont.Size = UDim2.new(1, -198, 1, -84)
Cont.Position = UDim2.new(0, 182, 0, 68)
Cont.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Cont.BackgroundTransparency = 0.2
Cont.BorderSizePixel = 0
Cont.ZIndex = 2
Cont.Parent = Main
Instance.new("UICorner", Cont).CornerRadius = UDim.new(0, 10)

local ContStroke = Instance.new("UIStroke")
ContStroke.Color = Color3.fromRGB(255,255,255)
ContStroke.Transparency = 0.96
ContStroke.Parent = Cont

local TabPool = {}
local BtnPool = {}
local ActiveCont = nil

function CreateTab(name)
    local B = Instance.new("TextButton")
    B.Size = UDim2.new(1, 0, 0, 36)
    B.BackgroundColor3 = Color3.fromRGB(19, 19, 26)
    B.BackgroundTransparency = 0.4
    B.Text = "   " .. name
    B.TextColor3 = Color3.fromRGB(130, 130, 140)
    B.TextSize = 13
    B.Font = Enum.Font.GothamSemibold
    B.TextXAlignment = Enum.TextXAlignment.Left
    B.ZIndex = 3
    B.Parent = Tabs
    Instance.new("UICorner", B).CornerRadius = UDim.new(0, 8)
    
    local BStroke = Instance.new("UIStroke")
    BStroke.Color = Color3.fromRGB(255,255,255)
    BStroke.Transparency = 0.97
    BStroke.Parent = B

    local SF = Instance.new("ScrollingFrame")
    SF.Size = UDim2.new(1, -24, 1, -24)
    SF.Position = UDim2.new(0, 12, 0, 12)
    SF.BackgroundTransparency = 1
    SF.BorderSizePixel = 0
    SF.ScrollBarThickness = 2
    SF.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 163)
    SF.Visible = false
    SF.ZIndex = 3
    SF.Parent = Cont

    local L = Instance.new("UIListLayout")
    L.Padding = UDim.new(0, 6)
    L.SortOrder = Enum.SortOrder.LayoutOrder
    L.Parent = SF

    -- Дизайнерские отступы внутри контента
    local UIPadding = Instance.new("UIPadding")
    UIPadding.PaddingTop = UDim.new(0, 2)
    UIPadding.PaddingLeft = UDim.new(0, 2)
    UIPadding.Parent = SF

    L:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        SF.CanvasSize = UDim2.new(0, 0, 0, L.AbsoluteContentSize.Y + 10)
    end)

    TabPool[name] = SF
    BtnPool[name] = {Btn = B, Stroke = BStroke}

    -- Плавные Hover/Click эффекты интерфейса
    B.MouseEnter:Connect(function()
        if ActiveCont ~= SF then
            TweenService:Create(B, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(200, 200, 210), BackgroundTransparency = 0.2}):Play()
        end
    end)
    B.MouseLeave:Connect(function()
        if ActiveCont ~= SF then
            TweenService:Create(B, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(130, 130, 140), BackgroundTransparency = 0.4}):Play()
        end
    end)

    B.MouseButton1Click:Connect(function()
        if ActiveCont then ActiveCont.Visible = false end
        for n, d in pairs(BtnPool) do
            TweenService:Create(d.Btn, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(19, 19, 26), BackgroundTransparency = 0.4, TextColor3 = Color3.fromRGB(130, 130, 140)}):Play()
            d.Stroke.Color = Color3.fromRGB(255,255,255)
            d.Stroke.Transparency = 0.97
        end
        TweenService:Create(B, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(0, 255, 163), BackgroundTransparency = 0, TextColor3 = Color3.fromRGB(11, 11, 14)}):Play()
        BStroke.Color = Color3.fromRGB(0, 255, 163)
        BStroke.Transparency = 0.6
        SF.Visible = true
        ActiveCont = SF
    end)
end

-- =========================================================================
-- CONTROLS MODULE (MODERN UI TOGGLES)
-- =========================================================================
function AddToggle(tab, name, callback)
    local target = TabPool[tab]
    if not target then return end
    local Enabled = false

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -6, 0, 44)
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 27)
    Frame.BackgroundTransparency = 0.3
    Frame.Parent = target
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)

    local FStroke = Instance.new("UIStroke")
    FStroke.Color = Color3.fromRGB(255,255,255)
    FStroke.Transparency = 0.96
    FStroke.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -60, 1, 0)
    Label.Position = UDim2.new(0, 14, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(210, 210, 215)
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamSemibold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.ZIndex = 4
    Label.Parent = Frame

    -- Красивый современный свитч (дизайнерская кнопка-переключатель)
    local SwitchBox = Instance.new("TextButton")
    SwitchBox.Size = UDim2.new(0, 36, 0, 20)
    SwitchBox.Position = UDim2.new(1, -50, 0.5, -10)
    SwitchBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    SwitchBox.Text = ""
    SwitchBox.ZIndex = 4
    SwitchBox.Parent = Frame
    Instance.new("UICorner", SwitchBox).CornerRadius = UDim.new(1, 0)

    local Circle = Instance.new("Frame")
    Circle.Size = UDim2.new(0, 14, 0, 14)
    Circle.Position = UDim2.new(0, 3, 0.5, -7)
    Circle.BackgroundColor3 = Color3.fromRGB(150, 150, 160)
    Circle.ZIndex = 5
    Circle.Parent = SwitchBox
    Instance.new("UICorner", Circle).CornerRadius = UDim.new(1, 0)

    SwitchBox.MouseButton1Click:Connect(function()
        Enabled = not Enabled
        if Enabled then
            TweenService:Create(SwitchBox, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(0, 255, 163)}):Play()
            TweenService:Create(Circle, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {Position = UDim2.new(1, -17, 0.5, -7), BackgroundColor3 = Color3.fromRGB(11, 11, 14)}):Play()
            TweenService:Create(Frame, TweenInfo.new(0.25), {BackgroundTransparency = 0}):Play()
            FStroke.Color = Color3.fromRGB(0, 255, 163)
            FStroke.Transparency = 0.8
        else
            TweenService:Create(SwitchBox, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(35, 35, 45)}):Play()
            TweenService:Create(Circle, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {Position = UDim2.new(0, 3, 0.5, -7), BackgroundColor3 = Color3.fromRGB(150, 150, 160)}):Play()
            TweenService:Create(Frame, TweenInfo.new(0.25), {BackgroundTransparency = 0.3}):Play()
            FStroke.Color = Color3.fromRGB(255,255,255)
            FStroke.Transparency = 0.96
        end
        pcall(callback, Enabled)
    end)
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.F8 then
        if Main then Main.Visible = not Main.Visible end
    end
end)

-- =========================================================================
-- REGISTRATION & GENERATION (INITIALIZATION)
-- =========================================================================
CreateTab("Главное")
CreateTab("MM 2")
CreateTab("Doors")

-- Активация первой вкладки по умолчанию
local DefaultTab = "Главное"
BtnPool[DefaultTab].Btn.BackgroundColor3 = Color3.fromRGB(0, 255, 163)
BtnPool[DefaultTab].Btn.BackgroundTransparency = 0
BtnPool[DefaultTab].Btn.TextColor3 = Color3.fromRGB(11, 11, 14)
BtnPool[DefaultTab].Stroke.Color = Color3.fromRGB(0, 255, 163)
BtnPool[DefaultTab].Stroke.Transparency = 0.6
TabPool[DefaultTab].Visible = true
ActiveCont = TabPool[DefaultTab]

-- =========================================================================
-- ADVANCED AIMBOT MODULE WITH FIXED CENTER FOV & SMOOTHING MODES
-- =========================================================================
-- 1. НАСТРОЙКИ АИМБОТА
local AimConfig = {
    Enabled = false,       -- Включен ли Аимбот
    Instant = false,       -- false = плавно, true = за 1 кадр
    Radius = 120,          -- Радиус круга FOV в центре экрана
    Smoothness = 0.15,     -- Скорость плавной наводки
    AimKey = Enum.UserInputType.MouseButton2 -- Зажатая ПКМ
}

-- 2. СОЗДАНИЕ СТАТИЧНОГО КРУГА FOV В ЦЕНТРЕ ЭКРАНА
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1.5
FOVCircle.Color = Color3.fromRGB(0, 255, 163) -- Наш неоновый зеленый
FOVCircle.Filled = false
FOVCircle.Transparency = 0.8
FOVCircle.Visible = false

-- 3. ПОИСК БЛИЖАЙШЕЙ ГОЛОВЫ ВНУТРИ КРУГА В ЦЕНТРЕ ЭКРАНА
local function GetClosestHeadInCenterFOV()
    local closestTarget = nil
    local shortestDistance = AimConfig.Radius
    -- Получаем точные координаты центра экрана
    local screenSize = Camera.ViewportSize
    local centerScreen = Vector2.new(screenSize.X / 2, screenSize.Y / 2)

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local character = player.Character
            local head = character:FindFirstChild("Head")
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if head and humanoid and humanoid.Health > 0 then
                -- Переводим 3D позицию головы на 2D экран
                local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    -- Считаем расстояние от головы строго до ЦЕНТРА ЭКРАНА
                    local distance = (Vector2.new(screenPos.X, screenPos.Y) - centerScreen).Magnitude
                    -- Проверяем, находится ли цель внутри круга и ближе ли она остальных к центру
                    if distance < shortestDistance then
                        shortestDistance = distance
                        closestTarget = head
                    end
                end
            end
        end
    end
    return closestTarget
end

-- 4. ОСНОВНОЙ СИСТЕМНЫЙ ЦИКЛ ОБРАБОТКИ НАВОДКИ
RunService.RenderStepped:Connect(function()
    -- Фиксируем круг ровно по центру экрана каждый кадр
    local screenSize = Camera.ViewportSize
    local centerScreen = Vector2.new(screenSize.X / 2, screenSize.Y / 2)
    
    FOVCircle.Position = centerScreen
    FOVCircle.Radius = AimConfig.Radius
    FOVCircle.Visible = AimConfig.Enabled

    -- Если аимбот включен и зажата ПКМ
    if AimConfig.Enabled and UserInputService:IsMouseButtonPressed(AimConfig.AimKey) then
        local targetHead = GetClosestHeadInCenterFOV()
        if targetHead then
            if AimConfig.Instant then
                -- РЕЖИМ ЗА 1 КАДР: Моментальное жесткое наведение
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetHead.Position)
            else
                -- ЛЕГИТНЫЙ РЕЖИМ: Плавный перенос камеры к цели
                local targetCFrame = CFrame.new(Camera.CFrame.Position, targetHead.Position)
                Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, AimConfig.Smoothness)
            end
        end
    end
end)

-- =========================================================================
-- ПРИВЯЗКА К ТУМБЛЕРАМ В ВАШЕМ МЕНЮ
-- =========================================================================
-- Главный тумблер включения Аимбота
AddToggle("Главное", "AimBot", function(state)
    AimConfig.Enabled = state
end)

-- Под-тумблер настройки скорости (выключен = плавно, включен = за 1 кадр)
AddToggle("Главное", "Rage Aim (for AimBot)", function(state)
    AimConfig.Instant = state
end)

-- =========================================================================
-- PREMIUM MODULES SYSTEM (CLEAN CODE // INJECT ONLY VERSION)
-- =========================================================================
-- ГЛОБАЛЬНЫЕ НАСТРОЙКИ МОДУЛЕЙ
local ESP_ENABLED = false

-- КОНФИГУРАЦИЯ СУСТАВОВ ДЛЯ СКЕЛЕТА
local SkeletonPairs = {
    {"Head", "UpperTorso"}, {"UpperTorso", "LowerTorso"},
    {"UpperTorso", "LeftUpperArm"}, {"LeftUpperArm", "LeftLowerArm"}, {"LeftLowerArm", "LeftHand"},
    {"UpperTorso", "RightUpperArm"}, {"RightUpperArm", "RightLowerArm"}, {"RightLowerArm", "RightHand"},
    {"LowerTorso", "LeftUpperLeg"}, {"LeftUpperLeg", "LeftLowerLeg"}, {"LeftLowerLeg", "LeftFoot"},
    {"LowerTorso", "RightUpperLeg"}, {"RightUpperLeg", "RightLowerLeg"}, {"RightLowerLeg", "RightFoot"}
}
local Cache = {}

-- Создание графических элементов (Drawing)
local function CreateESPObjects()
    local objects = {
        Box = Drawing.new("Square"),
        HealthBar = Drawing.new("Line"),
        Text = Drawing.new("Text"),
        SnapLine = Drawing.new("Line"),
        Bones = {}
    }
    -- Белые рамки вокруг игроков
    objects.Box.Color = Color3.fromRGB(255, 255, 255)
    objects.Box.Thickness = 1
    objects.Box.Filled = false
    -- Линия ХП справа
    objects.HealthBar.Color = Color3.fromRGB(0, 255, 100)
    objects.HealthBar.Thickness = 2
    -- Текст никнейма и дистанции
    objects.Text.Color = Color3.fromRGB(255, 255, 255)
    objects.Text.Size = 13
    objects.Text.Center = true
    objects.Text.Outline = true
    objects.Text.OutlineColor = Color3.fromRGB(0, 0, 0)
    objects.SnapLine.Thickness = 1.5

    for i = 1, #SkeletonPairs do
        local boneLine = Drawing.new("Line")
        boneLine.Color = Color3.fromRGB(230, 230, 230)
        boneLine.Thickness = 1
        table.insert(objects.Bones, boneLine)
    end
    return objects
end

local function SetESPVisibility(obs, state)
    obs.Box.Visible = state
    obs.HealthBar.Visible = state
    obs.Text.Visible = state
    obs.SnapLine.Visible = state
    for _, bone in ipairs(obs.Bones) do
        bone.Visible = state
    end
end

local function RemoveESP(player)
    if Cache[player] then
        local obs = Cache[player]
        obs.Box:Remove()
        obs.HealthBar:Remove()
        obs.Text:Remove()
        obs.SnapLine:Remove()
        for _, bone in ipairs(obs.Bones) do
            bone:Remove()
        end
        Cache[player] = nil
    end
end

-- ГЛАВНЫЙ ПОТОК ОБНОВЛЕНИЯ КАДРОВ (ESP + AIMBOT UPDATE)
RunService.RenderStepped:Connect(function()
    local screenSize = Camera.ViewportSize
    local centerScreen = Vector2.new(screenSize.X / 2, screenSize.Y / 2)
    
    -- Фиксация круга Аима в центре (обновление позиции при ресайзе окна)
    FOVCircle.Position = centerScreen
    FOVCircle.Radius = AimConfig.Radius
    FOVCircle.Visible = AimConfig.Enabled

    -- Логика работы Аимбота при зажатом ПКМ (дублируется здесь для надежности цикла)
    if AimConfig.Enabled and UserInputService:IsMouseButtonPressed(AimConfig.AimKey) then
        local targetHead = GetClosestHeadInCenterFOV()
        if targetHead then
            if AimConfig.Instant then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetHead.Position)
            else
                local targetCFrame = CFrame.new(Camera.CFrame.Position, targetHead.Position)
                Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, AimConfig.Smoothness)
            end
        end
    end

    -- Радужный цвет для SnapLines
    local hue = (tick() % 4) / 4
    local RainbowColor = Color3.fromHSV(hue, 1, 1)

    -- Цикл рендеринга ESP
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            if not Cache[player] then
                Cache[player] = CreateESPObjects()
            end
            local obs = Cache[player]
            local char = player.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local root = char and char:FindFirstChild("HumanoidRootPart")

            if ESP_ENABLED and char and hum and root and hum.Health > 0 then
                local rootPos, onScreen = Camera:WorldToViewportPoint(root.Position)
                if onScreen then
                    local scale = 1 / (rootPos.Z * math.tan(math.rad(Camera.FieldOfView / 2))) * 1000
                    local width, height = scale * 0.50, scale * 0.68
                    local boxX = rootPos.X - (width / 2)
                    local boxY = rootPos.Y - (height / 2) + (scale * 0.05)

                    -- Отображение белой рамки вокруг игрока
                    obs.Box.Size = Vector2.new(width, height)
                    obs.Box.Position = Vector2.new(boxX, boxY)

                    -- Зеленая полоска здоровья справа
                    local healthPercent = hum.Health / hum.MaxHealth
                    local barHeight = height * healthPercent
                    obs.HealthBar.From = Vector2.new(boxX + width + 4, boxY + height)
                    obs.HealthBar.To = Vector2.new(boxX + width + 4, boxY + height - barHeight)

                    -- Текст сверху (Ник + Дистанция)
                    local distance = math.floor(rootPos.Z)
                    obs.Text.Text = string.format("%s [%d m]", player.Name, distance)
                    obs.Text.Position = Vector2.new(rootPos.X, boxY - 16)

                    -- Разноцветные линии от низа экрана
                    obs.SnapLine.From = Vector2.new(screenSize.X / 2, screenSize.Y)
                    obs.SnapLine.To = Vector2.new(rootPos.X, boxY + height)
                    obs.SnapLine.Color = RainbowColor

                    -- Отрисовка скелета
                    for i, pair in ipairs(SkeletonPairs) do
                        local partA = char:FindFirstChild(pair[1])
                        local partB = char:FindFirstChild(pair[2])
                        local line = obs.Bones[i]
                        if partA and partB and line then
                            local posA, onScreenA = Camera:WorldToViewportPoint(partA.Position)
                            local posB, onScreenB = Camera:WorldToViewportPoint(partB.Position)
                            if onScreenA and onScreenB then
                                line.From = Vector2.new(posA.X, posA.Y)
                                line.To = Vector2.new(posB.X, posB.Y)
                                line.Visible = true
                            else
                                line.Visible = false
                            end
                        elseif line then
                            line.Visible = false
                        end
                    end
                    SetESPVisibility(obs, true)
                else
                    SetESPVisibility(obs, false)
                end
            else
                SetESPVisibility(obs, false)
            end
        end
    end
end)

Players.PlayerRemoving:Connect(RemoveESP)

-- =========================================================================
-- АКТИВАЦИЯ ТУМБЛЕРА ESP ДЛЯ В КЛАДКИ ГЛАВНОЕ
-- =========================================================================
AddToggle("Главное", "ESP", function(state)
    ESP_ENABLED = state
    -- Если тумблер выключают, принудительно убираем все элементы с экрана сразу
    if not state then
        for _, obs in pairs(Cache) do
            if obs.Box then obs.Box.Visible = false end
            if obs.HealthBar then obs.HealthBar.Visible = false end
            if obs.Text then obs.Text.Visible = false end
            if obs.SnapLine then obs.SnapLine.Visible = false end
            if obs.Bones then
                for _, bone in ipairs(obs.Bones) do
                    bone.Visible = false
                end
            end
        end
    end
end)

-- =========================================================================
-- NOCLIP MODULE (ПРОХОД СКВОЗЬ СТЕНЫ)
-- =========================================================================
local NoclipEnabled = false

-- Системный цикл, отключающий коллизию персонажа перед обработкой физики игры
RunService.Stepped:Connect(function()
    if NoclipEnabled and LocalPlayer.Character then
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end)

-- Создание тумблера в меню во вкладке "Главное"
AddToggle("Главное", "Noclip (Сквозь стены)", function(state)
    NoclipEnabled = state
end)

-- =========================================================================
-- PREMIUM FLY MODULE (УПРАВЛЕНИЕ КАМЕРОЙ)
-- =========================================================================
local FlyEnabled = false
local FlySpeed = 50 -- Скорость полета по умолчанию
local ControlAxes = {W = 0, S = 0, A = 0, D = 0, Space = 0, Shift = 0}

-- Отслеживание нажатий клавиш для направления полета
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    local key = input.KeyCode
    if key == Enum.KeyCode.W then ControlAxes.W = 1
    elseif key == Enum.KeyCode.S then ControlAxes.S = -1
    elseif key == Enum.KeyCode.A then ControlAxes.A = -1
    elseif key == Enum.KeyCode.D then ControlAxes.D = 1
    elseif key == Enum.KeyCode.Space then ControlAxes.Space = 1
    elseif key == Enum.KeyCode.LeftShift then ControlAxes.Shift = -1
    end
end)

UserInputService.InputEnded:Connect(function(input)
    local key = input.KeyCode
    if key == Enum.KeyCode.W then ControlAxes.W = 0
    elseif key == Enum.KeyCode.S then ControlAxes.S = 0
    elseif key == Enum.KeyCode.A then ControlAxes.A = 0
    elseif key == Enum.KeyCode.D then ControlAxes.D = 0
    elseif key == Enum.KeyCode.Space then ControlAxes.Space = 0
    elseif key == Enum.KeyCode.LeftShift then ControlAxes.Shift = 0
    end
end)

-- Основной цикл обработки полета
RunService.RenderStepped:Connect(function(deltaTime)
    if not FlyEnabled then return end
    local character = LocalPlayer.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    
    if root and humanoid then
        -- Отключаем стандартные падения и анимации ходьбы во время полета
        humanoid:ChangeState(Enum.HumanoidStateType.Flying)
        
        -- Считаем вектор направления на основе взгляда камеры
        local camCFrame = Camera.CFrame
        local moveDirection = Vector3.new(0, 0, 0)
        
        -- Вперед / Назад
        moveDirection = moveDirection + (camCFrame.LookVector * (ControlAxes.W + ControlAxes.S))
        -- Влево / Вправо
        moveDirection = moveDirection + (camCFrame.RightVector * (ControlAxes.A + ControlAxes.D))
        -- Вверх / Вниз (Пробел и Shift)
        moveDirection = moveDirection + (Vector3.new(0, 1, 0) * (ControlAxes.Space + ControlAxes.Shift))
        
        -- Если кнопки направления нажаты — двигаем, иначе — удерживаем персонажа на месте в воздухе
        if moveDirection.Magnitude > 0 then
            root.Velocity = moveDirection.Unit * FlySpeed
        else
            root.Velocity = Vector3.new(0, 0, 0)
        end
    end
end)

-- Создание тумблера во вкладке "Главное"
AddToggle("Главное", "Fly (Полет)", function(state)
    FlyEnabled = state
    -- Возвращаем физику в дефолтное состояние при отключении
    if not state and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
        if root then
            root.Velocity = Vector3.new(0, 0, 0)
        end
    end
end)

-- =========================================================================
-- INFINITE JUMP MODULE (БЕСКОНЕЧНЫЙ ПРЫЖОК)
-- =========================================================================
local InfJumpEnabled = false

-- Перехват каждого нажатия кнопки прыжка
UserInputService.JumpRequest:Connect(function()
    if InfJumpEnabled then
        local character = LocalPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        -- Если персонаж существует и жив, заставляем его прыгнуть в воздухе
        if humanoid and humanoid.Health > 0 then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- Создание тумблера во вкладке "Главное"
AddToggle("Главное", "Бесконечный прыжок", function(state)
    InfJumpEnabled = state
end)

-- =========================================================================
-- NIGHT VISION MODULE (FULLBRIGHT ДЛЯ ВКЛАДКИ ГЛАВНОЕ)
-- =========================================================================
local NightVisionEnabled = false

-- Сохраняем дефолтные настройки игры, чтобы вернуть их при выключении
local DefaultLighting = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd,
    GlobalShadows = Lighting.GlobalShadows,
    Ambient = Lighting.Ambient
}

-- Поток постоянного поддержания освещения (некоторые игры сбрасывают его сами)
task.spawn(function()
    while true do
        if NightVisionEnabled then
            Lighting.Brightness = 4
            Lighting.ClockTime = 12
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = false
            Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        end
        task.wait(0.5) -- Проверка и обновление каждые полсекунды
    end
end)

-- Создание тумблера во вкладке "Главное"
AddToggle("Главное", "Ночное виденье", function(state)
    NightVisionEnabled = state
    if not state then
        -- Возвращаем стандартные настройки графики и освещения игры
        Lighting.Brightness = DefaultLighting.Brightness
        Lighting.ClockTime = DefaultLighting.ClockTime
        Lighting.FogEnd = DefaultLighting.FogEnd
        Lighting.GlobalShadows = DefaultLighting.GlobalShadows
        Lighting.Ambient = DefaultLighting.Ambient
    end
end)

-- =========================================================================
-- CONTROLS MODULE: PREMIUM SLIDER ELEMENT
-- =========================================================================
-- Новая функция создания слайдера, полностью подходящая под ваш дизайн
function AddSlider(tab, name, min, max, default, callback)
    local target = TabPool[tab]
    if not target then return end

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -6, 0, 50)
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 27)
    Frame.BackgroundTransparency = 0.3
    Frame.Parent = target
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)

    local FStroke = Instance.new("UIStroke")
    FStroke.Color = Color3.fromRGB(255, 255, 255)
    FStroke.Transparency = 0.96
    FStroke.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -100, 0, 20)
    Label.Position = UDim2.new(0, 14, 0, 6)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(210, 210, 215)
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamSemibold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.ZIndex = 4
    Label.Parent = Frame

    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0, 60, 0, 20)
    ValueLabel.Position = UDim2.new(1, -74, 0, 6)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = tostring(default)
    ValueLabel.TextColor3 = Color3.fromRGB(0, 255, 163)
    ValueLabel.TextSize = 13
    ValueLabel.Font = Enum.Font.Code
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValueLabel.ZIndex = 4
    ValueLabel.Parent = Frame

    -- Полоса слайдера (Бэкграунд)
    local SliderButton = Instance.new("TextButton")
    SliderButton.Size = UDim2.new(1, -28, 0, 6)
    SliderButton.Position = UDim2.new(0, 14, 0, 34)
    SliderButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    SliderButton.Text = ""
    SliderButton.ZIndex = 4
    SliderButton.Parent = Frame
    Instance.new("UICorner", SliderButton).CornerRadius = UDim.new(1, 0)

    -- Активная закрашенная часть слайдера
    local SliderBar = Instance.new("Frame")
    SliderBar.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    SliderBar.BackgroundColor3 = Color3.fromRGB(0, 255, 163)
    SliderBar.BorderSizePixel = 0
    SliderBar.ZIndex = 5
    SliderBar.Parent = SliderButton
    Instance.new("UICorner", SliderBar).CornerRadius = UDim.new(1, 0)

    -- Ползунок (Кружок)
    local SliderDot = Instance.new("Frame")
    SliderDot.Size = UDim2.new(0, 12, 0, 12)
    SliderDot.Position = UDim2.new((default - min) / (max - min), -6, 0.5, -6)
    SliderDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderDot.ZIndex = 6
    SliderDot.Parent = SliderButton
    Instance.new("UICorner", SliderDot).CornerRadius = UDim.new(1, 0)

    local DotStroke = Instance.new("UIStroke")
    DotStroke.Color = Color3.fromRGB(0, 255, 163)
    DotStroke.Thickness = 1.5
    DotStroke.Parent = SliderDot

    -- Логика перетаскивания ползунка мышкой
    local Dragging = false
    local function UpdateSlider()
        local MousePos = UserInputService:GetMouseLocation()
        local RelativeX = MousePos.X - SliderButton.AbsolutePosition.X
        local Percentage = math.clamp(RelativeX / SliderButton.AbsoluteSize.X, 0, 1)
        local Value = math.floor(min + (max - min) * Percentage)
        
        ValueLabel.Text = tostring(Value)
        TweenService:Create(SliderBar, TweenInfo.new(0.05), {Size = UDim2.new(Percentage, 0, 1, 0)}):Play()
        TweenService:Create(SliderDot, TweenInfo.new(0.05), {Position = UDim2.new(Percentage, -6, 0.5, -6)}):Play()
        pcall(callback, Value)
    end

    SliderButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = true
            UpdateSlider()
            TweenService:Create(Frame, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
            FStroke.Color = Color3.fromRGB(0, 255, 163)
            FStroke.Transparency = 0.8
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and Dragging then
            Dragging = false
            TweenService:Create(Frame, TweenInfo.new(0.2), {BackgroundTransparency = 0.3}):Play()
            FStroke.Color = Color3.fromRGB(255, 255, 255)
            FStroke.Transparency = 0.96
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and Dragging then
            UpdateSlider()
        end
    end)
end

-- =========================================================================
-- СОЗДАНИЕ СЛАЙДЕРА FOV ВО ВКЛАДКЕ "ГЛАВНОЕ"
-- =========================================================================
-- Минимальный FOV: 70, Максимальный: 120, По умолчанию: 70
AddSlider("Главное", "Field of View (FOV)", 70, 120, 70, function(value)
    Camera.FieldOfView = value
end)

-- =========================================================================
-- ADVANCED SPINBOT MODULE (ИСПРАВЛЕННАЯ ВЕРСИЯ: ИДЕАЛЬНАЯ ХОДЬБА БЕЗ ТРЯСКИ)
-- =========================================================================

local SpinBotEnabled = false
local SpinSpeed = 50 -- Скорость вращения по умолчанию

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- Основной цикл вращения персонажа
RunService.RenderStepped:Connect(function(deltaTime)
    local character = LocalPlayer.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    
    if root and humanoid and humanoid.Health > 0 then
        if SpinBotEnabled and humanoid.Sit == false then
            -- КРИТИЧЕСКИЙ ФИКС: Отключаем авто-поворот Roblox, чтобы убрать тряску при ходьбе
            humanoid.AutoRotate = false
            
            -- Плавное и чистое вращение по оси Y с привязкой к дельте времени
            root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(SpinSpeed * deltaTime * 10), 0)
        else
            -- Возвращаем стандартное управление, если чит выключен
            if humanoid.AutoRotate == false then
                humanoid.AutoRotate = true
            end
        end
    end
end)

-- Тумблер включения/выключения во вкладке "Главное"
AddToggle("Главное", "SpinBot", function(state)
    SpinBotEnabled = state
    
    -- Дополнительный сброс при ручном выключении тумблера
    if not state and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then humanoid.AutoRotate = true end
    end
end)

-- Слайдер настройки скорости вращения во вкладке "Главное"
AddSlider("Главное", "SpinBot Speed", 10, 150, 50, function(value)
    SpinSpeed = value
end)

-- =========================================================================
-- PREMIUM 3RD PERSON CAMERA MODULE (КАМЕРА ОТ ТРЕТЬЕГО ЛИЦА)
-- =========================================================================

local ThirdPersonEnabled = false
local DefaultZoomDistance = 10 -- Дистанция камеры по умолчанию

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- Постоянное поддержание обзора (на случай, если игра пытается вернуть 1-е лицо)
RunService.RenderStepped:Connect(function()
    if ThirdPersonEnabled and LocalPlayer then
        -- Разрешаем свободное отдаление камеры
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        
        -- Если игра заставляет зум быть намертво в режиме 1-го лица (0.5),
        -- мы принудительно отодвигаем её назад на безопасное расстояние
        if LocalPlayer.CameraMinZoomDistance < 2 then
            LocalPlayer.CameraMinZoomDistance = DefaultZoomDistance
        end
    end
end)

-- Тумблер включения/выключения во вкладке "Главное"
AddToggle("Главное", "Камера от 3-го лица", function(state)
    ThirdPersonEnabled = state
    
    if state then
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        LocalPlayer.CameraMinZoomDistance = DefaultZoomDistance
    else
        -- Возвращаем стандартные настройки игры при выключении чита
        LocalPlayer.CameraMinZoomDistance = 0.5
    end
end)

-- Слайдер для настройки дальности обзора от 3-го лица
-- Минимум: 5 метров, Максимум: 30 метров, По умолчанию: 10 метров
AddSlider("Главное", "3rd Person Distance", 5, 30, 10, function(value)
    DefaultZoomDistance = value
    if ThirdPersonEnabled then
        LocalPlayer.CameraMinZoomDistance = value
    end
end)

-- =========================================================================
-- NATURAL DISASTER SURVIVAL: ORBITAL DEBRIS VACUUM (ЩИТ ИЗ ОБЛОМКОВ)
-- =========================================================================
local DebrisOrbitEnabled = false
local OrbitRadius = 10 -- Радиус кружения обломков (в метрах)
local OrbitSpeed = 3   -- Скорость вращения обломков
local MaxParts = 40    -- Максимальное количество притягиваемых деталей, чтобы не крашнуть игру

task.spawn(function()
    local angle = 0
    while true do
        task.wait(0.01) -- Минимальная задержка для плавности вращения
        if DebrisOrbitEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = LocalPlayer.Character.HumanoidRootPart
            local myPos = rootPart.Position
            
            -- Считаем текущий шаг угла вращения
            angle = angle + (OrbitSpeed / 100)
            
            -- Ищем все незакрепленные физические детали в мире
            local count = 0
            for _, part in ipairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") and not part.Anchored and not part:IsDescendantOf(LocalPlayer.Character) then
                    -- Проверяем, не является ли деталь частью чужого персонажа
                    local isPlayer = false
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p.Character and part:IsDescendantOf(p.Character) then
                            isPlayer = true
                            break
                        end
                    end
                    
                    if not isPlayer then
                        count = count + 1
                        if count > MaxParts then break end
                        
                        -- Пытаемся получить сетевой контроль над деталью
                        pcall(function()
                            if settings then
                                settings().Physics.AllowSleep = false
                            end
                        end)
                        
                        -- Математический расчет позиции для каждой детали (распределяем их по кругу)
                        local partAngle = angle + (count * (math.pi * 2 / MaxParts))
                        local targetX = myPos.X + math.cos(partAngle) * OrbitRadius
                        local targetZ = myPos.Z + math.sin(partAngle) * OrbitRadius
                        -- Обломки крутятся чуть выше уровня земли (на уровне торса)
                        local targetY = myPos.Y + (math.sin(angle + count) * 2) 
                        
                        -- Мгновенно переносим деталь в новую точку орбиты
                        part.Velocity = Vector3.new(0, 0, 0)
                        part.RotVelocity = Vector3.new(0, 5, 0) -- Заставляем обломки красиво вращаться вокруг своей оси
                        part.CFrame = CFrame.new(targetX, targetY, targetZ)
                    end
                end
            end
        end
    end
end)

-- Создание тумблера в вашем меню Uran Hub
AddToggle("Главное", "Orbit Debris (NDS)", function(state)
    DebrisOrbitEnabled = state
end)
