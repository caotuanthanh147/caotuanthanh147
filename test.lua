local s, e = pcall(function()
task.spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RelkzzRebranded/Bypassed---OBFUSCATED..../main/Adonis%20BYPASS.lua"))()
end)
end)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "EpicHub",
   Icon = 4483345998,
   LoadingTitle = "Loading EpicHub...",
   LoadingSubtitle = "Please wait while the script initializes.",
   Theme =  {
    TextColor = Color3.fromRGB(240, 240, 240),
    
    Background = Color3.fromRGB(10, 10, 15),
    Topbar = Color3.fromRGB(15, 15, 25),
    Shadow = Color3.fromRGB(0, 0, 0),
    
    NotificationBackground = Color3.fromRGB(20, 20, 30),
    NotificationActionsBackground = Color3.fromRGB(0, 255, 230),
    
    TabBackground = Color3.fromRGB(20, 20, 30),
    TabStroke = Color3.fromRGB(0, 255, 230),
    TabBackgroundSelected = Color3.fromRGB(0, 255, 230),
    TabTextColor = Color3.fromRGB(200, 200, 200),
    SelectedTabTextColor = Color3.fromRGB(0, 15, 20),
    
    ElementBackground = Color3.fromRGB(25, 25, 35),
    ElementBackgroundHover = Color3.fromRGB(30, 30, 45),
    SecondaryElementBackground = Color3.fromRGB(15, 15, 25),
    ElementStroke = Color3.fromRGB(0, 255, 230),
    SecondaryElementStroke = Color3.fromRGB(0, 200, 180),
    
    SliderBackground = Color3.fromRGB(40, 40, 50),
    SliderProgress = Color3.fromRGB(0, 255, 230),
    SliderStroke = Color3.fromRGB(0, 200, 180),
    
    ToggleBackground = Color3.fromRGB(30, 30, 40),
    ToggleEnabled = Color3.fromRGB(0, 255, 230),
    ToggleDisabled = Color3.fromRGB(80, 80, 90),
    ToggleEnabledStroke = Color3.fromRGB(0, 200, 180),
    ToggleDisabledStroke = Color3.fromRGB(60, 60, 70),
    ToggleEnabledOuterStroke = Color3.fromRGB(0, 150, 130),
    ToggleDisabledOuterStroke = Color3.fromRGB(40, 40, 50),
    
    DropdownSelected = Color3.fromRGB(0, 255, 230),
    DropdownUnselected = Color3.fromRGB(30, 30, 40),
    
    InputBackground = Color3.fromRGB(20, 20, 30),
    InputStroke = Color3.fromRGB(0, 200, 180),
    PlaceholderColor = Color3.fromRGB(100, 100, 120)
}, 
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "EpicHub",
      FileName = "Settings"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false
})
function notify(message, title, time)
   Rayfield:Notify({
      Title = tostring(title),
      Content = tostring(message),
      Duration = tonumber(time),
      Image = 4483345998
   })
end
local ManTab = Window:CreateTab("Main", 4483345998)
local MiscTab = Window:CreateTab("Misc", 4483345998)
local SellTab = Window:CreateTab("Sell", 4483345998)
local TeleTab = Window:CreateTab("Teleport", 4483345998)
local CraftTab = Window:CreateTab("Craft", 4483345998)
local WHTab = Window:CreateTab("Webhook", 4483345998)
local BossTab = Window:CreateTab("Boss", 4483345998)
local CTab = Window:CreateTab("Inventory", 4483345998)
local QuestTab = Window:CreateTab("Quest", 4483345998)
local ShopTab = Window:CreateTab("Shop", 4483345998)
local ExTab = Window:CreateTab("Extra", 4483345998)


if not isfile("EpicHub/Settings.json") then
    makefolder("EpicHub")
    writefile("EpicHub/Settings.json", game:GetService("HttpService"):JSONEncode(Settings))
else
    Settings = game:GetService("HttpService"):JSONDecode(readfile("EpicHub/Settings.json"))
end

