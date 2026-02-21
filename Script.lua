-- Script Ultra Mega Good V3 - Juan (VERSIÓN FINAL OFICIAL - 24 HORAS)
local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local tweenService = game:GetService("TweenService")

-- LISTA DE LLAVES EN ORDEN
local keysEnOrden = {
    "4927", "8105", "3742", "9261", "1583", "6039", "2471", "5814", "7390", "2056",
    "8417", "3962", "5108", "7723", "4095", "6281", "1359", "9042", "2674", "5510",
    "3829", "8647", "1930", "7258", "4106", "6394", "2817", "5043", "9731", "1468", "8522"
}

local fileName = "JuanProgress_V3.bin"

-- Lógica interna de progreso
local function obtenerProgreso()
    if isfile(fileName) then
        local success, data = pcall(function() return HttpService:JSONDecode(readfile(fileName)) end)
        if success then return data end
    end
    return {indice = 1, vencimiento = 0}
end

-- CONFIGURACIÓN FINAL: 24 Horas de uso por llave
local function guardarProgreso(nuevoIndice)
    local data = {
        indice = nuevoIndice, 
        vencimiento = os.time() + (24 * 60 * 60) -- 24 horas de acceso
    }
    writefile(fileName, HttpService:JSONEncode(data))
end

local function addHoverEffect(btn)
    btn.MouseEnter:Connect(function()
        tweenService:Create(btn, TweenInfo.new(0.3), {BackgroundTransparency = 0.2}):Play()
    end)
    btn.MouseLeave:Connect(function()
        tweenService:Create(btn, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
    end)
end

local function IniciarScriptPrincipal()
    local anclado = false
    local objetivoActual = nil
    local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    screenGui.Name = "TP_Final_Juan"
    screenGui.ResetOnSpawn = false 

    local mainFrame = Instance.new("Frame", screenGui)
    mainFrame.Size = UDim2.new(0, 240, 0, 200)
    mainFrame.Position = UDim2.new(0.5, -120, 0.5, -100)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    mainFrame.Active = true
    mainFrame.Draggable = true
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)
    local stroke = Instance.new("UIStroke", mainFrame)
    stroke.Color = Color3.fromRGB(85, 170, 255)
    stroke.Thickness = 2

    local title = Instance.new("TextLabel", mainFrame)
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "JUAN TP MOD V3"
    title.Font = Enum.Font.GothamBold
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1

    local offsetInput = Instance.new("TextBox", mainFrame)
    offsetInput.Size = UDim2.new(0.85, 0, 0, 35)
    offsetInput.Position = UDim2.new(0.075, 0, 0.25, 0)
    offsetInput.Text = "-10"
    offsetInput.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    offsetInput.TextColor3 = Color3.fromRGB(0, 255, 255)
    Instance.new("UICorner", offsetInput).CornerRadius = UDim.new(0, 8)

    local startButton = Instance.new("TextButton", mainFrame)
    startButton.Size = UDim2.new(0.85, 0, 0, 35)
    startButton.Position = UDim2.new(0.075, 0, 0.5, 0)
    startButton.Text = "INICIAR"
    startButton.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
    startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", startButton).CornerRadius = UDim.new(0, 8)
    addHoverEffect(startButton)

    local cancelButton = Instance.new("TextButton", mainFrame)
    cancelButton.Size = UDim2.new(0.85, 0, 0, 35)
    cancelButton.Position = UDim2.new(0.075, 0, 0.75, 0)
    cancelButton.Text = "DETENER"
    cancelButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
    cancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", cancelButton).CornerRadius = UDim.new(0, 8)
    addHoverEffect(cancelButton)

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

-- --- LOGIN (TU DISEÑO Y TEXTOS ORIGINALES) ---
local prodatos = obtenerProgreso()

if os.time() < prodatos.vencimiento then
    IniciarScriptPrincipal()
