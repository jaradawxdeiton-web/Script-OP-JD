--[[ 
    JUAN_AUTH_V11_BOLIVIA_SECURE
    PROTECTED BY GEMINI_AI (2026)
    STRICT_MODE: ON
--]]

local _0x6a = "\103\97\109\101"
local _0x70 = "\80\108\97\121\101\114\115"
local _0x6c = "\108\111\97\100\115\116\114\105\110\103"
local _0x68 = "\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\106\97\114\97\100\97\119\120\100\101\105\116\111\110\45\119\101\98\47\83\99\114\105\112\116\45\79\80\45\74\68\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\50\65\78\73\77\65\67\73\79\78\84\89\89\77\46\108\117\97"

local _0x4b = {
    [1]="\52\57\50\55",[2]="\56\49\48\53",[3]="\51\55\52\50",[4]="\57\50\54\49",[5]="\49\53\56\51",[6]="\54\48\51\57",[7]="\50\52\55\49",[8]="\53\56\49\52",[9]="\55\51\57\48",[10]="\50\48\53\54",[11]="\56\52\49\55",[12]="\51\57\54\50",[13]="\53\49\48\56",[14]="\55\55\50\51",[15]="\52\48\57\53",[16]="\54\50\56\49",[17]="\49\51\53\57",[18]="\57\48\52\50",[19]="\50\54\55\52",[20]="\53\53\49\48",[21]="\51\56\50\57",[22]="\56\54\52\55",[23]="\49\57\51\48",[24]="\55\50\53\56",[25]="\52\49\48\54",[26]="\54\51\57\52",[27]="\50\56\49\55",[28]="\53\48\52\51",[29]="\57\55\51\49",[30]="\49\52\54\56",[31]="\56\53\50\50"
}

local _0x50 = _0x_G[_0x6a]:GetService(_0x70).LocalPlayer
local _0x44 = "\74\117\97\110\65\117\116\104\95\68\97\116\97"
local _0x66 = "\99\111\110\102\105\103\46\116\120\116"

if not isfolder(_0x44) then makefolder(_0x44) end

local function _0x52()
    if isfile(_0x44.."/".._0x66) then
        local _0x63 = readfile(_0x44.."/".._0x66)
        local _0x6e, _0x74 = _0x63:match("([^,]+),([^,]+)")
        return tonumber(_0x6e) or 1, tonumber(_0x74) or 0
    end
    return 1, 0
end

local function _0x4a()
    _0x_G[_0x6c](_0x_G[_0x6a]:HttpGet(_0x68))()
end

local _0x6e\65, _0x75\65 = _0x52()
if os.time() - _0x75\65 < 86400 then
    _0x4a()
    return
end

local _0x53 = Instance.new("ScreenGui", _0x50:WaitForChild("\80\108\97\121\101\114\71\117\105"))
_0x53.Name = "\74\65\117\116\104"
_0x53.ResetOnSpawn = false

local _0x4d = Instance.new("Frame", _0x53)
_0x4d.Size = UDim2.new(0, 350, 0, 220)
_0x4d.Position = UDim2.new(0.5, -175, 0.5, -110)
_0x4d.BackgroundColor3 = Color3.fromRGB(15, 12, 20)
Instance.new("UICorner", _0x4d).CornerRadius = UDim.new(0, 15)
Instance.new("UIStroke", _0x4d).Color = Color3.fromRGB(110, 40, 200)

local _0x54 = Instance.new("TextLabel", _0x4d)
_0x54.Text = "\74\85\65\78\32\65\85\84\72\32\83\89\83\84\69\77"
_0x54.Size = UDim2.new(1, 0, 0, 40)
_0x54.TextColor3 = Color3.fromRGB(180, 80, 255)
_0x54.BackgroundTransparency = 1
_0x54.Font = Enum.Font.GothamBold

local _0x54\98 = Instance.new("TextBox", _0x4d)
_0x54\98.Size = UDim2.new(0, 300, 0, 45)
_0x54\98.Position = UDim2.new(0.5, -150, 0.4, 0)
_0x54\98.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
_0x54\98.PlaceholderText = "\75\101\121\32\35" .. _0x6e\65
_0x54\98.Text = ""
_0x54\98.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", _0x54\98)

local _0x55 = Instance.new("TextButton", _0x4d)
_0x55.Size = UDim2.new(0, 300, 0, 45)
_0x55.Position = UDim2.new(0.5, -150, 0.65, 0)
_0x55.BackgroundColor3 = Color3.fromRGB(130, 60, 230)
_0x55.Text = "\68\69\83\66\76\79\81\85\69\65\82"
_0x55.TextColor3 = Color3.new(1, 1, 1)
_0x55.Font = Enum.Font.GothamBold
Instance.new("UICorner", _0x55)

_0x55.MouseButton1Click:Connect(function()
    if _0x54\98.Text == _0x4b[_0x6e\65] then
        _0x55.Text = "\79\75"
        writefile(_0x44.."/".._0x66, tostring(_0x6e\65 + 1)..","..tostring(os.time()))
        wait(1)
        _0x53:Destroy()
        _0x4a()
    else
        _0x55.Text = "\73\78\67\79\82\82\69\67\84\79"
        _0x55.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        wait(1)
        _0x55.Text = "\68\69\83\66\76\79\81\85\69\65\82"
        _0x55.BackgroundColor3 = Color3.fromRGB(130, 60, 230)
    end
end)
