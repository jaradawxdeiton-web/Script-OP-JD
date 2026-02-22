local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

-- 1. Crear Interfaz
local SG = Instance.new("ScreenGui", CoreGui)
local Boton = Instance.new("TextButton", SG)

-- 2. Configuración del Botón (Tamaño reducido a 65)
Boton.Name = "BotonJD_Ajustado"
Boton.Size = UDim2.new(0, 0, 0, 0) -- Inicio para animación
Boton.Position = UDim2.new(0.5, 0, 0.5, 0)
Boton.AnchorPoint = Vector2.new(0.5, 0.5)
Boton.BorderSizePixel = 0
Boton.AutoButtonColor = false

-- Fondo Negro, Rojo y Guindo
local GradienteFondo = Instance.new("UIGradient", Boton)
GradienteFondo.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),     -- Negro
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200, 0, 0)), -- Rojo
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 0, 20))   -- Guindo
})

Boton.Text = "JD"
Boton.TextColor3 = Color3.fromRGB(0, 255, 255) -- Celeste
Boton.TextSize = 28 
Boton.Font = Enum.Font.Creepster

-- Hacerlo circular
Instance.new("UICorner", Boton).CornerRadius = UDim.new(1, 0)

-- 3. EL BORDE CIRCULAR NEGRO
local BordeDecorado = Instance.new("Frame", Boton)
BordeDecorado.Name = "BordeNegro"
BordeDecorado.Size = UDim2.new(1.15, 0, 1.15, 0)
BordeDecorado.Position = UDim2.new(0.5, 0, 0.5, 0)
BordeDecorado.AnchorPoint = Vector2.new(0.5, 0.5)
BordeDecorado.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BordeDecorado.ZIndex = 0

Instance.new("UICorner", BordeDecorado).CornerRadius = UDim.new(1, 0)

-- 4. Animación de Aparición (Zoom In)
Boton:TweenSize(UDim2.new(0, 65, 0, 65), "Out", "Back", 0.6, true)

-- 5. Lógica Movible (Drag)
local drag, start, pos
Boton.InputBegan:Connect(function(i) 
    if i.UserInputType.Name:find("Button1") or i.UserInputType.Name == "Touch" then 
        drag, start, pos = true, i.Position, Boton.Position 
    end 
end)

UIS.InputChanged:Connect(function(i) 
    if drag and (i.UserInputType.Name == "MouseMovement" or i.UserInputType.Name == "Touch") then 
        local delta = i.Position - start
        Boton.Position = UDim2.new(pos.X.Scale, pos.X.Offset + delta.X, pos.Y.Scale, pos.Y.Offset + delta.Y) 
    end 
end)
Boton.InputEnded:Connect(function() drag = false end)

--- NUEVA FUNCIÓN DE CLICK CON AUTODESTRUCCIÓN ---
Boton.MouseButton1Click:Connect(function()
    -- 1. Elimina el círculo y toda su interfaz de inmediato
    SG:Destroy()
    
    -- 2. Ejecuta el script de Panel.lua
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jaradawxdeiton-web/Script-OP-JD/refs/heads/main/Panel.lua"))()
end)
