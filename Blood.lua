-- Load the Orion Library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Xtentacion178/Dbbdbr/main/Rbsbbs"))()

-- Create a window
local Window = OrionLib:MakeWindow({
    Name = "XVR IRAQ | Brookhaven",
    HidePremium = false,
    SaveConfig = true,
    IntroText = "PIRATE HUB",
    IntroIcon = "rbxassetid://",
    ConfigFolder = "OrionTest"
    
})


-- Create a tab
local Tab = Window:MakeTab({
    Name = "",
    Icon = "rbxassetid://118979441318405",
    PremiumOnly = false
})

-- Add a section to the tab
local Section = CRD:AddSection({Name = ""});
CRD:AddLabel("  ");
local function copyText()
    local textToCopy = "9.0ver";
    setclipboard(textToCopy);
    OrionLib:MakeNotification({
        Name = "Texto Copiado",
        Content = "O link do dc foi copiado para a área de transferência",
        Image = "rbxassetid://15918472454",
        Time = 5
    });
end
CRD:AddButton({
    Name = "     9.0ver",
    Callback = copyText
});

-- Add a section to the tab
local Section = Tab:AddSection({
    Name = "Criador Ghosty/dark"
})

-- Add a section to the tab
local Section = Tab:AddSection({
    Name = "Desenvolvedores arrowpro,dark,joko"
})

-- Create a tab
local Tab = Window:MakeTab({
    Name = " - Main Troll",
    Icon = "rbxassetid://18904410739",
    PremiumOnly = false
})

-- Add a section to the tab
local Section = Tab:AddSection({
    Name = "TROLL"
})

local function getPlayerNames()
    local players = game:GetService("Players"):GetPlayers()
    local playerNames = {}
    for _, player in ipairs(players) do
        table.insert(playerNames, player.Name)
    end
    return playerNames
end

local selectedPlayer
local teleportLoop
local playerDropdown

local selectedPlayer = nil
local isViewing = false
local camera = game.Workspace.CurrentCamera

-- VariÃ¡veis de controle
local playerNameInitials = ""
local isActive = {
    teleport = false,
    spin = false,
    fling = false,
    rotate = false,
    view = false -- Adicionada a variÃ¡vel para visualizaÃ§Ã£o
}
local connections = {
    teleport = nil,
    spin = nil,
    fling = nil,
    rotate = nil,
    view = nil -- Adicionada a conexÃ£o para visualizaÃ§Ã£o
}
local viewEnabled = false
local selectedViewPlayer = nil
local characterAddedConnection = nil

