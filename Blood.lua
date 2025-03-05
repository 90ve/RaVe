local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/90ve/X/refs/heads/main/Nkp67.lua')))()
local Window = OrionLib:MakeWindow({Name = "Bluez Brookhaven🏡", HidePremium = false, SaveConfig = true, ConfigFolder = "Bluez Brookhaven"})

local House = Window:MakeTab({
  Name = "House",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
})

local Perm = House:AddSection({
  Name = "Permission"
})
local Ban = House:AddSection({
  Name = "Ban"
})
local Selected = nil
Perm:AddDropdown({
  Name = "Get House permission",
  Default = "",
  Options = HouseNumber,
  Callback = function(Value)
    Selected = Value
  end
})
Perm:AddButton({
  Name = "Confirm",
  Callback = function()
    GetPermission(Selected)
  end
})
Perm:AddButton({
  Name = "Get all houses perms",
  Callback = function()
    for _, house in ipairs(lots:GetChildren()) do
      -- Verifica se o nome da casa corresponde ao nome do jogador concatenado com "House"
      for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        if house.Name == player.Name .. "House" then
          -- Acesse a propriedade Number dentro da casa (house.Number.Number)
          local houseNumber = house:FindFirstChild("Number")
          
          -- Verifique se "Number" existe e se a propriedade "Number" dentro dele está presente
          if houseNumber and houseNumber:FindFirstChild("Number") then
            -- Chama a função para conceder permissão usando o valor do número da casa
            GetPermission(houseNumber.Number.Value)
          else
            -- Caso "Number" não seja encontrado ou não tenha a propriedade correta
            warn("House number not found or invalid for house:", house.Name)
          end
          
          -- Adicionando delay de 0.5 segundos entre as verificações
          wait(0.5)
        end
      end
    end
  end
})
local tirar = nil
Perm:AddDropdown({
  Name = "Remove all House permission",
  Default = "",
  Options = HouseNumber,
  Callback = function(Option)
    tirar = Option
  end
})
Perm:AddButton({
  Name = "Confirm",
  Callback = function()
    for i, each in ipairs(Players:GetPlayers()) do
      local Table = {}
      table.insert(Table, each.Name)
      table.remove(Table, 1)
      for a, b in ipairs(Table) do
        RemovePermission(each.Name, tirar)
        wait(0.5)
      end
    end
  end
})

