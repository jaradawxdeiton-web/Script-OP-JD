--[[
    Scripts OP - Final Juan
    Versión Actualizada (2026)
    Optimizado para Delta Ejecutor
--]]

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local MinusButton = Instance.new("TextButton")
local NextPageBtn = Instance.new("TextButton")

-- Contenedores
local Sidebar = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

-- MARCO DE CONFIRMACIÓN (Reutilizable)
local ConfirmFrame = Instance.new("Frame")
local ConfirmStroke = Instance.new("UIStroke")
local QuestionLabel = Instance.new("TextLabel")
local YesBtn = Instance.new("TextButton")
local NoBtn = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "ScriptsOP_Final_Juan"

-- 1. MARCO PRINCIPAL
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -150)
MainFrame.Size = UDim2.new(0, 550, 0, 320)
MainFrame.BorderSizePixel = 0

UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(150, 0, 0)
UIStroke.Thickness = 7

-- 2. TITULAR
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 10)
Title.Size = UDim2.new(1, 0, 0, 60)
Title.Font = Enum.Font.Creepster
Title.Text = "SCRIPTS OP"
Title.TextColor3 = Color3.fromRGB(200, 0, 0)
Title.TextSize = 50

-- 3. LÓGICA BOTÓN "-" (BORRADO RÁPIDO)
MinusButton.Name = "MinusButton"
MinusButton.Parent = MainFrame
MinusButton.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
MinusButton.Position = UDim2.new(1, -45, 0, 15)
MinusButton.Size = UDim2.new(0, 30, 0, 30)
MinusButton.Text = "-"
MinusButton.TextColor3 = Color3.fromRGB(255, 0, 0)
MinusButton.TextSize = 30

MinusButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy() -- Elimina todo rápido
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jaradawxdeiton-web/Script-OP-JD/refs/heads/main/Circlesan.lua"))()
end)

-- 4. BOTÓN "SIGUIENTE PÁGINA"
NextPageBtn.Name = "NextPageBtn"
NextPageBtn.Parent = MainFrame
NextPageBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
NextPageBtn.Position = UDim2.new(1, -165, 0, 15)
NextPageBtn.Size = UDim2.new(0, 110, 0, 30)
NextPageBtn.Font = Enum.Font.SourceSansBold
NextPageBtn.Text = "Siguiente página"
NextPageBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NextPageBtn.TextSize = 14

-- 5. CONFIGURACIÓN DEL MINI MARCO
ConfirmFrame.Name = "ConfirmFrame"
ConfirmFrame.Parent = MainFrame
ConfirmFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ConfirmFrame.Position = UDim2.new(0.5, -140, 0.5, -70)
ConfirmFrame.Size = UDim2.new(0, 280, 0, 140)
ConfirmFrame.ZIndex = 20
ConfirmFrame.Visible = false

ConfirmStroke.Parent = ConfirmFrame
ConfirmStroke.Color = Color3.fromRGB(255, 0, 0)
ConfirmStroke.Thickness = 4

QuestionLabel.Parent = ConfirmFrame
QuestionLabel.BackgroundTransparency = 1
QuestionLabel.Position = UDim2.new(0, 10, 0, 10)
QuestionLabel.Size = UDim2.new(1, -20, 0, 60)
QuestionLabel.ZIndex = 21
QuestionLabel.Font = Enum.Font.SourceSansBold
QuestionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
QuestionLabel.TextSize = 18
QuestionLabel.TextWrapped = true

YesBtn.Parent = ConfirmFrame
YesBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
YesBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
YesBtn.Size = UDim2.new(0, 100, 0, 35)
YesBtn.ZIndex = 21
YesBtn.Text = "SÍ"
YesBtn.TextColor3 = Color3.fromRGB(0, 0, 0)

NoBtn.Parent = ConfirmFrame
NoBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
NoBtn.Position = UDim2.new(0.55, 0, 0.65, 0)
NoBtn.Size = UDim2.new(0, 100, 0, 35)
NoBtn.ZIndex = 21
NoBtn.Text = "NO"
NoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local currentAction = nil

local function abrirConfirmacion(texto, accion)
    QuestionLabel.Text = texto
    currentAction = accion
    ConfirmFrame.Visible = true
end

NoBtn.MouseButton1Click:Connect(function() ConfirmFrame.Visible = false end)
YesBtn.MouseButton1Click:Connect(function()
    ConfirmFrame.Visible = false
    if currentAction then accion() end -- Ejecución rápida
end)

NextPageBtn.MouseButton1Click:Connect(function()
    abrirConfirmacion("¿Deseas cambiar de página?", function()
        ScreenGui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jaradawxdeiton-web/Script-OP-JD/refs/heads/main/Next.lua"))()
    end)
end)

-- 6. BOTONES Y DESCRIPCIONES (CORREGIDAS)
Sidebar.Name = "Sidebar"
Sidebar.Parent = MainFrame
Sidebar.BackgroundTransparency = 1
Sidebar.Position = UDim2.new(0, 15, 0, 85)
Sidebar.Size = UDim2.new(0, 520, 1, -100)
UIListLayout.Parent = Sidebar
UIListLayout.Padding = UDim.new(0, 12)

local scriptsData = {
    {
        nombre = "Invisible fe", 
        desc = "Este script te hace invisible; no puedes atacar ni ser atacado, solo observar.",
        link = "https://rawscripts.net/raw/Universal-Script-Invisible-FE-19153"
    },
    {
        nombre = "Radiación F", 
        desc = "Este script altera tu cuerpo haciendo que cualquiera que toques salga volando.",
        link = "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-30401"
    },
    {
        nombre = "Inseparables A.L.E", 
        desc = "Este script te ancla al enemigo más cercano, facilitándote la pelea.",
        link = "https://rawscripts.net/raw/The-Strongest-Battlegrounds-TBS-CROZO-SCRIPT-49130"
    },
    {
        nombre = "Farm Tach", 
        desc = "Este script recoge un tacho de los campos de batalla más fuertes instantáneamente.",
        link = "https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man"
    }
}

for _, data in ipairs(scriptsData) do
    local container = Instance.new("Frame")
    container.Parent = Sidebar
    container.BackgroundTransparency = 1
    container.Size = UDim2.new(1, 0, 0, 40)

    local btn = Instance.new("TextButton")
    btn.Parent = container
    btn.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    btn.Size = UDim2.new(0, 140, 1, 0)
    btn.Text = data.nombre
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14

    local descLabel = Instance.new("TextLabel")
    descLabel.Parent = container
    descLabel.BackgroundTransparency = 1
    descLabel.Position = UDim2.new(0, 150, 0, 0)
    descLabel.Size = UDim2.new(1, -160, 1, 0)
    descLabel.Text = data.desc
    descLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    descLabel.TextSize = 11
    descLabel.TextWrapped = true
    descLabel.TextXAlignment = Enum.TextXAlignment.Left

    btn.MouseButton1Click:Connect(function()
        abrirConfirmacion("¿Deseas ejecutar este script?", function()
            loadstring(game:HttpGet(data.link))()
        end)
    end)
end

-- Función de ejecución corregida para el YesBtn
YesBtn.MouseButton1Click:Connect(function()
    ConfirmFrame.Visible = false
    if currentAction then currentAction() end
end)
