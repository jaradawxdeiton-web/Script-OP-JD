-- Script Ultra Mega Good V3 - Juan (Anti-Error al morir)
local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")

-- Variables de control
local anclado = false
local objetivoActual = nil
local offsetValue = -10

-- Función para obtener el personaje actual (SIEMPRE actualizado)
local function getMyCharacter()
    return player.Character or player.CharacterAdded:Wait()
end

-- --- CONFIGURACIÓN DE LA INTERFAZ ---
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TP_Final_Juan"
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false -- IMPORTANTE: Para que la UI no desaparezca al morir

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 220, 0, 180)
mainFrame.Position = UDim2.new(0.5, -110, 0.5, -90)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "TP Fixed - Inmortal"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Parent = mainFrame

local offsetInput = Instance.new("TextBox")
offsetInput.Size = UDim2.new(0.8, 0, 0, 30)
offsetInput.Position = UDim2.new(0.1, 0, 0.25, 0)
offsetInput.Text = "-10"
offsetInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
offsetInput.TextColor3 = Color3.fromRGB(255, 255, 255)
offsetInput.Parent = mainFrame

local startButton = Instance.new("TextButton")
startButton.Size = UDim2.new(0.8, 0, 0, 30)
startButton.Position = UDim2.new(0.1, 0, 0.5, 0)
startButton.Text = "Iniciar"
startButton.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
startButton.Parent = mainFrame

local cancelButton = Instance.new("TextButton")
cancelButton.Size = UDim2.new(0.8, 0, 0, 30)
cancelButton.Position = UDim2.new(0.1, 0, 0.75, 0)
cancelButton.Text = "Cancelar"
cancelButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
cancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
cancelButton.Parent = mainFrame

-- --- LÓGICA DE SEGUIMIENTO ---
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
            if d < distMin then
                distMin = d
                target = p
            end
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
            -- El bucle ahora es más robusto
            while anclado do
                local miChar = getMyCharacter() -- Buscamos nuestro cuerpo actual en cada ciclo
                local miHrp = miChar:FindFirstChild("HumanoidRootPart")
                
                if objetivoActual and objetivoActual.Character then
                    local targetHrp = objetivoActual.Character:FindFirstChild("HumanoidRootPart")
                    
                    if targetHrp and miHrp then
                        miHrp.CFrame = targetHrp.CFrame * CFrame.new(0, offsetValue, 0) * CFrame.Angles(math.rad(90), 0, 0)
                    end
                else
                    -- Si el enemigo se va o muere, cancelamos para no gastar recursos
                    anclado = false
                end
                runService.Heartbeat:Wait()
            end
            startButton.Text = "Iniciar"
        end)
    end
end)

cancelButton.MouseButton1Click:Connect(function()
    if anclado then
        local miChar = getMyCharacter()
        local miHrp = miChar:FindFirstChild("HumanoidRootPart")
        if objetivoActual and objetivoActual.Character and miHrp then
            local targetHrp = objetivoActual.Character:FindFirstChild("HumanoidRootPart")
            if targetHrp then
                miHrp.CFrame = targetHrp.CFrame * CFrame.new(0, 5, 0) -- Salto de seguridad
            end
        end
    end
    anclado = false
    objetivoActual = nil
end)
