-- Escript JD: Sistema de Llave Diaria con Memoria (24 Horas)
local player = game.Players.LocalPlayer
local diaDelMes = tonumber(os.date("%d"))
local nombreArchivo = "JD_Auth_Key.txt"

-- --- CALENDARIO DE LLAVES (1 POR DÍA) ---
local calendarioKeys = {
    [1] = "JD-1092", [2] = "JD-8832", [3] = "JD-4451", [4] = "JD-9920",
    [5] = "JD-3341", [6] = "JD-7712", [7] = "JD-5509", [8] = "JD-2218",
    [9] = "JD-6634", [10] = "JD-1187", [11] = "JD-4490", [12] = "JD-8823",
    [13] = "JD-3315", [14] = "JD-7746", [15] = "JD-5591", [16] = "JD-2202",
    [17] = "JD-6683", [18] = "JD-1129", [19] = "JD-4474", [20] = "JD-8293",
    [21] = "JD-9911", [22] = "JD-3355", [23] = "JD-7722", [24] = "JD-5544",
    [25] = "JD-2266", [26] = "JD-6699", [27] = "JD-1133", [28] = "JD-4488",
    [29] = "JD-8855", [30] = "JD-3377", [31] = "JD-7700"
}
local keyDelDia = calendarioKeys[diaDelMes]

-- --- TU SCRIPT V3 (TP Fixed e Inmortal) ---
local function IniciarScriptJuan()
    local runService = game:GetService("RunService")
    local anclado = false
    local objetivoActual = nil
    local offsetValue = -10
    local function getMyCharacter() return player.Character or player.CharacterAdded:Wait() end
    local mainGui = Instance.new("ScreenGui", player.PlayerGui)
    mainGui.Name = "TP_Final_Juan"
    mainGui.ResetOnSpawn = false
    local mainFrame = Instance.new("Frame", mainGui)
    mainFrame.Size = UDim2.new(0, 220, 0, 180)
    mainFrame.Position = UDim2.new(0.5, -110, 0.5, -90)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    mainFrame.BorderSizePixel = 2
    mainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    mainFrame.Active = true
    mainFrame.Draggable = true
    local titleT = Instance.new("TextLabel", mainFrame)
    titleT.Size = UDim2.new(1, 0, 0, 30)
    titleT.Text = "TP Fixed - Inmortal"
    titleT.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleT.BackgroundTransparency = 1
    local offsetInput = Instance.new("TextBox", mainFrame)
    offsetInput.Size = UDim2.new(0.8, 0, 0, 30)
    offsetInput.Position = UDim2.new(0.1, 0, 0.25, 0)
    offsetInput.Text = "-10"
    offsetInput.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
    offsetInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    local startButton = Instance.new("TextButton", mainFrame)
    startButton.Size = UDim2.new(0.8, 0, 0, 30)
    startButton.Position = UDim2.new(0.1, 0, 0.5, 0)
    startButton.Text = "Iniciar"
    startButton.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
    startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    local cancelButton = Instance.new("TextButton", mainFrame)
    cancelButton.Size = UDim2.new(0.8, 0, 0, 30)
    cancelButton.Position = UDim2.new(0.1, 0, 0.75, 0)
    cancelButton.Text = "Cancelar"
    cancelButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    cancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    offsetInput.FocusLost:Connect(function()
        local val = tonumber(offsetInput.Text)
        if val then offsetValue = val else offsetInput.Text = tostring(offsetValue) end
    end)
    local function getClosestPlayer()
        local target = nil
        local distMin = math.huge
        local miChar = getMyCharacter()
        local miHrp = miChar:FindFirstChild("HumanoidRootPart")
        if not miHrp then return nil end
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local d = (p.Character.HumanoidRootPart.Position - miHrp.Position).Magnitude
                if d < distMin then distMin = d; target = p end
            end
        end
        return target
    end
    startButton.MouseButton1Click:Connect(function()
        if anclado then return end
        objetivoActual = getClosestPlayer()
        if objetivoActual then
            anclado = true
            startButton.Text = "Siguiendo: " .. objetivoActual.Name
            task.spawn(function()
                while anclado do
                    local miChar = getMyCharacter()
                    local miHrp = miChar:FindFirstChild("HumanoidRootPart")
                    if objetivoActual and objetivoActual.Character then
                        local targetHrp = objetivoActual.Character:FindFirstChild("HumanoidRootPart")
                        if targetHrp and miHrp then
                            miHrp.CFrame = targetHrp.CFrame * CFrame.new(0, offsetValue, 0) * CFrame.Angles(math.rad(90), 0, 0)
                        end
                    else anclado = false end
                    runService.Heartbeat:Wait()
                end
                startButton.Text = "Iniciar"
            end)
        end
    end)
    cancelButton.MouseButton1Click:Connect(function() anclado = false; objetivoActual = nil end)
end

-- --- LÓGICA DE MEMORIA (Persistence) ---
local function yaValidado()
    if isfile and isfile(nombreArchivo) then
        local contenido = readfile(nombreArchivo)
        if contenido == tostring(diaDelMes) then
            return true
        end
    end
    return false
end

if yaValidado() then
    IniciarScriptJuan()
else
    -- --- INTERFAZ DEL CANDADO (Solo si no está validado) ---
    local sg = Instance.new("ScreenGui", player.PlayerGui)
    sg.Name = "KeySystem_JD"
    sg.ResetOnSpawn = false

    local frame = Instance.new("Frame", sg)
    frame.Size = UDim2.new(0, 300, 0, 220)
    frame.Position = UDim2.new(0.5, -150, 0.5, -110)
    frame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    frame.BorderSizePixel = 3
    frame.Active = true
    frame.Draggable = true

    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Text = "Escript JD"
    title.TextColor3 = Color3.fromRGB(255, 0, 0)
    title.BackgroundTransparency = 1
    title.TextSize = 30
    title.Font = Enum.Font.SourceSansBold

    local input = Instance.new("TextBox", frame)
    input.Size = UDim2.new(0.8, 0, 0, 40)
    input.Position = UDim2.new(0.1, 0, 0.45, 0)
    input.PlaceholderText = "Escribe la Key de 24h..."
    input.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
    input.TextColor3 = Color3.fromRGB(255, 255, 255)

    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0.6, 0, 0, 40)
    btn.Position = UDim2.new(0.2, 0, 0.75, 0)
    btn.Text = "VERIFICAR"
    btn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold

    btn.MouseButton1Click:Connect(function()
        local userKey = input.Text:gsub("%s+", "")
        if userKey == keyDelDia then
            if writefile then writefile(nombreArchivo, tostring(diaDelMes)) end
            sg:Destroy()
            IniciarScriptJuan()
        else
            btn.Text = "SANGRE INCORRECTA"
            wait(2)
            btn.Text = "VERIFICAR"
        end
    end)
end