Ban:AddToggle({
  Name = "Auto house unban",
  Default = false,
  Callback = function(Value)
    AutoUnban = Value
  end
})
local Troll = Window:MakeTab({
  Name = "Troll",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
})
local Invisible = Troll:AddSection({
  Name = "Invisible"
})
Invisible:AddButton({
  Name = "Invisible",
  Callback = function()
    local args = {
      [1] = "CharacterSizeDown",
      [2] = 5
    }
    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  end
})
Invisible:AddButton({
  Name = "Visible",
  Callback = function()
    local args = {
      [1] = "CharacterSizeUp",
      [2] = 1
    }
    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  end
})
local kill = Troll:AddSection({
  Name = "Kill"
})
local playerToKill = nil
local killDropdown = kill:AddDropdown({
  Name = "Select Player",
  Default = "",
  Options = players,
  Callback = function(Option)
    playerToKill = Option
  end
})
kill:AddDropdown({
  Name = "Select Method",
  Default = "",
  Options = {"Stretcher", "Couch"},
  Callback = function(Option)
    Method = Option
  end
})
kill:AddButton({
  Name = "Refresh",
  Callback = function()
    killDropdown:Refresh(players, true) 
  end
})
kill:AddButton({
  Name = "Kill",
  Callback = function()
    if backpack:FindFirstChild(Method) ~= true and ch:FindFirstChild(Method) ~= true then
      Stop = false
      humanoid:EquipTool(backpack:FindFirstChild(Method))
      TeleportAround(tostring(playerToKill))
    else
      TakeObject(Method)
      Stop = false
      humanoid:EquipTool(backpack:FindFirstChild(Method))
      TeleportAround(tostring(playerToKill))
    end
  end
})
kill:AddButton({
  Name = "Stop killing",
  Callback = function()
    Stop = true
  end
})
kill:AddButton({
  Name = "Sit esp",
  Callback = function()
    -- Obtém o jogador local
    local localPlayer = game.Players.LocalPlayer
    
    -- Loop para monitorar os jogadores
    game:GetService("RunService").RenderStepped:Connect(function()
        for _, player in pairs(game.Players:GetPlayers()) do
            -- Ignora o jogador local
            if player ~= localPlayer then
                local character = player.Character
                local localCharacter = localPlayer.Character
                if character and localCharacter then
                    local humanoid = character:FindFirstChild("Humanoid")
                    local head = character:FindFirstChild("Head")
                    local localHead = localCharacter:FindFirstChild("Head")
    
                    if head and localHead and humanoid then
                        -- Calcula a distância entre os jogadores
                        local distance = (localHead.Position - head.Position).Magnitude
    
                        -- Verifica se o ESP já existe
                        local espTag = head:FindFirstChild("ESP_Tag")
                        if not espTag then
                            -- Cria o BillboardGui para o ESP
                            espTag = Instance.new("BillboardGui", head)
                            espTag.Name = "ESP_Tag"
                            espTag.Size = UDim2.new(8, 0, 2, 0)
                            espTag.StudsOffset = Vector3.new(0, 2, 0)
                            espTag.AlwaysOnTop = true
    
                            -- Cria a TextLabel dentro do BillboardGui
                            local label = Instance.new("TextLabel", espTag)
                            label.Size = UDim2.new(1, 0, 1, 0)
                            label.BackgroundTransparency = 1
                            label.TextColor3 = Color3.new(1, 1, 1)
                            label.TextStrokeTransparency = 0.5
                            label.Font = Enum.Font.SourceSansBold
                            label.TextScaled = false
                        end
    
                        -- Atualiza o texto e o tamanho das letras
                        local label = espTag:FindFirstChildOfClass("TextLabel")
                        if label then
                            label.Text = player.Name .. " | Sentado: " .. tostring(humanoid.Sit)
                            label.TextColor3 = humanoid.Sit and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
    
                            -- Ajusta o tamanho do texto com base na distância (ajustado para tamanhos menores)
                            label.TextSize = math.clamp(distance / 4, 14, 20)  -- Tamanho mínimo de 14 e máximo de 20
                        end
                    end
                end
            end
        end
    end)
  end
})
Troll:AddLabel("[Beta]")
local Car = Window:MakeTab({
  Name = "Car",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
})

local Clothes = Window:MakeTab({
  Name = "Clothes",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
})
Clothes:AddSection({
  Name = "Copy Clothes"
})
local SelectedClothes = nil

-- Dropdown para selecionar o jogador
local ClothesDropdown = Clothes:AddDropdown({
    Name = "Select Player",
    Default = "",
    Options = players, -- Lista de jogadores já inicializada
    Callback = function(Value)
        SelectedClothes = Value -- Atualiza o jogador selecionado
    end
})

