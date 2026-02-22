-- JD ULTRA PREMIUM: VERSIÓN FINAL CON LOADSTRING
local player = game.Players.LocalPlayer
local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local lighting = game:GetService("Lighting")

local sg = Instance.new("ScreenGui")
sg.Name = "JD_System_Final_Execution"
sg.Parent = player:WaitForChild("PlayerGui")
sg.ResetOnSpawn = false

-- 1. BLUR INICIAL
local blur = Instance.new("BlurEffect", lighting)
blur.Size = 25

-- 2. ELEMENTOS DE LA INTRO (Sangre Derretida)
local introFrame = Instance.new("Frame", sg)
introFrame.Size = UDim2.new(1, 0, 1, 0)
introFrame.BackgroundTransparency = 1

local function CreateBloodText(text, pos)
    local label = Instance.new("TextLabel", introFrame)
    label.Size = UDim2.new(0, 120, 0, 120)
    label.Position = pos
    label.Text = text
    label.Font = Enum.Font.GothamBlack
    label.TextSize = 120
    label.TextColor3 = Color3.fromRGB(130, 0, 0) 
    label.BackgroundTransparency = 1
    
    local stroke = Instance.new("UIStroke", label)
    stroke.Color = Color3.fromRGB(255, 0, 0) 
    stroke.Thickness = 2
    return label
end

local J = CreateBloodText("J", UDim2.new(-0.3, 0, 0.5, -70))
local D = CreateBloodText("D", UDim2.new(1.3, 0, 0.5, -70))

local sText = Instance.new("TextLabel", introFrame)
sText.Size = UDim2.new(0, 200, 0, 50)
sText.Position = UDim2.new(0.5, -100, 0.65, 0)
sText.Text = "SCRIPT"
sText.Font = Enum.Font.GothamBlack
sText.TextSize = 45
sText.TextColor3 = Color3.fromRGB(180, 0, 0)
sText.TextTransparency = 1
sText.BackgroundTransparency = 1

-- 🚀 ANIMACIÓN (Exactamente como la pediste)
task.wait(0.2)
tweenService:Create(J, TweenInfo.new(1.2, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -95, 0.5, -70)}):Play()
tweenService:Create(D, TweenInfo.new(1.2, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -5, 0.5, -70)}):Play()

task.wait(0.6)
tweenService:Create(sText, TweenInfo.new(0.8), {TextTransparency = 0}):Play()

task.wait(1.5)
tweenService:Create(blur, TweenInfo.new(1.5), {Size = 0}):Play()

task.wait(1.5)
introFrame:Destroy()
if blur then blur:Destroy() end

-- ✨ 3. BOTÓN COMENZAR RAINBOW
local btnFrame = Instance.new("Frame", sg)
btnFrame.Size = UDim2.new(0, 250, 0, 80)
btnFrame.Position = UDim2.new(0.5, -125, 0.5, -40)
btnFrame.BorderSizePixel = 0

local corner = Instance.new("UICorner", btnFrame)
corner.CornerRadius = UDim.new(0, 25)

local stroke = Instance.new("UIStroke", btnFrame)
stroke.Thickness = 5

local startBtn = Instance.new("TextButton", btnFrame)
startBtn.Size = UDim2.new(1, 0, 1, 0)
startBtn.BackgroundTransparency = 1
startBtn.Text = "COMENZAR"
startBtn.Font = Enum.Font.GothamBlack
startBtn.TextColor3 = Color3.new(1, 1, 1)
startBtn.TextSize = 30

-- 🌈 LÓGICA RAINBOW
runService.RenderStepped:Connect(function()
    if btnFrame.Parent then
        local hue = tick() % 3 / 3
        local color = Color3.fromHSV(hue, 0.8, 1)
        btnFrame.BackgroundColor3 = color
        stroke.Color = color:Lerp(Color3.new(1,1,1), 0.5)
    end
end)

-- 🖱️ CLIC PARA EJECUTAR SCRIPT EXTERNO
startBtn.MouseButton1Click:Connect(function()
    -- Primero ejecutamos el script de tu link
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jaradawxdeiton-web/Script-OP-JD/refs/heads/main/3Circlesan.lua"))()
    end)
    
    -- Luego destruimos la interfaz de entrada
    sg:Destroy()
    print("Script OP JD cargado con éxito.")
end)
