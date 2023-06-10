local FovFunction = nil
local Fov = 120

for i,v in pairs(getreg()) do
    if type(v) == "function" and getfenv(v).script and getfenv(v).script.Name == "Camera" then
        if type(v) == "function" and #getupvalues(v) > 17 then
            FovFunction = v
        end
    end
end

--Locals
if syn then request = syn.request end

local Framework, Esp, Aimbot, Crosshair = loadstring(request({Url="https://raw.githubusercontent.com/E118600C0293859436ECCB95331473386AD122K/Framework/main/Main.lua"}).Body)()
local AllowedOres = {"StoneOre","NitrateOre","IronOre"}
local Camera = game:GetService("Workspace").CurrentCamera
Aimbot.Settings.SilentEnabled = false

local PlayerCache = {}

Aimbot:CreateFov()
Esp:LocalChams()

for i,v in pairs(Framework:GetPlayers()) do
    Esp:AddPlayer(v.model,v)
    if not table.find(PlayerCache,v) then
        table.insert(PlayerCache,v)
    end
end

game.workspace.ChildAdded:Connect(function(child)
    if child:FindFirstChild("HumanoidRootPart") then
        for i,v in pairs(Framework:GetPlayers()) do
            if not table.find(PlayerCache,v) then
                Esp:AddPlayer(v.model,v)
                table.insert(PlayerCache,v)
            end
        end
    end
end)

function DetectMods(UserId)
    local tbl = {}
    tbl[112995674] = "Mod Detected | UserId: "..UserId.." | Rank: Owner | Name: shylou"
    tbl[17698974] = "Mod Detected | UserId: "..UserId.." | Rank: Devolper | Name: SteffJonez"
    tbl[50464767] = "Mod Detected | UserId: "..UserId.." | Rank: Admin | Name: Bree"
    tbl[61105506] = "Mod Detected | UserId: "..UserId.." | Rank: SuperVisor | Name: Fredo"
    tbl[71278730] = "Mod Detected | UserId: "..UserId.." | Rank: SuperVisor | Name: Ghost"
    tbl[144580377] = "Mod Detected | UserId: "..UserId.." | Rank: SuperVisor | Name: Shiming"
    tbl[471145875] = "Mod Detected | UserId: "..UserId.." | Rank: Head Mod | Name: Aulut"
    tbl[495632825] = "Mod Detected | UserId: "..UserId.." | Rank: Senoir Moderator | Name: add"
    tbl[115532014] = "Mod Detected | UserId: "..UserId.." | Rank: Senoir Moderator | Name: Azen"
    tbl[121539737] = "Mod Detected | UserId: "..UserId.." | Rank: Senoir Moderator | Name: odneyray"
    tbl[1002316147] = "Mod Detected | UserId: "..UserId.." | Rank: Senoir Moderator | Name: Stormzy"
    tbl[2066193356] = "Mod Detected | UserId: "..UserId.." | Rank: Moderator | Name: WaterPipe"
    tbl[294183787] = "Mod Detected | UserId: "..UserId.." | Rank: Moderator | Name: Nougat"
    tbl[2061087650] = "Mod Detected | UserId: "..UserId.." | Rank: Moderator | Name: $Issac"
    tbl[2688293337] = "Mod Detected | UserId: "..UserId.." | Rank: Moderator | Name: !robofish"
    tbl[91229278] = "Mod Detected | UserId: "..UserId.." | Rank: Moderator | Name: saveme"
    tbl[74706314] = "Mod Detected | UserId: "..UserId.." | Rank: Trial Moderator | Name: zuh"
    tbl[338731269] = "Mod Detected | UserId: "..UserId.." | Rank: Retired Staff | Name: Itzi"
    tbl[125587459] = "Mod Detected | UserId: "..UserId.." | Rank: Retired Staff | Name: nuri"
    tbl[92752600] = "Mod Detected | UserId: "..UserId.." | Rank: Retired Staff | Name: Varnox"
    tbl[144580377] = "Mod Detected | UserId: "..UserId.." | Rank: HR | Name: Shimming29"
    tbl[24977621] =  "Mod Detected | UserId: "..UserId.." | Rank: Devolper | Name: SteffJonez"
    return tbl[UserId]
end