-- Botão para copiar roupas
Clothes:AddButton({
    Name = "Copy Clothes",
    Callback = function()
        if SelectedClothes then
            local selectedPlayer = Players:FindFirstChild(SelectedClothes)
            if selectedPlayer and selectedPlayer.Character then
                local humanoidDescription = selectedPlayer.Character:FindFirstChildOfClass("HumanoidDescription")
                if humanoidDescription then
                    local event = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r")
                    if event and event:IsA("RemoteEvent") then
                        for _, child in ipairs(humanoidDescription:GetChildren()) do
                            -- Verifica se o filho tem uma propriedade "Name" ou similar que indique o ID
                            if child:IsA("AccessoryDescription") or child:IsA("BodyPartDescription") then
                                local id = child.Name -- Tente acessar a propriedade relevante
                                if id and id ~= "" then
                                    print("Enviando ID:", id) -- Debug para verificar o ID
                                    event:FireServer("wear", id)
                                else
                                    warn("ID inválido encontrado em:", child)
                                end
                            else
                                warn("Filho inesperado em HumanoidDescription:", child.ClassName)
                            end
                        end
                    else
                        warn("Evento remoto '1Updat1eAvata1r' não encontrado ou inválido!")
                    end
                else
                    warn("HumanoidDescription não encontrado no jogador selecionado!")
                end
            else
                warn("Jogador ou Character inválido!")
            end
        else
            warn("Nenhum jogador selecionado!")
        end
    end
})

-- Botão para atualizar a lista de jogadores
Clothes:AddButton({
    Name = "Refresh",
    Callback = function()
        ClothesDropdown:Refresh(players, true) -- Atualiza o dropdown com a lista existente
    end
})
local Local = Window:MakeTab({
  Name = "Local Player",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
})
Local:AddTextbox({
  Name = "Walk Speed",
  Default = "",
  TextDisappear = true,
  Callback = function(Value)
    if tonumber(Value) > 1 then
      humanoid.WalkSpeed = Value
    end
  end
})
Local:AddTextbox({
  Name = "Jump Power",
  Default = "",
  TextDisappear = true,
  Callback = function(Value)
    if tonumber(Value) > 1 then
      humanoid.JumpPower = Value
    end
  end
})
Local:AddButton({
  Name = "Prop Esp",
  Callback = function()
    local Players = game:GetService("Players")
    local props = game.Workspace.WorkspaceCom["001_TrafficCones"] -- Caminho correto dos props
    
    -- Função para criar o ESP
    local function createESPForProp(prop, player)
        -- Verifica se o prop já tem um ESP
        local existingESP = prop:FindFirstChild("ESP_" .. player.Name)
        if existingESP then
            return -- Se já existir, não cria outro
        end

        -- Procura qualquer filho que seja um BasePart
        local basePart = nil
        for _, child in ipairs(prop:GetChildren()) do
            if child:IsA("BasePart") then
                basePart = child
                break
            end
        end

        if basePart then
            -- Cria o BillboardGui
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ESP_" .. player.Name
            billboard.Adornee = basePart -- Associa o ESP à BasePart
            billboard.Size = UDim2.new(5, 0, 1, 0) -- Tamanho do ESP
            billboard.StudsOffset = Vector3.new(0, 3, 0) -- Posição acima da BasePart
            billboard.AlwaysOnTop = true -- Sempre visível

            -- Cria o texto
            local textLabel = Instance.new("TextLabel")
            textLabel.Text = "Prop Owner: " .. player.Name -- Nome do jogador dono do prop
            textLabel.BackgroundTransparency = 1 -- Sem fundo
            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Cor do texto (branco)
            textLabel.TextScaled = true -- Escala automática do texto
            textLabel.Size = UDim2.new(1, 0, 1, 0) -- Ocupa todo o espaço do BillboardGui
            textLabel.Font = Enum.Font.SourceSansBold -- Fonte do texto
            textLabel.Parent = billboard

            -- Adiciona o BillboardGui à BasePart
            billboard.Parent = basePart

            print("ESP criado para o prop de:", player.Name)
        else
            print("Nenhuma BasePart encontrada no prop:", prop.Name)
        end
    end

    -- Função para verificar e criar ESP para novos props
    local function checkAndCreateESPForNewProps()
        for _, prop in ipairs(props:GetChildren()) do
            for _, player in ipairs(Players:GetPlayers()) do
                if prop.Name == "Prop" .. player.Name then
                    createESPForProp(prop, player)
                end
            end
        end
    end


    props.ChildAdded:Connect(function(prop)
