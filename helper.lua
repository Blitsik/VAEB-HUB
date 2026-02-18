--// VAEB HUB - Update Notice
--// Simple GUI for maintenance/update notifications

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

--// ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VaebUpdateNotice"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.DisplayOrder = 999999999
ScreenGui.Parent = game.CoreGui

--// Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 420, 0, 320)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 2
MainStroke.Transparency = 0.3
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MainStroke.Parent = MainFrame

-- Animated gradient stroke
local MainStrokeGradient = Instance.new("UIGradient")
MainStrokeGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 150)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 100, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 150, 255))
})
MainStrokeGradient.Parent = MainStroke

task.spawn(function()
    while MainStroke.Parent do
        for i = 0, 360, 2 do
            if not MainStroke.Parent then break end
            MainStrokeGradient.Rotation = i
            task.wait(0.03)
        end
    end
end)

-- Outer Glow
local OuterGlow = Instance.new("ImageLabel")
OuterGlow.Size = UDim2.new(1, 80, 1, 80)
OuterGlow.Position = UDim2.new(0.5, -40, 0.5, -40)
OuterGlow.AnchorPoint = Vector2.new(0.5, 0.5)
OuterGlow.BackgroundTransparency = 1
OuterGlow.Image = "rbxassetid://5028857084"
OuterGlow.ImageColor3 = Color3.fromRGB(150, 100, 255)
OuterGlow.ImageTransparency = 0.4
OuterGlow.ScaleType = Enum.ScaleType.Slice
OuterGlow.SliceCenter = Rect.new(24, 24, 276, 276)
OuterGlow.ZIndex = 0
OuterGlow.Parent = MainFrame

-- Pulsing animation
task.spawn(function()
    while OuterGlow.Parent do
        TweenService:Create(OuterGlow, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            ImageTransparency = 0.2
        }):Play()
        task.wait(1.5)
        TweenService:Create(OuterGlow, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            ImageTransparency = 0.6
        }):Play()
        task.wait(1.5)
    end
end)

--// Icon Container
local IconContainer = Instance.new("Frame")
IconContainer.Size = UDim2.new(0, 80, 0, 80)
IconContainer.Position = UDim2.new(0.5, -40, 0, 30)
IconContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
IconContainer.BackgroundTransparency = 0.3
IconContainer.BorderSizePixel = 0
IconContainer.Parent = MainFrame

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(1, 0)
IconCorner.Parent = IconContainer

local IconStroke = Instance.new("UIStroke")
IconStroke.Color = Color3.fromRGB(150, 100, 255)
IconStroke.Thickness = 2
IconStroke.Transparency = 0.4
IconStroke.Parent = IconContainer

-- Icon Text
local IconLabel = Instance.new("TextLabel")
IconLabel.Size = UDim2.new(1, 0, 1, 0)
IconLabel.BackgroundTransparency = 1
IconLabel.Text = "⚠"
IconLabel.Font = Enum.Font.GothamBold
IconLabel.TextSize = 48
IconLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
IconLabel.Parent = IconContainer

-- Animated icon color
task.spawn(function()
    while IconLabel.Parent do
        for hue = 0.1, 0.2, 0.002 do
            if not IconLabel.Parent then break end
            IconLabel.TextColor3 = Color3.fromHSV(hue, 0.8, 1)
            task.wait(0.05)
        end
        for hue = 0.2, 0.1, -0.002 do
            if not IconLabel.Parent then break end
            IconLabel.TextColor3 = Color3.fromHSV(hue, 0.8, 1)
            task.wait(0.05)
        end
    end
end)

--// Main Title
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -40, 0, 40)
TitleLabel.Position = UDim2.new(0, 20, 0, 120)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "SCRIPT ON UPDATE"
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 28
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
TitleLabel.Parent = MainFrame

local TitleStroke = Instance.new("UIStroke")
TitleStroke.Color = Color3.fromRGB(0, 0, 0)
TitleStroke.Thickness = 2
TitleStroke.Transparency = 0.5
TitleStroke.Parent = TitleLabel

-- Animated title color
task.spawn(function()
    while TitleLabel.Parent do
        for hue = 0, 1, 0.005 do
            if not TitleLabel.Parent then break end
            TitleLabel.TextColor3 = Color3.fromHSV(hue, 0.6, 1)
            task.wait(0.04)
        end
    end
end)

--// Separator Line
local Separator = Instance.new("Frame")
Separator.Size = UDim2.new(0.8, 0, 0, 2)
Separator.Position = UDim2.new(0.1, 0, 0, 170)
Separator.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
Separator.BackgroundTransparency = 0.3
Separator.BorderSizePixel = 0
Separator.Parent = MainFrame

local SepGradient = Instance.new("UIGradient")
SepGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 150)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 100, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 150, 255))
}
SepGradient.Parent = Separator

--// Info Text
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, -40, 0, 25)
InfoLabel.Position = UDim2.new(0, 20, 0, 185)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = "JOIN DISCORD OR TELEGRAM"
InfoLabel.Font = Enum.Font.GothamBold
InfoLabel.TextSize = 15
InfoLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
InfoLabel.TextXAlignment = Enum.TextXAlignment.Center
InfoLabel.Parent = MainFrame