--GUI
local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/VertigoCool99/LoadScript/main/Uii.lua'))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/VertigoCool99/LoadScript/main/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({Title = 'Float | Private',Center = true, AutoShow = true,})

Library.KeybindFrame.Visible = true;
Library:SetWatermarkVisibility(true)
Library:SetWatermark('Float | Private')
Library:OnUnload(function() Library.Unloaded = true end)

local Tabs = {Combat = Window:AddTab('Combat'),Visual = Window:AddTab('Visual'),Misc=Window:AddTab('Misc'),['UI Settings'] = Window:AddTab('UI Settings'),}

local PlayerVisualTabbox = Tabs.Visual:AddLeftTabbox()
local PlayerVisualTab = PlayerVisualTabbox:AddTab('Players')
local OreVisualTabbox = Tabs.Visual:AddRightTabbox()
local OreVisualTab = OreVisualTabbox:AddTab('Ores')
local ItemsVisualTabbox = Tabs.Visual:AddRightTabbox()
local ItemsVisualTab = ItemsVisualTabbox:AddTab('Items')
local CrosshairVisualTabbox = Tabs.Visual:AddLeftTabbox()
local CrosshairVisualTab = CrosshairVisualTabbox:AddTab('Crosshair')
local LocalPlayerVisualTabbox = Tabs.Visual:AddRightTabbox()
local LocalPlayerVisualTab = LocalPlayerVisualTabbox:AddTab('Local Player')

local MiscTabbox = Tabs.Misc:AddRightTabbox()
local MiscTab = MiscTabbox:AddTab('Visual')
local SoundsMiscTabbox = Tabs.Misc:AddLeftTabbox()
local SoundsMiscTab = SoundsMiscTabbox:AddTab('Sounds')

local AimbotTabbox = Tabs.Combat:AddLeftTabbox()
local AimbotTab = AimbotTabbox:AddTab('Aimbot')
local SilentAimTab = AimbotTabbox:AddTab('Silent Aim')
local GunTabbox = Tabs.Combat:AddRightTabbox()
local GunTab = GunTabbox:AddTab('Gun Modification')
local PlayerTabbox = Tabs.Combat:AddRightTabbox()
local PlayerTab = PlayerTabbox:AddTab('Players')

local FovTabbox = Tabs.Combat:AddLeftTabbox()
local FovTab = FovTabbox:AddTab('Fov Circle')

Esp:CreateCrosshair()

AimbotTab:AddLabel('Aimbot'):AddKeyPicker('AimbotKey', {Default = 'MB2',SyncToggleState = false, Mode = 'Hold',Text = 'Aimbot',NoUI = false,})
AimbotTab:AddSlider('Smoothing', {Text = 'Smoothing',Default = 2,Min = 1,Max = 10,Rounding = 1,Compact = false,})
AimbotTab:AddToggle('TargetSleepers', {Text = 'Dont Target Sleepers',Default = false})
AimbotTab:AddToggle('Prediction', {Text = 'Prediction',Default = true})
AimbotTab:AddToggle('DropPrediction', {Text = 'Drop Prediction',Default = false})
AimbotTab:AddDropdown('FovHitpart', {Values = {"Head","HumanoidRootPart","Torso"},Default = 1,Multi = false,Text = 'Hitpart'})

SilentAimTab:AddToggle('SilentEnabled', {Text = 'Silent Enabled',Default = true})
SilentAimTab:AddToggle('TeamCheckSilent', {Text = 'Team Check',Default = false})
SilentAimTab:AddDropdown('FovHitpartSilent', {Values = {"Head","HumanoidRootPart","Torso"},Default = 1,Multi = false,Text = 'Hitpart'})
SilentAimTab:AddSlider('HitChance', {Text = 'Hit Chance',Default = 100,Min = 1,Max = 100,Rounding = 0,Compact = false})

FovTab:AddToggle('FovEnabled', {Text = 'Fov',Default = true}):AddColorPicker('FovColor', {Default = Color3.fromRGB(255,0,76),Title = 'Fov',})
FovTab:AddSlider('FovSize', {Text = 'Fov Size',Default = 100,Min = 5,Max = 1000,Rounding = 0,Compact = false,})

