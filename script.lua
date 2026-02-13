-- Создаём базовое GUI
local screen = game:GetService("CoreGui")

-- Окно
local window = Instance.new("ScreenGui")
window.Parent = screen

local frame = Instance.new("Frame")
frame.Parent = window
frame.Position = UDim2.new(0.5, -150, 0.4, 0)
frame.Size = UDim2.new(0, 300, 0, 200)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.CornerRadius = UDim.new(0, 10)

-- Заголовок
local title = Instance.new("TextLabel")
title.Parent = frame
title.Position = UDim2.new(0, 0, 0, -40)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Kick Player"
title.Font = Enum.Font.GothamSemibold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
title.BorderSizePixel = 0
title.TextSize = 20

-- Поле для никнейма
local usernameLabel = Instance.new("TextLabel")
usernameLabel.Parent = frame
usernameLabel.Position = UDim2.new(0.1, 0, 0.2, 0)
usernameLabel.Size = UDim2.new(0.8, 0, 0, 30)
usernameLabel.Text = "Username:"
usernameNewtonLabel.Font = Enum.Font.Gotham
usernameLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
usernameLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
usernameLabel.BorderSizePixel = 0
usernameLabel.TextXAlignment = Enum.TextXAlignment.Left
usernameLabel.PaddingLeft = UDim.new(0, 10)

local usernameInput = Instance.new("TextBox")
usernameInput.Parent = frame
usernameInput.Position = UDim2.new(0.1, 0, 0.32, 0)
usernameInput.Size = UDim2.new(0.8, 0, 0, 30)
usernameInput.PlaceholderText = "Enter player name"
usernameInput.Font = Enum.Font.Gotham
usernameInput.TextColor3 = Color3.fromRGB(255, 255, 255)
usernameInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
usernameInput.BorderSizePixel = 1
usernameInput.BorderColor3 = Color3.fromRGB(70, 70, 70)
usernameInput.TextSize = 14

-- Поле для причины
local reasonLabel = Instance.new("TextLabel")
reasonLabel.Parent = frame
reasonLabel.Position = UDim2.new(0.1, 0, 0.48, 0)
reasonLabel.Size = UDim2.new(0.8, 0, 0, 30)
reasonLabel.Text = "Reason:"
reasonLabel.Font = Enum.Font.Gotham
reasonLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
reasonLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
reasonLabel.BorderSizePixel = 0
reasonLabel.TextXAlignment = Enum.TextXAlignment.Left
reasonLabel.PaddingLeft = UDim.new(0, 10)

local reasonInput = Instance.new("TextBox")
reasonInput.Parent = frame
reasonInput.Position = UDim2.new(0.1, 0, 0.6, 0)
reasonInput.Size = UDim2.new(0.8, 0, 0, 30)
reasonInput.PlaceholderText = "Enter reason"
reasonInput.Font = Enum.Font.Gotham
reasonInput.TextColor3 = Color3.fromRGB(255, 255, 255)
reasonInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
reasonInput.BorderSizePixel = 1
reasonInput.BorderColor3 = Color3.fromRGB(70, 70, 70)
reasonInput.TextSize = 14

-- Кнопка Kick
local kickButton = Instance.new("TextButton")
kickButton.Parent = frame
kickButton.Position = UDim2.new(0.1, 0, 0.8, 0)
kickButton.Size = UDim2.new(0.8, 0, 0, 40)
kickButton.Text = "Kick Player"
kickButton.Font = Enum.Font.GothamSemibold
kickButton.TextColor3 = Color3.fromRGB(255, 255, 255)
kickButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
kickButton.BorderSizePixel = 0
kickButton.TextSize = 16
kickButton.CornerRadius = UDim.new(0, 5)

-- Обработчик нажатия
kickButton.MouseButton1Click:Connect(function()
    local targetName = usernameInput.Text
    local reason = reasonInput.Text or "No reason given"

    -- Ищем игрока по никнейму
    local players = game:GetService("Players"):GetPlayers()
    local targetPlayer = nil

    for _, player in ipairs(players) do
        if string.lower(player.Name) == string.lower(targetName) then
            targetPlayer = player
            break
        end
    end

    if not targetPlayer then
        warn("Player not found: " .. targetName)
        return
    end

    -- Отправляем запрос на кик через RemoteEvent (пример)
    -- Убедитесь, что на сервере есть соответствующий RemoteEvent!
    local remoteEvent = game:GetService("ReplicatedStorage"):FindFirstChild("KickPlayerRemote")
    if remoteEvent then
        remoteEvent:FireServer(targetPlayer, reason)
    else
        warn("RemoteEvent 'KickPlayerRemote' not found!")
    end
end)
