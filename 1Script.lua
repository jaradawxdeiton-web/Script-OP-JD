-- ==========================================
-- SISTEMA DE KEYS DIARIAS - JUAN (BOLIVIA)
-- ==========================================

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local setclipboard = setclipboard or toclipboard

-- CONFIGURACIÓN DE REGISTRO
local folderName = "JuanAuth_Data"
local fileName = "config.txt"

if not isfolder(folderName) then makefolder(folderName) end

-- TABLA DE CONTRASEÑAS (1 al 31)
local llaves = {
    [1] = "4927", [2] = "8105", [3] = "3742", [4] = "9261", [5] = "1583",
    [6] = "6039", [7] = "2471", [8] = "5814", [9] = "7390", [10] = "2056",
    [11] = "8417", [12] = "3962", [13] = "5108", [14] = "7723", [15] = "4095",
    [16] = "6281", [17] = "1359", [18] = "9042", [19] = "2674", [20] = "5510",
    [21] = "3829", [22] = "8647", [23] = "1930", [24] = "7258", [25] = "4106",
    [26] = "6394", [27] = "2817", [28] = "5043", [29] = "9731", [30] = "1468",
    [31] = "8522"
}

local function cargarProgreso()
    if isfile(folderName.."/"..fileName) then
        local content = readfile(folderName.."/"..fileName)
        local n, t = content:match("([^,]+),([^,]+)")
        return tonumber(n) or 1, tonumber(t) or 0
    end
    return 1, 0
end

local function guardarProgreso(nivel, tiempo)
    writefile(folderName.."/"..fileName, tostring(nivel)..","..tostring(tiempo))
end

local nivelActual, ultimoAcceso = cargarProgreso()
local tiempoAhora = os.time()

-- FUNCIÓN PARA EJECUTAR EL SCRIPT PRINCIPAL
local function EjecutarScriptJD()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jaradawxdeiton-web/Script-OP-JD/refs/heads/main/2JD_ULTRA.lua"))()
end

-- VERIFICAR SI SIGUE DENTRO DE LAS 24 HORAS PARA ENTRAR DIRECTO
if tiempoAhora - ultimoAcceso < 86400 then
    print("Acceso vigente. Cargando Script JD...")
    EjecutarScriptJD()
    return -- Detiene la ejecución de la GUI porque ya entró
end

-- ==========================================
-- INTERFAZ VISUAL (GUI)
-- ==========================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "JuanAuthSystem"
ScreenGui.Parent = localPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 220)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -110)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 12, 20)
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 15)

local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Color = Color3.fromRGB(110, 40, 200)
UIStroke.Thickness = 2

