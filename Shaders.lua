function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(Enum,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
Script0 = Instance.new("Script")
Script1 = Instance.new("Script")
Sky2 = Instance.new("Sky")
Sound3 = Instance.new("Sound")
ScreenGui4 = Instance.new("ScreenGui")
ScreenGui4.IgnoreGuiInset = true
Frame5 = Instance.new("Frame")
LocalScript6 = Instance.new("LocalScript")
ImageLabel7 = Instance.new("ImageLabel")
ImageLabel8 = Instance.new("ImageLabel")
ImageLabel9 = Instance.new("ImageLabel")
ImageLabel10 = Instance.new("ImageLabel")
ImageLabel11 = Instance.new("ImageLabel")
ImageLabel12 = Instance.new("ImageLabel")
LocalScript13 = Instance.new("LocalScript")
Script0.Name = "READ ME OR IT WILL NOT WORK"
Script0.Parent = mas
table.insert(cors,sandbox(Script0,function()
--[[
	TO USE THIS MAKE SURE PROPERTIES PANEL AND EXPLORER ARE OPEN AND SELECT LIGHTING IN THE EXPLORER
	THEN, GO THE PROPERTIES PANEL AND FIND TECHNOLOGY, DOUBLE CLICK IT AND SELECT "ShadowMap"
	
	
	Done!
	
	Now you can delete the read me script, But KEEP THE SHADERS SCRIPT!
--]]
end))
Script1.Name = "Shaders"
Script1.Parent = mas
table.insert(cors,sandbox(Script1,function()
--Leave script alone!


game.Players.PlayerAdded:Connect(function(plr)
	wait()
	local SunFX = script.LensFlareGui:Clone()
	SunFX.Parent = plr.PlayerGui
end)



print('Voxel: SEGI LIGHTING loaded..')

wait(2)
script.Beep:Play()

Lighting = game:GetService("Lighting")

wait(0.1)

Lighting.Brightness = 2
Lighting.ExposureCompensation = 1.5

Lighting.ShadowSoftness = 0.2

Lighting.OutdoorAmbient = Color3.new(139/255, 139/255, 139/255)
Lighting.Ambient = Color3.new(2/255, 2/255, 2/255)

SunFlare = Instance.new("SunRaysEffect", Lighting)
SunFlare.Intensity = 0.04

ColorCorrection = Instance.new("ColorCorrectionEffect", Lighting)
ColorCorrection.TintColor = Color3.new(229/255, 231/255, 255/255)
ColorCorrection.Contrast = 0.1
ColorCorrection.Brightness = 0.05


Lighting.FogEnd = 2999
Lighting.FogStart = 0
Lighting.FogColor = Color3.new(162/255, 195/255, 255/255)

--- water

workspace.Terrain.WaterTransparency = 1
workspace.Terrain.WaterReflectance = 0.2

sky = script.Sky
sky.Parent = Lighting




local Blur = Instance.new("BlurEffect")
Blur.Parent = game.Lighting
Blur.Size = 25
wait(0.1)
Blur.Size = 24
wait(0.1)
Blur.Size = 23
wait(0.1)
Blur.Size = 22
wait(0.1)
Blur.Size = 21
wait(0.1)
Blur.Size = 20
wait(0.1)
Blur.Size = 19
wait(0.1)
Blur.Size = 18
wait(0.1)
Blur.Size = 17
wait(0.1)
Blur.Size = 16
wait(0.1)
Blur.Size = 15
wait(0.1)
Blur.Size = 14
wait(0.1)
Blur.Size = 13
wait(0.1)
Blur.Size = 12
wait(0.1)
Blur.Size = 11
wait(0.1)
Blur.Size = 10
wait(0.1)
Blur.Size = 9
wait(0.1)
Blur.Size = 8
wait(0.1)
Blur.Size = 7
wait(0.1)
Blur.Size = 6
wait(0.1)
Blur.Size = 5
wait(0.1)
Blur.Size = 4
wait(0.1)
Blur.Size = 3
wait(0.1)
Blur.Size = 2
wait(0.1)
Blur.Size = 1
wait(0.1)
Blur.Size = 0




print('Loading..Bloom')
wait(2)
print('Loading..Lens Flares')


print("Done!")


while wait(1) do
	for i,v in pairs(game.Players:GetPlayers()) do
		if v.PlayerGui:FindFirstChild("LensFlareGui") == nil then
			gui = script.LensFlareGui:Clone()
			gui.Parent = v.PlayerGui
		end
	end
end
end))
Sky2.Parent = Script1
Sky2.MoonAngularSize = 13
Sky2.SkyboxBk = "http://www.roblox.com/asset/?id=225469345"
Sky2.SkyboxDn = "http://www.roblox.com/asset/?id=225469349"
Sky2.SkyboxFt = "http://www.roblox.com/asset/?id=225469359"
Sky2.SkyboxLf = "http://www.roblox.com/asset/?id=225469364"
Sky2.SkyboxRt = "http://www.roblox.com/asset/?id=225469372"
Sky2.SkyboxUp = "http://www.roblox.com/asset/?id=225469380"
Sky2.SunAngularSize = 20
Sky2.SunTextureId = "rbxassetid://1168763430"
Sound3.Name = "Beep"
Sound3.Parent = Script1
Sound3.SoundId = "rbxassetid://1029495337"
Sound3.Volume = 1
ScreenGui4.Name = "LensFlareGui"
ScreenGui4.Parent = Script1
Frame5.Name = "lensFlare"
Frame5.Parent = ScreenGui4
Frame5.Size = UDim2.new(1, 0, 1, 0)
Frame5.BackgroundColor = BrickColor.new("Really black")
Frame5.BackgroundColor3 = Color3.new(0, 0, 0)
Frame5.BackgroundTransparency = 1
Frame5.BorderColor = BrickColor.new("Really black")
Frame5.BorderColor3 = Color3.new(0, 0, 0)
Frame5.BorderSizePixel = 0
LocalScript6.Name = "Lens Flare Script"
LocalScript6.Parent = Frame5
table.insert(cors,sandbox(LocalScript6,function()
local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local gui = script.Parent
local flares = {}
local char

repeat char = player.Character wait(1/30) until char

for i, child in pairs(gui:GetChildren()) do
	if child.Name:sub(1, 5) == "flare" then
		flares[child] = tonumber(child.Name:match("flare%d+ : (%-?.+)"))
	end
end

function project(cam, point)
	local dif = cam:pointToObjectSpace(point)
	local fov = math.atan(math.rad(camera.FieldOfView))
	local z = -dif.z
	if z > 0 then
		local x = (dif.x / fov / 1.3) / (z + 1) * (gui.AbsoluteSize.y / gui.AbsoluteSize.x)
		local y = (dif.y / fov / 1.3) / (z + 1) * -1
		return x, y, true
	else
		return 0, 0, false
	end
end

function rayCast(pos, dir, ignore)
	return workspace:FindPartOnRayWithIgnoreList(Ray.new(pos, dir), ignore)
end

while wait(1/60) do
	local suns = 0
	for i = 1, 5 do
		local frame = CFrame.new(camera.CoordinateFrame.p, camera.CoordinateFrame.p + game.Lighting:GetSunDirection())
		frame = frame * CFrame.Angles(0, 0, i/5 * math.pi*2)
		frame = frame * CFrame.Angles(math.rad(5), 0, 0)
		if not rayCast(frame.p, frame.lookVector*999, {char}) then
			suns = suns + 1
		end
	end
	if suns > 0 then
		local x, y, z = project(camera.CoordinateFrame, camera.CoordinateFrame.p + game.Lighting:GetSunDirection()*25)
		if z then
			for flare, pos in pairs(flares) do
				flare.Position = UDim2.new(0.5 + x*pos, -flare.AbsoluteSize.x/2, 0.5 + y*pos, -flare.AbsoluteSize.y/2)
				flare.Visible = true
			end
		else
			for flare in pairs(flares) do
				flare.Visible = false
			end
		end
	else
		for flare, pos in pairs(flares) do
			flare.Visible = false
		end
	end
end

end))
ImageLabel7.Name = "flare2 : 0.5"
ImageLabel7.Parent = Frame5
ImageLabel7.Size = UDim2.new(0.0625, 0, 0.0625, 0)
ImageLabel7.BackgroundColor = BrickColor.new("Really black")
ImageLabel7.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel7.BackgroundTransparency = 1
ImageLabel7.BorderColor = BrickColor.new("Really black")
ImageLabel7.BorderColor3 = Color3.new(0, 0, 0)
ImageLabel7.BorderSizePixel = 0
ImageLabel7.SizeConstraint = Enum.SizeConstraint.RelativeXX
ImageLabel7.ZIndex = 2
ImageLabel7.Image = "http://www.roblox.com/asset/?id=109801097"
ImageLabel8.Name = "flare3 : -0.1"
ImageLabel8.Parent = Frame5
ImageLabel8.Size = UDim2.new(0.03125, 0, 0.03125, 0)
ImageLabel8.BackgroundColor = BrickColor.new("Really black")
ImageLabel8.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel8.BackgroundTransparency = 1
ImageLabel8.BorderColor = BrickColor.new("Really black")
ImageLabel8.BorderColor3 = Color3.new(0, 0, 0)
ImageLabel8.BorderSizePixel = 0
ImageLabel8.SizeConstraint = Enum.SizeConstraint.RelativeXX
ImageLabel8.ZIndex = 3
ImageLabel8.Image = "http://www.roblox.com/asset/?id=109801097"
ImageLabel9.Name = "flare1 : -0.5"
ImageLabel9.Parent = Frame5
ImageLabel9.Size = UDim2.new(0.100000001, 0, 0.100000001, 0)
ImageLabel9.BackgroundColor = BrickColor.new("Really black")
ImageLabel9.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel9.BackgroundTransparency = 1
ImageLabel9.BorderColor = BrickColor.new("Really black")
ImageLabel9.BorderColor3 = Color3.new(0, 0, 0)
ImageLabel9.BorderSizePixel = 0
ImageLabel9.SizeConstraint = Enum.SizeConstraint.RelativeXX
ImageLabel9.ZIndex = 2
ImageLabel9.Image = "http://www.roblox.com/asset/?id=109801097"
ImageLabel10.Name = "flare4 : 1"
ImageLabel10.Parent = Frame5
ImageLabel10.Size = UDim2.new(1, 0, 1, 0)
ImageLabel10.BackgroundColor = BrickColor.new("Really black")
ImageLabel10.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel10.BackgroundTransparency = 1
ImageLabel10.BorderColor = BrickColor.new("Really black")
ImageLabel10.BorderColor3 = Color3.new(0, 0, 0)
ImageLabel10.BorderSizePixel = 0
ImageLabel10.SizeConstraint = Enum.SizeConstraint.RelativeXX
ImageLabel10.ZIndex = 3
ImageLabel10.Image = "http://www.roblox.com/asset/?id=109801097"
ImageLabel11.Name = "flare5 : -1.1"
ImageLabel11.Parent = Frame5
ImageLabel11.Size = UDim2.new(0.150000006, 0, 0.150000006, 0)
ImageLabel11.BackgroundColor = BrickColor.new("Really black")
ImageLabel11.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel11.BackgroundTransparency = 1
ImageLabel11.BorderColor = BrickColor.new("Really black")
ImageLabel11.BorderColor3 = Color3.new(0, 0, 0)
ImageLabel11.BorderSizePixel = 0
ImageLabel11.SizeConstraint = Enum.SizeConstraint.RelativeXX
ImageLabel11.ZIndex = 2
ImageLabel11.Image = "http://www.roblox.com/asset/?id=109801061"
ImageLabel12.Name = "vignette"
ImageLabel12.Parent = ScreenGui4
ImageLabel12.Size = UDim2.new(1, 0, 1, 0)
ImageLabel12.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel12.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel12.BackgroundTransparency = 1
ImageLabel12.BorderSizePixel = 0
ImageLabel12.Image = "rbxassetid://192776775"
ImageLabel12.ImageTransparency = 0.69999998807907
LocalScript13.Name = "MotionBlur"
LocalScript13.Parent = ScreenGui4
table.insert(cors,sandbox(LocalScript13,function()
--[[
By AstroCode on August 17, 2016

This motion blur script is activated by the rotation of the camera.
Place this script in StarterPlayer > StarterPlayerScripts
By default, players must have their graphics quality set to 6+ to see the blur effect.
--]]

--//Settings
BlurAmount = 15 -- Change this to increase or decrease the blur size

--//Declarations
Camera 	= game.Workspace.CurrentCamera
Last 	= Camera.CFrame.lookVector
Blur 	= Instance.new("BlurEffect",Camera)

--//Logic
game.Workspace.Changed:connect(function(p) -- Feels a bit hacky. Updates the Camera and Blur if the Camera object is changed.
	if p == "CurrentCamera" then
		Camera = game.Workspace.CurrentCamera
		if Blur and Blur.Parent then
			Blur.Parent = Camera
		else
			Blur = Instance.new("BlurEffect",Camera)
		end
	end
end)

game:GetService("RunService").Heartbeat:connect(function()
	if not Blur or Blur.Parent == nil then Blur = Instance.new("BlurEffect",Camera) end -- Feels a bit hacky. Creates a new Blur if it is destroyed.
	
	local magnitude = (Camera.CFrame.lookVector - Last).magnitude -- How much the camera has rotated since the last frame
	Blur.Size = math.abs(magnitude)*BlurAmount -- Set the blur size
	Last = Camera.CFrame.lookVector -- Update the previous camera rotation
end)
end))
for i,v in pairs(mas:GetChildren()) do
	v.Parent = workspace
	pcall(function() v:MakeJoints() end)
end
for i,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end