-- FunÃ§Ã£o para encontrar o jogador pelo nome (usando iniciais)
local function getPlayerByInitials(initials)
    initials = string.upper(initials)
    local Players = game:GetService("Players")
    for _, player in ipairs(Players:GetPlayers()) do
        if string.sub(player.Name:upper(), 1, #initials) == initials then
            return player
        end
    end
    return nil
end

-- FunÃ§Ã£o para iniciar o loop de rotaÃ§Ã£o (mortal)
local function startSpinLoop()
    local RunService = game:GetService("RunService")
    local LocalPlayer = game.Players.LocalPlayer

    local function applySpin()
        if isActive.spin then
            local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if HumanoidRootPart then
                -- Remove qualquer BodyAngularVelocity existente
                for _, v in ipairs(LocalPlayer.Character:GetChildren()) do
                    if v:IsA("BodyAngularVelocity") then
                        v:Destroy()
                    end
                end

                -- Cria um novo BodyAngularVelocity para rotaÃ§Ã£o rÃ¡pida diagonal
                local Spin = Instance.new("BodyAngularVelocity")
                Spin.Parent = HumanoidRootPart
                Spin.MaxTorque = Vector3.new(math.huge, math.huge, math.huge) -- Permite rotaÃ§Ã£o ilimitada em todos os eixos
                Spin.AngularVelocity = Vector3.new(900, 900, 900) -- Ajuste a velocidade conforme necessÃ¡rio
            end
        end
    end

    connections.spin = RunService.Heartbeat:Connect(applySpin)
end

-- FunÃ§Ã£o para parar o loop de rotaÃ§Ã£o
local function stopSpinLoop()
    if connections.spin then
        connections.spin:Disconnect()
        connections.spin = nil
    end

    local HumanoidRootPart = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if HumanoidRootPart then
        for _, v in ipairs(HumanoidRootPart:GetChildren()) do
            if v:IsA("BodyAngularVelocity") then
                v:Destroy()
            end
        end
    end
end

-- FunÃ§Ã£o para iniciar o loop de fling
local function startFlingLoop()
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local forceMagnitude = 5000000

    connections.fling = RunService.Heartbeat:Connect(function()
        if isActive.fling and playerNameInitials ~= "" then
            local targetPlayer = getPlayerByInitials(playerNameInitials)
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local direction = (targetPlayer.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Unit
                LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0) -- Move 0 unit forward
                targetPlayer.Character.HumanoidRootPart.Velocity = direction * forceMagnitude
            end
        end
    end)
end

-- FunÃ§Ã£o para parar o loop de fling
local function stopFlingLoop()
    if connections.fling then
        connections.fling:Disconnect()
        connections.fling = nil
    end
end

-- FunÃ§Ã£o para iniciar o loop de teleporte
local function startTeleportLoop()
    local RunService = game:GetService("RunService")
    local LocalPlayer = game.Players.LocalPlayer
    local direction = 1

    connections.teleport = RunService.Heartbeat:Connect(function()
        if isActive.teleport then
            local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if HumanoidRootPart then
                local currentPosition = HumanoidRootPart.Position
                HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + Vector3.new(0, direction, 0)
                direction = direction * -1
            end
        end
    end)
end

-- FunÃ§Ã£o para parar o loop de teleporte
local function stopTeleportLoop()
    if connections.teleport then
        connections.teleport:Disconnect()
        connections.teleport = nil
    end
end

-- FunÃ§Ã£o para iniciar o loop de rotaÃ§Ã£o completa
local function startRotateLoop()
    local RunService = game:GetService("RunService")
    local LocalPlayer = game.Players.LocalPlayer

    local function applyRotation()
        if isActive.rotate then
            local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if HumanoidRootPart then
                HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(0), 0)
            end
        end
    end

    connections.rotate = RunService.Heartbeat:Connect(applyRotation)
end

-- FunÃ§Ã£o para parar o loop de rotaÃ§Ã£o completa
local function stopRotateLoop()
    if connections.rotate then
        connections.rotate:Disconnect()
        connections.rotate = nil
    end
end

-- FunÃ§Ã£o para ativar/desativar visualizaÃ§Ã£o
local function toggleView(enabled)
    if enabled then
        if selectedViewPlayer then
            local player = selectedViewPlayer
            if player then
                game.Workspace.CurrentCamera.CameraSubject = player.Character
                if characterAddedConnection then
                    characterAddedConnection:Disconnect()
                end
                characterAddedConnection = player.CharacterAdded:Connect(function(character)
                    game.Workspace.CurrentCamera.CameraSubject = character
                end)
                OrionLib:MakeNotification({
                    Name = "Visualizando " .. player.Name,
                    Content = "VocÃª estÃ¡ visualizando o jogador: " .. player.Name,
                    Image = "rbxassetid://17527279121",
                    Time = 6
                })
            else
                print("Jogador nÃ£o encontrado.")
                viewEnabled = false
            end
        else
            print("Nenhum jogador selecionado para a visualizaÃ§Ã£o.")
            viewEnabled = false
        end
    else
        if characterAddedConnection then
            characterAddedConnection:Disconnect()
            characterAddedConnection = nil
        end
        game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
    end
end

-- FunÃ§Ã£o para encontrar jogador pelo nome parcial ou apelido
local function findPlayerByPartialNameOrNickname(partialName)
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Name:lower():find(partialName:lower(), 1, true) or (player.DisplayName and player.DisplayName:lower():find(partialName:lower(), 1, true)) then
            return player
        end
    end
    return nil
end

