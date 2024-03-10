local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Scripts from Minion | Slap Battles", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})


local PlayerTab= Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = PlayerTab:AddSection({
	Name = "Movement"
})

PlayerTab:AddSlider({
    Name = "Walkspeed",
    Min = 16,
    Max = 500,
    Default = 16,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "WS",
    Callback = function(Value)
     game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end    
   })
   
   PlayerTab:AddSlider({
    Name = "Jump Height",
    Min = 16,
    Max = 500,
    Default = 5,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Height",
    Callback = function(Value)
     game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end    
   })

   local CombatTab = Window:MakeTab({
	Name = "Combat",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

CombatTab:AddToggle({
	Name = "Null Spam",
	Default = false,
	Callback = function(Value)
                NullSpam = Value
                while NullSpam do
                game:GetService("ReplicatedStorage").NullAbility:FireServer()
                task.wait()
                end
                 end    
})

CombatTab:AddToggle({
        Name = "Rhythm Spam",
        Default = false,
        Callback = function(Value)
RhythmSpam = Value
while RhythmSpam do
game:GetService("ReplicatedStorage").rhythmevent:FireServer("AoeExplosion",0)
task.wait(0.1)
end
        end    
    })

local MiscTab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

MiscTab:AddDropdown({
	Name = "Teleport",
	Default = "",
        Options = {"Safe spot", "Arena",  "Default Arena", "Lobby", "Tournament", "Moai Island", "Slapple Island", "Plate"},
        Callback = function(Value)
      if Value == "Safe spot" then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Spot.CFrame * CFrame.new(0,28,0)
      elseif Value == "Arena" then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0,-5,0)
      elseif Value == "Moai Island" then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(215, -15.5, 0.5)
      elseif Value == "Slapple Island" then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Arena.island5.Union.CFrame * CFrame.new(0,3.25,0)
      elseif Value == "Plate" then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.Plate.CFrame * CFrame.new(0,2,0)
      elseif Value == "Tournament" then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Battlearena.Arena.CFrame * CFrame.new(0,10,0)
      elseif Value == "Default Arena" then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120,360,-3)
      elseif Value == "Lobby" then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-800,328,-2.5)
      end
        end    
      })

      MiscTab:AddButton({
	Name = "Auto Win Retro Obby",
	Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-27776.0977, 173.634323, 4834.86084, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        end 
})

        OrionLib:Init()