GunTab:AddToggle('NoRecoilToggle', {Text = 'No Recoil',Default = true})

PlayerVisualTab:AddToggle('PlayerBoxes', {Text = 'Box',Default = false}):AddColorPicker('PlayerBoxColor', {Default = Color3.fromRGB(255,0,76),Title = 'Box',})
PlayerVisualTab:AddToggle('PlayerDistance', {Text = 'Distance',Default = false}):AddColorPicker('PlayerDistanceColor', {Default = Color3.fromRGB(255,0,76),Title = 'Distance',})
PlayerVisualTab:AddToggle('PlayerSleeping', {Text = 'Sleeping',Default = false}):AddColorPicker('PlayerSleepingColor', {Default = Color3.fromRGB(255,0,76),Title = 'Sleeping',})
PlayerVisualTab:AddToggle('PlayerArmor', {Text = 'Armor',Default = false}):AddColorPicker('PlayerArmorColor', {Default = Color3.fromRGB(255,0,76),Title = 'Armor',})
PlayerVisualTab:AddSlider('PlayerRenderDistance', {Text = 'Render Distance',Default = 500,Min = 1,Max = 1000,Rounding = 0,Compact = false,})
PlayerVisualTab:AddToggle('TeamCheckEsp', {Text = 'Team Check',Default = false})

OreVisualTab:AddLabel("WIP")
OreVisualTab:AddToggle('OreNames', {Text = 'Name',Default = false})
OreVisualTab:AddToggle('OreDistance', {Text = 'Distance',Default = false})
OreVisualTab:AddSlider('OreRenderDistance', {Text = 'Render Distance',Default = 500,Min = 1,Max = 1000,Rounding = 0,Compact = false,})
ItemsVisualTab:AddLabel("WIP")
ItemsVisualTab:AddToggle('ItemNames', {Text = 'Name',Default = false})
ItemsVisualTab:AddToggle('ItemDistance', {Text = 'Distance',Default = false})
ItemsVisualTab:AddSlider('ItemRenderDistance', {Text = 'Render Distance',Default = 500,Min = 1,Max = 1000,Rounding = 0,Compact = false,})

CrosshairVisualTab:AddToggle('CrosshairEnabled', {Text = 'Enabled',Default = false}):AddColorPicker('CrosshairColor', {Default = Color3.fromRGB(255,0,76),Title = 'Crosshair',})
CrosshairVisualTab:AddSlider('CrosshairSize', {Text = 'Size',Default = 5,Min = 1,Max = 15,Rounding = 0,Compact = false,})
CrosshairVisualTab:AddSlider('CrosshairThickness', {Text = 'Thickness',Default = 1,Min = 1,Max = 10,Rounding = 0,Compact = false,})
CrosshairVisualTab:AddSlider('CrosshairOffset', {Text = 'Offset',Default = 1,Min = 1,Max = 20,Rounding = 0,Compact = false,})
CrosshairVisualTab:AddToggle('CrosshairSpin', {Text = 'Spin',Default = false})
CrosshairVisualTab:AddSlider('CrosshairSpinSpeed', {Text = 'Spin Speed',Default = 90,Min = 1,Max = 900,Rounding = 0,Compact = false,})

LocalPlayerVisualTab:AddToggle('LocalChamsEnabled', {Text = 'Local Chams Enabled',Default = false}):AddColorPicker('LocalChamsColor', {Default = Color3.fromRGB(255,0,76),Title = 'Local Chams',})
LocalPlayerVisualTab:AddDropdown('LocalChamsMaterial', {Values = {"ForceField","Neon","Ice"},Default = 1,Multi = false,Text = 'Material'})
LocalPlayerVisualTab:AddToggle('LocalGunChamsEnabled', {Text = 'Gun Chams Enabled',Default = false}):AddColorPicker('LocalGunChamsColor', {Default = Color3.fromRGB(255,0,76),Title = 'Local Chams',})
LocalPlayerVisualTab:AddDropdown('LocalGunChamsMaterial', {Values = {"ForceField","Neon","Ice"},Default = 1,Multi = false,Text = 'Material'})