else
    local LoginGui = Instance.new("ScreenGui", game.CoreGui)
    local LMain = Instance.new("Frame", LoginGui)
    LMain.Size = UDim2.new(0, 280, 0, 160)
    LMain.Position = UDim2.new(0.5, -140, 0.5, -80)
    LMain.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    Instance.new("UICorner", LMain).CornerRadius = UDim.new(0, 15)
    Instance.new("UIStroke", LMain).Color = Color3.fromRGB(170, 85, 255)

    local helpBtn = Instance.new("TextButton", LMain)
    helpBtn.Size = UDim2.new(0, 20, 0, 20)
    helpBtn.Position = UDim2.new(1, -28, 0, 10)
    helpBtn.Text = "?"
    helpBtn.Font = Enum.Font.GothamBold
    helpBtn.BackgroundColor3 = Color3.fromRGB(170, 85, 255)
    helpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", helpBtn).CornerRadius = UDim.new(1, 0)

    local LTitle = Instance.new("TextLabel", LMain)
    LTitle.Size = UDim2.new(1, 0, 0, 40)
    LTitle.Text = "JUAN AUTH SYSTEM"
    LTitle.Font = Enum.Font.GothamBold
    LTitle.TextColor3 = Color3.fromRGB(170, 85, 255)
    LTitle.BackgroundTransparency = 1

    local LInput = Instance.new("TextBox", LMain)
    LInput.Size = UDim2.new(0.8, 0, 0, 35)
    LInput.Position = UDim2.new(0.1, 0, 0.35, 0)
    LInput.PlaceholderText = "Ingresa Key..."
    LInput.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    LInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", LInput).CornerRadius = UDim.new(0, 8)

    local LBtn = Instance.new("TextButton", LMain)
    LBtn.Size = UDim2.new(0.8, 0, 0, 35)
    LBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
    LBtn.Text = "DESBLOQUEAR"
    LBtn.BackgroundColor3 = Color3.fromRGB(170, 85, 255)
    LBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", LBtn).CornerRadius = UDim.new(0, 8)
    addHoverEffect(LBtn)

    local helpFrame = Instance.new("Frame", LoginGui)
    helpFrame.Size = UDim2.new(0, 180, 0, 185)
    helpFrame.Position = UDim2.new(0.5, 145, 0.5, -92)
    helpFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    helpFrame.Visible = false
    Instance.new("UICorner", helpFrame).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", helpFrame).Color = Color3.fromRGB(255, 255, 255)

    local helpMsg = Instance.new("TextLabel", helpFrame)
    helpMsg.Size = UDim2.new(0.9, 0, 0.75, 0)
    helpMsg.Position = UDim2.new(0.05, 0, 0.05, 0)
    helpMsg.Text = "para obtener el código de cada día juega el juego publicado de Juan, en el juego abra un contado en cuanto termine el contador te mostrara el código, copia el enlace y pegalo en tu navegador (Google) también puedes buscar al usuario \"juanelcaballowasa\" seguirlo si gustas, entrar a creaciones y jugar el juego"
    helpMsg.TextWrapped = true
    helpMsg.Font = Enum.Font.Gotham
    helpMsg.TextSize = 8.5
    helpMsg.TextColor3 = Color3.fromRGB(255, 255, 255)
    helpMsg.BackgroundTransparency = 1

    local copyBtn = Instance.new("TextButton", helpFrame)
    copyBtn.Size = UDim2.new(0.8, 0, 0, 25)
    copyBtn.Position = UDim2.new(0.1, 0, 0.82, 0)
    copyBtn.Text = "COPIAR LINK"
    copyBtn.TextSize = 10
    copyBtn.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
    copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", copyBtn).CornerRadius = UDim.new(0, 6)

    helpBtn.MouseButton1Click:Connect(function() helpFrame.Visible = not helpFrame.Visible end)
    copyBtn.MouseButton1Click:Connect(function()
        setclipboard("https://www.roblox.com/share?code=9195a883b4392a4eb34f3edaf9ae9a22&type=ExperienceDetails&stamp=1771618504737")
        copyBtn.Text = "COPIADO"
        task.wait(1)
        copyBtn.Text = "COPIAR LINK"
    end)

    LBtn.MouseButton1Click:Connect(function()
        local llaveCorrecta = keysEnOrden[prodatos.indice]
        if LInput.Text == llaveCorrecta then
            guardarProgreso(prodatos.indice + 1)
            LoginGui:Destroy()
            IniciarScriptPrincipal()
        else
            LInput.Text = ""
            LInput.PlaceholderText = "¡KEY INVÁLIDA!"
        end
    end)
end
