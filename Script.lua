-- Script Ultra Mega Good V4 Premium + Drag Handle - Juan
local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local tweenService = game:GetService("TweenService")

-- LISTA DE LLAVES
local keysEnOrden = {
    "4927", "8105", "3742", "9261", "1583", "6039", "2471", "5814", "7390", "2056",
    "8417", "3962", "5108", "7723", "4095", "6281", "1359", "9042", "2674", "5510",
    "3829", "8647", "1930", "7258", "4106", "6394", "2817", "5043", "9731", "1468", "8522"
}

local fileName = "JuanProgress_V3.bin"

local function obtenerProgreso()
    if isfile(fileName) then
        local success, data = pcall(function() return HttpService:JSONDecode(readfile(fileName)) end)
        if success then return data end
    end
    return {indice = 1, vencimiento = 0}
end

local function guardarProgreso(nuevoIndice)
    local data = {indice = nuevoIndice, vencimiento = os.time() + (24 * 60 * 60)}
    writefile(fileName, HttpService:JSONEncode(data))
end

-- --- FUNCIÓN PRINCIPAL ---
local function IniciarScriptPrincipal()
    local anclado = false
    local objetivoActual = nil
    local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    screenGui.Name = "Juan_Premium_Hub"
    screenGui.ResetOnSpawn = false 

    -- MARCO PRINCIPAL
    local mainFrame = Instance.new("Frame", screenGui)
    mainFrame.Size = UDim2.new(0, 280, 0, 220)
    mainFrame.Position = UDim2.new(0.5, -140, 0.5, -110)
    mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
    mainFrame.BorderSizePixel = 0
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)
    
    local stroke = Instance.new("UIStroke", mainFrame)
    stroke.Color = Color3.fromRGB(85, 170, 255)
    stroke.Thickness = 2

    -- --- BARRA DE ARRASTRE (DRAG BAR) ---
    local dragBar = Instance.new("Frame", mainFrame)
    dragBar.Size = UDim2.new(1, 0, 0, 22)
    dragBar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    dragBar.BorderSizePixel = 0
    Instance.new("UICorner", dragBar).CornerRadius = UDim.new(0, 12)
    
    local dCover = Instance.new("Frame", dragBar)
    dCover.Size = UDim2.new(1, 0, 0, 10)
    dCover.Position = UDim2.new(0, 0, 1, -10)
    dCover.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    dCover.BorderSizePixel = 0

    local dragTitle = Instance.new("TextLabel", dragBar)
    dragTitle.Size = UDim2.new(1, 0, 1, 0)
    dragTitle.Text = "SYSTEM MANAGER - JUAN"
    dragTitle.Font = Enum.Font.GothamBold
    dragTitle.TextColor3 = Color3.fromRGB(150, 150, 150)
    dragTitle.TextSize = 9
    dragTitle.BackgroundTransparency = 1

    mainFrame.Active = true
    mainFrame.Draggable = true

    -- --- NAVEGACIÓN ---
    local nav = Instance.new("Frame", mainFrame)
    nav.Size = UDim2.new(1, 0, 0, 32)
    nav.Position = UDim2.new(0, 0, 0, 22)
    nav.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    nav.BorderSizePixel = 0

    local btnTab1 = Instance.new("TextButton", nav)
    btnTab1.Size = UDim2.new(0.5, -5, 1, 0)
    btnTab1.Text = "TP"
    btnTab1.Font = Enum.Font.GothamBold
    btnTab1.TextColor3 = Color3.fromRGB(255, 255, 255)
    btnTab1.BackgroundTransparency = 1

    local btnTab2 = Instance.new("TextButton", nav)
    btnTab2.Size = UDim2.new(0.5, -5, 1, 0)
    btnTab2.Position = UDim2.new(0.5, 5, 0, 0)
    btnTab2.Text = "MÁS SCRIPTS OP/JD"
    btnTab2.Font = Enum.Font.GothamBold
    btnTab2.TextSize = 10
    btnTab2.TextColor3 = Color3.fromRGB(120, 120, 130)
    btnTab2.BackgroundTransparency = 1

    -- --- CONTENEDORES ---
    local framePrincipal = Instance.new("Frame", mainFrame)
    framePrincipal.Size = UDim2.new(1, 0, 1, -54)
    framePrincipal.Position = UDim2.new(0, 0, 0, 54)
    framePrincipal.BackgroundTransparency = 1

    local frameAjustes = Instance.new("Frame", mainFrame)
    frameAjustes.Size = UDim2.new(1, 0, 1, -54)
    frameAjustes.Position = UDim2.new(0, 0, 0, 54)
    frameAjustes.BackgroundTransparency = 1
    frameAjustes.Visible = false

    -- --- PÁGINA 1: ANCLATE SUB ---
    local title = Instance.new("TextLabel", framePrincipal)
    title.Size = UDim2.new(1, 0, 0, 35)
    title.Text = "ANCLATE SUB"
    title.Font = Enum.Font.GothamBold
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1

    local offsetInput = Instance.new("TextBox", framePrincipal)
    offsetInput.Size = UDim2.new(0.85, 0, 0, 30)
    offsetInput.Position = UDim2.new(0.075, 0, 0.22, 0)
    offsetInput.Text = "-10"
    offsetInput.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    offsetInput.TextColor3 = Color3.fromRGB(0, 255, 255)
    Instance.new("UICorner", offsetInput)

    local startButton = Instance.new("TextButton", framePrincipal)
    startButton.Size = UDim2.new(0.85, 0, 0, 35)
    startButton.Position = UDim2.new(0.075, 0, 0.46, 0)
    startButton.Text = "INICIAR"
    startButton.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
    startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", startButton)

    local cancelButton = Instance.new("TextButton", framePrincipal)
    cancelButton.Size = UDim2.new(0.85, 0, 0, 35)
    cancelButton.Position = UDim2.new(0.075, 0, 0.72, 0)
    cancelButton.Text = "DETENER"
    cancelButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    cancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", cancelButton)

    -- --- PÁGINA 2: MÁS SCRIPTS (TEXTO LARGO PROFESIONAL) ---
    local settingsTitle = Instance.new("TextLabel", frameAjustes)
    settingsTitle.Size = UDim2.new(1, 0, 0, 30)
    settingsTitle.Text = "JD PREMIUM - EXCLUSIVE"
    settingsTitle.Font = Enum.Font.GothamBold
    settingsTitle.TextColor3 = Color3.fromRGB(170, 85, 255)
    settingsTitle.TextSize = 12
    settingsTitle.BackgroundTransparency = 1

    local longDesc = Instance.new("TextLabel", frameAjustes)
    longDesc.Size = UDim2.new(0.9, 0, 0, 80)
    longDesc.Position = UDim2.new(0.05, 0, 0.18, 0)
    longDesc.Text = "Este software avanzado representa la cúspide del desarrollo en scripts de utilidad. Al ejecutarlo, desbloqueas un abanico de ventajas tácticas diseñadas para otorgarte superioridad inmediata en una vasta gama de experiencias. Su arquitectura optimizada garantiza estabilidad y un impacto directo en el gameplay, permitiéndote dominar mecánicas complejas con un solo clic."
    longDesc.Font = Enum.Font.Gotham
    longDesc.TextColor3 = Color3.fromRGB(160, 160, 165)
    longDesc.TextSize = 8
    longDesc.TextWrapped = true
    longDesc.TextXAlignment = Enum.TextXAlignment.Left
    longDesc.BackgroundTransparency = 1

    local openBtn = Instance.new("TextButton", frameAjustes)
    openBtn.Size = UDim2.new(0.85, 0, 0, 32)
    openBtn.Position = UDim2.new(0.075, 0, 0.7, 0)
    openBtn.Text = "ABRIR SCRIPT OP"
    openBtn.Font = Enum.Font.GothamBold
    openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    openBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 200)
    Instance.new("UICorner", openBtn)

    -- --- MARCO DE CONFIRMACIÓN APARTE (FLOATING) ---
    local confirmGui = Instance.new("Frame", screenGui)
    confirmGui.Size = UDim2.new(0, 220, 0, 100)
    confirmGui.Position = UDim2.new(0.5, -110, 0.5, -50)
    confirmGui.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
    confirmGui.BorderSizePixel = 0
    confirmGui.Visible = false
    Instance.new("UICorner", confirmGui)
    Instance.new("UIStroke", confirmGui).Color = Color3.fromRGB(255, 85, 85)

    local confirmTxt = Instance.new("TextLabel", confirmGui)
    confirmTxt.Size = UDim2.new(1, 0, 0.5, 0)
    confirmTxt.Text = "¿Deseas abrir el script?"
    confirmTxt.Font = Enum.Font.GothamBold
    confirmTxt.TextColor3 = Color3.fromRGB(255, 255, 255)
    confirmTxt.TextSize = 11
    confirmTxt.BackgroundTransparency = 1

    local btnSi = Instance.new("TextButton", confirmGui)
    btnSi.Size = UDim2.new(0.4, 0, 0.35, 0)
    btnSi.Position = UDim2.new(0.08, 0, 0.55, 0)
    btnSi.Text = "SÍ"
    btnSi.BackgroundColor3 = Color3.fromRGB(0, 150, 80)
    btnSi.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", btnSi)

    local btnNo = Instance.new("TextButton", confirmGui)
    btnNo.Size = UDim2.new(0.4, 0, 0.35, 0)
    btnNo.Position = UDim2.new(0.52, 0, 0.55, 0)
    btnNo.Text = "NO"
    btnNo.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    btnNo.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", btnNo)

    -- LÓGICA DE CONFIRMACIÓN
    openBtn.MouseButton1Click:Connect(function() confirmGui.Visible = true end)
    btnNo.MouseButton1Click:Connect(function() confirmGui.Visible = false end)
    btnSi.MouseButton1Click:Connect(function()
        confirmGui.Visible = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jaradawxdeiton-web/Script-OP-JD/refs/heads/main/JD_ULTRA_V10.lua"))()
    end)

    -- NAVEGACIÓN
    btnTab1.MouseButton1Click:Connect(function()
        framePrincipal.Visible = true; frameAjustes.Visible = false
        btnTab1.TextColor3 = Color3.fromRGB(255, 255, 255)
        btnTab2.TextColor3 = Color3.fromRGB(120, 120, 130)
    end)
    btnTab2.MouseButton1Click:Connect(function()
        framePrincipal.Visible = false; frameAjustes.Visible = true
        btnTab2.TextColor3 = Color3.fromRGB(255, 255, 255)
        btnTab1.TextColor3 = Color3.fromRGB(120, 120, 130)
    end)

    -- LÓGICA DE TP (MANTENIDA)
    startButton.MouseButton1Click:Connect(function()
        if anclado then return end
        local function getClosest()
            local target, dist = nil, math.huge
            local miHrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if not miHrp then return end
            for _, p in pairs(game.Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local d = (p.Character.HumanoidRootPart.Position - miHrp.Position).Magnitude
                    if d < dist then dist = d; target = p end
                end
            end
            return target
        end
        objetivoActual = getClosest()
        if objetivoActual then
            anclado = true
            startButton.Text = "SIGUIENDO..."
            task.spawn(function()
                while anclado do
                    local miHrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if objetivoActual and objetivoActual.Character and miHrp then
                        local targetHrp = objetivoActual.Character:FindFirstChild("HumanoidRootPart")
                        if targetHrp then
                            local off = tonumber(offsetInput.Text) or -10
                            miHrp.CFrame = targetHrp.CFrame * CFrame.new(0, off, 0) * CFrame.Angles(math.rad(90), 0, 0)
                        end
                    else anclado = false end
                    runService.Heartbeat:Wait()
                end
                startButton.Text = "INICIAR"
            end)
        end
    end)

    cancelButton.MouseButton1Click:Connect(function()
        anclado = false
        task.wait(0.1)
        local miHrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if miHrp and objetivoActual and objetivoActual.Character then
            local targetHrp = objetivoActual.Character:FindFirstChild("HumanoidRootPart")
            if targetHrp then
                miHrp.CFrame = targetHrp.CFrame * CFrame.new(0, 10, 0)
            end
        end
        objetivoActual = nil
        startButton.Text = "INICIAR"
    end)
end

-- --- LOGIN Y EJECUCIÓN ---
local prodatos = obtenerProgreso()
if os.time() < prodatos.vencimiento then
    IniciarScriptPrincipal()
else
    IniciarScriptPrincipal() 
end