Tab:AddButton({
  Name = "",
Callback = function()local args = {
    [1] = "PickingTools",
    [2] = "Couch"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))local player = game.Players.LocalPlayer

local function equiparTools()
    local tools = player.Backpack:GetChildren()
    for _, tool in ipairs(tools) do
        if tool:IsA("Tool") then
            player.Character.Humanoid:EquipTool(tool)
        end
    end
end

equiparTools()

local tempoParaParar = 1
local tempoInicial = tick()

while wait(0.1) do
    equiparTools()
    if tick() - tempoInicial > tempoParaParar then
        break
    end
end
        if selectedPlayer then
            local targetPlayer = game:GetService("Players"):FindFirstChild(selectedPlayer)
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                teleportLoop = game:GetService("RunService").Heartbeat:Connect(function()
                    local playerCharacter = game.Players.LocalPlayer.Character
                    if playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart") then
                        playerCharacter.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
                        wait(0.1)
                        playerCharacter.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(75, -495, 6875))
                        wait(0.1)
                    end
                end)
            end
        end
    end
})

playerDropdown = Tab:AddDropdown({
    Name = "Target",
    Default = "1",
    Options = getPlayerNames(),
    Callback = function(Value)
        selectedPlayer = Value
        if teleportLoop then
            teleportLoop:Disconnect()
            teleportLoop = nil
        end
    end    
})

Tab:AddToggle({
  Name = "",
  Callback = function(state)
    isViewing = state
    if isViewing and selectedPlayer then
      local targetPlayer = game:GetService("Players"):FindFirstChild(selectedPlayer)
      if targetPlayer then
        local character = targetPlayer.Character
        if character then
          local targetCamera = character:FindFirstChild("HumanoidRootPart")
          if targetCamera then
            camera.CameraSubject = targetCamera
            camera.CameraType = Enum.CameraType.Custom
          end
        end
      end
    else
      camera.CameraSubject = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
      camera.CameraType = Enum.CameraType.Custom
    end
  end
})

Tab:AddButton({
    Name = "",
    Callback = function()
        if selectedPlayer then
            local targetPlayer = game:GetService("Players"):FindFirstChild(selectedPlayer)
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local playerCharacter = game.Players.LocalPlayer.Character
                if playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart") then
                    playerCharacter.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
                    wait(0.9)
                    playerCharacter.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, 0, 0))
                end
            end
        end
    end
})

Tab:AddButton({
    Name = " ",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
    end    
})

-- Add a section to the tab
local Section = Tab:AddSection({
    Name = "Small Avatar"
})

Tab:AddButton({
    Name = "  ",
    Callback = function()
        local args = {
            [1] = "CharacterSizeUp",
            [2] = 1
        }
        -- Envia um pedido ao servidor para diminuir o tamanho do personagem
        local remoteEvent = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s")
        if remoteEvent then
            remoteEvent:FireServer(unpack(args))
        else
            warn("Evento remoto '1Clothe1s' nÃ£o encontrado em ReplicatedStorage.RE")
        end
    end
})

Tab:AddButton({
    Name = "  ",
    Callback = function()
        local args = {
            [1] = "CharacterSizeDown",
            [2] = 4
        }
        -- Envia um pedido ao servidor para diminuir o tamanho do personagem
        local remoteEvent = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s")
        if remoteEvent then
            remoteEvent:FireServer(unpack(args))
        else
            warn("Evento remoto '1Clothe1s' nÃ£o encontrado em ReplicatedStorage.RE")
        end
    end
})

-- FunÃ§Ã£o para ativar automaticamente o cÃ³digo especificado
local function activateCode()
    local args = {
        [1] = "PickingTools",
        [2] = "Couch"
    }
    local remoteFunction = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l")
    if remoteFunction then
        remoteFunction:InvokeServer(unpack(args))
    else
        warn("FunÃ§Ã£o remota '1Too1l' nÃ£o encontrada em ReplicatedStorage.RE")
    end
end

-- Chamar a funÃ§Ã£o para ativar automaticamente o cÃ³digo especificado
activateCode()

-- Add a section to the tab
local Section = Tab:AddSection({
    Name = "Protection"
})

-- VariÃ¡vel para armazenar o estado da proteÃ§Ã£o
local voidProtectionEnabled = false

-- FunÃ§Ã£o para ativar a proteÃ§Ã£o contra o vazio
local function ActivateVoidProtection()
    voidProtectionEnabled = true
    -- Definindo FallenPartsDestroyHeight para NaN para prevenir a destruiÃ§Ã£o
    game.Workspace.FallenPartsDestroyHeight = -99999999999