--// Button Creation Function
local function CreateCopyButton(text, icon, position, link)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 190, 0, 50)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
    button.BackgroundTransparency = 0.3
    button.BorderSizePixel = 0
    button.Text = ""
    button.AutoButtonColor = false
    button.Parent = MainFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 12)
    btnCorner.Parent = button
    
    local btnGradient = Instance.new("UIGradient")
    btnGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(26, 26, 31)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 24))
    }
    btnGradient.Rotation = 90
    btnGradient.Parent = button
    
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Color = Color3.fromRGB(80, 120, 200)
    btnStroke.Thickness = 2
    btnStroke.Transparency = 0.4
    btnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    btnStroke.Parent = button
    
    -- Icon
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 30, 0, 30)
    iconLabel.Position = UDim2.new(0, 15, 0.5, -15)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.TextSize = 22
    iconLabel.TextColor3 = Color3.fromRGB(120, 180, 255)
    iconLabel.Parent = button


print("[VAEB HUB] Update notice displayed")
    
    -- Text Label
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, -55, 0, 20)
    textLabel.Position = UDim2.new(0, 50, 0, 8)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextSize = 14
    textLabel.TextColor3 = Color3.fromRGB(210, 210, 230)
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.Parent = button
    
    -- Link Label
    local linkLabel = Instance.new("TextLabel")
    linkLabel.Size = UDim2.new(1, -55, 0, 16)
    linkLabel.Position = UDim2.new(0, 50, 0, 28)
    linkLabel.BackgroundTransparency = 1
    linkLabel.Text = link
    linkLabel.Font = Enum.Font.Gotham
    linkLabel.TextSize = 11
    linkLabel.TextColor3 = Color3.fromRGB(120, 180, 255)
    linkLabel.TextXAlignment = Enum.TextXAlignment.Left
    linkLabel.Parent = button
    
    -- Copy indicator
    local copyIndicator = Instance.new("TextLabel")
    copyIndicator.Size = UDim2.new(1, 0, 1, 0)
    copyIndicator.BackgroundTransparency = 1
    copyIndicator.Text = "✓ COPIED!"
    copyIndicator.Font = Enum.Font.GothamBold
    copyIndicator.TextSize = 16
    copyIndicator.TextColor3 = Color3.fromRGB(100, 255, 150)
    copyIndicator.TextTransparency = 1
    copyIndicator.ZIndex = 10
    copyIndicator.Parent = button
    
    -- Hover effects
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.15
        }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.2), {
            Transparency = 0.2,
            Color = Color3.fromRGB(120, 160, 255)
        }):Play()
        TweenService:Create(iconLabel, TweenInfo.new(0.2), {
            TextColor3 = Color3.fromRGB(150, 200, 255),
            TextSize = 24
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.3
        }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.2), {
            Transparency = 0.4,
            Color = Color3.fromRGB(80, 120, 200)
        }):Play()
        TweenService:Create(iconLabel, TweenInfo.new(0.2), {
            TextColor3 = Color3.fromRGB(120, 180, 255),
            TextSize = 22
        }):Play()
    end)
    
    -- Click to copy
    button.MouseButton1Click:Connect(function()
        -- Copy to clipboard
        if setclipboard then
            setclipboard(link)
        end
        
        -- Show copied indicator
        textLabel.TextTransparency = 1
        linkLabel.TextTransparency = 1
        iconLabel.TextTransparency = 1
        
        TweenService:Create(copyIndicator, TweenInfo.new(0.2), {
            TextTransparency = 0
        }):Play()
        
        TweenService:Create(button, TweenInfo.new(0.1), {
            BackgroundTransparency = 0,
            Size = UDim2.new(0, 185, 0, 48)
        }):Play()
        
        TweenService:Create(btnStroke, TweenInfo.new(0.1), {
            Color = Color3.fromRGB(100, 255, 150),
            Transparency = 0.2
        }):Play()
        
        task.wait(0.1)
        
        TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Back), {
            Size = UDim2.new(0, 190, 0, 50)
        }):Play()
        
        task.wait(1.5)
        
        -- Hide copied indicator
        TweenService:Create(copyIndicator, TweenInfo.new(0.2), {
            TextTransparency = 1
        }):Play()
        
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.3
        }):Play()
        
        TweenService:Create(btnStroke, TweenInfo.new(0.2), {
            Color = Color3.fromRGB(80, 120, 200),
            Transparency = 0.4
        }):Play()
        
        task.wait(0.2)
        
        textLabel.TextTransparency = 0
        linkLabel.TextTransparency = 0
        iconLabel.TextTransparency = 0
    end)
    
    return button
end

--// Create Buttons
CreateCopyButton("DISCORD", "💬", UDim2.new(0, 15, 0, 220), "https://discord.gg/gdQ5mp9QdB")
CreateCopyButton("TELEGRAM", "✈", UDim2.new(0, 215, 0, 220), "https://t.me/vaeb_scripts")

print("[VAEB HUB] Update notice displayed")
