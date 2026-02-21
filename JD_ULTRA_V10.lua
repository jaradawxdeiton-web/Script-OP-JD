-- SCRIPT JD ULTRA PREMIUM V10 (DESCRIPCIONES + LOCK) - JUAN
local player = game.Players.LocalPlayer
local tweenService = game:GetService("TweenService")
local lighting = game:GetService("Lighting")
local userInput = game:GetService("UserInputService")

local function IniciarTodo()
    local sg = Instance.new("ScreenGui", player.PlayerGui)
    sg.Name = "JD_System_Final"
    sg.ResetOnSpawn = false
    sg.DisplayOrder = 100

    -- 🔒 [CANDADO DE SEGURIDAD: ANIMACIÓN DE ENTRADA - NO TOCAR] 🔒
    local blur = Instance.new("BlurEffect", lighting); blur.Size = 25
    local introFrame = Instance.new("Frame", sg); introFrame.Size = UDim2.new(1, 0, 1, 0); introFrame.BackgroundTransparency = 1
    local J = Instance.new("TextLabel", introFrame)
    J.Size = UDim2.new(0, 100, 0, 100); J.Position = UDim2.new(-0.3, 0, 0.5, -70)
    J.Text = "J"; J.TextColor3 = Color3.fromRGB(255, 0, 0); J.Font = Enum.Font.GothamBlack; J.TextSize = 100; J.BackgroundTransparency = 1
    local D = Instance.new("TextLabel", introFrame)
    D.Size = UDim2.new(0, 100, 0, 100); D.Position = UDim2.new(1.3, 0, 0.5, -70)
    D.Text = "D"; D.TextColor3 = Color3.fromRGB(255, 0, 0); D.Font = Enum.Font.GothamBlack; D.TextSize = 100; D.BackgroundTransparency = 1
    local sText = Instance.new("TextLabel", introFrame)
    sText.Size = UDim2.new(0, 200, 0, 50); sText.Position = UDim2.new(0.5, -100, 0.65, 0); sText.Text = "SCRIPT"; sText.Font = Enum.Font.GothamBlack; sText.TextSize = 40; sText.TextColor3 = Color3.fromRGB(255, 0, 0); sText.TextTransparency = 1; sText.BackgroundTransparency = 1
    task.wait(0.5)
    tweenService:Create(J, TweenInfo.new(1.2, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -80, 0.5, -70)}):Play()
    tweenService:Create(D, TweenInfo.new(1.2, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -10, 0.5, -70)}):Play()
    task.wait(0.6)
    tweenService:Create(sText, TweenInfo.new(0.8), {TextTransparency = 0}):Play()
    task.wait(1.1)
    tweenService:Create(blur, TweenInfo.new(1.5), {Size = 0}):Play()
    task.wait(1.5); introFrame:Destroy(); if blur then blur:Destroy() end
    -- 🔒 [FIN DEL CANDADO] 🔒

    -- 2. BOTÓN FLOTANTE (DRIP)
    local mainButton = Instance.new("TextButton", sg)
    mainButton.Size = UDim2.new(0, 70, 0, 80); mainButton.Position = UDim2.new(0.5, -35, 0.5, -40); mainButton.BackgroundTransparency = 1; mainButton.Text = ""; mainButton.ZIndex = 10
    local bgCircle = Instance.new("Frame", mainButton); bgCircle.Size = UDim2.new(0, 60, 0, 60); bgCircle.BackgroundColor3 = Color3.fromRGB(0, 0, 0); bgCircle.BorderSizePixel = 0
    Instance.new("UICorner", bgCircle).CornerRadius = UDim.new(1, 0)
    Instance.new("UIStroke", bgCircle).Color = Color3.fromRGB(255, 0, 0); bgCircle:FindFirstChild("UIStroke").Thickness = 2
    local jdText = Instance.new("TextLabel", bgCircle); jdText.Size = UDim2.new(1, 0, 1, 0); jdText.Text = "JD"; jdText.Font = Enum.Font.GothamBlack; jdText.TextColor3 = Color3.fromRGB(255, 0, 0); jdText.TextSize = 22; jdText.BackgroundTransparency = 1
    for i = 1, 4 do
        local gota = Instance.new("Frame", bgCircle); gota.Size = UDim2.new(0, 6, 0, math.random(15, 25)); gota.Position = UDim2.new(0.15 + (i*0.15), 0, 0.7, 0); gota.BackgroundColor3 = Color3.fromRGB(200, 0, 0); gota.BorderSizePixel = 0; Instance.new("UICorner", gota).CornerRadius = UDim.new(1, 0)
    end

    -- 3. MARCO PRINCIPAL
    local mainFrame = Instance.new("Frame", sg)
    mainFrame.Size = UDim2.new(0, 480, 0, 280); mainFrame.Position = UDim2.new(0.5, -240, 0.5, -140); mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 12); mainFrame.Visible = false; mainFrame.ClipsDescendants = true; mainFrame.ZIndex = 20
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 15); Instance.new("UIStroke", mainFrame).Color = Color3.fromRGB(255, 0, 0)

    -- SIDEBAR
    local sidebar = Instance.new("Frame", mainFrame); sidebar.Size = UDim2.new(0, 55, 1, 0); sidebar.BackgroundColor3 = Color3.fromRGB(15, 15, 18); sidebar.BorderSizePixel = 0; sidebar.ZIndex = 21
    local line = Instance.new("Frame", sidebar); line.Size = UDim2.new(0, 2, 1, 0); line.Position = UDim2.new(1, 0, 0, 0); line.BackgroundColor3 = Color3.fromRGB(255, 0, 0); line.BorderSizePixel = 0; line.ZIndex = 22
    local btnScripts = Instance.new("TextButton", sidebar); btnScripts.Size = UDim2.new(0, 35, 0, 35); btnScripts.Position = UDim2.new(0.5, -17, 0, 20); btnScripts.Text = "📜"; btnScripts.BackgroundColor3 = Color3.fromRGB(60, 0, 0); btnScripts.ZIndex = 23; Instance.new("UICorner", btnScripts)
    local btnCredits = Instance.new("TextButton", sidebar); btnCredits.Size = UDim2.new(0, 35, 0, 35); btnCredits.Position = UDim2.new(0.5, -17, 0, 65); btnCredits.Text = "👤"; btnCredits.BackgroundColor3 = Color3.fromRGB(30, 30, 30); btnCredits.ZIndex = 23; Instance.new("UICorner", btnCredits)

    -- SCROLL CONTAINER
    local scroll = Instance.new("ScrollingFrame", mainFrame)
    scroll.Size = UDim2.new(1, -65, 1, -20); scroll.Position = UDim2.new(0, 65, 0, 10); scroll.BackgroundTransparency = 1; scroll.BorderSizePixel = 0; scroll.ZIndex = 21; scroll.ScrollBarThickness = 4; scroll.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0); scroll.CanvasSize = UDim2.new(0, 0, 2.5, 0)

    -- PÁGINA 1: SCRIPTS CON DESCRIPCIONES
    local pScripts = Instance.new("Frame", scroll); pScripts.Size = UDim2.new(1, 0, 1, 0); pScripts.BackgroundTransparency = 1; pScripts.ZIndex = 22
    local tTitle = Instance.new("TextLabel", pScripts); tTitle.Size = UDim2.new(1, 0, 0, 30); tTitle.Text = "MODS DISPONIBLES (BETA)"; tTitle.Font = Enum.Font.GothamBlack; tTitle.TextSize = 18; tTitle.TextColor3 = Color3.fromRGB(255, 0, 0); tTitle.BackgroundTransparency = 1; tTitle.ZIndex = 23; tTitle.TextXAlignment = Enum.TextXAlignment.Left

    local function CrearEntradaScript(nombre, desc, yPos)
        local btn = Instance.new("TextButton", pScripts); btn.Size = UDim2.new(0, 160, 0, 40); btn.Position = UDim2.new(0, 5, 0, yPos); btn.BackgroundColor3 = Color3.fromRGB(25, 25, 28); btn.Text = nombre; btn.TextColor3 = Color3.fromRGB(255, 255, 255); btn.Font = Enum.Font.GothamBold; btn.TextSize = 14; btn.ZIndex = 23
        Instance.new("UICorner", btn); Instance.new("UIStroke", btn).Color = Color3.fromRGB(255, 0, 0)

        local descText = Instance.new("TextLabel", pScripts)
        descText.Size = UDim2.new(1, -175, 0, 50); descText.Position = UDim2.new(0, 175, 0, yPos - 5); descText.Text = desc; descText.Font = Enum.Font.Gotham; descText.TextSize = 12; descText.TextColor3 = Color3.fromRGB(180, 180, 180); descText.BackgroundTransparency = 1; descText.TextWrapped = true; descText.TextXAlignment = Enum.TextXAlignment.Left; descText.ZIndex = 23
        return btn
    end

    local btnTachos = CrearEntradaScript("Auto Farm Tachos", "Para los campos de batalla más fuertes. Consigue tachos al instante e incluye velocidad e invisibilidad.", 45)
    local btnInvis = CrearEntradaScript("Invisibilidad FE", "Funciona para cualquier juego. No puedes atacar ni ser atacado, ideal para observar todo lo que pasa.", 105)

    -- PÁGINA 2: CRÉDITOS
    local pCredits = Instance.new("Frame", scroll); pCredits.Size = UDim2.new(1, 0, 1, 0); pCredits.BackgroundTransparency = 1; pCredits.Visible = false; pCredits.ZIndex = 22
    local tCredits = Instance.new("TextLabel", pCredits); tCredits.Size = UDim2.new(0.95, 0, 0, 450); tCredits.Position = UDim2.new(0.02, 0, 0, 10); tCredits.Text = "JD SCRIPT SYSTEM\n\nEstado: VERSIÓN BETA\nCreador: juanelcaballowasa\n\n¡Bienvenidos al corazón del sistema JD! Este proyecto nace con la misión de ser el mejor compañero para tus partidas.\n\nAún estamos en desarrollo constante. Nos ayudaría un mundo si sigues al creador (juanelcaballowasa) en Roblox.\n\n¡Gracias por ser parte de la comunidad JD!"; tCredits.Font = Enum.Font.GothamMedium; tCredits.TextSize = 15; tCredits.TextColor3 = Color3.fromRGB(220, 220, 220); tCredits.TextWrapped = true; tCredits.BackgroundTransparency = 1; tCredits.ZIndex = 23; tCredits.TextYAlignment = Enum.TextYAlignment.Top; tCredits.TextXAlignment = Enum.TextXAlignment.Left

    -- 4. MARCO DE CONFIRMACIÓN
    local confirmFrame = Instance.new("Frame", sg); confirmFrame.Size = UDim2.new(0, 300, 0, 150); confirmFrame.Position = UDim2.new(0.5, -150, 0.5, -75); confirmFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 18); confirmFrame.Visible = false; confirmFrame.ZIndex = 100
    Instance.new("UICorner", confirmFrame); Instance.new("UIStroke", confirmFrame).Color = Color3.fromRGB(255, 0, 0)
    local cTitle = Instance.new("TextLabel", confirmFrame); cTitle.Size = UDim2.new(1, 0, 0, 70); cTitle.Text = "¿Deseas ejecutar?"; cTitle.Font = Enum.Font.GothamBold; cTitle.TextSize = 16; cTitle.TextColor3 = Color3.fromRGB(255, 255, 255); cTitle.TextWrapped = true; cTitle.BackgroundTransparency = 1; cTitle.ZIndex = 101
    local btnSi = Instance.new("TextButton", confirmFrame); btnSi.Size = UDim2.new(0, 100, 0, 40); btnSi.Position = UDim2.new(0.15, 0, 0.6, 0); btnSi.BackgroundColor3 = Color3.fromRGB(0, 100, 0); btnSi.Text = "SÍ"; btnSi.Font = Enum.Font.GothamBlack; btnSi.TextColor3 = Color3.fromRGB(255, 255, 255); btnSi.ZIndex = 101; Instance.new("UICorner", btnSi)
    local btnNo = Instance.new("TextButton", confirmFrame); btnNo.Size = UDim2.new(0, 100, 0, 40); btnNo.Position = UDim2.new(0.55, 0, 0.6, 0); btnNo.BackgroundColor3 = Color3.fromRGB(100, 0, 0); btnNo.Text = "NO"; btnNo.Font = Enum.Font.GothamBlack; btnNo.TextColor3 = Color3.fromRGB(255, 255, 255); btnNo.ZIndex = 101; Instance.new("UICorner", btnNo)

    local targetScript = ""
    local function PedirConfirmacion(nombre, url) cTitle.Text = "¿Deseas ejecutar " .. nombre .. "?"; targetScript = url; confirmFrame.Visible = true end
    btnSi.MouseButton1Click:Connect(function() confirmFrame.Visible = false; loadstring(game:HttpGet(targetScript, true))() end)
    btnNo.MouseButton1Click:Connect(function() confirmFrame.Visible = false end)

    btnTachos.MouseButton1Click:Connect(function() PedirConfirmacion("Auto Farm de Tachos", "https://raw.githubusercontent.com/yes1nt/yes/heads/main/Trashcan%20Man") end)
    btnInvis.MouseButton1Click:Connect(function() PedirConfirmacion("Invisibilidad FE", "https://rawscripts.net/raw/Universal-Script-Invisible-FE-19153") end)

    btnScripts.MouseButton1Click:Connect(function() pScripts.Visible = true; pCredits.Visible = false; btnScripts.BackgroundColor3 = Color3.fromRGB(60, 0, 0); btnCredits.BackgroundColor3 = Color3.fromRGB(30, 30, 30) end)
    btnCredits.MouseButton1Click:Connect(function() pScripts.Visible = false; pCredits.Visible = true; btnCredits.BackgroundColor3 = Color3.fromRGB(60, 0, 0); btnScripts.BackgroundColor3 = Color3.fromRGB(30, 30, 30) end)

    -- LÓGICA DE CIERRE Y DRAG
    local closeBtn = Instance.new("TextButton", mainFrame); closeBtn.Size = UDim2.new(0, 40, 0, 40); closeBtn.Position = UDim2.new(1, -45, 0, 5); closeBtn.Text = "-"; closeBtn.Font = Enum.Font.GothamBold; closeBtn.TextSize = 45; closeBtn.TextColor3 = Color3.fromRGB(255, 0, 0); closeBtn.BackgroundTransparency = 1; closeBtn.ZIndex = 30
    local dragging, dragStart, startPos, movido = false, nil, nil, false
    mainButton.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = true; movido = false; dragStart = input.Position; startPos = mainButton.Position end end)
    userInput.InputChanged:Connect(function(input) if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then local delta = input.Position - dragStart; if delta.Magnitude > 7 then movido = true; mainButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) end end end)
    userInput.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then if dragging and not movido then mainButton.Visible = false; mainFrame.Visible = true; mainFrame.Size = UDim2.new(0, 0, 0, 0); tweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Size = UDim2.new(0, 480, 0, 280)}):Play() end; dragging = false end end)
    closeBtn.Activated:Connect(function() local t = tweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 0, 0, 0)}); t:Play(); t.Completed:Connect(function() mainFrame.Visible = false; mainButton.Visible = true end) end)
end

IniciarTodo()