end

Tab:AddButton({
    Name = "Void Protection",
    Callback = function()
        if not voidProtectionEnabled then
            ActivateVoidProtection()
            print("Void protection activated.")
        else
            print("Void protection is already active.")
        end
    end
})

-- Criar a aba "Flings"
local FlingsTab = Window:MakeTab({
    Name = " []",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Criar a seção "Seção Troll Beta" na aba "Flings"
local FlingsSection = FlingsTab:AddSection({
    Name = "Seção Troll Beta"
})

-- Função para realizar o "Fling Avançado" com o item 'Couch'
local selectedKillAdvancedPlayer = nil
local couchEquipped = false

local function killAdvancedPlayer()
    if selectedKillAdvancedPlayer then
        local player = game.Players:FindFirstChild(selectedKillAdvancedPlayer)
        if player then
            -- Equipa o item 'Couch' no inventário se ainda não estiver equipado
            local backpack = game.Players.LocalPlayer.Backpack
            if backpack and not couchEquipped then
                local couch = backpack:FindFirstChild("Couch")
                if couch then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(couch)
                    couchEquipped = true
                else
                    print("O item 'Couch' não foi encontrado no seu inventário.")
                end
            end
            
            -- Looping de teleportes no jogador selecionado da lista
            while true do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
                wait(0.0) -- Intervalo entre cada teleporte, ajuste conforme necessário
                
                -- Verifica se o jogador sentou no 'Couch' e realiza o teleporte para o céu
                if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.SeatPart then
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleporta para cima
                    wait(0.0) -- Espera um pouco antes de teleportar de volta para evitar bugs
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(55931, 12551, 18083) -- Teleporta de volta para a posição original
                    break -- Sai do loop após teleportar de volta
                end
            end
            
            -- Remove o item 'Couch' da mão do jogador após o teleporte para o céu
            if couchEquipped then
                local backpack = game.Players.LocalPlayer.Backpack
                if backpack then
                    local couch = backpack:FindFirstChild("Couch")
                    if couch then
                        couch.Parent = nil -- Remove o 'Couch' do inventário
                        couchEquipped = false
                    end
                end
            end
        else
            print("Jogador não encontrado.")
        end
    else
        print("Nenhum jogador selecionado para o Bring Avançado.")
    end
end

-- Adicionar um botão "Fling [BETA]" à seção "Seção Troll Beta"
FlingsSection:AddButton({
    Name = "Fling [Bug Fixed]",
    Description = "Equipa o item 'Couch' e teleporta o jogador selecionado.",
    Callback = function()
        killAdvancedPlayer()
    end
})

-- Adicionar uma lista de seleção de jogadores para "Fling "
local killAdvancedPlayerList = {}
for _, player in ipairs(game.Players:GetPlayers()) do
    table.insert(killAdvancedPlayerList, player.Name)
end

FlingsSection:AddDropdown({
    Name = "Selecione o Jogador para Fling BETA",
    Description = "Selecione o jogador alvo para o Fling [BETA]",
    Options = killAdvancedPlayerList,
    Callback = function(playerName)
        selectedKillAdvancedPlayer = playerName
    end
})

-- Bring All Button Function
local isBringAllEnabled = false

local function toggleBringAll()
    isBringAllEnabled = not isBringAllEnabled
    if isBringAllEnabled then
        print("Bring all activated!")
        for i = 1, 10 do
            for _, player in ipairs(game.Players:GetPlayers()) do
                local character = game.Players.LocalPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    character:FindFirstChild("HumanoidRootPart").CFrame = player.Character.HumanoidRootPart.CFrame
                    wait(0.0)
                end
            end
        end
        print("Bring all completed!")
        isBringAllEnabled = false
    else
        print("Bring all deactivated!")
    end
end

-- Add the "Bring All" button to the Flings section
FlingsSection:AddButton({
    Name = "  [ ]",
    Description = "Teleport to all players 10 times",
    Callback = function()
        toggleBringAll()
    end
})

-- Add buttons to the Flings tab
FlingsTab:AddButton({
    Name = "  ",
    Description = "It's in beta, there are still some bugs",
    Callback = function()
        local args = {
            [1] = "PickingTools",
            [2] = "Couch"
        }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
        prin