MiscTab:CreateToggle({
    Name = "Auto Collect Items",
    CurrentValue = false,
    Callback = function(value)
        isAutoCollectActive = value

        if isAutoCollectActive then
            autoCollectConnection = RunService.Heartbeat:Connect(function()
                local success, errorMessage = pcall(function()
                    local playerCharacter = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                    local playerRootPart = playerCharacter:WaitForChild("HumanoidRootPart")

                    for _, child in pairs(workspace:GetChildren()) do
                        if child:FindFirstChild("Handle") and child.Handle:FindFirstChild("TouchInterest") then
                            local handle = child.Handle
                            handle.CFrame = playerRootPart.CFrame
                        end
                    end
                end)

                if not success then
                    warn("Error in auto collect loop: " .. errorMessage)
                end
            end)
        else
            if autoCollectConnection then
                autoCollectConnection:Disconnect()
                autoCollectConnection = nil
            end
        end
    end
})
ExTab:CreateButton({
    Name = "Grab All Tools",
    Callback = function()
        local player = game.Players.LocalPlayer
        local function getCharacterRoot()
            local character = player.Character or player.CharacterAdded:Wait()
            return character:WaitForChild("HumanoidRootPart")
        end

        local humanoidRootPart = getCharacterRoot()
        local inventory = player.Backpack:GetChildren()
        for _, item in pairs(workspace:GetChildren()) do
            if item:IsA("Tool") and item:FindFirstChild("Handle") and item.Parent == workspace then
                local alreadyHasItem = false
                for _, invItem in pairs(inventory) do
                    if invItem.Name == item.Name then
                        alreadyHasItem = true
                        break
                    end
                end
                if not alreadyHasItem then
                    pcall(function()
                        item.Handle.CFrame = humanoidRootPart.CFrame + Vector3.new(0, 2, 0)
                        item.Parent = player.Backpack
                    end)
                end
            end
        end
    end
})
ManTab:CreateToggle({
    Name = "Auto kill all",
    CurrentValue = false,
    Callback = function(value)
        isKillAllActive = value
        
        if isKillAllActive then
            killAllCoroutine = coroutine.create(function()
                while isKillAllActive do
                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 112412400)
                    sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", 112412400)
                    for _, d in pairs(game.Workspace:GetDescendants()) do
                        if d.ClassName == 'Humanoid' then
                            local isPlayerCharacter = false
                            
                            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                                if player.Character and player.Character == d.Parent then
                                    isPlayerCharacter = true
                                    break
                                end
                            end
                            
                            if not isPlayerCharacter then
                                d.Health = 0
                            end
                        end
                    end
                    wait(0.1)
                end
            end)
            coroutine.resume(killAllCoroutine)
        else
            isKillAllActive = false
            if killAllCoroutine then
                coroutine.close(killAllCoroutine)
                killAllCoroutine = nil
            end
        end
    end    
})
ManTab:CreateButton({
    Name = "Collect all chests.",
    Callback = function()
        local Y_OFFSET = -3
        local player = game.Players.LocalPlayer
        local rp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not rp then return end
        local originalCFrame = rp.CFrame

        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name:lower():find("chest_") then
                local validParent = v.Parent == workspace or v.Parent == workspace:FindFirstChild("chests")
                
                if validParent and v:FindFirstChild("ProximityPrompt") then
                    local targetPosition = v.CFrame * CFrame.new(0, Y_OFFSET, 0)
                    rp.CFrame = targetPosition
                    task.wait(0.15)
                    local success = pcall(function()
                        fireproximityprompt(v.ProximityPrompt)
                    end)
                    if success and Settings.ChestNotifier then
                        notify("Collected "..v.Name:gsub("Chest_p", "Chest"), "Chest Collected", 3)
                    end
                    task.wait(0.175)
                end
            end
        end
        rp.CFrame = originalCFrame
    end
})
ManTab:CreateToggle({
    Name = "Kill All Mobs",
    CurrentValue = false,
    Callback = function(value)
        isAutoExecuteActive = value

        if isAutoExecuteActive and not autoExecuteCoroutine then
            autoExecuteCoroutine = coroutine.create(function()
                local function getPlayerRootPart()
                    local playerCharacter = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                    return playerCharacter:WaitForChild("HumanoidRootPart")
                end

                local function isMobValid(mob, playerNames)
                    return mob:FindFirstChild("BlockHealth") and not playerNames[mob.Name]
                end

                local function getPlayerNames()
                    local names = {}
                    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                        names[player.Name] = true
                    end
                    return names
                end

                while isAutoExecuteActive do
                    local success, errorMessage = pcall(function()
                        local playerNames = getPlayerNames()
                        local playerRootPart = getPlayerRootPart()

                        for _, child in pairs(workspace:GetChildren()) do
                            if child and child:IsDescendantOf(workspace) and isMobValid(child, playerNames) then
                                local args = {
                                    [1] = {
                                        [1] = child
                                    },
                                    [2] = {
                                        ["Attributes"] = {
                                            ["Ragdoll"] = false,
                                            ["Daze"] = false,
                                            ["ShowVisual"] = false,
                                            ["Effects"] = {
                                                ["Visual"] = {
                                                    ["Alpha/hit_slash"] = {}
                                                }
                                            },
                                            ["IgnoreBlock"] = false,
                                            ["IgnoreIframe"] = false,
                                            ["MultipleNpcDmg"] = 1,
                                            ["Stun"] = 1,
                                            ["Guardbreak"] = false,
                                            ["Knockback"] = {
                                                ["Duration"] = 0.2,
                                                ["Direction"] = Vector3.new(-0.9558579921722412, -5.172034533984515e-08, -0.293829083442688)
                                            },
                                            ["Damage"] = 10000
                                        },
                                        ["Properties"] = {
                                            ["DebounceDuration"] = 0.2,
                                            ["PartOffset"] = CFrame.new(0, 0, -3, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                                            ["Duration"] = 0.2,
                                            ["ReferencePart"] = playerRootPart,
                                            ["Size"] = 6
                                        }
                                    }
                                }

                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RegisterHit"):FireServer(unpack(args))
                                wait(0.1)
                            end
                        end
                    end)

                    if not success then
                        warn("Error in kill all mobs loop: " .. errorMessage)
                    end

                    wait(0.2)
                end
            end)
            coroutine.resume(autoExecuteCoroutine)
        elseif not isAutoExecuteActive then
            autoExecuteCoroutine = nil
        end
    end
})
ExTab:CreateButton({
    Name = "Reset Stand",
    Callback = function()
        local backpack = game.Players.LocalPlayer.Backpack
        local lootbagItem = backpack:FindFirstChild("Certificates")

        if lootbagItem then
            lootbagItem.Parent = game.Players.LocalPlayer.Character
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("ItemUses"):WaitForChild("ResetStand"):FireServer()
            end)
        end
    end
})
ExTab:CreateToggle({
    Name = "Kill All",
    CurrentValue = false,
    Callback = function(value)
        isAutoExecuteActive = value

        if isAutoExecuteActive then
            autoExecuteCoroutine = coroutine.create(function()
                local playerCharacter = game.Players.LocalPlayer.Character

                while isAutoExecuteActive do
                    for _, child in pairs(workspace:GetChildren()) do
                        if child:FindFirstChild("BlockHealth") and child ~= playerCharacter then
                            local args = {
                                [1] = {
                                    [1] = child
                                },
                                [2] = {
                                    ["Attributes"] = {
                                        ["Ragdoll"] = false,
                                        ["Daze"] = false,
                                        ["ShowVisual"] = false,
                                        ["Effects"] = {
                                            ["Visual"] = {
                                                ["Alpha/hit_slash"] = {}
                                            }
                                        },
                                        ["IgnoreBlock"] = false,
                                        ["IgnoreIframe"] = false,
                                        ["MultipleNpcDmg"] = 1,
                                        ["Stun"] = 1,
                                        ["Guardbreak"] = false,
                                        ["Knockback"] = {
                                            ["Duration"] = 0.2,
                                            ["Direction"] = Vector3.new(-0.9558579921722412, -5.172034533984515e-08, -0.293829083442688)
                                        },
                                        ["Damage"] = 10000
                                    },
                                    ["Properties"] = {
                                        ["DebounceDuration"] = 0.2,
                                        ["PartOffset"] = CFrame.new(0, 0, -3, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                                        ["Duration"] = 0.2,
                                        ["ReferencePart"] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
                                        ["Size"] = 6
                                    }
                                }
                            }

                            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RegisterHit"):FireServer(unpack(args))
                            wait(0.1)
                        end
                    end
                    wait(0.175)
                end
            end)
            coroutine.resume(autoExecuteCoroutine)
        else
            isAutoExecuteActive = false
            if autoExecuteCoroutine then
                coroutine.close(autoExecuteCoroutine)
                autoExecuteCoroutine = nil
            end
        end
    end
})
ExTab:CreateButton({
    Name = "DCExchange",
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("DCExchange"):FireServer()
    end
})
ExTab:CreateToggle({
    Name = "Soul Orbs",
    CurrentValue = false,
    Callback = function(isEnabled)
        local function autoFireAllSoulOrbs()
            while isEnabled do
                for _, soulOrb in ipairs(workspace:GetChildren()) do
                    if soulOrb.Name == "SoulOrb" then
                        local mainPart = soulOrb:FindFirstChild("Main")
                        if mainPart and mainPart:FindFirstChild("ClickDetector") then
                            pcall(function()
                                fireclickdetector(mainPart.ClickDetector)
                            end)
                        end
                    end
                end
                task.wait(0.2)
            end
        end

        if isEnabled then
            task.spawn(autoFireAllSoulOrbs)
        end
    end
})
QuestTab:CreateToggle({
    Name = "Auto Quest",
    CurrentValue = false,
    Callback = function(value)
        isAutoQuestActive = value

        if isAutoQuestActive then
            task.spawn(function()
                local player = game:GetService("Players").LocalPlayer
                local replicatedStorage = game:GetService("ReplicatedStorage")

                local function fireClickDetectorForPart(part)
                    local mainPart = part:FindFirstChild("Main")
                    if mainPart and mainPart:FindFirstChild("ClickDetector") then
                        pcall(function()
                            fireclickdetector(mainPart.ClickDetector)
                        end)
                    end
                end

                local function processWorkspaceParts()
                    for _, part in ipairs(workspace:GetChildren()) do
                        fireClickDetectorForPart(part)
                        task.wait(0.1)
                    end
                end

                local function checkAndClaimReward()
                    if player:FindFirstChild("RandomQuest") and player.RandomQuest.Completed then
                        replicatedStorage.CheckEvents.RandomQuestReward:FireServer()
                        replicatedStorage.CheckEvents.RandomQuest:FireServer()
                    end
                end

                while isAutoQuestActive do
                    processWorkspaceParts()
                    checkAndClaimReward()
                    task.wait(0.2)
                end
            end)
        end
    end
})
ExTab:CreateToggle({
    Name = "Auto Kill Target",
    CurrentValue = false,
    Callback = function(value)
        isAutoKillActive = value

        if isAutoKillActive then
            task.spawn(function()
                local players = game:GetService("Players")
                local replicatedStorage = game:GetService("ReplicatedStorage")
                local localPlayer = players.LocalPlayer
                while isAutoKillActive do
                    for _, player in pairs(players:GetPlayers()) do
                        if player ~= localPlayer then
                            local playerWorkspace = workspace:FindFirstChild(player.Name)

                            if playerWorkspace and playerWorkspace:FindFirstChild("PlayerSoulOrbDrop") then
                                local args = {
                                    [1] = {
                                        [1] = playerWorkspace
                                    },
                                    [2] = {
                                        ["Attributes"] = {
                                            ["Ragdoll"] = false,
                                            ["Daze"] = false,
                                            ["ShowVisual"] = false,
                                            ["Effects"] = {
                                                ["Visual"] = {
                                                    ["BS/slash_hit"] = {}
                                                }
                                            },
                                            ["IgnoreBlock"] = false,
                                            ["IgnoreIframe"] = false,
                                            ["MultipleNpcDmg"] = 1,
                                            ["Stun"] = 1.1,
                                            ["Guardbreak"] = false,
                                            ["Knockback"] = {
                                                ["Duration"] = 0.25,
                                                ["Direction"] = Vector3.new(0.9987, 0, 0.051)
                                            },
                                            ["Damage"] = 10000
                                        },
                                        ["Properties"] = {
                                            ["DebounceDuration"] = 0.25,
                                            ["PartOffset"] = CFrame.new(0, 0, -3),
                                            ["Duration"] = 0.2,
                                            ["ReferencePart"] = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart"),
                                            ["Size"] = 6
                                        }
                                    }
                                }

                                pcall(function()
                                    replicatedStorage:WaitForChild("Remotes"):WaitForChild("RegisterHit"):FireServer(unpack(args))
                                end)
                                task.wait(0.1)
                            end
                        end
                    end
                    task.wait(0.2)
                end
            end)
        end
    end
})
local AfkModeEnabled = false
local overlayGui = nil

ExTab:CreateToggle({
    Name = "🌑 AFK Mode",
    CurrentValue = false,
    Flag = "AFKModeToggle",
    Callback = function(Value)
        AfkModeEnabled = Value
        
        if AfkModeEnabled then
            overlayGui = Instance.new("ScreenGui")
            overlayGui.Name = "AFKOverlay"
            overlayGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            overlayGui.DisplayOrder = 1
            overlayGui.IgnoreGuiInset = true
            local blackFrame = Instance.new("Frame")
            blackFrame.Size = UDim2.new(1, 0, 1, 0)
            blackFrame.Position = UDim2.new(0, 0, 0, 0)
            blackFrame.BackgroundColor3 = Color3.new(0, 0, 0)
            blackFrame.BorderSizePixel = 0
            blackFrame.Parent = overlayGui
            local textButton = Instance.new("TextButton")
            textButton.Size = UDim2.new(1, 0, 1, 0)
            textButton.Position = UDim2.new(0, 0, 0, 0)
            textButton.BackgroundTransparency = 1
            textButton.Text = ""
            textButton.Modal = true
            textButton.Parent = overlayGui
            overlayGui.Parent = game:GetService("CoreGui")
            Rayfield:Notify({
                Title = "AFK Mode Activated",
                Content = "Screen darkened - GUI remains accessible",
                Duration = 3,
                Image = 4483362458
            })
        else
            if overlayGui then
                overlayGui:Destroy()
                overlayGui = nil
                Rayfield:Notify({
                    Title = "AFK Mode Disabled",
                    Content = "Screen overlay removed",
                    Duration = 3,
                    Image = 4483362458
                })
            end
        end
    end
})
ExTab:CreateButton({
    Name = "HolyGrail",
    Callback = function()
        while wait() do
            game:GetService("ReplicatedStorage"):WaitForChild("ItemUses"):WaitForChild("DarkHolyGrail"):FireServer()
        end
    end
})
local delayBetweenRepeats = 0.1
local connections = {}
local repeatCount = 1
local fireRadius = 50

ManTab:CreateInput({
    Name = "Set Repeat Count",
    CurrentValue = "1",
    PlaceholderText = "Enter repeat count",
    RemoveTextAfterFocusLost = true,
    Flag = "RepeatCountInput",
    Callback = function(Value)
        local number = tonumber(Value)
        if number and number > 0 then
            repeatCount = number
            print("Repeat count set to: " .. repeatCount)
        else
            warn("Please enter a valid positive number.")
        end
    end
})

ManTab:CreateButton({
    Name = "Enable Proximity Multiplier",
    Callback = function()
        local function applyMultiplier(prompt)
            if connections[prompt] then return end

            local connection = prompt.Triggered:Connect(function()
                for i = 1, repeatCount do
                    if not prompt:IsDescendantOf(workspace) then break end
                    fireproximityprompt(prompt)
                    if delayBetweenRepeats > 0 then
                        task.wait(delayBetweenRepeats)
                    end
                end
            end)

            connections[prompt] = connection
        end

        for _, descendant in ipairs(workspace:GetDescendants()) do
            if descendant:IsA("ProximityPrompt") then
                applyMultiplier(descendant)
            end
        end

        workspace.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("ProximityPrompt") then
                applyMultiplier(descendant)
            end
        end)
    end
})

