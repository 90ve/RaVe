local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = " سـكـربـت عـلـي | الـدمـاء 🍷",
   LoadingTitle = "مـطـور الـسـكـربـت عـلـي 🍷",
   LoadingSubtitle = "Tik | 9.0Ver",
   
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Ali Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "9.0ver",
      RememberJoins = true 
   },
   KeySystem = false,
   KeySettings = {
      Title = "Key | Youtube Hub",
      Subtitle = "Key System",
      Note = "Key In Discord Server",
      FileName = "YoutubeHubKey1", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local args = {
    [1] = "RolePlayBio",
    [2] = "سـكـربـت الـمـطـور عـلـي 🔪✨"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
wait(0.1)
game.StarterGui:SetCore("SendNotification", {
    Title = "حـقـوق عـلـي";
    Text = "Tik | 9.0ver"; 
    Duration = 5;
})

local Tab = Window:CreateTab("🍷 مـعـلومات مـطـور الـسكربت") -- Title, Image

local Button = Tab:CreateButton({
   Name = "تـم تـحـديـث الـسـكـربـت",
   Callback = function() 
   end,
})

local Button = Tab:CreateButton({
   Name = "قـنـات مـطـور الـسـكـربت تـيـك 9.0ver",
   Callback = function() 
   end,
})

local Button = Tab:CreateButton({
   Name = "حـساب الـمـطور فـي روبـلوكـس 8ril_m",
   Callback = function() 
   end,
})

local Button = Tab:CreateButton({
   Name = "ادخلو سيرفر الديسكورد مالتي",
   Callback = function() 
   end,
})

local Button = Tab:CreateButton({
   Name = "كلان AR",
   Callback = function() 
   end,
})
local Main Tab = Window:CreateTab("اجـسـام", "smile")

local Button = Tab:CreateButton({
   Name = "راس مـخـفـي (هـيـدلـيس)",
   Callback = function()
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 134082579
    },
    [3] = "Roblox20"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
   end,
})

local Button = Tab:CreateButton({
   Name = "راس الـروبـوت",
   Callback = function()
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 3210773801
    },
    [3] = "Roblox20"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
   end,
})

local Button = Tab:CreateButton({
   Name = " عـيـون نـاريـه زرقـاء",
   Callback = function()
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 16580493236
    },
    [3] = "Roblox20"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
   end,
})

local Button = Tab:CreateButton({
   Name = " جسم طويل",
   Callback = function()
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 116266039925754,
        [2] = 115931454049085,
        [3] = 84053421838284,
        [4] = 96815508293389,
        [5] = 121515016872144,
        [6] = 1,
    },
    [3] = "Roblox20"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
   end,
})

local Button = Tab:CreateButton({
   Name = "رجـل",
   Callback = function()
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 139607718,
        [5] = 1,
        [6] = 1,
    },
    [3] = "Alihub"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
   end,
})

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
   end,
})

local MainTab = Window:CreateTab("الـميـزات 🌟") 

Rayfield:Notify({
   Title = "هـلـو",
   Content = "اقرو عدكم امتحانات",
   Duration = 5,
   Image = 13047715178,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "گومو اقرو امتحانات نص سنه اجت",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local Slider = MainTab:CreateSlider({
   Name = "الـسـرعـه",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderws", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "الـقـفـز",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderjp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})

local Input = MainTab:CreateInput({
   Name = "اخـتـيـار الـسـرعـه",
   PlaceholderText = "1-500",
   RemoveTextAfterFocusLost = true,
   Callback = function(Text)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Text)
   end,
})

local OtherSection = MainTab:CreateSection("الاوتـو فـارم 🔪")

local Toggle = MainTab:CreateToggle({
   Name = "تجميع الكاندي قيد التطوير",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        print("FARMING")
   end,
})


Rayfield:Notify({
   Title = "مـنـوريـن الـسـكـربـت",
   Content = "جـار تـحـمـيـل..... ",
   Duration = 5,
   Image = 9794138570,
})

Rayfield:Notify({
   Title = "سـكـربـت الـمـطـور عـلـي 🍷",
   Content = "تيك/9.0ver",
   Duration = 15,
   Image = 9794138570,
})
