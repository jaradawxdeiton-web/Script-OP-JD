--[[
    SCRIPTS OP - VERSIÓN FINAL CORREGIDA (JUAN)
    1. Atrás: Movido al lado izquierdo superior.
    2. Siguiente y Cerrar: En el lado derecho.
    3. Scripts: Enlaces corregidos y funcionales.
--]]

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke")
local MinusButton = Instance.new("TextButton")
local NextPageBtn = Instance.new("TextButton")
local BackBtn = Instance.new("TextButton")
local Sidebar = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

-- Marco de Confirmación
local ConfirmFrame = Instance.new("Frame")
local ConfirmStroke = Instance.new("UIStroke")
local QuestionLabel = Instance.new("TextLabel")
local YesBtn = Instance.new("TextButton")
local NoBtn = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "ScriptsOP_Juan_Definitivo"

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -150)
MainFrame.Size = UDim2.new(0, 550, 0, 320)
MainFrame.BorderSizePixel = 0

UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(150, 0, 0)
UIStroke.Thickness = 7

-- 1. BOTÓN ATRÁS (AHORA AL OTRO LADO - IZQUIERDA)
BackBtn.Name = "BackBtn"
BackBtn.Parent = MainFrame
BackBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BackBtn.Position = UDim2.new(0, 15, 0, 15) -- Lado izquierdo
BackBtn.Size = UDim2.new(0, 100, 0, 30)
BackBtn.Font = Enum.Font.SourceSansBold
BackBtn.Text = "Atrás"
BackBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BackBtn.TextSize = 16

-- 2. BOTONES DERECHOS (SIGUIENTE Y CERRAR)
NextPageBtn.Name = "NextPageBtn"
NextPageBtn.Parent = MainFrame
NextPageBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
NextPageBtn.Position = UDim2.new(1, -165, 0, 15)
NextPageBtn.Size = UDim2.new(0, 110, 0, 30)
NextPageBtn.Font = Enum.Font.SourceSansBold
NextPageBtn.Text = "Siguiente"
NextPageBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NextPageBtn.TextSize = 16

MinusButton.Name = "MinusButton"
MinusButton.Parent = MainFrame
MinusButton.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
MinusButton.Position = UDim2.new(1, -45, 0, 15)
MinusButton.Size = UDim2.new(0, 30, 0, 30)
MinusButton.Text = "-"
MinusButton.TextColor3 = Color3.fromRGB(255, 0, 0)
MinusButton.TextSize = 30

MinusButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jaradawxdeiton-web/Script-OP-JD/refs/heads/main/3Circlesan.lua"))()
end)

-- 3. CONFIGURACIÓN DEL MARCO DE CONFIRMACIÓN
ConfirmFrame.Name = "ConfirmFrame"
ConfirmFrame.Parent = MainFrame
ConfirmFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ConfirmFrame.Position = UDim2.new(0.5, -140, 0.5, -70)
ConfirmFrame.Size = UDim2.new(0, 280, 0, 140)
ConfirmFrame.ZIndex = 100
ConfirmFrame.Visible = false

ConfirmStroke.Parent = ConfirmFrame
ConfirmStroke.Color = Color3.fromRGB(255, 0, 0)
ConfirmStroke.Thickness = 4

QuestionLabel.Parent = ConfirmFrame
QuestionLabel.BackgroundTransparency = 1
QuestionLabel.Position = UDim2.new(0, 10, 0, 10)
QuestionLabel.Size = UDim2.new(1, -20, 0, 60)
QuestionLabel.Font = Enum.Font.SourceSansBold
QuestionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
QuestionLabel.TextSize = 18
QuestionLabel.TextWrapped = true
QuestionLabel.ZIndex = 101

YesBtn.Parent = ConfirmFrame
YesBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
YesBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
YesBtn.Size = UDim2.new(0, 100, 0, 35)
YesBtn.Text = "SÍ"
YesBtn.Font = Enum.Font.SourceSansBold
YesBtn.ZIndex = 101

