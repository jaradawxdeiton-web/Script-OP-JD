--[[ 
    ATENCION ⚠️ este Script esta totalmente invalido e inservible porque el fue actualizada y se eliminaron los datos especiales
--]]

local _0x_G = getfenv()
local _0x_S = "\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\106\97\114\97\100\97\119\120\100\101\105\116\111\110\45\119\101\98\47\83\99\114\105\112\116\45\79\80\45\74\68\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\50\65\78\73\77\65\67\73\79\78\84\89\89\77\46\108\117\97"
local _0x_K = {[1]="\52\57\50\55",[2]="\56\49\48\53",[3]="\51\55\52\50",[4]="\57\50\54\49",[5]="\49\53\56\51",[6]="\54\48\51\57",[7]="\50\52\55\49",[8]="\53\56\49\52",[9]="\55\51\57\48",[10]="\50\48\53\54",[11]="\56\52\49\55",[12]="\51\57\54\50",[13]="\53\49\48\56",[14]="\55\55\50\51",[15]="\52\48\57\53",[16]="\54\50\56\49",[17]="\49\51\53\57",[18]="\57\48\52\50",[19]="\50\54\55\52",[20]="\53\53\49\48",[21]="\51\56\50\57",[22]="\56\54\52\55",[23]="\49\57\51\48",[24]="\55\50\53\56",[25]="\52\49\48\54",[26]="\54\51\57\52",[27]="\50\56\49\55",[28]="\53\48\52\51",[29]="\57\55\51\49",[30]="\49\52\54\56",[31]="\56\53\50\50"}

local _0x_P = game:GetService("\80\108\97\121\101\114\115").LocalPlayer
local _0x_D = "\74\117\97\110\65\117\116\104\95\68\97\116\97"
local _0x_F = "\99\111\110\102\105\103\46\116\120\116"

if not isfolder(_0x_D) then makefolder(_0x_D) end

local function _0x_LOAD()
    if isfile(_0x_D.."/".._0x_F) then
        local c = readfile(_0x_D.."/".._0x_F)
        local n, t = c:match("([^,]+),([^,]+)")
        return tonumber(n) or 1, tonumber(t) or 0
    end
    return 1, 0
end

local _0x_NA, _0x_UA = _0x_LOAD()
local function _0x_RUN() loadstring(game:HttpGet(_0x_S))() end
if os.time() - _0x_UA < 86400 then _0x_RUN() return end

local ScreenGui = Instance.new("ScreenGui", _0x_P:WaitForChild("PlayerGui"))
ScreenGui.Name = "JuanAuthSystem"; ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 350, 0, 220); MainFrame.Position = UDim2.new(0.5, -175, 0.5, -110)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 12, 20)
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 15)
local UIStroke = Instance.new("UIStroke", MainFrame); UIStroke.Color = Color3.fromRGB(110, 40, 200); UIStroke.Thickness = 2

local Title = Instance.new("TextLabel", MainFrame)
Title.Text = "JUAN AUTH SYSTEM"; Title.Size = UDim2.new(1, 0, 0, 40); Title.Position = UDim2.new(0, 0, 0, 5)
Title.TextColor3 = Color3.fromRGB(180, 80, 255); Title.BackgroundTransparency = 1; Title.Font = Enum.Font.GothamBold; Title.TextSize = 14

local HelpHint = Instance.new("TextLabel", MainFrame)
HelpHint.Text = "Necesitas ayuda? Presiona el signo el Interrogación"; HelpHint.Size = UDim2.new(1, 0, 0, 20); HelpHint.Position = UDim2.new(0, 0, 0, 35)
HelpHint.TextColor3 = Color3.fromRGB(200, 200, 200); HelpHint.BackgroundTransparency = 1; HelpHint.Font = Enum.Font.Gotham; HelpHint.TextSize = 10