MiscTab:AddSlider('PlayerFov', {Text = 'Fov',Default = 90,Min = 30,Max = 200,Rounding = 0,Compact = false})
MiscTab:AddDropdown('SkyboxeChange', {Values = {"Standard","Among Us","Spongebob","Deep Space","Winter","Clouded Sky"},Default = 1,Multi = false,Text = 'Sky'})
MiscTab:AddDivider()
MiscTab:AddToggle('Leaves', {Text = 'Leaves',Default = true})
MiscTab:AddToggle('Grass', {Text = 'Grass',Default = true})

--Gun Chams Updater
Esp:LocalGunChams()
game:GetService("Workspace").Ignore.ChildAdded:Connect(function()
    Esp:LocalGunChams()
end)

--Silent Aim
local oldFunction; oldFunction = hookfunction(getupvalues(getrenv()._G.modules.FPS.ToolControllers.BowSpecial.PlayerFire)[4],function(...)
    args = {...}
    if Aimbot.Settings.SilentEnabled == true and Aimbot:GetClosest() ~= nil and Framework:DistanceFromCharacter(Aimbot:GetClosest():GetPivot().p) <= Esp.Settings.PlayerRenderDistance and not Aimbot.SilentHitChance >= math.random(1, 100) then
        if Aimbot.TeamCheck == true and Framework:TeamCheck(Model) == false then
	        args[1] = CFrame.lookAt(args[1].Position,Aimbot:SilentPredict(Aimbot:GetClosest()))
        else
            args[1] = CFrame.lookAt(args[1].Position,Aimbot:SilentPredict(Aimbot:GetClosest()))
        end
    end
    return oldFunction(unpack(args))
end)

local oldFunctionGun; oldFunctionGun = hookfunction(getupvalues(getrenv()._G.modules.FPS.ToolControllers.RangedWeapon.PlayerFire)[2],function(...)
    args = {...}
    if Aimbot.Settings.SilentEnabled == true and Aimbot:GetClosest() ~= nil and Framework:DistanceFromCharacter(Aimbot:GetClosest():GetPivot().p) <= Esp.Settings.PlayerRenderDistance and not Aimbot.SilentHitChance >= math.random(1, 100) then
        if Aimbot.TeamCheck == true and Framework:TeamCheck(Model) == false then
	        args[1] = CFrame.lookAt(args[1].Position,Aimbot:SilentPredict(Aimbot:GetClosest()))
        else
            args[1] = CFrame.lookAt(args[1].Position,Aimbot:SilentPredict(Aimbot:GetClosest()))
        end
        --args[1] = CFrame.lookAt(args[1].Position,Aimbot:GetClosest()[Aimbot.FovHitpartSilent]:GetPivot().Position)
    end
    return oldFunctionGun(unpack(args))
end)

--Aimbot
game:GetService("RunService").Heartbeat:Connect(function()
    if Options.AimbotKey:GetState() then
        local Model = Aimbot:GetClosest()
        if Model and Model:FindFirstChild(Aimbot.Settings.AimbotHitpart) and Framework:DistanceFromCharacter(Model:GetPivot().p) <= Esp.Settings.PlayerRenderDistance then
            if Aimbot.Settings.Prediction == true then
                local pos, Visible = nil
                Drop = Aimbot:PredictDrop(Aimbot:GetClosest())
                if Drop ~= nil then
                    Drop = 0
                end
                if Aimbot.Settings.DropPrediction == true then
                    pos, Visible = Camera:WorldToViewportPoint(Aimbot:Predict(Aimbot:GetClosest())+Vector3.new(0,Drop*10,0))
                else
                    pos, Visible = Camera:WorldToViewportPoint(Aimbot:Predict(Aimbot:GetClosest()))
                end
                pos = Vector2.new(pos.X, pos.Y)
                if Visible == true then
                    Framework:MoveMouse(pos.X,pos.Y,Aimbot.AimbotSmoothing)
                end
            else
                if Aimbot.Settings.DropPrediction == true then
                    pos, Visible = Camera:WorldToViewportPoint(Model[Aimbot.Settings.AimbotHitpart].Position+Vector3.new(0,2,0)+Vector3.new(0,Drop*10,0))
                else
                    pos, Visible = Camera:WorldToViewportPoint(Model[Aimbot.Settings.AimbotHitpart].Position+Vector3.new(0,2,0))
                end
                pos = Vector2.new(pos.X, pos.Y)
                if Visible == true then
                    Framework:MoveMouse(pos.X,pos.Y,Aimbot.AimbotSmoothing)
                end
            end
        end
    else
        Aimbot.HighlightedTarget = nil
    end
end)