NoBtn.Parent = ConfirmFrame
NoBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
NoBtn.Position = UDim2.new(0.55, 0, 0.65, 0)
NoBtn.Size = UDim2.new(0, 100, 0, 35)
NoBtn.Text = "NO"
NoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NoBtn.Font = Enum.Font.SourceSansBold
NoBtn.ZIndex = 101

local currentAction = nil
local function abrirConfirmacion(texto, accion)
    QuestionLabel.Text = texto
    currentAction = accion
    ConfirmFrame.Visible = true
end

NoBtn.MouseButton1Click:Connect(function() ConfirmFrame.Visible = false end)
YesBtn.MouseButton1Click:Connect(function()
    ConfirmFrame.Visible = false
    if currentAction then currentAction() end
end)

-- Navegación
NextPageBtn.MouseButton1Click:Connect(function()
    abrirConfirmacion("¿Deseas ir al siguiente?", function()
        ScreenGui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jaradawxdeiton-web/Script-OP-JD/refs/heads/main/6NuevoScript.lua"))()
    end)
end)

BackBtn.MouseButton1Click:Connect(function()
    abrirConfirmacion("¿Deseas volver atrás?", function()
        ScreenGui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jaradawxdeiton-web/Script-OP-JD/refs/heads/main/4Panel.lua"))()
    end)
end)

-- 4. SECCIÓN DE SCRIPTS (CARGA CORREGIDA)
Sidebar.Name = "Sidebar"
Sidebar.Parent = MainFrame
Sidebar.BackgroundTransparency = 1
Sidebar.Position = UDim2.new(0, 15, 0, 65)
Sidebar.Size = UDim2.new(0, 520, 1, -85)
UIListLayout.Parent = Sidebar
UIListLayout.Padding = UDim.new(0, 12)

local scriptsData = {
    {nombre = "Fly/Gui", desc = "Este Script te permite volar y personalizar la velocidad, funciona para cualquier juego.", link = "https://rawscripts.net/raw/Universal-Script-fly-gui-no-mio-34954"},
    {nombre = "Vehicles fly", desc = "Este Script te permite volar con un carro entre ti, funciona en cualquier juego", link = "https://rawscripts.net/raw/Universal-Script-Vfly-indonesian-53139"},
    {nombre = "Troleador", desc = "Este Script te hace una chatetita en cualquier jugador, funciona para cualquier juego", link = "https://rawscripts.net/raw/Universal-Script-Troll-GUI-30896"},
    {nombre = "Fake Lag Egor", desc = "Este Script crea un lag falso, funcióna para cualquier juego", link = "https://rawscripts.net/raw/Natural-Disaster-Survival-fake-lag-egor-47745"}
}

for _, data in ipairs(scriptsData) do
    local container = Instance.new("Frame")
    container.Parent = Sidebar
    container.BackgroundTransparency = 1
    container.Size = UDim2.new(1, 0, 0, 45)

    local btn = Instance.new("TextButton")
    btn.Parent = container
    btn.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    btn.Size = UDim2.new(0, 140, 0, 40)
    btn.Text = data.nombre
    btn.Font = Enum.Font.SourceSansBold
    btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    btn.TextSize = 16

    local descLabel = Instance.new("TextLabel")
    descLabel.Parent = container
    descLabel.BackgroundTransparency = 1
    descLabel.Position = UDim2.new(0, 155, 0, 0)
    descLabel.Size = UDim2.new(1, -165, 1, 0)
    descLabel.Text = data.desc
    descLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    descLabel.TextSize = 13
    descLabel.TextWrapped = true
    descLabel.TextXAlignment = Enum.TextXAlignment.Left

    btn.MouseButton1Click:Connect(function()
        abrirConfirmacion("¿Deseas ejecutar " .. data.nombre .. "?", function()
            loadstring(game:HttpGet(data.link))()
        end)
    end)
end
