-- Script Ultra Mega Good V3 - Juan (REMASTERED + FIX CANCELAR)
local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local tweenService = game:GetService("TweenService")

local validKeys = {
    ["4927"] = true, ["8105"] = true, ["3742"] = true, ["9261"] = true, ["1583"] = true,
    ["6039"] = true, ["2471"] = true, ["5814"] = true, ["7390"] = true, ["2056"] = true,
    ["8417"] = true, ["3962"] = true, ["5108"] = true, ["7723"] = true, ["4095"] = true,
    ["6281"] = true, ["1359"] = true, ["9042"] = true, ["2674"] = true, ["5510"] = true,
    ["3829"] = true, ["8647"] = true, ["1930"] = true, ["7258"] = true, ["4106"] = true,
    ["6394"] = true, ["2817"] = true, ["5043"] = true, ["9731"] = true, ["1468"] = true,
    ["8522"] = true
}

local fileName = "JuanScript_Auth.txt"

local function addHoverEffect(btn)
    btn.MouseEnter:Connect(function()
        tweenService:Create(btn, TweenInfo.new(0.3), {BackgroundTransparency = 0.2}):Play()
    end)
    btn.MouseLeave:Connect(function()
        tweenService:Create(btn, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
    end)
end

local function guardarSesion(key)
    local data = {key = key, vencimiento = os.time() + (24 * 60 * 60)}
    writefile(fileName, HttpService:JSONEncode(data))
end

local function tieneSesionValida()
    if isfile(fileName) then
        local content = readfile(fileName)
        local success, data = pcall(function() return HttpService:JSONDecode(content) end)
        if success and data.vencimiento > os.time() then return true end
    end
    return false
end

local function IniciarScriptPrincipal()
    local anclado = false
    local objetivoActual = nil

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "TP_Final_Juan"
    screenGui.Parent = player:WaitForChild("PlayerGui")
    screenGui.ResetOnSpawn = false 

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 240, 0, 200)
    mainFrame.Position = UDim2.new(0.5, -120, 0.5, -100)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = screenGui

    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)
    local stroke = Instance.new("UIStroke", mainFrame)
    stroke.Color = Color3.fromRGB(85, 170, 255)
    stroke.Thickness = 2

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "JUAN TP MOD V3"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Parent = mainFrame

    local offsetInput = Instance.new("TextBox")
    offsetInput.Size = UDim2.new(0.85, 0, 0, 35)
    offsetInput.Position = UDim2.new(0.075, 0, 0.25, 0)
    offsetInput.Text = "-10"
    offsetInput.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    offsetInput.TextColor3 = Color3.fromRGB(0, 255, 255)
    offsetInput.Font = Enum.Font.Gotham
    offsetInput.Parent = mainFrame
    Instance.new("UICorner", offsetInput).CornerRadius = UDim.new(0, 8)

    local startButton = Instance.new("TextButton")
    startButton.Size = UDim2.new(0.85, 0, 0, 35)
    startButton.Position = UDim2.new(0.075, 0, 0.5, 0)
    startButton.Text = "INICIAR"
    startButton.Font = Enum.Font.GothamBold
    startButton.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
    startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    startButton.Parent = mainFrame
    Instance.new("UICorner", startButton).CornerRadius = UDim.new(0, 8)
    addHoverEffect(startButton)

    local cancelButton = Instance.new("TextButton")
    cancelButton.Size = UDim2.new(0.85, 0, 0, 35)
    cancelButton.Position = UDim2.new(0.075, 0, 0.75, 0)
    cancelButton.Text = "DETENER"
    cancelButton.Font = Enum.Font.GothamBold
    cancelButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
    cancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    cancelButton.Parent = mainFrame
    Instance.new("UICorner", cancelButton).CornerRadius = UDim.new(0, 8)
    addHoverEffect(cancelButton)

    -- LÓGICA DE SEGUIMIENTO
    startButton.MouseButton1Click:Connect(function()
        if anclado then return end
        
        local function getClosest()
            local target, dist = nil, math.huge
            local miChar = player.Character
            local miHrp = miChar and miChar:FindFirstChild("HumanoidRootPart")
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
                    local miChar = player.Character
                    local miHrp = miChar and miChar:FindFirstChild("HumanoidRootPart")
                    
                    if objetivoActual and objetivoActual.Character and miHrp then
                        local targetHrp = objetivoActual.Character:FindFirstChild("HumanoidRootPart")
                        if targetHrp then
                            -- Teletransporte debajo del enemigo
                            local off = tonumber(offsetInput.Text) or -10
                            miHrp.CFrame = targetHrp.CFrame * CFrame.new(0, off, 0) * CFrame.Angles(math.rad(90), 0, 0)
                        end
                    else 
                        anclado = false 
                    end
                    runService.Heartbeat:Wait()
                end
                startButton.Text = "INICIAR"
            end)
        end
    end)

    -- FIX: LÓGICA DE CANCELAR PARA EVITAR QUEDAR BAJO TIERRA
    cancelButton.MouseButton1Click:Connect(function()
        anclado = false -- Detiene el bucle de seguimiento inmediatamente
        
        task.wait(0.1) -- Pequeña pausa para asegurar que el bucle se detuvo
        
        local miChar = player.Character
        local miHrp = miChar and miChar:FindFirstChild("HumanoidRootPart")
        
        if miHrp and objetivoActual and objetivoActual.Character then
            local targetHrp = objetivoActual.Character:FindFirstChild("HumanoidRootPart")
            if targetHrp then
                -- SALTO DE SEGURIDAD: Te pone 10 studs arriba del enemigo
                miHrp.CFrame = targetHrp.CFrame * CFrame.new(0, 10, 0)
            end
        end
        
        objetivoActual = nil
        startButton.Text = "INICIAR"
    end)