local OldHook; OldHook = hookfunction(getrenv()._G.modules.Camera.Recoil, function(...)
    args = {...}
    if Aimbot.NoRecoilToggle == true then
        args[1]["cameraY"] = 0;args[1]["cameraX"] = 0
    end
    return OldHook(unpack(args))
end)

--Toggles
Toggles.LocalGunChamsEnabled:OnChanged(function()
    Framework.LocalGunChams = Toggles.LocalGunChamsEnabled.Value
    Esp:LocalGunChams()
end)
Toggles.LocalChamsEnabled:OnChanged(function()
    Framework.LocalChams = Toggles.LocalChamsEnabled.Value
end)
Toggles.LocalChamsEnabled:OnChanged(function()
    Framework.LocalChams = Toggles.LocalChamsEnabled.Value
end)
Toggles.TeamCheckSilent:OnChanged(function()
    Aimbot.TeamCheckSilent = Toggles.TeamCheckSilent.Value
end)
Toggles.TeamCheckEsp:OnChanged(function()
    Esp.TeamCheck = Toggles.TeamCheckEsp.Value
end)
Toggles.NoRecoilToggle:OnChanged(function()
    Aimbot.NoRecoilToggle = Toggles.NoRecoilToggle
end)
Toggles.CrosshairSpin:OnChanged(function()
    Crosshair.Spin = Toggles.CrosshairSpin.Value
end)
Toggles.CrosshairEnabled:OnChanged(function()
    Crosshair.Enabled = Toggles.CrosshairEnabled.Value
end)
Toggles.SilentEnabled:OnChanged(function()
    Aimbot.Settings.SilentEnabled = Toggles.SilentEnabled.Value
end)
Toggles.PlayerBoxes:OnChanged(function()
    Esp.Settings.Boxes = Toggles.PlayerBoxes.Value
end)
Toggles.PlayerDistance:OnChanged(function()
    Esp.Settings.Distances = Toggles.PlayerDistance.Value
end)
Toggles.PlayerArmor:OnChanged(function()
    Esp.Settings.Armor = Toggles.PlayerArmor.Value
end)
Toggles.PlayerSleeping:OnChanged(function()
    Esp.Settings.Sleeping = Toggles.PlayerSleeping.Value
end)
Toggles.OreNames:OnChanged(function()
    Esp.Settings.OreNames = Toggles.OreNames.Value
end)
Toggles.OreDistance:OnChanged(function()
    Esp.Settings.OreDistances = Toggles.OreDistance.Value
end)
Toggles.FovEnabled:OnChanged(function()
    Aimbot.Settings.FovEnabled = Toggles.FovEnabled.Value
end)
Toggles.Prediction:OnChanged(function()
    Aimbot.Settings.Prediction = Toggles.Prediction.Value
end)
Toggles.DropPrediction:OnChanged(function()
    Aimbot.Settings.DropPrediction = Toggles.DropPrediction.Value
end)
Toggles.TargetSleepers:OnChanged(function()
    Aimbot.Settings.TargetSleepers = Toggles.TargetSleepers.Value
end)
Toggles.Grass:OnChanged(function()
    sethiddenproperty(game:GetService("Workspace").Terrain,"Decoration",Toggles.Grass.Value)
end)
Toggles.Leaves:OnChanged(function()
    if Toggles.Leaves.Value == true then
        Framework:ToggleLeaves(0.4)
    else
        Framework:ToggleLeaves(1)
    end
end)

