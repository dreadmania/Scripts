-- //

--\\

local v1 = game.Players.LocalPlayer.PlayerGui.MainUI
local u2 = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

local Death = {}

local partsWithId = {}
local awaitRef = {}

local SpawnerLibrary = {
	Tween = function(object, input, studspersecond, offset)
		local char = game:GetService("Players").LocalPlayer.Character;
		local input = input or error("input is nil");
		local studspersecond = studspersecond or 1000;
		local offset = offset or CFrame.new(0,0,0);
		local vec3, cframe;

		if typeof(input) == "table" then
			vec3 = Vector3.new(unpack(input)); cframe = CFrame.new(unpack(input));
		elseif typeof(input) ~= "Instance" then
			return error("wrong format used");
		end;

		local Time = (object.Value.Position - (vec3 or input.Position)).magnitude/studspersecond;

		local twn = game.TweenService:Create(object, TweenInfo.new(Time,Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Value = (cframe or input.CFrame) * offset});
		twn:Play();
		twn.Completed:Wait()
	end,
	Tween2 = function(object, input, studspersecond, offset)
		local char = game:GetService("Players").LocalPlayer.Character;
		local input = input or error("input is nil");
		local studspersecond = studspersecond or 1000;
		local offset = offset or CFrame.new(0,0,0);
		local vec3, cframe;

		if typeof(input) == "table" then
			vec3 = Vector3.new(unpack(input)); cframe = CFrame.new(unpack(input));
		elseif typeof(input) ~= "Instance" then
			return error("wrong format used");
		end;

		local Time = (object.Position - (vec3 or input.Position)).magnitude/studspersecond;

		local twn = game.TweenService:Create(object, TweenInfo.new(Time,Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {CFrame = (cframe or input.CFrame) * offset});
		twn:Play();
		twn.Completed:Wait()
	end,
	Calculate = function()
		local t = 0
		local Earliest = 0
		local Latest = game.ReplicatedStorage.GameData.LatestRoom.Value

		for _,Room in ipairs(workspace.CurrentRooms:GetChildren()) do
			t += 1
			if Room:FindFirstChild("RoomStart") and tonumber(Room.Name) == game.ReplicatedStorage.GameData.LatestRoom.Value then
				Earliest = tonumber(Room.Name)
				break;
			end
		end

		return workspace.CurrentRooms[Earliest], workspace.CurrentRooms[Latest]
	end,
	Calculate2 = function()
		local Earliest = 0
		local Latest = game.ReplicatedStorage.GameData.LatestRoom.Value

		for _,Room in ipairs(workspace.CurrentRooms:GetChildren()) do
			if Room:FindFirstChild("RoomStart") then
				Earliest = tonumber(Room.Name)
				break;
			end
		end

		return workspace.CurrentRooms[Earliest], workspace.CurrentRooms[Latest]
	end,
	Raycast = function(Player, Part, Entity, Distance)
		if Player.Character.Humanoid.Health > 0 then
			local Params = RaycastParams.new()
			Params.FilterDescendantsInstances = {
				Part
			}
			local dir = CFrame.lookAt(Part.Position, Player.Character.PrimaryPart.Position).LookVector * Distance
			local Cast = workspace:Raycast(Part.Position, dir)

			if Cast and Cast.Instance then
				local Hit = Cast.Instance

				if Hit:IsDescendantOf(Player.Character) and (Player.Character:GetAttribute("Hiding") == false or Player.Character:GetAttribute("Hiding") == nil) then
					Player.Character.Humanoid.Health = 0
					
					Death[Entity]()
				end
			end
		end
	end,
	Prepare = function(Lines, Cause)
		return coroutine.wrap(function()
			for i,v in pairs(game.ReplicatedStorage.GameStats:GetDescendants()) do
				if v.Name == "DeathCause" then
					v.Value = Cause
				end
			end

			firesignal(game.ReplicatedStorage.Bricks.DeathHint.OnClientEvent, Lines)
		end)()
	end
}

Create = function(item, parent)
	local obj = Instance.new(item.Type)
	if (item.ID) then
		local awaiting = awaitRef[item.ID]
		if (awaiting) then
			awaiting[1][awaiting[2]] = obj
			awaitRef[item.ID] = nil
		else
			partsWithId[item.ID] = obj
		end
	end
	for p,v in pairs(item.Properties) do
		if (type(v) == "string") then
			local id = tonumber(v:match("^_R:(%w+)_$"))
			if (id) then
				if (partsWithId[id]) then
					v = partsWithId[id]
				else
					awaitRef[id] = {obj, p}
					v = nil
				end
			end
		end
		obj[p] = v
	end
	for _,c in pairs(item.Children) do
		Create(c, obj)
	end
	obj.Parent = parent
	return obj
end

Death = {
	Rush = function()
		local function Jumpscare()
			u2.deathtick = tick() + 10;
			game.SoundService.Main.Volume = 0;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush:Play();
			v1.Jumpscare_Rush.Visible = true;
			local v64 = tick();
			local v65 = math.random(5, 30) / 10;
			local v66 = v65 + math.random(10, 60) / 10;
			local v67 = 0.25;
			for v68 = 1, 100000 do
				task.wait();
				if v64 + v65 <= tick() then
					v1.Jumpscare_Rush.ImageLabel.Visible = true;
					v65 = v65 + math.random(7, 44) / 10;
					game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush.Pitch = 1 + math.random(-100, 100) / 500;
					v1.Jumpscare_Rush.BackgroundColor3 = Color3.new(0, 0, math.random(0, 10) / 255);
					v1.Jumpscare_Rush.ImageLabel.Position = UDim2.new(0.5, math.random(-2, 2), 0.5, math.random(-2, 2));
					v67 = v67 + 0.05;
					v1.Jumpscare_Rush.ImageLabel.Size = UDim2.new(v67, 0, v67, 0);
				end;
				if v64 + v66 <= tick() then
					break;
				end;
			end;
			v1.Jumpscare_Rush.ImageLabel.Visible = true;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush:Stop();
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush2:Play();
			v1.Jumpscare_Rush.ImageLabel.Visible = false;
			v1.Jumpscare_Rush.ImageLabelBig.Visible = true;
			v1.Jumpscare_Rush.ImageLabelBig:TweenSize(UDim2.new(2.5, 0, 2.5, 0), "In", "Sine", 0.3, true);
			local v69 = tick();
			for v70 = 1, 1000 do
				local v71 = math.random(0, 10) / 10;
				v1.Jumpscare_Rush.BackgroundColor3 = Color3.new(v71, v71, math.clamp(math.random(25, 50) / 50, v71, 1));
				v1.Jumpscare_Rush.ImageLabelBig.Position = UDim2.new(0.5 + math.random(-100, 100) / 5000, 0, 0.5 + math.random(-100, 100) / 3000, 0);
				task.wait(0.016666666666666666);
				if v69 + 0.3 <= tick() then
					break;
				end;
			end;
			v1.Jumpscare_Rush.ImageLabelBig.Visible = false;
			v1.Jumpscare_Rush.BackgroundColor3 = Color3.new(0, 0, 0);
			v1.Jumpscare_Rush.Visible = false;
			u2.deathtick = tick();
		end

		SpawnerLibrary.Prepare({"You died to Rush..."}, "Rush")
		Jumpscare()
	end,
	Ambush = function()
		local function Jumpscare()
			u2.deathtick = tick() + 10;
			game.SoundService.Main.Volume = 0;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush:Play();
			v1.Jumpscare_Ambush.Visible = true;
			local v72 = tick();
			local v73 = math.random(5, 30) / 100;
			local v74 = v73 + math.random(10, 60) / 100;
			local v75 = 0.2;
			for v76 = 1, 100000 do
				task.wait(0.016666666666666666);
				v1.Jumpscare_Ambush.ImageLabel.Position = UDim2.new(0.5, math.random(-15, 15), 0.5, math.random(-15, 15));
				v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(0, math.random(4, 10) / 255, math.random(0, 3) / 255);
				if v72 + v73 <= tick() then
					v1.Jumpscare_Ambush.ImageLabel.Visible = true;
					v73 = v73 + math.random(7, 44) / 100;
					game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush.Pitch = math.random(35, 155) / 100;
					v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(0, math.random(4, 10) / 255, math.random(0, 3) / 255);
					v1.Jumpscare_Ambush.ImageLabel.Position = UDim2.new(0.5, math.random(-25, 25), 0.5, math.random(-25, 25));
					v75 = v75 + 0.05;
					v1.Jumpscare_Ambush.ImageLabel.Size = UDim2.new(v75, 0, v75, 0);
				end;
				if v72 + v74 <= tick() then
					break;
				end;
			end;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush2:Play();
			v1.Jumpscare_Ambush.ImageLabel.Visible = true;
			v1.Jumpscare_Ambush.ImageLabel:TweenSize(UDim2.new(9, 0, 9, 0), "In", "Quart", 0.3, true);
			local v77 = tick();
			for v78 = 1, 100 do
				local v79 = math.random(0, 10) / 10;
				v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(v79, math.clamp(math.random(25, 50) / 50, v79, 1), math.clamp(math.random(25, 50) / 150, v79, 1));
				game["Run Service"].RenderStepped:wait();
				if v77 + 0.3 <= tick() then
					break;
				end;
			end;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush:Stop();
			v1.Jumpscare_Ambush.ImageLabel.Visible = false;
			v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(0, 0, 0);
			v1.Jumpscare_Ambush.Visible = false;
			u2.deathtick = tick();
			return;
		end

		SpawnerLibrary.Prepare({"You died to who you call Ambush..."}, "Ambush")
		Jumpscare()
	end,
}

local function Event(Module, ...)
	return firesignal(game.ReplicatedStorage.Bricks.UseEventModule.OnClientEvent, Module, unpack({...})) 
end

local Spawner = {}
local Entities = {
	Seek = {
		Func = function(Args)
			local Kill = Args.Kill and Args.Kill or false
			local Rooms = Args.Rooms and tonumber(Args.Rooms) or 15
			
			local u2 = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

			workspace.Ambience_Seek.TimePosition = 0
			workspace["Ambience_Seek"]:Play()

			local firgur = game:GetObjects("rbxassetid://10829142080")[1]

			firgur.Figure.Anchored = true
			firgur.Parent = workspace

			local val = Instance.new("CFrameValue")

			val.Changed:Connect(function()
				firgur.SeekRig:PivotTo(val.Value)
			end)

			local early, latest = SpawnerLibrary.Calculate()

			val.Value = early.Nodes["1"].CFrame + Vector3.new(0,5,0)

			local anim = Instance.new("Animation")
			anim.AnimationId = "rbxassetid://9896641335"

			firgur.SeekRig.AnimationController:LoadAnimation(anim):Play()

			local orig = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0

			require(game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator["Main_Game"].RemoteListener.Cutscenes.SeekIntro)(u2)
			firgur.Figure.Footsteps:Play()
			firgur.Figure.FootstepsFar:Play()

			local anim = Instance.new("Animation")
			anim.AnimationId = "rbxassetid://7758895278"

			firgur.SeekRig.AnimationController:LoadAnimation(anim):Play()

			local chase = true

			coroutine.wrap(function()
				while task.wait() do
					if chase then
						game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 23
						if math.random(1,100) == 95 then
							firgur.Figure.Scream:Play()
						end
					end
				end
			end)()

			if Kill then
				-- Not coded in yet
			end

			for i = 1,15 do
				for i,v in ipairs(workspace.CurrentRooms:GetChildren()) do
					if tonumber(v.Name) < tonumber(early.Name) then continue end
					if v:GetAttribute("lol") then continue end
					if v:FindFirstChild("Nodes") then
						v:SetAttribute("lol", true)
						require(game:GetService("ReplicatedStorage").ClientModules.EntityModules.Seek).tease(nil, v, 14, 1665596753, true)
						for i,v in ipairs(v.Nodes:GetChildren()) do
							SpawnerLibrary.Tween(val, v, 25, CFrame.new(0,5,0))
						end
					end
				end
			end

			chase = false
			task.wait()

			firgur:Destroy()

			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = orig
			workspace.Ambience_Seek.TimePosition = 92.5

			task.wait(4)
			u2.hideplayers = 0
		end,
	},
	Rush = {
		Func = function(Args)
			local RushSpeed = (Args.Speed and Args.Speed) or 60
			local CanKill = (Args.Kill and Args.Kill) or false
			local WaitTime = (Args.Time and Args.Time) or 5
			
			Event("flickerLights", game.ReplicatedStorage.GameData.LatestRoom.Value, .75)

			local Rush = Instance.new("Model")
			Rush.Name = "RushMoving"

			local RushNew = game.ReplicatedStorage.JumpscareModels.RushNew:Clone()
			RushNew.Parent = Rush

			Rush.Parent = workspace
			Rush.PrimaryPart = RushNew

			for i,v in pairs(Rush:GetDescendants()) do
				if v:IsA("Sound") then
					v.SoundGroup = game.SoundService.Main

					if v.Name == "Footsteps" or v.Name == "PlaySound" then
						v:Play()
					end
				elseif v:IsA("ParticleEmitter") then
					if v.Name == "ParticleEmitter" or v.Name == "BlackTrail" then
						v.Enabled = true
					end
				end
			end

			local Earliest, Latest = SpawnerLibrary.Calculate2()
			Rush:PivotTo(Earliest.PrimaryPart.CFrame)

			task.wait(WaitTime)

			local Rushing = true
			local con
			con = workspace.CurrentRooms.ChildAdded:Connect(function()
				for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
					v:SetAttribute("Possible", true)
				end
			end)

			coroutine.wrap(function()
				while Rushing do
					firesignal(game.ReplicatedStorage.Bricks.CamShakeRelative.OnClientEvent, RushNew.Position, 2, 15, 0.1, .2, Vector3.new(0,0,0))
					if CanKill then
						for i,v in pairs(game.Players:GetPlayers()) do
							SpawnerLibrary.Raycast(v, RushNew, "Rush", 50)
						end
					end
					task.wait()
				end
			end)()

			local Earliest, Latest = SpawnerLibrary.Calculate2()

			for _,Room in ipairs(workspace.CurrentRooms:GetChildren()) do
				local IsPossible = true
				local Last = workspace.CurrentRooms:FindFirstChild(tonumber(Room.Name) - 1)
				
				if Last then
					if Last:FindFirstChild("Nodes") then
						if Last:GetAttribute("Done") == true then
							IsPossible = false
						end
					end
				end
				
				if Room:GetAttribute("Possible") == false then
					IsPossible = false
				end
				
				-- Next room operations
				local Next = workspace.CurrentRooms:FindFirstChild(tonumber(Room.Name) + 1)

				if Next then
					if tonumber(Room.Name) == tonumber(game.ReplicatedStorage.GameData.LatestRoom.Value) then
						if Room:FindFirstChild("Door") and Room:FindFirstChild("Nodes") then
							if Room.Door.Door.Anchored then
								Next:SetAttribute("Possible", false)
							end
						end
					end
				end
				
				if Room:FindFirstChild("Nodes") and IsPossible then
					Event("breakLights", Room, 0.416, 60)
					for i,v in pairs(Room.Nodes:GetChildren()) do
						SpawnerLibrary.Tween2(RushNew, v, RushSpeed, CFrame.new(0,4,0))
					end
					SpawnerLibrary.Tween2(RushNew, Room.RoomEnd, RushSpeed)
				end
			end

			CanKill = false
			
			local Current = workspace.CurrentRooms:FindFirstChild(game.ReplicatedStorage.GameData.LatestRoom.Value)
			
			if Current:FindFirstChild("Door") then
				Current.Door.ClientOpen:FireServer()
			end
			
			Rushing = false

			RushNew.CanCollide = false
			RushNew.Anchored = false
			
			for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
				v:SetAttribute("Possible", true)
			end
			
			con:Disconnect()
		end,
	},
	Ambush = {
		Func = function(Args)
			local AmbushSpeed = (Args.Speed and Args.Speed) or 160
			local CanKill = (Args.Kill and Args.Kill) or false
			local WaitTime = (Args.Time and Args.Time) or 3
			
			Event("flickerLights", game.ReplicatedStorage.GameData.LatestRoom.Value, .75)
			
			task.wait(math.random(1,3))
			workspace["Ambience_Ambush"]:Play()
			
			local Ambush = Instance.new("Model")
			Ambush.Name = "RushMoving"

			local RushNew = Create(loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/Ambush.lua"))(), nil)
			RushNew.Parent = Ambush

			Ambush.Parent = workspace
			Ambush.PrimaryPart = RushNew

			local Earliest, Latest = SpawnerLibrary.Calculate2()
			Ambush:PivotTo(Earliest.PrimaryPart.CFrame)
			
			for i,v in pairs(Ambush:GetDescendants()) do
				if v:IsA("Sound") then
					v.SoundGroup = game.SoundService.Main
				end
			end

			task.wait(WaitTime)

			local Rushing = true
			local con
			con = workspace.CurrentRooms.ChildAdded:Connect(function()
				for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
					v:SetAttribute("Possible", true)
				end
			end)

			coroutine.wrap(function()
				while Rushing do
					firesignal(game.ReplicatedStorage.Bricks.CamShakeRelative.OnClientEvent, RushNew.Position, 2, 15, 0.1, .5, Vector3.new(0,0,0))
					if CanKill then
						for i,v in pairs(game.Players:GetPlayers()) do
							SpawnerLibrary.Raycast(v, RushNew, "Ambush", 150)
						end
					end
					task.wait()
				end
			end)()

			local Earliest, Latest = SpawnerLibrary.Calculate2()

			for i = 1,math.random(2,4) do
				local Nodes = {}
				for _,Room in ipairs(workspace.CurrentRooms:GetChildren()) do
					local IsPossible = true
					
					if Room:GetAttribute("Possible") == false then
						IsPossible = false
					end
					
					-- Next room operations
					local Next = workspace.CurrentRooms:FindFirstChild(tonumber(Room.Name) + 1)

					if Next then
						if tonumber(Room.Name) == tonumber(game.ReplicatedStorage.GameData.LatestRoom.Value) then
							if Room:FindFirstChild("Door") and Room:FindFirstChild("Nodes") then
								if Room.Door.Door.Anchored then
									Next:SetAttribute("Possible", false)
								end
							end
						end
					end

					if Room:FindFirstChild("Nodes") and IsPossible then
						Event("breakLights", Room, 0.416, 60)
						for i,v in pairs(Room.Nodes:GetChildren()) do
							table.insert(Nodes, 1, v)
							SpawnerLibrary.Tween2(RushNew, v, AmbushSpeed, CFrame.new(0,4,0))
						end
						SpawnerLibrary.Tween2(RushNew, Room.RoomEnd, AmbushSpeed)
					end
				end
				
				for i,v in ipairs(Nodes) do
					SpawnerLibrary.Tween2(RushNew, v, AmbushSpeed, CFrame.new(0,4,0))
				end
				
				task.wait(math.random(1,3))
			end

			CanKill = false
			Rushing = false

			Ambush:Destroy()
			
			for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
				v:SetAttribute("Possible", true)
			end
			
			con:Disconnect()
		end,
	},
	Screech = {
		Func = function()
			require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(u2)
		end,
	},
	Glitch = {
		Func = function()
			require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(u2, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
		end,
	},
	Halt = {
		Func = function()
			require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(u2, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
		end,
	},
	Jack = {
		Func = function()
			local Room = workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
			
			Event("tryp", workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value], 10) 

			local Jack = Instance.new("Part", workspace)
			Jack.Name = "MobbleHallway"

			Jack.CFrame = Room.RoomStart.CFrame * CFrame.new(Vector3.new(0,0,-5))
			Jack.Orientation = Jack.Orientation + Vector3.new(0,180,0)
			Jack.Anchored = true
			Jack.CanCollide = false
			Jack.Transparency = 1

			Event("flickerLights", game.ReplicatedStorage.GameData.LatestRoom.Value, .6) 

			local Beam = Instance.new("Beam", Jack)
			Beam.Brightness = 1.295
			Beam.LightInfluence = 0
			Beam.Texture = "rbxassetid://8829534246"

			local Attachment1 = Instance.new("Attachment", Jack)
			local Attachment2 = Instance.new("Attachment", Jack)

			Attachment1.Orientation = Vector3.new(0, -180, -90)
			Attachment1.Position = Vector3.new(-0.049, 2.36, 0)

			Attachment2.Orientation = Vector3.new(0, -180, -90)
			Attachment2.Position = Vector3.new(-0.049, -1.211, 0)

			Beam.Attachment0 = Attachment1
			Beam.Attachment1 = Attachment2
			Beam.TextureLength = 1
			Beam.TextureMode = Enum.TextureMode.Stretch
			Beam.Transparency = NumberSequence.new(0)
			Beam.TextureSpeed = 0

			Beam.FaceCamera = true
			Beam.Width0 = 3
			Beam.Width1 = 3

			local Sound = Instance.new("Sound", Jack)
			Sound.SoundId = "rbxassetid://9145204231"

			Sound.PlaybackSpeed = 5
			Sound.Volume = 0.6

			Sound.RollOffMaxDistance = 150
			Sound.RollOffMinDistance = 25

			local Distortion = Instance.new("DistortionSoundEffect", Sound)
			local Echo = Instance.new("EchoSoundEffect", Sound)
			local Equalizer = Instance.new("EqualizerSoundEffect", Sound)

			Distortion.Level = 1
			Echo.Delay = 0.1

			Equalizer.MidGain = 0
			Equalizer.LowGain = -13.4
			Equalizer.HighGain = -1.7

			Sound:Play()
			task.wait(.3)
			Jack:Destroy()
		end,
	},
	Eyes = {
		Func = function(Args)
			local Damage = Args.Damage or 10
			local Room = workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]

			local Eyes = Instance.new("Part", workspace)
			Eyes.Transparency = 1
			local Sound = Instance.new("Sound", Eyes)

			local Attachment = Instance.new("Attachment", Eyes)

			local Spark = Instance.new("ParticleEmitter", Attachment)
			Spark.Texture = "rbxassetid://2581223252"
			Spark.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 11, 39)),
				ColorSequenceKeypoint.new(0.324, Color3.fromRGB(32, 14, 22)),
				ColorSequenceKeypoint.new(0.441, Color3.fromRGB(20, 30, 14)),
				ColorSequenceKeypoint.new(0.527, Color3.fromRGB(14, 18, 27)),
				ColorSequenceKeypoint.new(0.675, Color3.fromRGB(15, 14, 27)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(17, 8, 26))
			}
			Spark.Size = NumberSequence.new(8)
			Spark.Transparency = NumberSequence.new{
				NumberSequenceKeypoint.new(0, .975),
				NumberSequenceKeypoint.new(0.247, 0),
				NumberSequenceKeypoint.new(0.498, .0125),
				NumberSequenceKeypoint.new(0.786, .0375),
				NumberSequenceKeypoint.new(1, 1),
			}

			Spark.Drag = 15
			Spark.LockedToPart = true
			Spark.VelocityInheritance = 0.5

			Spark.Lifetime = NumberRange.new(0.5, 2)
			Spark.Rate = 25
			Spark.Rotation = NumberRange.new(-50, 50)
			Spark.RotSpeed = NumberRange.new(-5, -5)
			Spark.Speed = NumberRange.new(1, 3)
			Spark.SpreadAngle = Vector2.new(180, 180)

			Spark.Enabled = true

			local EyesParticle = Instance.new("ParticleEmitter", Attachment)
			EyesParticle.LightInfluence = 0
			EyesParticle.Brightness = 1.26
			EyesParticle.Size = NumberSequence.new(4)
			EyesParticle.Texture = "rbxassetid://10183704772"
			EyesParticle.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
				ColorSequenceKeypoint.new(0.46, Color3.fromRGB(255,255,255)),
				ColorSequenceKeypoint.new(0.509, Color3.fromRGB(129,97,255)),
				ColorSequenceKeypoint.new(0.612, Color3.fromRGB(17, 0, 255)),
				ColorSequenceKeypoint.new(0.649, Color3.fromRGB(255, 58, 163)),
				ColorSequenceKeypoint.new(0.848, Color3.fromRGB(255, 255, 255)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
			}
			EyesParticle.Transparency = NumberSequence.new{
				NumberSequenceKeypoint.new(0, .975),
				NumberSequenceKeypoint.new(0.247, 0),
				NumberSequenceKeypoint.new(0.498, .0125),
				NumberSequenceKeypoint.new(0.786, .0375),
				NumberSequenceKeypoint.new(1, 1),
			}

			EyesParticle.Lifetime = NumberRange.new(0.2, .5)
			EyesParticle.Rate = 25
			EyesParticle.Rotation = NumberRange.new(-1, 1)
			EyesParticle.RotSpeed = NumberRange.new(-1, 1)
			EyesParticle.Speed = NumberRange.new(0,0)

			EyesParticle.Drag = 1
			EyesParticle.LockedToPart = true
			EyesParticle.VelocityInheritance = 0.5
			EyesParticle.Transparency = NumberSequence.new{
				NumberSequenceKeypoint.new(0, .994),
				NumberSequenceKeypoint.new(0.496, .637),
				NumberSequenceKeypoint.new(1, 1),
			}

			Sound.SoundId = "rbxassetid://1168009240"
			Sound.PlaybackSpeed = 0.3
			Sound:Play()

			local flange = Instance.new("FlangeSoundEffect", Sound)
			flange.Depth = 0.475
			flange.Mix = 0.97
			flange.Rate = 2

			local Sound2 = Instance.new("Sound", Eyes)
			Sound2.SoundId = "rbxassetid://1228230799"
			Sound2.PlaybackSpeed = 1
			Sound2.Looped = true
			Sound2:Play()

			local Sound3 = Instance.new("Sound", Eyes)
			Sound3.SoundId = "rbxassetid://9126213993"
			Sound3.PlaybackSpeed = 1.05

			Eyes.Name = "Lookman"

			Eyes.Anchored = true
			Eyes.CanCollide = false
			Eyes.Size = Vector3.new(2.5,2.5,2.5)
			Eyes.Position = Room.Base.Position + Vector3.new(0,8,0)


			local Light1 = Instance.new("PointLight", Eyes)

			Light1.Brightness = 2
			Light1.Color = Color3.fromRGB(21,0,107)
			Light1.Enabled = true
			Light1.Range = 60
			Light1.Shadows = true

			local Light2 = Instance.new("PointLight", Eyes)

			Light2.Brightness = 2
			Light2.Color = Color3.fromRGB(51, 0, 255)
			Light2.Enabled = true
			Light2.Range = 25
			Light2.Shadows = false

			coroutine.wrap(function()
				task.wait(1)
				while Spark.Enabled do
					local Camera = workspace.Camera
					local Character = game:GetService('Players').LocalPlayer.Character

					local RunService = game:GetService('RunService')

					local Parameters = RaycastParams.new()
					Parameters.FilterDescendantsInstances = {Character, Eyes}
					Parameters.FilterType = Enum.RaycastFilterType.Blacklist

					local Vector, OnScreen = Camera:WorldToViewportPoint(Eyes.Position)

					if OnScreen then
						if workspace:Raycast(Camera.CFrame.Position, Eyes.Position - Camera.CFrame.Position, Parameters) == nil then
							game.Players.LocalPlayer.Character.Humanoid.Health -= Damage
						end
					end

					task.wait(.175)
				end
			end)()
			game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
			
			Sound2:Stop()
			
			EyesParticle.Enabled = false
			Spark.Enabled = false
			
			Light1:Destroy()
			Light2:Destroy()
			
			task.wait(5)
			Eyes:Destroy()
		end,
	},
}

function Spawner:Spawn(Entity, Args)
	for Name,List in pairs(Entities) do
		print(Name)
		if Name == Entity then
			List["Func"](Args)
		end
	end
end

return Spawner
