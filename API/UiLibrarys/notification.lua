local notification = {}

-- Services
local ContentProvider = game:GetService("ContentProvider")
local CoreGui = game:GetService("CoreGui")


if not CoreGui then
	warn("CoreGui not found.")
	return notification
end

-- Rest of your script remains the same
local tween = game:GetService("TweenService")

local warnicon = "rbxassetid://7249251729"
local errorsign = "rbxassetid://187736963"
local notifysign = "rbxassetid://11707615313"

ContentProvider:PreloadAsync({warnicon, errorsign, notifysign})

local Instances = _G.Notification or {
	Notification = Instance.new("ScreenGui"),
	Main_Holder = Instance.new("Frame"),
	UICorner = Instance.new("UICorner"),
	notification_text = Instance.new("TextLabel"),
	UIPadding = Instance.new("UIPadding"),
	icon = Instance.new("ImageLabel"),
	UICorner_2 = Instance.new("UICorner"),
}

if not _G.Notification or not CoreGui:FindFirstChild("Notification") then
    Instances.Notification.Name = "Notification"
    Instances.Notification.Parent = CoreGui

    Instances.Main_Holder.Name = "Main_Holder"
    Instances.Main_Holder.Size = UDim2.new(0, 311, 0, 40)
    Instances.Main_Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Instances.Main_Holder.Position = UDim2.new(1.00999999, 0, 0.889999986, 0)
    Instances.Main_Holder.BorderSizePixel = 0
    Instances.Main_Holder.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Instances.Main_Holder.Parent = Instances.Notification

    Instances.UICorner.Name = "UICorner"
    Instances.UICorner.CornerRadius = UDim.new(0, 4)
    Instances.UICorner.Parent = Instances.Main_Holder

    Instances.notification_text.Name = "notification_text"
    Instances.notification_text.Size = UDim2.new(0, 311, 0, 40)
    Instances.notification_text.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Instances.notification_text.BackgroundTransparency = 1
    Instances.notification_text.BorderSizePixel = 0
    Instances.notification_text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Instances.notification_text.TextDirection = Enum.TextDirection.LeftToRight
    Instances.notification_text.TextColor3 = Color3.fromRGB(209, 134, 91)
    Instances.notification_text.Text = "Placeholder"
    Instances.notification_text.TextXAlignment = Enum.TextXAlignment.Left
    Instances.notification_text.TextWrapped = true
    Instances.notification_text.TextSize = 18
    Instances.notification_text.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    Instances.notification_text.Parent = Instances.Main_Holder

    Instances.UIPadding.Name = "UIPadding"
    Instances.UIPadding.PaddingBottom = UDim.new(0, 2)
    Instances.UIPadding.PaddingLeft = UDim.new(0, 45)
    Instances.UIPadding.Parent = Instances.notification_text

    Instances.icon.Name = "icon"
    Instances.icon.Size = UDim2.new(0, 29, 0, 31)
    Instances.icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Instances.icon.BackgroundTransparency = 1
    Instances.icon.Position = UDim2.new(0.0192926042, 0, 0.100000001, 0)
    Instances.icon.BorderSizePixel = 0
    Instances.icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Instances.icon.ScaleType = Enum.ScaleType.Fit
    Instances.icon.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    Instances.icon.Parent = Instances.Main_Holder

    Instances.UICorner_2.Name = "UICorner"
    Instances.UICorner_2.CornerRadius = UDim.new(0, 4)
    Instances.UICorner_2.Parent = Instances.icon

    _G.Notification = Instances

end

local playing = false

function notification.notify(text, duration)

	if text and duration and not playing then
		playing = true
		local tweening = tween:Create(Instances.Main_Holder, TweenInfo.new(1), { Position = UDim2.new(0.745, 0, 0.89, 0) })
		local tweenoff = tween:Create(Instances.Main_Holder, TweenInfo.new(1), { Position = UDim2.new(1.01, 0, 0.89, 0) })
		Instances.notification_text.Text = text
		Instances.icon.Image = notifysign
		tweening:Play()
		tweening.Completed:Connect(function()
			task.wait(duration)
			tweenoff:Play()
		end)
		playing = false
	else
		warn("Text or duration not provided, or in cooldown.")
	end
end

function notification.error(text, duration)
	if text and duration and not playing then
		playing = true
		local tweening = tween:Create(Instances.Main_Holder, TweenInfo.new(1), { Position = UDim2.new(0.745, 0, 0.89, 0) })
		local tweenoff = tween:Create(Instances.Main_Holder, TweenInfo.new(1), { Position = UDim2.new(1.01, 0, 0.89, 0) })
		Instances.notification_text.TextColor3 = Color3.fromRGB(160, 25, 75)
		Instances.notification_text.Text = text
		Instances.icon.Image = errorsign
		tweening:Play()
		tweening.Completed:Connect(function()
			task.wait(duration)
			tweenoff:Play()
		end)
		tweenoff.Completed:Connect(function()
			Instances.notification_text.TextColor3 = Color3.fromRGB(205, 135, 90)
		end)
		playing = false
	else
		warn("Text or duration not provided, or in cooldown.")
	end
end

function notification.warn(text, duration)
	if text and duration and not playing then
		playing = true
		local tweening = tween:Create(Instances.Main_Holder, TweenInfo.new(1), { Position = UDim2.new(0.745, 0, 0.89, 0) })
		local tweenoff = tween:Create(Instances.Main_Holder, TweenInfo.new(1), { Position = UDim2.new(1.01, 0, 0.89, 0) })
		Instances.notification_text.TextColor3 = Color3.fromRGB(190, 160, 90)
		Instances.notification_text.Text = text
		Instances.icon.Image = warnicon
		tweening:Play()
		tweening.Completed:Connect(function()
			task.wait(duration)
			tweenoff:Play()
		end)
		tweenoff.Completed:Connect(function()
			Instances.notification_text.TextColor3 = Color3.fromRGB(205, 135, 90)
		end)
		playing = false
	else
		warn("Text or duration not provided, or in cooldown.")
	end
end

return notification
--notification.error("test", 5)