end

-- --- LOGIN DECORADO ---
if tieneSesionValida() then
    IniciarScriptPrincipal()
else
    local LoginGui = Instance.new("ScreenGui")
    LoginGui.Parent = game.CoreGui
    
    local LMain = Instance.new("Frame")
    LMain.Size = UDim2.new(0, 280, 0, 150)
    LMain.Position = UDim2.new(0.5, -140, 0.5, -75)
    LMain.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    LMain.Parent = LoginGui
    Instance.new("UICorner", LMain).CornerRadius = UDim.new(0, 15)
    
    local LStroke = Instance.new("UIStroke", LMain)
    LStroke.Color = Color3.fromRGB(170, 85, 255)
    LStroke.Thickness = 3

    local LTitle = Instance.new("TextLabel")
    LTitle.Size = UDim2.new(1, 0, 0, 40)
    LTitle.Text = "JUAN AUTH SYSTEM"
    LTitle.Font = Enum.Font.GothamBold
    LTitle.TextColor3 = Color3.fromRGB(170, 85, 255)
    LTitle.BackgroundTransparency = 1
    LTitle.Parent = LMain

    local LInput = Instance.new("TextBox")
    LInput.Size = UDim2.new(0.8, 0, 0, 35)
    LInput.Position = UDim2.new(0.1, 0, 0.35, 0)
    LInput.PlaceholderText = "Ingresa Key..."
    LInput.Font = Enum.Font.Gotham
    LInput.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    LInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    LInput.Parent = LMain
    Instance.new("UICorner", LInput).CornerRadius = UDim.new(0, 8)

    local LBtn = Instance.new("TextButton")
    LBtn.Size = UDim2.new(0.8, 0, 0, 35)
    LBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
    LBtn.Text = "DESBLOQUEAR"
    LBtn.Font = Enum.Font.GothamBold
    LBtn.BackgroundColor3 = Color3.fromRGB(170, 85, 255)
    LBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    LBtn.Parent = LMain
    Instance.new("UICorner", LBtn).CornerRadius = UDim.new(0, 8)
    addHoverEffect(LBtn)

    LBtn.MouseButton1Click:Connect(function()
        if validKeys[LInput.Text] then
            guardarSesion(LInput.Text)
            LoginGui:Destroy()
            IniciarScriptPrincipal()
        else
            LInput.Text = ""
            LInput.PlaceholderText = "¡KEY INVÁLIDA!"
            LInput.PlaceholderColor3 = Color3.fromRGB(255, 0, 0)
        end
    end)
end