ManTab:CreateButton({
    Name = "Fire Nearby Prompts",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        for _, descendant in ipairs(workspace:GetDescendants()) do
            if descendant:IsA("ProximityPrompt") then
                local parentObject = descendant.Parent
                local position

                if parentObject:IsA("Model") and parentObject:FindFirstChild("HumanoidRootPart") then
                    position = parentObject:FindFirstChild("HumanoidRootPart").Position
                elseif parentObject:IsA("BasePart") then
                    position = parentObject.Position
                end

                if position and (position - humanoidRootPart.Position).Magnitude <= fireRadius then
                    for i = 1, repeatCount do
                        fireproximityprompt(descendant)
                    end
                end
            end
        end
    end
})
CTab:CreateButton({
    Name = "Use all items in inventory.",
    Callback = function()
        local p = game:GetService("Players")
        local character = p.LocalPlayer.Character
        for _, v in ipairs(p.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = character
                v:Activate()
                wait(0.5)
                v.Parent = p.LocalPlayer.Backpack
            end
        end
    end
})
CTab:CreateButton({
    Name = "📦 List Inventory Items",
    Callback = function()
        print("[DEBUG] Initializing inventory scan...")
        local startTime = os.clock()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local inventoryContainers = {"Backpack", "Character", "StarterGear"}
        if not LocalPlayer.Character then
            print("[DEBUG] Waiting for character...")
            LocalPlayer.CharacterAdded:Wait()
        end
        local itemCounts = {}
        local totalItems = 0
        
        for _, containerName in ipairs(inventoryContainers) do
            local container = LocalPlayer:FindFirstChild(containerName)
            if container then
                print("[DEBUG] Scanning container:", container:GetFullName())
                local function scanRecursive(parent)
                    for _, item in ipairs(parent:GetChildren()) do
                        if item:IsA("Tool") then
                            itemCounts[item.Name] = (itemCounts[item.Name] or 0) + 1
                            totalItems += 1
                            print("[DEBUG] Found tool:", item.Name)
                        end
                        scanRecursive(item)
                    end
                end
                
                scanRecursive(container)
            end
        end
        local notificationContent
        if totalItems > 0 then
            local formattedItems = {}
            for itemName, count in pairs(itemCounts) do
                table.insert(formattedItems, string.format("%s ×%d", itemName, count))
            end
            table.sort(formattedItems)
            notificationContent = table.concat(formattedItems, "\n")
        else
            notificationContent = "Inventory is empty in all containers!"
        end
        task.wait(0.2)
        Rayfield:Notify({
            Title = string.format("🎒 Inventory (%d Items)", totalItems),
            Content = notificationContent,
            Duration = 8,
            Image = 4483345998,
            Actions = {{
                Name = "Close",
                Callback = function()
                    print("[DEBUG] Inventory notification closed")
                end
            }}
        })
        print(string.format("[DEBUG] Scan completed in %.2f seconds", os.clock() - startTime))
    end
})
ManTab:CreateButton({
    Name = "Teleport to InvTarget",
    Callback = function()
        local target = workspace:WaitForChild("NPCs"):WaitForChild("InvTarget")
        rp.CFrame = target.CFrame
    end
})
ManTab:CreateButton({
    Name = "Reset Multiplier",
    Callback = function()
        for prompt, connection in pairs(connections) do
            if connection.Connected then
                connection:Disconnect()
            end
            connections[prompt] = nil
        end
        print("All multipliers have been reset.")
    end
})
QuestTab:CreateToggle({
    Name = "Auto Boss Quest",
    CurrentValue = false,
    Callback = function(isEnabled)
        isBossQuestActive = isEnabled

        if isBossQuestActive then
            task.spawn(function()
                local player = game:GetService("Players").LocalPlayer
                local replicatedStorage = game:GetService("ReplicatedStorage")

                while isBossQuestActive do
                    replicatedStorage:WaitForChild("CheckEvents"):WaitForChild("BossQuest"):FireServer()
                    task.wait(0.175)

                    local bossQuest = player:FindFirstChild("BossQuest")
                    if bossQuest then
                        local questValue = bossQuest.Quest.Value
                        local questCompleted = bossQuest.Completed

                        if questValue == 1 then
                            replicatedStorage:WaitForChild("CheckEvents"):WaitForChild("AbandonBossQuest"):FireServer()
                        elseif questValue == 2 then
                            replicatedStorage:WaitForChild("DungeonSpawn"):WaitForChild("Area59Spawn"):FireServer()
                        elseif questValue == 3 then
                            replicatedStorage:WaitForChild("DungeonSpawn"):WaitForChild("TW8Spawn"):FireServer()
                        end

                        while not questCompleted do
                            task.wait(0.175)
                            questCompleted = bossQuest.Completed
                        end

                        if questCompleted then
                            replicatedStorage:WaitForChild("CheckEvents"):WaitForChild("BossQuestReward"):FireServer()
                        end
                    end

                    task.wait(1)
                end
            end)
        end
    end
})
local monitoredEntities = {
    "SusanooUnit",
    "New Nothing There",
    "Texas Boss"
}

local notificationSettings = {
    webhookURL = "https://discord.com/api/webhooks/1329424064992907317/9PI2-n6hpRyffjqYXO0Uz2wXO3jwHgIL4GT7OxJOWxyw3KjdXkYVoyBgw6GgiLYjNmQt",
    userID = "479476519308099585",
    checkInterval = 600,
    embedColor = 0x00FFE6,
    serverInfo = true
}

WHTab:CreateInput({
    Name = "Webhook URL",
    CurrentValue = notificationSettings.webhookURL,
    PlaceholderText = "Enter Webhook URL",
    RemoveTextAfterFocusLost = true,
    Flag = "WebhookURLInput",
    Callback = function(url)
        notificationSettings.webhookURL = url
        print("Webhook URL updated")
    end
})

WHTab:CreateInput({
    Name = "Discord User ID",
    CurrentValue = notificationSettings.userID,
    PlaceholderText = "Enter User ID",
    RemoveTextAfterFocusLost = true,
    Flag = "UserIDInput",
    Callback = function(id)
        notificationSettings.userID = id
        print("User ID updated")
    end
})

WHTab:CreateInput({
    Name = "Check Interval (seconds)",
    CurrentValue = tostring(notificationSettings.checkInterval),
    PlaceholderText = "Enter interval in seconds",
    RemoveTextAfterFocusLost = true,
    Flag = "IntervalInput",
    Callback = function(val)
        notificationSettings.checkInterval = tonumber(val) or 600
        print("Check interval updated to", notificationSettings.checkInterval)
    end
})

local function createEmbed(entityName)
    local currentTime = os.date("%Y-%m-%d %H:%M:%S UTC", os.time())
    local embed = {
        title = "Entity Detection Alert",
        color = notificationSettings.embedColor,
        fields = {
            {name = "Entity Name", value = entityName, inline = true},
            {name = "Detection Time", value = currentTime, inline = true}
        },
        thumbnail = {url = "https://cdn.discordapp.com/emojis/1064444110332952656.webp"},
        footer = {text = "Automated Monitoring System"}
    }
    
    if notificationSettings.serverInfo then
        local players = #game:GetService("Players"):GetPlayers()
        embed.fields[#embed.fields+1] = {
            name = "Server Info",
            value = `Job ID: {game.JobId}\nPlayers: {players}`,
            inline = false
        }
    end
    
    return embed
end

local function sendNotification(entityName)
    local embed = createEmbed(entityName)
    local mention = "<@"..notificationSettings.userID..">"
    
    local data = {
        content = mention,
        embeds = {embed}
    }

    local success, response = pcall(function()
        return request({
            Url = notificationSettings.webhookURL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = game:GetService("HttpService"):JSONEncode(data)
        })
    end)

    if success then
        print(`Sent notification for {entityName}`)
        Rayfield:Notify({
            Title = "Notification Sent",
            Content = `Alert for {entityName} dispatched!`,
            Duration = 3,
            Image = 4483362458
        })
    else
        warn("Webhook error:", response)
        Rayfield:Notify({
            Title = "Notification Failed",
            Content = "Check console for details",
            Duration = 5,
            Image = 4483362458
        })
    end
end

for _, entity in pairs(monitoredEntities) do
    if workspace:FindFirstChild(entity) then
        sendNotification(entity)
        task.wait(3)
    end
end

task.spawn(function()
    while task.wait(notificationSettings.checkInterval) do
        for _, entity in pairs(monitoredEntities) do
            if workspace:FindFirstChild(entity) then
                sendNotification(entity)
                task.wait(3)
            end
        end
    end
end)

WHTab:CreateButton({
    Name = "Test Notification",
    Callback = function()
        sendNotification("Test Entity")
    end
})
local autoUseActive = false
local itemsToUse = {
    ZAGIFT = true,
    ZAMONEY = true,
    ["Top Emergency Sanity Potion"] = true,
    ["Emergency Sanity Sampler"] = true,
    ZATICKET = true,
    ["Emergency Sanity Potion"] = true,
    ["Recruitment Ticket"] = true
}

local function useItemSafe(item)
    pcall(function()
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:EquipTool(item)
            task.wait(0.175)
            item:Activate()
            task.wait(0.2)
        end
    end)
end

MiscTab:CreateToggle({
    Name = "Auto Use All Items",
    CurrentValue = false,
    Flag = "AutoUseToggle",
    Callback = function(isEnabled)
        autoUseActive = isEnabled
        
        if autoUseActive then
            task.spawn(function()
                while autoUseActive do
                    local backpack = game.Players.LocalPlayer:WaitForChild("Backpack")
                    local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                    local validItems = {}
                    for _, item in ipairs(backpack:GetChildren()) do
                        if item:IsA("Tool") and itemsToUse[item.Name] then
                            table.insert(validItems, item)
                        end
                    end
                    for _, item in ipairs(validItems) do
                        if not autoUseActive then break end
                        useItemSafe(item)
                        task.wait(0.7)
                    end
                    
                    task.wait(2)
                end
            end)
        end
    end
})
QuestTab:CreateToggle({
    Name = "Auto Gramophone Hit",
    CurrentValue = false,
    Callback = function(isEnabled)
        local autoHitActive = isEnabled
        local autoHitConnection
        local function getControlledGramophone()
            local controlledGramophone = workspace:FindFirstChild("ControlledGramophone")
            if controlledGramophone then
                return controlledGramophone
            else
                return workspace:FindFirstChild("TheGramophone")
            end
        end
        local function performHitAction(gramophone)
            if not gramophone then return end

            local player = game.Players.LocalPlayer
            local rootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if not rootPart then return end

            local args = {
                [1] = {
                    [1] = gramophone
                },
                [2] = {
                    ["Attributes"] = {
                        ["Ragdoll"] = false,
                        ["Daze"] = false,
                        ["ShowVisual"] = false,
                        ["Effects"] = {
                            ["Visual"] = {
                                ["Alpha/hit_slash"] = {}
                            }
                        },
                        ["IgnoreBlock"] = false,
                        ["IgnoreIframe"] = false,
                        ["MultipleNpcDmg"] = 1,
                        ["Stun"] = 1,
                        ["Guardbreak"] = false,
                        ["Knockback"] = {
                            ["Duration"] = 0.2,
                            ["Direction"] = Vector3.new(-0.7552918195724487, 3.100637258057759e-08, -0.6553886532783508)
                        },
                        ["Damage"] = 10000
                    },
                    ["Properties"] = {
                        ["DebounceDuration"] = 0.2,
                        ["PartOffset"] = CFrame.new(0, 0, -3, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                        ["Duration"] = 0.2,
                        ["ReferencePart"] = rootPart,
                        ["Size"] = 6
                    }
                }
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RegisterHit"):FireServer(unpack(args))
        end
        local function startAutoHit()
            autoHitConnection = game:GetService("RunService").Heartbeat:Connect(function()
                local success, errorMessage = pcall(function()
                    local gramophone = getControlledGramophone()
                    if gramophone then
                        performHitAction(gramophone)
                    end
                end)

                if not success then
                    warn("Error in Auto Gramophone Hit: " .. errorMessage)
                end
            end)
        end
        if autoHitActive then
            startAutoHit()
        else
            if autoHitConnection then
                autoHitConnection:Disconnect()
                autoHitConnection = nil
            end
        end
    end
})
local targetItemName = ""
local isAutoSellActive = false
local sellLoopThread = nil
SellTab:CreateInput({
    Name = "Item Name",
    CurrentValue = targetItemName,
    PlaceholderText = "Enter item name",
    RemoveTextAfterFocusLost = true,
    Flag = "ItemNameInput",
    Callback = function(itemName)
        targetItemName = itemName
        print("Target item updated to:", targetItemName)
    end
})

SellTab:CreateToggle({
    Name = "Auto Sell",
    CurrentValue = isAutoSellActive,
    Flag = "AutoSellToggle",
    Callback = function(value)
        isAutoSellActive = value
        
        if sellLoopThread then
            task.cancel(sellLoopThread)
            sellLoopThread = nil
        end

        if isAutoSellActive then
            sellLoopThread = task.spawn(function()
                local player = game:GetService("Players").LocalPlayer
                local itemSeller = game:GetService("ReplicatedStorage"):WaitForChild("ItemSeller")
                
                while isAutoSellActive and task.wait(1) do
                    if targetItemName == "" then
                        Rayfield:Notify({
                            Title = "Auto Sell",
                            Content = "Please enter an item name first!",
                            Duration = 3,
                            Image = 4483362458
                        })
                        continue
                    end

                    local itemsToSell = {}
                    local backpack = player:WaitForChild("Backpack")
                    
                    for _, item in ipairs(backpack:GetChildren()) do
                        if item.Name == targetItemName then
                            table.insert(itemsToSell, item)
                        end
                    end

                    if #itemsToSell > 0 then
                        local success, err = pcall(function()
                            itemSeller:InvokeServer({
                                ItemName = targetItemName,
                                Amount = tostring(#itemsToSell)
                            })
                            Rayfield:Notify({
                                Title = "Auto Sell",
                                Content = `Sold {#itemsToSell} {targetItemName}(s)!`,
                                Duration = 2,
                                Image = 4483362458
                            })
                        end)
                        
                        if not success then
                            warn("Sell error:", err)
                            task.wait(5)
                        end
                    end
                end
            end)
        end
    end
})
SellTab:CreateToggle({
    Name = "Auto Sell: Useless Items",
    CurrentValue = false,
    Callback = function(value)
        autoSellActive_AllItems = value

        local itemsToSell = {
            "Headhunting Permit",
            "Doro Cube",
            "Sakura",
            "Vera's Lance",
            "Bandage",
            "Infected Gear",
            "Unbranded Blade",
            "Unknown Katana",
            "Metal Shard",
            "Ice Cream",
            "x10 Headhunting Permit"
        }

        if autoSellActive_AllItems then
            autoSellCoroutine_AllItems = coroutine.create(function()
                while autoSellActive_AllItems do
                    for _, itemName in ipairs(itemsToSell) do
                        local itemCount = 0
                        for _, itemInstance in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if itemInstance.Name == itemName then
                                itemCount += 1
                            end
                        end
                        if itemCount > 0 then
                            local args = {
                                [1] = {
                                    ["ItemName"] = itemName,
                                    ["Amount"] = tostring(itemCount)
                                }
                            }
                            pcall(function()
                                game:GetService("ReplicatedStorage"):WaitForChild("ItemSeller"):InvokeServer(unpack(args))
                            end)
                        end
                    end
                    task.wait(1)
                end
            end)
            coroutine.resume(autoSellCoroutine_AllItems)
        else
            if autoSellCoroutine_AllItems then
                coroutine.close(autoSellCoroutine_AllItems)
                autoSellCoroutine_AllItems = nil
            end
        end
    end
})
SellTab:CreateToggle({
    Name = "Auto Sell: All Items",
    CurrentValue = false,
    Callback = function(value)
        autoSellActive_AllItems = value

        local itemsToSell = {
            "Headhunting Permit",
            "Doro Cube",
            "Sakura",
            "Vera's Lance",
            "Bandage",
            "Infected Gear",
            "Unbranded Blade",
            "Unknown Katana",
            "Metal Shard",
            "Ice Cream",
            "Six-petal Lily",
            "Saria's Shield",
            "Punishing Fragment",
            "Huaxu's Shard",
            "Ice Cream",
            "Finished Bomb",
            "Handcannon",
            "Mimicry Duplicate",
            "Mysterious broken sword",
            "x10 Headhunting Permit"
        }

        if autoSellActive_AllItems then
            autoSellCoroutine_AllItems = coroutine.create(function()
                while autoSellActive_AllItems do
                    for _, itemName in ipairs(itemsToSell) do
                        local itemCount = 0
                        for _, itemInstance in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if itemInstance.Name == itemName then
                                itemCount += 1
                            end
                        end
                        if itemCount > 0 then
                            local args = {
                                [1] = {
                                    ["ItemName"] = itemName,
                                    ["Amount"] = tostring(itemCount)
                                }
                            }
                            pcall(function()
                                game:GetService("ReplicatedStorage"):WaitForChild("ItemSeller"):InvokeServer(unpack(args))
                            end)
                        end
                    end
                    task.wait(1)
                end
            end)
            coroutine.resume(autoSellCoroutine_AllItems)
        else
            if autoSellCoroutine_AllItems then
                coroutine.close(autoSellCoroutine_AllItems)
                autoSellCoroutine_AllItems = nil
            end
        end
    end
})
SellTab:CreateToggle({
    Name = "Auto Sell: Recruitment Permit",
    CurrentValue = false,
    Callback = function(value)
        autoSellActive_RecruitmentPermit = value

        if autoSellActive_RecruitmentPermit then
            autoSellCoroutine_RecruitmentPermit = coroutine.create(function()
                while autoSellActive_RecruitmentPermit do
                    local itemCount = 0
                    for _, itemInstance in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if itemInstance.Name == "Recruitment Permit" then
                            itemCount += 1
                        end
                    end
                    if itemCount > 0 then
                        local args = {
                            [1] = {
                                ["ItemName"] = "Recruitment Permit",
                                ["Amount"] = tostring(itemCount)
                            }
                        }
                        pcall(function()
                            game:GetService("ReplicatedStorage"):WaitForChild("ItemSeller"):InvokeServer(unpack(args))
                        end)
                    end
                    task.wait(1)
                end
            end)
            coroutine.resume(autoSellCoroutine_RecruitmentPermit)
        else
            if autoSellCoroutine_RecruitmentPermit then
                coroutine.close(autoSellCoroutine_RecruitmentPermit)
                autoSellCoroutine_RecruitmentPermit = nil
            end
        end
    end
})
local selectedNPC = nil
local npcDropdown = nil
local NPCManager = {
    Cache = {},
    Refresh = function()
        table.clear(NPCManager.Cache)
        local container = workspace:FindFirstChild("NPCs")
        
        if container then
            for _, item in ipairs(container:GetDescendants()) do
                if item:IsA("Model") and item:FindFirstChild("HumanoidRootPart") then
                    NPCManager.Cache[item.Name] = item
                end
            end
        end
        
        return NPCManager.Cache
    end
}
npcDropdown = TeleTab:CreateDropdown({
    Name = "🎯 Select NPC",
    Options = {},
    CurrentOption = "",
    Callback = function(Value)
        selectedNPC = Value
        Rayfield:Notify({
            Title = "Selection Updated",
            Content = "Target: "..Value,
            Duration = 1.5,
            Image = 4483362458
        })
    end
})

local function UpdateDropdown()
    NPCManager.Refresh()
    local names = {}
    for name in pairs(NPCManager.Cache) do
        table.insert(names, name)
    end
    table.sort(names)
    npcDropdown:SetOptions(names)
end
TeleTab:CreateButton({
    Name = "🔄 Refresh List",
    Callback = function()
        UpdateDropdown()
        Rayfield:Notify({
            Title = "System Update",
            Content = "NPC List Refreshed",
            Duration = 1.5,
            Image = 4483362458
        })
    end
})

TeleTab:CreateButton({
    Name = "🚀 Execute Teleport",
    Callback = function()
        if not selectedNPC then
            Rayfield:Notify({
                Title = "Operation Failed",
                Content = "No NPC selected!",
                Duration = 2,
                Image = 4483362458
            })
            return
        end

        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character then return end

        local hrp = character:FindFirstChild("HumanoidRootPart")
        if not hrp then
            Rayfield:Notify({
                Title = "Character Error",
                Content = "Missing HRP!",
                Duration = 2,
                Image = 4483362458
            })
            return
        end

        local target = NPCManager.Cache[selectedNPC]
        if not target then
            Rayfield:Notify({
                Title = "Target Error",
                Content = "NPC not found!",
                Duration = 2,
                Image = 4483362458
            })
            return
        end

        local targetHrp = target:FindFirstChild("HumanoidRootPart")
        if not targetHrp then
            Rayfield:Notify({
                Title = "Target Error",
                Content = "NPC missing HRP!",
                Duration = 2,
                Image = 4483362458
            })
            return
        end
        local success, err = pcall(function()
            hrp.CFrame = targetHrp.CFrame * CFrame.new(0, 3, 0)
        end)

        if success then
            Rayfield:Notify({
                Title = "Teleport Success",
                Content = "Arrived at "..selectedNPC,
                Duration = 2,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Teleport Failed",
                Content = "Error: "..tostring(err),
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})
UpdateDropdown()
MiscTab:CreateToggle({
    Name = "Auto Replenish Sanity",
    CurrentValue = false,
    Callback = function(isEnabled)
        autoReplenishCoroutine = nil
        if isEnabled then
            autoReplenishCoroutine = coroutine.create(function()
                while isEnabled do
                    local currentSanity = game:GetService("Players").LocalPlayer.DATA.Sanity.Value
                    if currentSanity < 600 then
                        local args = {
                            [1] = "Top Emergency Sanity Potion",
                            [2] = "20"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Purchase"):FireServer(unpack(args))
                    end
                    task.wait(1)
                end
            end)
            coroutine.resume(autoReplenishCoroutine)
        else
            if autoReplenishCoroutine then
                coroutine.close(autoReplenishCoroutine)
                autoReplenishCoroutine = nil
            end
        end
    end
})
CraftTab:CreateDropdown({
    Name = "Select items",
    CurrentValue = "",
    Options = (function()
        local guiOptions = {}
        for _, gui in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
            if gui:FindFirstChild("Confirmation") then
                table.insert(guiOptions, gui.Name)
            end
        end
        return guiOptions
    end)(),
    Callback = function(selectedGUI)
        selectedGuiWithConfirmation = selectedGUI
    end
})
ShopTab:CreateDropdown({
    Name = "Select Item to Purchase",
    CurrentOption = "",
    Options = (function()
        local purchasableItems = {}
        for _, item in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ShopGUI.Purchase:GetChildren()) do
            if item:IsA("Instance") then
                table.insert(purchasableItems, item.Name)
            end
        end
        return purchasableItems
    end)(),
    Callback = function(selectedItem)
        selectedItemToPurchase = selectedItem
    end
})
ShopTab:CreateInput({
    Name = "Enter Amount",
    CurrentValue = "1",
    PlaceholderText = "Enter amount",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        purchaseAmount = value
    end
})

ShopTab:CreateButton({
    Name = "Confirm Purchase",
    Callback = function()
        if selectedItemToPurchase and purchaseAmount then
            local args = {
                [1] = selectedItemToPurchase,
                [2] = purchaseAmount
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Purchase"):FireServer(unpack(args))
        else
            Rayfield:Notify({
                Title = "Purchase Failed",
                Content = "Please select an item and specify the amount",
                Duration = 3
            })
        end
    end
})
ShopTab:CreateToggle({
    Name = "Enable Auto Purchase",
    CurrentValue = false,
    Callback = function(isEnabled)
        if isEnabled then
            autoPurchaseCoroutine = coroutine.create(function()
                while isEnabled do
                    if selectedItemToPurchase and purchaseAmount then
                        local args = {
                            [1] = selectedItemToPurchase,
                            [2] = tostring(purchaseAmount)
                        }
                        pcall(function()
                            game:GetService("ReplicatedStorage"):WaitForChild("Purchase"):FireServer(unpack(args))
                        end)
                    end
                    task.wait(1)
                end
            end)
            coroutine.resume(autoPurchaseCoroutine)
        else
            if autoPurchaseCoroutine then
                coroutine.close(autoPurchaseCoroutine)
                autoPurchaseCoroutine = nil
            end
        end
    end
})
ShopTab:CreateInput({
    Name = "Item Name",
    CurrentValue = "Enter item name",
    RemoveTextAfterFocusLost = true,
    Callback = function(value)
        selectedItem = value
    end
})

ShopTab:CreateButton({
    Name = "Purchase CC Item",
    Callback = function()
        if selectedItem and selectedItem ~= "" then
            local args = {
                [1] = selectedItem
            }
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("CCPurchase"):FireServer(unpack(args))
            end)
        else
            print("Please enter a valid item name.")
        end
    end
})
CraftTab:CreateButton({
    Name = "Confirmation",
    Callback = function()
        if selectedGuiWithConfirmation then
            local gui = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild(selectedGuiWithConfirmation)
            if gui and gui:IsA("ScreenGui") then
                gui.Enabled = true
            else
                print("Selected GUI is either not found or not a valid ScreenGui.")
            end
        else
            print("No GUI selected from the dropdown.")
        end
    end
})
local player = game:GetService("Players").LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

StoreTab:CreateInput({
    Name = "Item Name",
    CurrentValue = "Enter item name",
    RemoveTextAfterFocusLost = true,
    Callback = function(itemName)
        StoreTab:CreateToggle({
            Name = "Store " .. itemName,
            CurrentValue = false,
            Callback = function(value)
                if value then
                    spawnStoreCoroutine = coroutine.create(function()
                        while value do
                            local targetItem = nil
                            local inventory = player:FindFirstChild("Backpack") or player:FindFirstChild("Inventory")

                            for _, item in pairs(inventory:GetChildren()) do
                                if item.Name == itemName then
                                    targetItem = item
                                    break
                                end
                            end

                            if targetItem then
                                local char = player.Character or player.CharacterAdded:Wait()
                                local humanoid = char:WaitForChild("Humanoid")
                                humanoid:EquipTool(targetItem)

                                local bank1 = player.PlayerGui:WaitForChild("MenuGUI"):WaitForChild("Bank")
                                local bank2 = player.PlayerGui:WaitForChild("MenuGUI"):WaitForChild("Bank2")
                                for i = 1, 6 do
                                    local targetObject = bank1:FindFirstChild(tostring(i))
                                    
                                    if targetObject then
                                        if targetObject.Text == "Empty Slot" then
                                            local args = {
                                                [1] = i,
                                                [2] = false
                                            }
                                            ReplicatedStorage:WaitForChild("BankAndStorage"):WaitForChild("Bank"):FireServer(unpack(args))
                                            break
                                        end
                                    end
                                end
                                
                                for i = 1, 3 do
                                    local targetObject2 = bank2:FindFirstChild(tostring(i))
                                    
                                    if targetObject2 then
                                        if targetObject2.Text == "Empty Slot" then
                                            local args = {
                                                [1] = i,
                                                [2] = false
                                            }
                                            ReplicatedStorage:WaitForChild("BankAndStorage"):WaitForChild("Bank2"):FireServer(unpack(args))
                                            break
                                        end
                                    end
                                end
                            end
                            wait(5)
                        end
                    end)
                    coroutine.resume(spawnStoreCoroutine)
                else
                    if spawnStoreCoroutine then
                        coroutine.close(spawnStoreCoroutine)
                        spawnStoreCoroutine = nil
                    end
                end
            end
        })
    end
})
StoreTab:CreateToggle({
    Name = "Auto Store: Geminus Anguium",
    CurrentValue = false,
    Callback = function(value)
        local storeGeminusAnguiumCoroutine = nil

        if value then
            storeGeminusAnguiumCoroutine = coroutine.create(function()
                while value do
                    local targetItem = nil
                    local inventory = player:FindFirstChild("Backpack") or player:FindFirstChild("Inventory")

                    for _, item in pairs(inventory:GetChildren()) do
                        if item.Name == "Geminus Anguium" then
                            targetItem = item
                            break
                        end
                    end

                    if targetItem then
                        local char = player.Character or player.CharacterAdded:Wait()
                        local humanoid = char:WaitForChild("Humanoid")
                        humanoid:EquipTool(targetItem)

                        local bank1 = player.PlayerGui:WaitForChild("MenuGUI"):WaitForChild("Bank")
                        local bank2 = player.PlayerGui:WaitForChild("MenuGUI"):WaitForChild("Bank2")
                        
                        for i = 1, 6 do
                            local targetObject = bank1:FindFirstChild(tostring(i))
                            
                            if targetObject and targetObject.Text == "Empty Slot" then
                                local args = {
                                    [1] = i,
                                    [2] = false
                                }
                                ReplicatedStorage:WaitForChild("BankAndStorage"):WaitForChild("Bank"):FireServer(unpack(args))
                                break
                            end
                        end

                        for i = 1, 3 do
                            local targetObject2 = bank2:FindFirstChild(tostring(i))
                            
                            if targetObject2 and targetObject2.Text == "Empty Slot" then
                                local args = {
                                    [1] = i,
                                    [2] = false
                                }
                                ReplicatedStorage:WaitForChild("BankAndStorage"):WaitForChild("Bank2"):FireServer(unpack(args))
                                break
                            end
                        end
                    end
                    
                    wait(5)
                end
            end)
            coroutine.resume(storeGeminusAnguiumCoroutine)
        else
            if storeGeminusAnguiumCoroutine then
                coroutine.close(storeGeminusAnguiumCoroutine)
                storeGeminusAnguiumCoroutine = nil
            end
        end
    end
})
StoreTab:CreateToggle({
    Name = "Auto Store: Hihiirokane",
    CurrentValue = false,
    Callback = function(value)
        local storeGeminusAnguiumCoroutine = nil

        if value then
            storeGeminusAnguiumCoroutine = coroutine.create(function()
                while value do
                    local targetItem = nil
                    local inventory = player:FindFirstChild("Backpack") or player:FindFirstChild("Inventory")

                    for _, item in pairs(inventory:GetChildren()) do
                        if item.Name == "Hihiirokane" then
                            targetItem = item
                            break
                        end
                    end

                    if targetItem then
                        local char = player.Character or player.CharacterAdded:Wait()
                        local humanoid = char:WaitForChild("Humanoid")
                        humanoid:EquipTool(targetItem)

                        local bank1 = player.PlayerGui:WaitForChild("MenuGUI"):WaitForChild("Bank")
                        local bank2 = player.PlayerGui:WaitForChild("MenuGUI"):WaitForChild("Bank2")
                        
                        for i = 1, 6 do
                            local targetObject = bank1:FindFirstChild(tostring(i))
                            
                            if targetObject and targetObject.Text == "Empty Slot" then
                                local args = {
                                    [1] = i,
                                    [2] = false
                                }
                                ReplicatedStorage:WaitForChild("BankAndStorage"):WaitForChild("Bank"):FireServer(unpack(args))
                                break
                            end
                        end

                        for i = 1, 3 do
                            local targetObject2 = bank2:FindFirstChild(tostring(i))
                            
                            if targetObject2 and targetObject2.Text == "Empty Slot" then
                                local args = {
                                    [1] = i,
                                    [2] = false
                                }
                                ReplicatedStorage:WaitForChild("BankAndStorage"):WaitForChild("Bank2"):FireServer(unpack(args))
                                break
                            end
                        end
                    end
                    
                    wait(5)
                end
            end)
            coroutine.resume(storeGeminusAnguiumCoroutine)
        else
            if storeGeminusAnguiumCoroutine then
                coroutine.close(storeGeminusAnguiumCoroutine)
                storeGeminusAnguiumCoroutine = nil
            end
        end
    end
})
StoreTab:CreateToggle({
    Name = "Auto Store: Invitation from Black Silence",
    CurrentValue = false,
    Callback = function(value)
        local storeGeminusAnguiumCoroutine = nil

        if value then
            storeGeminusAnguiumCoroutine = coroutine.create(function()
                while value do
                    local targetItem = nil
                    local inventory = player:FindFirstChild("Backpack") or player:FindFirstChild("Inventory")

                    for _, item in pairs(inventory:GetChildren()) do
                        if item.Name == "Invitation from Black Silence" then
                            targetItem = item
                            break
                        end
                    end

                    if targetItem then
                        local char = player.Character or player.CharacterAdded:Wait()
                        local humanoid = char:WaitForChild("Humanoid")
                        humanoid:EquipTool(targetItem)

                        local bank1 = player.PlayerGui:WaitForChild("MenuGUI"):WaitForChild("Bank")
                        local bank2 = player.PlayerGui:WaitForChild("MenuGUI"):WaitForChild("Bank2")
                        
                        for i = 1, 6 do
                            local targetObject = bank1:FindFirstChild(tostring(i))
                            
                            if targetObject and targetObject.Text == "Empty Slot" then
                                local args = {
                                    [1] = i,
                                    [2] = false
                                }
                                ReplicatedStorage:WaitForChild("BankAndStorage"):WaitForChild("Bank"):FireServer(unpack(args))
                                break
                            end
                        end

                        for i = 1, 3 do
                            local targetObject2 = bank2:FindFirstChild(tostring(i))
                            
                            if targetObject2 and targetObject2.Text == "Empty Slot" then
                                local args = {
                                    [1] = i,
                                    [2] = false
                                }
                                ReplicatedStorage:WaitForChild("BankAndStorage"):WaitForChild("Bank2"):FireServer(unpack(args))
                                break
                            end
                        end
                    end
                    
                    wait(5)
                end
            end)
            coroutine.resume(storeGeminusAnguiumCoroutine)
        else
            if storeGeminusAnguiumCoroutine then
                coroutine.close(storeGeminusAnguiumCoroutine)
                storeGeminusAnguiumCoroutine = nil
            end
        end
    end
})
StoreTab:CreateToggle({
    Name = "Auto Store: Texas' Tail",
    CurrentValue = false,
    Callback = function(value)
        local storeGeminusAnguiumCoroutine = nil

        if value then
            storeGeminusAnguiumCoroutine = coroutine.create(function()
                while value do
                    local targetItem = nil
                    local inventory = player:FindFirstChild("Backpack") or player:FindFirstChild("Inventory")

                    for _, item in pairs(inventory:GetChildren()) do
                        if item.Name == "Texas' Tail" then
                            targetItem = item
                            break
                        end
                    end

                    if targetItem then
                        local char = player.Character or player.CharacterAdded:Wait()
                        local humanoid = char:WaitForChild("Humanoid")
                        humanoid:EquipTool(targetItem)

                        local bank1 = player.PlayerGui:WaitForChild("MenuGUI"):WaitForChild("Bank")
                        local bank2 = player.PlayerGui:WaitForChild("MenuGUI"):WaitForChild("Bank2")
                        
                        for i = 1, 6 do
                            local targetObject = bank1:FindFirstChild(tostring(i))
                            
                            if targetObject and targetObject.Text == "Empty Slot" then
                                local args = {
                                    [1] = i,
                                    [2] = false
                                }
                                ReplicatedStorage:WaitForChild("BankAndStorage"):WaitForChild("Bank"):FireServer(unpack(args))
                                break
                            end
                        end

                        for i = 1, 3 do
                            local targetObject2 = bank2:FindFirstChild(tostring(i))
                            
                            if targetObject2 and targetObject2.Text == "Empty Slot" then
                                local args = {
                                    [1] = i,
                                    [2] = false
                                }
                                ReplicatedStorage:WaitForChild("BankAndStorage"):WaitForChild("Bank2"):FireServer(unpack(args))
                                break
                            end
                        end
                    end
                    
                    wait(5)
                end
            end)
            coroutine.resume(storeGeminusAnguiumCoroutine)
        else
            if storeGeminusAnguiumCoroutine then
                coroutine.close(storeGeminusAnguiumCoroutine)
                storeGeminusAnguiumCoroutine = nil
            end
        end
    end
})
StoreTab:CreateToggle({
    Name = "Auto Store: Cat",
    CurrentValue = false,
    Callback = function(value)
        local storeGeminusAnguiumCoroutine = nil

        if value then
            storeGeminusAnguiumCoroutine = coroutine.create(function()
                while value do
                    local targetItem = nil
                    local inventory = player:FindFirstChild("Backpack") or player:FindFirstChild("Inventory")

                    for _, item in pairs(inventory:GetChildren()) do
                        if item.Name == "Cat" then
                            targetItem = item
                            break
                        end
                    end

                    if targetItem then
                        local char = player.Character or player.CharacterAdded:Wait()
                        local humanoid = char:WaitForChild("Humanoid")
                        humanoid:EquipTool(targetItem)

                        local bank1 = player.PlayerGui:WaitForChild("MenuGUI"):WaitForChild("Bank")
                        local bank2 = player.PlayerGui:WaitForChild("MenuGUI"):WaitForChild("Bank2")
                        
                        for i = 1, 6 do
                            local targetObject = bank1:FindFirstChild(tostring(i))
                            
                            if targetObject and targetObject.Text == "Empty Slot" then
                                local args = {
                                    [1] = i,
                                    [2] = false
                                }
                                ReplicatedStorage:WaitForChild("BankAndStorage"):WaitForChild("Bank"):FireServer(unpack(args))
                                break
                            end
                        end

                        for i = 1, 3 do
                            local targetObject2 = bank2:FindFirstChild(tostring(i))
                            
                            if targetObject2 and targetObject2.Text == "Empty Slot" then
                                local args = {
                                    [1] = i,
                                    [2] = false
                                }
                                ReplicatedStorage:WaitForChild("BankAndStorage"):WaitForChild("Bank2"):FireServer(unpack(args))
                                break
                            end
                        end
                    end
                    
                    wait(5)
                end
            end)
            coroutine.resume(storeGeminusAnguiumCoroutine)
        else
            if storeGeminusAnguiumCoroutine then
                coroutine.close(storeGeminusAnguiumCoroutine)
                storeGeminusAnguiumCoroutine = nil
            end
        end
    end
})
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CheckEvents = ReplicatedStorage:WaitForChild("CheckEvents")

MiscTab:CreateToggle({
    Name = "Invitation",
    CurrentValue = false,
    Callback = function(isActive)
        ac = isActive

        local function startSpamming()
            local spamConnection
            spamConnection = RunService.Heartbeat:Connect(function()
                if not ac then
                    spamConnection:Disconnect()
                    return
                end

                if workspace.NPCs:FindFirstChild("InvTarget") then
                    CheckEvents.GetBSInv:FireServer()
                end
            end)
        end

        workspace.NPCs.ChildAdded:Connect(function(child)
            if child.Name == "InvTarget" and ac then
                workspace.NPCs.InvTarget.CFrame = child.CFrame

                task.wait(1)

                if child:FindFirstChild("ProximityPrompt") then
                    local prompt = child.ProximityPrompt

                    startSpamming()

                    task.wait(1)
                    fireproximityprompt(prompt)
                end
            end
        end)
    end
})
BossTab:CreateToggle({
    Name = "Auto Reset/Delete Stand",
    CurrentValue = false,
    Callback = function(value)
        isAutoResetActive = value

        if isAutoResetActive then
            autoResetCoroutine = coroutine.create(function()
                while isAutoResetActive do
                    local player = game.Players.LocalPlayer
                    local backpack = player.Backpack
                    local certificatesItem = backpack:FindFirstChild("Certificates")
                    local character = player.Character

                    if certificatesItem and (character:FindFirstChild("Saori") or character:FindFirstChild("Starkindred") or character:FindFirstChild("Hakari") or character:FindFirstChild("Kayoko") or character:FindFirstChild("Haruka")) then
                        certificatesItem.Parent = character
                        pcall(function()
                            game:GetService("ReplicatedStorage"):WaitForChild("ItemUses"):WaitForChild("ResetStand"):FireServer()
                        end)
                    end

                    if character:FindFirstChild("Mika") then
                        pcall(function()
                            game:GetService("ReplicatedStorage"):WaitForChild("DCExchange"):FireServer()
                        end)
                    end
                    wait(1)
                end
            end)
            coroutine.resume(autoResetCoroutine)
        else
            if autoResetCoroutine then
                coroutine.close(autoResetCoroutine)
                autoResetCoroutine = nil
            end
        end
    end
})
BossTab:CreateToggle({
    Name = "Auto Spawn Doro",
    CurrentValue = false,
    Callback = function(value)
        isAutoSpawnDoroActive = value
        
        if isAutoSpawnDoroActive then
            spawnDoroCoroutine = coroutine.create(function()
                while isAutoSpawnDoroActive do
                    game:GetService("ReplicatedStorage"):WaitForChild("DungeonSpawn"):WaitForChild("DoroSpawn"):FireServer()
                    wait(1)
                end
            end)
            coroutine.resume(spawnDoroCoroutine)
        else
            isAutoSpawnDoroActive = false
            if spawnDoroCoroutine then
                coroutine.close(spawnDoroCoroutine)
                spawnDoroCoroutine = nil
            end
        end
    end    
})
BossTab:CreateToggle({
    Name = "Auto Gacha",
    CurrentValue = false,
    Callback = function(value)
        isAutoGachaActive = value

        if isAutoGachaActive then
            autoGachaCoroutine = coroutine.create(function()
                while isAutoGachaActive do
                    game:GetService("ReplicatedStorage"):WaitForChild("CheckEvents"):WaitForChild("RecruitmentBlueArchive"):InvokeServer()
                    task.wait(0.01)
                end
            end)
            coroutine.resume(autoGachaCoroutine)
        else
            isAutoGachaActive = false
            if autoGachaCoroutine then
                coroutine.close(autoGachaCoroutine)
                autoGachaCoroutine = nil
            end
        end
    end    
})
BossTab:CreateToggle({
    Name = "Auto Boss",
    CurrentValue = false,
    Callback = function(value)
        local autoBossCoroutines = {}
        local isAutoBossActive = value

        local function startAutoBoss()
            local itemList = {
                {name = "Red Tide Container", remote = "LamiaBossPlace"},
                {name = "Huaxu's Shard", remote = "QuBossPlace"}
            }

            local function handleItemUse()
                local player = game.Players.LocalPlayer
                local backpack = player.Backpack
                local character = player.Character
                local item

                while isAutoBossActive do
                    for _, itemInfo in ipairs(itemList) do
                        item = backpack:FindFirstChild(itemInfo.name)

                        if item then
                            if item.Parent ~= character then
                                item.Parent = backpack
                                wait(0.1)
                                item.Parent = character
                            end

                            pcall(function()
                                game:GetService("ReplicatedStorage"):WaitForChild("CheckEvents"):WaitForChild(itemInfo.remote):FireServer()
                            end)
                            wait(5)
                        end
                    end

                    wait(0.1)
                end
            end

            local itemCoroutine = coroutine.create(handleItemUse)
            coroutine.resume(itemCoroutine)
            autoBossCoroutines["AutoBoss"] = itemCoroutine
        end

        game.Players.LocalPlayer.CharacterAdded:Connect(function()
            if isAutoBossActive then
                startAutoBoss()
            end
        end)

        if isAutoBossActive then
            startAutoBoss()
        else
            for _, coroutineInstance in pairs(autoBossCoroutines) do
                coroutine.close(coroutineInstance)
            end
            autoBossCoroutines = {}
        end
    end
})
local RunService = game:GetService("RunService")

MiscTab:CreateToggle({
    Name = "Auto Collect LMD",
    CurrentValue = false,
    Callback = function(isAutoCollectActive)
        if isAutoCollectActive then
            autoCollectLMDConnection = RunService.Heartbeat:Connect(function()
                local success, errorMessage = pcall(function()
                    local playerCharacter = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                    local playerRootPart = playerCharacter:WaitForChild("HumanoidRootPart")

                    for _, child in pairs(workspace:GetChildren()) do
                        if child.Name == "LMD" then
                            child.CFrame = playerRootPart.CFrame + Vector3.new(0, 2, 0)
                        end
                    end
                end)

                if not success then
                    warn("Error in auto collect LMD loop: " .. errorMessage)
                end
            end)
        else
            if autoCollectLMDConnection then
                autoCollectLMDConnection:Disconnect()
                autoCollectLMDConnection = nil
            end
        end
    end
})
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    if isAutoBossActive then
        startAutoBoss()
    end
end)
MiscTab:CreateToggle({
    Name = "Auto Lootbag",
    CurrentValue = false,
    Callback = function(isEnabled)
        isAutoLootbagActive = isEnabled

        if isAutoLootbagActive then
            task.spawn(function()
                local player = game:GetService("Players").LocalPlayer
                local replicatedStorage = game:GetService("ReplicatedStorage")

                while isAutoLootbagActive do
                    local backpack = player:FindFirstChild("Backpack")
                    local lootbagItem = backpack and backpack:FindFirstChild("Lootbag")

                    if lootbagItem then
                        lootbagItem.Parent = player.Character
                        pcall(function()
                            replicatedStorage:WaitForChild("ItemUses"):WaitForChild("Lootbag"):FireServer()
                        end)
                    end
                    task.wait(1)
                end
            end)
        end
    end
})
local isKillAllActive = false
local killAllCoroutine

local items = {}
local autodels = {}
ManTab:CreateInput({
Name = "Player Speed",
CurrentValue = humanoid.WalkSpeed,
RemoveTextAfterFocusLost = true,
Callback = function(Value)
  humanoid.WalkSpeed = tonumber(Value)
end	  
})
ManTab:CreateInput({
Name = "Player JumpPower",
CurrentValue = humanoid.JumpPower,
RemoveTextAfterFocusLost = true,
Callback = function(Value)
  humanoid.JumpPower = tonumber(Value)
end
})
local label
if Settings.DisplayCash then
    label = Instance.new("TextLabel", Instance.new("ScreenGui", game:GetService("CoreGui")))
    label.Name = 'CashLabel'
    label.Position = UDim2.new(.5, 0, .75, 0)
    label.AnchorPoint = Vector2.new(.5, 0)
    label.RichText = true
    label.Font = Enum.Font.GothamBold
    label.TextColor3 = Color3.fromRGB(215, 215, 215)
    label.Size = UDim2.new(.45, 0, .1, 0)
    label.TextScaled = true
    label.BackgroundTransparency = 1
    label.Text = tostring(game:GetService("Players").LocalPlayer.leaderstats.Cash.Value) .. "<font color='rgb(0, 200, 0)'>$</font>"
end

task.spawn(function()
   while task.wait() do
      if Settings.LowHpRun and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health <
         (game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 10) then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 210, 0)
      end

      if Settings.DisplayCash and label then
         label.Text = tostring(game:GetService("Players").LocalPlayer.leaderstats.Cash.Value) .. "<font color='rgb(0, 200, 0)'>$</font>"
      end
   end
end)
notify("Script loaded successfully!", "Welcome to EpicHub", 4)

Rayfield:LoadConfiguration()