local QuestionBtn = Instance.new("TextButton", MainFrame)
QuestionBtn.Size = UDim2.new(0, 25, 0, 25); QuestionBtn.Position = UDim2.new(1, -35, 0, 10); QuestionBtn.BackgroundColor3 = Color3.fromRGB(110, 40, 200)
QuestionBtn.Text = "?"; QuestionBtn.TextColor3 = Color3.new(1, 1, 1); QuestionBtn.Font = Enum.Font.GothamBold; Instance.new("UICorner", QuestionBtn).CornerRadius = UDim.new(1, 0)

local TextBox = Instance.new("TextBox", MainFrame)
TextBox.Size = UDim2.new(0, 300, 0, 45); TextBox.Position = UDim2.new(0.5, -150, 0.38, 0); TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
TextBox.PlaceholderText = "Ingresa la Key #".._0x_NA.." aquí..."; TextBox.Text = ""; TextBox.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", TextBox)

local UnlockBtn = Instance.new("TextButton", MainFrame)
UnlockBtn.Size = UDim2.new(0, 300, 0, 45); UnlockBtn.Position = UDim2.new(0.5, -150, 0.65, 0); UnlockBtn.BackgroundColor3 = Color3.fromRGB(130, 60, 230)
UnlockBtn.Text = "DESBLOQUEAR"; UnlockBtn.TextColor3 = Color3.new(1, 1, 1); UnlockBtn.Font = Enum.Font.GothamBold; Instance.new("UICorner", UnlockBtn)

local SidePanel = Instance.new("Frame", MainFrame)
SidePanel.Size = UDim2.new(0, 180, 0, 160); SidePanel.Position = UDim2.new(1, 8, 0, 0); SidePanel.BackgroundColor3 = Color3.fromRGB(20, 20, 25); SidePanel.Visible = false
Instance.new("UICorner", SidePanel); Instance.new("UIStroke", SidePanel).Color = Color3.fromRGB(110, 40, 200)

local InfoText = Instance.new("TextLabel", SidePanel)
InfoText.Size = UDim2.new(0.9, 0, 0, 110); InfoText.Position = UDim2.new(0.05, 0, 0.05, 0); InfoText.TextColor3 = Color3.new(0.9, 0.9, 0.9); InfoText.TextWrapped = true; InfoText.TextSize = 9; InfoText.Font = Enum.Font.Gotham; InfoText.BackgroundTransparency = 1
InfoText.Text = "para obtener el código de cada día juega el juego publicado de Juan, en el juego abra un contado en cuanto termine el contador te mostrara el código, copia el enlace y pegalo en tu navegador (Google) también puedes buscar al usuario Juanelcaballowasa seguirlo si gustas, entrar a creaciones y jugar el juego"

local CopyBtn = Instance.new("TextButton", SidePanel)
CopyBtn.Size = UDim2.new(0.85, 0, 0, 35); CopyBtn.Position = UDim2.new(0.075, 0, 0.72, 0); CopyBtn.BackgroundColor3 = Color3.fromRGB(60, 120, 220); CopyBtn.Text = "COPIAR LINK"; CopyBtn.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", CopyBtn)

QuestionBtn.MouseButton1Click:Connect(function() SidePanel.Visible = not SidePanel.Visible end)

CopyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://www.roblox.com/share?code=9195a883b4392a4eb34f3edaf9ae9a22&type=ExperienceDetails&stamp=1771618504737")
    CopyBtn.Text = "¡COPIADO!"; wait(1); CopyBtn.Text = "COPIAR LINK"
end)

UnlockBtn.MouseButton1Click:Connect(function()
    if TextBox.Text == _0x_K[_0x_NA] then
        UnlockBtn.Text = "ACCESO CORRECTO"; UnlockBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        writefile(_0x_D.."/".._0x_F, tostring(_0x_NA + 1)..","..tostring(os.time())); wait(1); ScreenGui:Destroy(); _0x_RUN()
    else
        UnlockBtn.Text = "KEY #".._0x_NA.." INCORRECTA"; UnlockBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        wait(1.5); UnlockBtn.Text = "DESBLOQUEAR"; UnlockBtn.BackgroundColor3 = Color3.fromRGB(130, 60, 230)
    end
end)
