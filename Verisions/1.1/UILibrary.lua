local UiLib = Instance.new("ScreenGui")
local Docker = Instance.new("Frame")


UiLib.Name = "UiLib"
UiLib.Parent = game.CoreGui
UiLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Docker.Name = "Docker"
Docker.Parent = UiLib
Docker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Docker.BackgroundTransparency = 1.000
Docker.Position = UDim2.new(0.00309023494, 0, 0.0151306745, 0)
Docker.Size = UDim2.new(0, 1899, 0, 100)

local windowOffset = 0

local Library = {}

function Library:createTab(Name)
	local Tab = Instance.new("Frame")
	local Title_2 = Instance.new("TextLabel")
	local Open = Instance.new("TextButton")
	local Line = Instance.new("TextLabel")
	local Body = Instance.new("Frame")
	local size = Instance.new("NumberValue")
	local UIListLayout = Instance.new("UIListLayout")
	
	size.Name = "size"
	size.Parent = Body

	Tab.Name = "Tab"
	Tab.Parent = Docker
	Tab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Tab.Size = UDim2.new(0, 204, 0, 39)
	Tab.Position = UDim2.new(windowOffset, 0, 0, 0)
	windowOffset += 0.15
	
	Body.Name = "Body"
	Body.Parent = Tab
	Body.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Body.Position = UDim2.new(0, 0, 1, 0)
	Body.Size = UDim2.new(0, 204, 0, 255)

	UIListLayout.Parent = Body
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 3)

	Title_2.Name = "Title"
	Title_2.Parent = Tab
	Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title_2.BackgroundTransparency = 1.000
	Title_2.BorderSizePixel = 0
	Title_2.Size = UDim2.new(0, 167, 0, 33)
	Title_2.Font = Enum.Font.SourceSans
	Title_2.Text = Name
	Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title_2.TextScaled = true
	Title_2.TextSize = 14.000
	Title_2.TextWrapped = true
	Title_2.TextXAlignment = Enum.TextXAlignment.Left

	Open.Name = "Open"
	Open.Parent = Tab
	Open.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Open.BackgroundTransparency = 1.000
	Open.BorderColor3 = Color3.fromRGB(255, 255, 255)
	Open.BorderSizePixel = 0
	Open.Position = UDim2.new(0.818627477, 0, 0, 0)
	Open.Rotation = 90.000
	Open.Size = UDim2.new(0, 37, 0, 39)
	Open.Font = Enum.Font.SourceSans
	Open.Text = ">"
	Open.TextColor3 = Color3.fromRGB(255, 255, 255)
	Open.TextScaled = true
	Open.TextSize = 14.000
	Open.TextWrapped = true

	Line.Name = "Line"
	Line.Parent = Tab
	Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0, 0, 0.846153855, 0)
	Line.Size = UDim2.new(0, 204, 0, 6)
	Line.Font = Enum.Font.SourceSans
	Line.Text = ""
	Line.TextColor3 = Color3.fromRGB(0, 0, 0)
	Line.TextSize = 14.000


	local function YIAGR_fake_script() -- Body.LocalScript 
		local script = Instance.new('LocalScript', Body)
		script.Parent.Parent.Parent.Visible = false
		wait(2)
		script.Parent.Parent.Parent.Visible = true
		for i,v in pairs(script.Parent:GetChildren()) do
			if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") or v:IsA("Frame") then
				script.Parent.size.Value += 42
				v.Visible = false
			end
		end

		script.Parent.size.Value += 5
		script.Parent.Size = UDim2.new(0, 204,0, 0)

	end
	coroutine.wrap(YIAGR_fake_script)()
	local function CMJI_fake_script() -- Open.LocalScript 
		local script = Instance.new('LocalScript', Open)

		local TweenService = game:GetService("TweenService")
		local opened = false


		local tweenInfo = TweenInfo.new(
			0.5,
			Enum.EasingStyle.Linear,
			Enum.EasingDirection.Out,
			0,
			false,
			0
		)

		script.Parent.MouseButton1Click:Connect(function()
			if opened == false then
				TweenService:Create(script.Parent, tweenInfo, {Rotation = -90}):Play()
				script.Parent.Parent.Body:TweenSize(
					UDim2.new(0, 204,0, script.Parent.Parent.Body.size.Value),
					Enum.EasingDirection.In,
					Enum.EasingStyle.Sine,
					0.5,
					true,
					nil
				)
				wait(0.5)
				for i,v in pairs(script.Parent.Parent.Body:GetChildren()) do
					if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") or v:IsA("Frame") then
						v.Visible = true
					end
				end
				opened = true
			else
				TweenService:Create(script.Parent, tweenInfo, {Rotation = 90}):Play()
				script.Parent.Parent.Body:TweenSize(
					UDim2.new(0,204,0,0),
					Enum.EasingDirection.In,
					Enum.EasingStyle.Sine,
					0.5,
					true,
					nil
				)
				for i,v in pairs(script.Parent.Parent.Body:GetChildren()) do
					if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") or v:IsA("Frame") then
						v.Visible = false
					end
				end
				opened = false
			end
		end)
	end
	coroutine.wrap(CMJI_fake_script)()
	local function DGIMBAE_fake_script() -- Tab.Draggable 
		local script = Instance.new('LocalScript', Tab)

		script.Parent.Active = true
		script.Parent.Draggable = true
	end
	coroutine.wrap(DGIMBAE_fake_script)()

	local objs = {}
	function objs:createButton(Name, callback)
		local Button = Instance.new("TextButton")
		Button.Name = Name
		Button.Parent = Body
		Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		Button.BorderSizePixel = 0
		Button.Size = UDim2.new(0, 204, 0, 39)
		Button.Font = Enum.Font.SourceSans
		Button.TextColor3 = Color3.fromRGB(255, 255, 255)
		Button.TextScaled = true
		Button.TextSize = 14.000
		Button.TextWrapped = true
		Button.Text = Name
		Button.MouseButton1Click:Connect(function()
			callback()
		end)
	end

	function objs:createToggle(Name, callback)
		local Toggle = Instance.new("Frame")
		local Title = Instance.new("TextLabel")
		local ToggleButton = Instance.new("TextButton")

		Toggle.Name = "Toggle"
		Toggle.Parent = Body
		Toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		Toggle.BorderSizePixel = 0
		Toggle.Position = UDim2.new(0, 0, 0.494117647, 0)
		Toggle.Size = UDim2.new(0, 204, 0, 39)

		Title.Name = "Title"
		Title.Parent = Toggle
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.Size = UDim2.new(0, 158, 0, 39)
		Title.Font = Enum.Font.SourceSans
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextWrapped = true
		Title.Text = Name

		ToggleButton.Name = "ToggleButton"
		ToggleButton.Parent = Toggle
		ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		ToggleButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
		ToggleButton.BorderSizePixel = 5
		ToggleButton.Position = UDim2.new(0.818627477, 0, 0.205128208, 0)
		ToggleButton.Size = UDim2.new(0, 31, 0, 25)
		ToggleButton.Font = Enum.Font.SourceSans
		ToggleButton.Text = ""
		ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		ToggleButton.TextScaled = true
		ToggleButton.TextSize = 14.000
		ToggleButton.TextWrapped = true

		local toggled = false

		ToggleButton.MouseButton1Click:Connect(function()
			toggled = not toggled
			callback(toggled)
			if toggled then
				ToggleButton.Text = "X"
			else
				ToggleButton.Text = ""
			end
		end)
	end

	function objs:createLabel(Text)
		local TextLabel = Instance.new("TextLabel")
		TextLabel.Parent = Body
		TextLabel.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0, 0, 0.521739125, 0)
		TextLabel.Size = UDim2.new(0, 204, 0, 39)
		TextLabel.Font = Enum.Font.SourceSans
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 14.000
		TextLabel.TextWrapped = true
		TextLabel.Text = Text
	end

	function objs:createSlider(Name, Max, callback)
		local Slider = Instance.new("Frame")
		local SliderSlider = Instance.new("Frame")
		local SliderTitle = Instance.new("TextLabel")
		local Slider_2 = Instance.new("TextButton")
		Slider.Name = "Slider"
		Slider.Parent = Body
		Slider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		Slider.Position = UDim2.new(0.0441176482, 0, 0.70588237, 0)
		Slider.Size = UDim2.new(0, 204, 0, 39)

		SliderSlider.Name = "SliderSlider"
		SliderSlider.Parent = Slider
		SliderSlider.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
		SliderSlider.BorderColor3 = Color3.fromRGB(40, 40, 40)
		SliderSlider.BorderSizePixel = 4
		SliderSlider.Position = UDim2.new(0.087997891, 0, 0.594914734, 0)
		SliderSlider.Size = UDim2.new(0, 167, 0, 5)

		Slider_2.Name = "Slider"
		Slider_2.Parent = SliderSlider
		Slider_2.AnchorPoint = Vector2.new(0.5, 0.5)
		Slider_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Slider_2.BorderColor3 = Color3.fromRGB(40, 40, 40)
		Slider_2.BorderSizePixel = 4
		Slider_2.Position = UDim2.new(0.0160642564, 0, 0.5, 0)
		Slider_2.Size = UDim2.new(0, 9, 0, 10)
		Slider_2.Font = Enum.Font.SourceSans
		Slider_2.Text = ""
		Slider_2.TextColor3 = Color3.fromRGB(0, 0, 0)
		Slider_2.TextSize = 14.000

		SliderTitle.Name = "SliderTitle"
		SliderTitle.Parent = Slider
		SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SliderTitle.BackgroundTransparency = 1.000
		SliderTitle.Size = UDim2.new(0, 200, 0, 20)
		SliderTitle.Font = Enum.Font.SourceSans
		SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		SliderTitle.TextScaled = true
		SliderTitle.TextSize = 14.000
		SliderTitle.TextWrapped = true
		SliderTitle.Text = Name

		local UserInputService = game:GetService("UserInputService")
		local Dragging = false
		Slider_2.MouseButton1Down:Connect(function()
			Dragging = true
		end)

		local sliderValue

		UserInputService.InputChanged:Connect(function()
			if Dragging then
				local MousePos = UserInputService:GetMouseLocation()+Vector2.new(0,36)
				local RelPos = MousePos-SliderSlider.AbsolutePosition
				local Precent = math.clamp(RelPos.X/SliderSlider.AbsoluteSize.X,0,1)
				Slider_2.Position = UDim2.new(Precent,0,0.5,0)
				sliderValue = Precent*Max
				callback(sliderValue)
			end
		end)

		UserInputService.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				Dragging = false
			end
		end)
	end
	return objs;
end
return Library;