--Options
Options.HitChance:OnChanged(function()
    Aimbot.SilentHitChance = Options.HitChance.Value
end)
Options.LocalGunChamsMaterial:OnChanged(function()
    Esp.Settings.LocalGunChamsMaterial = Options.LocalGunChamsMaterial.Value
end)
Options.LocalGunChamsColor:OnChanged(function()
    Esp.Settings.LocalGunChamsColor = Options.LocalGunChamsColor.Value
end)
Options.LocalChamsMaterial:OnChanged(function()
    Esp.Settings.LocalChamsMaterial = Options.LocalChamsMaterial.Value
end)
Options.LocalChamsColor:OnChanged(function()
    Esp.Settings.LocalChamsColor = Options.LocalChamsColor.Value
end)
Options.CrosshairSpinSpeed:OnChanged(function()
    Crosshair.Speed = Options.CrosshairSpinSpeed.Value
end)
Options.CrosshairOffset:OnChanged(function()
    Crosshair.CrosshairOffset = Options.CrosshairOffset.Value
end)
Options.CrosshairColor:OnChanged(function()
    Crosshair.CrosshairColor = Options.CrosshairColor.Value
end)
Options.CrosshairSize:OnChanged(function()
    Crosshair.CrosshairSize = Options.CrosshairSize.Value
end)
Options.CrosshairThickness:OnChanged(function()
    Crosshair.CrosshairThickness = Options.CrosshairThickness.Value
end)
Options.FovHitpartSilent:OnChanged(function()
    Aimbot.FovHitpartSilent = Options.FovHitpartSilent.Value
end)
Options.PlayerFov:OnChanged(function()
    setupvalue(FovFunction,17,Options.PlayerFov.Value)
end)
Options.PlayerBoxColor:OnChanged(function()
    Esp.Settings.PlayerBoxColor = Options.PlayerBoxColor.Value 
end)
Options.PlayerDistanceColor:OnChanged(function()
    Esp.Settings.PlayerDistanceColor = Options.PlayerDistanceColor.Value 
end)
Options.PlayerSleepingColor:OnChanged(function()
    Esp.Settings.PlayerSleepingColor = Options.PlayerSleepingColor.Value 
end)
Options.PlayerArmorColor:OnChanged(function()
    Esp.Settings.PlayerArmorColor = Options.PlayerArmorColor.Value 
end)
Options.PlayerRenderDistance:OnChanged(function()
    Esp.Settings.PlayerRenderDistance = Options.PlayerRenderDistance.Value
end)
Options.OreRenderDistance:OnChanged(function()
    Esp.Settings.OreRenderDistance = Options.OreRenderDistance.Value
end)
Options.ItemRenderDistance:OnChanged(function()
    Esp.Settings.ItemRenderDistance = Options.ItemRenderDistance.Value
end)
Options.FovSize:OnChanged(function()
    Aimbot.Settings.FovSize = Options.FovSize.Value
end)
Options.FovColor:OnChanged(function()
    Aimbot.Settings.FovColor = Options.FovColor.Value
end)
Options.FovHitpart:OnChanged(function()
    Aimbot.Settings.AimbotHitpart = Options.FovHitpart.Value
end)
Options.Smoothing:OnChanged(function()
    Aimbot.AimbotSmoothing = Options.Smoothing.Value
end)
Options.SkyboxeChange:OnChanged(function()
    Framework:ReplaceSkybox(Options.SkyboxeChange.Value)
end)

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
    if DetectMods(v.UserId) ~= nil then
        game.Players.LocalPlayer:Kick(DetectMods(v.UserId))
    end
end
game:GetService("Players").PlayerAdded:Connect(function(v)
    Library:Notify(v.Name.." Joined The Game!",3)
    if DetectMods(v.UserId) ~= nil then
        game.Players.LocalPlayer:Kick(DetectMods(v.UserId))
    end
end)
game:GetService("Players").PlayerRemoving:Connect(function(v)
    Library:Notify(v.Name.." Left The Game!",3)
end)

Library:Notify("Loaded",3)

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
MenuGroup:AddToggle('Watermark', {Text="Watermark",Default=true})
MenuGroup:AddToggle('KeybindFrame', {Text="Keybinds",Default=true})
Toggles.Watermark:OnChanged(function()
    Library:SetWatermarkVisibility(Toggles.Watermark.Value)
end)
Toggles.KeybindFrame:OnChanged(function()
    Library.KeybindFrame.Visible = Toggles.KeybindFrame.Value
end)
Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings() 
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
ThemeManager:SetFolder('ProjectVertigo')
SaveManager:SetFolder('ProjectVertigo/TheSurvivalGame')
SaveManager:BuildConfigSection(Tabs['UI Settings']) 
ThemeManager:ApplyToTab(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()