local Title = Instance.new("TextLabel")
Title.Text = "JUAN AUTH SYSTEM"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 5)
Title.TextColor3 = Color3.fromRGB(180, 80, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.Parent = MainFrame

local HelpHint = Instance.new("TextLabel")
HelpHint.Text = "Necesitas ayuda? Presiona el signo el Interrogación"
HelpHint.Size = UDim2.new(1, 0, 0, 20)
HelpHint.Position = UDim2.new(0, 0, 0, 35)
HelpHint.TextColor3 = Color3.fromRGB(200, 200, 200)
HelpHint.BackgroundTransparency = 1
HelpHint.Font = Enum.Font.Gotham
HelpHint.TextSize = 10
HelpHint.Parent = MainFrame

local QuestionBtn = Instance.new("TextButton")
QuestionBtn.Size = UDim2.new(0, 25, 0, 25)
QuestionBtn.Position = UDim2.new(1, -35, 0, 10)
QuestionBtn.BackgroundColor3 = Color3.fromRGB(110, 40, 200)
QuestionBtn.Text = "?"
QuestionBtn.TextColor3 = Color3.new(1, 1, 1)
QuestionBtn.Font = Enum.Font.GothamBold
QuestionBtn.Parent = MainFrame
Instance.new("UICorner", QuestionBtn).CornerRadius = UDim.new(1, 0)

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0, 300, 0, 45)
TextBox.Position = UDim2.new(0.5, -150, 0.38, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
TextBox.PlaceholderText = "Ingresa la Key #"..nivelActual.." aquí..."
TextBox.Text = ""
TextBox.TextColor3 = Color3.new(1, 1, 1)
TextBox.Parent = MainFrame
Instance.new("UICorner", TextBox)

local UnlockBtn = Instance.new("TextButton")
UnlockBtn.Size = UDim2.new(0, 300, 0, 45)
UnlockBtn.Position = UDim2.new(0.5, -150, 0.65, 0)
UnlockBtn.BackgroundColor3 = Color3.fromRGB(130, 60, 230)
UnlockBtn.Text = "DESBLOQUEAR"
UnlockBtn.TextColor3 = Color3.new(1, 1, 1)
UnlockBtn.Font = Enum.Font.GothamBold
UnlockBtn.Parent = MainFrame
Instance.new("UICorner", UnlockBtn)

-- VENTANA LATERAL (AYUDA)
local SidePanel = Instance.new("Frame")
SidePanel.Size = UDim2.new(0, 180, 0, 160)
SidePanel.Position = UDim2.new(1, 8, 0, 0)
SidePanel.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
SidePanel.Visible = false
SidePanel.Parent = MainFrame
Instance.new("UICorner", SidePanel)
Instance.new("UIStroke", SidePanel).Color = Color3.fromRGB(110, 40, 200)

local InfoText = Instance.new("TextLabel")
InfoText.Size = UDim2.new(0.9, 0, 0, 110)
InfoText.Position = UDim2.new(0.05, 0, 0.05, 0)
InfoText.Text = "para obtener el código de cada día juega el juego publicado de Juan, en el juego abra un contado en cuanto termine el contador te mostrara el código, copia el enlace y pegalo en tu navegador (Google) también puedes buscar al usuario Juanelcaballowasa seguirlo si gustas, entrar a creaciones y jugar el juego"
InfoText.TextColor3 = Color3.new(0.9, 0.9, 0.9)
InfoText.TextWrapped = true
InfoText.TextSize = 9
InfoText.Font = Enum.Font.Gotham
InfoText.BackgroundTransparency = 1
InfoText.Parent = SidePanel

local CopyBtn = Instance.new("TextButton")
CopyBtn.Size = UDim2.new(0.85, 0, 0, 35)
CopyBtn.Position = UDim2.new(0.075, 0, 0.72, 0)
CopyBtn.BackgroundColor3 = Color3.fromRGB(60, 120, 220)
CopyBtn.Text = "COPIAR LINK"
CopyBtn.TextColor3 = Color3.new(1, 1, 1)
CopyBtn.Parent = SidePanel
Instance.new("UICorner", CopyBtn)

-- LÓGICA DE FUNCIONAMIENTO
QuestionBtn.MouseButton1Click:Connect(function()
    SidePanel.Visible = not SidePanel.Visible
end)

CopyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://www.roblox.com/share?code=9195a883b4392a4eb34f3edaf9ae9a22&type=ExperienceDetails&stamp=1771618504737")
    CopyBtn.Text = "¡COPIADO!"
    wait(1)
    CopyBtn.Text = "COPIAR LINK"
end)

UnlockBtn.MouseButton1Click:Connect(function()
    local input = TextBox.Text
    local keyCorrecta = llaves[nivelActual]
    
    if input == keyCorrecta then
        UnlockBtn.Text = "ACCESO CORRECTO"
        UnlockBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        
        -- Guardar progreso y tiempo
        guardarProgreso(nivelActual + 1, os.time())
        
        wait(1)
        ScreenGui:Destroy()
        
        -- EJECUCIÓN DEL SCRIPT DE JUAN
        EjecutarScriptJD()
    else
        UnlockBtn.Text = "KEY #"..nivelActual.." INCORRECTA"
        UnlockBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        wait(1.5)
        UnlockBtn.Text = "DESBLOQUEAR"
        UnlockBtn.BackgroundColor3 = Color3.fromRGB(130, 60, 230)
    end
end)
