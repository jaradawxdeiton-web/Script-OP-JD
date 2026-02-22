local botonComprar = script.Parent
local marco = botonComprar.Parent
local screenGui = marco.Parent
 
-- MARCO DE CONFIRMACIÓN CON ZINDEX MUY ALTO
local marcoConfirm = Instance.new("Frame")
marcoConfirm.Name = "MarcoConfirmacion"
marcoConfirm.Size = UDim2.new(0, 450, 0, 250)
marcoConfirm.Position = UDim2.new(0.5, -225, 0.5, -125)
marcoConfirm.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
marcoConfirm.BackgroundTransparency = 0
marcoConfirm.Visible = false
marcoConfirm.ZIndex = 1000
marcoConfirm.Parent = screenGui
 
-- Borde negro grueso
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0, 0, 0)
stroke.Thickness = 6
stroke.Parent = marcoConfirm
 
-- Esquinas redondeadas
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15)
corner.Parent = marcoConfirm
 
-- TÍTULO NEGRO
local titulo = Instance.new("TextLabel")
titulo.Size = UDim2.new(1, -40, 0, 60)
titulo.Position = UDim2.new(0, 20, 0, 20)
titulo.BackgroundTransparency = 1
titulo.Text = "🎯 CONFIRMAR COMPRA"
titulo.TextColor3 = Color3.fromRGB(0, 0, 0)
titulo.TextSize = 24
titulo.Font = Enum.Font.GothamBlack
titulo.TextWrapped = true
titulo.ZIndex = 1001
titulo.Parent = marcoConfirm
 
-- TEXTO PRINCIPAL NEGRO
local texto = Instance.new("TextLabel")
texto.Size = UDim2.new(1, -40, 0, 70)
texto.Position = UDim2.new(0, 20, 0, 90)
texto.BackgroundTransparency = 1
texto.Text = "¿Estás seguro de que quieres adquirir la\nBOBINA DE VELOCIDAD por GRATIS?"
texto.TextColor3 = Color3.fromRGB(0, 0, 0)
texto.TextSize = 20
texto.Font = Enum.Font.GothamBold
texto.TextWrapped = true
texto.ZIndex = 1001
texto.Parent = marcoConfirm
 
-- BOTÓN SÍ
local botonSi = Instance.new("TextButton")
botonSi.Size = UDim2.new(0, 150, 0, 50)
botonSi.Position = UDim2.new(0, 50, 0, 180)
botonSi.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
botonSi.Text = "✅ SÍ, COMPRAR"
botonSi.TextColor3 = Color3.fromRGB(255, 255, 255)
botonSi.TextSize = 18
botonSi.Font = Enum.Font.GothamBold
botonSi.ZIndex = 1001
botonSi.Parent = marcoConfirm
 
local cornerSi = Instance.new("UICorner")
cornerSi.CornerRadius = UDim.new(0, 10)
cornerSi.Parent = botonSi
 
-- BOTÓN NO
local botonNo = Instance.new("TextButton")
botonNo.Size = UDim2.new(0, 150, 0, 50)
botonNo.Position = UDim2.new(1, -200, 0, 180)
botonNo.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
botonNo.Text = "❌ CANCELAR"
botonNo.TextColor3 = Color3.fromRGB(255, 255, 255)
botonNo.TextSize = 18
botonNo.Font = Enum.Font.GothamBold
botonNo.ZIndex = 1001
botonNo.Parent = marcoConfirm
 
local cornerNo = Instance.new("UICorner")
cornerNo.CornerRadius = UDim.new(0, 10)
cornerNo.Parent = botonNo
 
-- FUNCIÓN PARA MOSTRAR MARCO
botonComprar.MouseButton1Click:Connect(function()
    marcoConfirm.Visible = true
end)
 
-- FUNCIÓN BOTÓN SÍ CON REMOTEEVENT Y SONIDO
botonSi.MouseButton1Click:Connect(function()
    -- 🔊 REPRODUCIR SONIDO DE COMPRA
    local sonidoCompra = Instance.new("Sound")
    sonidoCompra.SoundId = "rbxassetid://133292918309565"
    sonidoCompra.Parent = game.Workspace
    sonidoCompra:Play()
    
    -- 📨 ENVIAR SOLICITUD DE COMPRA
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local comprarEvent = ReplicatedStorage:FindFirstChild("ComprarBobinaEvent")
    
    if comprarEvent then
        comprarEvent:FireServer()
        print("🟡 Solicitud de compra enviada al servidor")
    else
        print("❌ No se encontró ComprarBobinaEvent")
    end
    
    marcoConfirm.Visible = false
    marco.Visible = false
end)
 
-- FUNCIÓN BOTÓN NO
botonNo.MouseButton1Click:Connect(function()
    marcoConfirm.Visible = false
end)
 
print("🎯 Sistema de compra con RemoteEvent y SONIDO LISTO!")
