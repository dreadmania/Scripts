local AmbushModel = {
	ID = 0;
	Type = "Part";
	Properties = {
		BottomSurface = Enum.SurfaceType.Smooth;
		Anchored = true;
		CFrame = CFrame.new(103.65540313720703,42.928443908691406,-56.23512268066406,-0.763397216796875,0,0.645930290222168,0,1,0,-0.645930290222168,0,-0.763397216796875);
		Rotation = Vector3.new(-180,40.2400016784668,-180);
		Transparency = 1;
		Name = "RushNew";
		Position = Vector3.new(103.65540313720703,42.928443908691406,-56.23512268066406);
		Orientation = Vector3.new(0,139.75999450683594,0);
		Size = Vector3.new(6.5079240798950195,6.5079240798950195,6.5079240798950195);
		Shape = Enum.PartType.Ball;
		TopSurface = Enum.SurfaceType.Smooth;
	};
	Children = {
		{
			ID = 1;
			Type = "Attachment";
			Properties = {
				Position = Vector3.new(0,1.459420919418335,0);
				CFrame = CFrame.new(0,1.459420919418335,0,1,0,0,0,1,0,0,0,1);
			};
			Children = {
				{
					ID = 2;
					Type = "ParticleEmitter";
					Properties = {
						Enabled = false;
						VelocitySpread = 360;
						RotSpeed = NumberRange.new(335533,32323232);
						Texture = "rbxassetid://84277811";
						Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0,62/85,1)),ColorSequenceKeypoint.new(1,Color3.new(0,62/85,1))});
						Drag = -2;
						ZOffset = -1;
						SpreadAngle = Vector2.new(360,360);
						Rotation = NumberRange.new(-360,360);
						Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.11021800339221954,0,0),NumberSequenceKeypoint.new(0.2204360067844391,1,0),NumberSequenceKeypoint.new(0.31687700748443604,0,0),NumberSequenceKeypoint.new(0.4282430112361908,1,0),NumberSequenceKeypoint.new(0.5591269731521606,0,0),NumberSequenceKeypoint.new(0.6934559941291809,1,0),NumberSequenceKeypoint.new(0.8013780117034912,0,0),NumberSequenceKeypoint.new(1,1,0)});
						Name = "BlackTrail";
						Lifetime = NumberRange.new(0.009999999776482582,0.10000000149011612);
						Speed = NumberRange.new(15);
						Rate = 15;
						LockedToPart = true;
						Size = NumberSequence.new({NumberSequenceKeypoint.new(0,5,0),NumberSequenceKeypoint.new(1,5,0)});
					};
					Children = {};
				};
				{
					ID = 3;
					Type = "ParticleEmitter";
					Properties = {
						Enabled = false;
						VelocitySpread = 360;
						RotSpeed = NumberRange.new(-3,3);
						Texture = "rbxassetid://7648565918";
						Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0,0,11/255)),ColorSequenceKeypoint.new(0.261231005191803,Color3.new(0,73/255,52/255)),ColorSequenceKeypoint.new(1,Color3.new(0,0,11/255))});
						Drag = 255;
						ZOffset = 0.8999999761581421;
						SpreadAngle = Vector2.new(360,360);
						Rotation = NumberRange.new(-360,360);
						Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.11021800339221954,0,0),NumberSequenceKeypoint.new(0.2204360067844391,1,0),NumberSequenceKeypoint.new(0.31687700748443604,0,0),NumberSequenceKeypoint.new(0.4282430112361908,1,0),NumberSequenceKeypoint.new(0.5591269731521606,0,0),NumberSequenceKeypoint.new(0.6934559941291809,1,0),NumberSequenceKeypoint.new(0.8013780117034912,0,0),NumberSequenceKeypoint.new(1,1,0)});
						Name = "Black";
						Lifetime = NumberRange.new(0.019999999552965164,0.20000000298023224);
						Speed = NumberRange.new(15);
						Rate = 25;
						LockedToPart = true;
						Size = NumberSequence.new({NumberSequenceKeypoint.new(0,25,0),NumberSequenceKeypoint.new(1,25,0)});
					};
					Children = {};
				};
				{
					ID = 4;
					Type = "ParticleEmitter";
					Properties = {
						VelocitySpread = 360;
						RotSpeed = NumberRange.new(-5,5);
						Texture = "rbxassetid://10110576663";
						Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),ColorSequenceKeypoint.new(0.35940098762512207,Color3.new(7/15,1,41/51)),ColorSequenceKeypoint.new(0.3643929958343506,Color3.new(1,1,1)),ColorSequenceKeypoint.new(1,Color3.new(1,1,1))});
						Drag = 0.10000000149011612;
						ZOffset = 4;
						LightEmission = 0.20000000298023224;
						Rotation = NumberRange.new(-1,1);
						Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.20518900454044342,0,0),NumberSequenceKeypoint.new(0.2602199912071228,1,0),NumberSequenceKeypoint.new(0.3168239891529083,0,0),NumberSequenceKeypoint.new(0.39386799931526184,1,0),NumberSequenceKeypoint.new(0.4418239891529083,0,0),NumberSequenceKeypoint.new(0.5385220050811768,1,0),NumberSequenceKeypoint.new(0.6116350293159485,0,0),NumberSequenceKeypoint.new(0.6949689984321594,1,0),NumberSequenceKeypoint.new(0.7570750117301941,0,0),NumberSequenceKeypoint.new(1,0,0)});
						SpreadAngle = Vector2.new(360,360);
						Lifetime = NumberRange.new(0,1);
						Speed = NumberRange.new(0.20000000298023224);
						Rate = 15;
						LockedToPart = true;
						Size = NumberSequence.new({NumberSequenceKeypoint.new(0,5,0.12738800048828125),NumberSequenceKeypoint.new(0.12730099260807037,4.936309814453125,0.11947499960660934),NumberSequenceKeypoint.new(0.2561349868774414,5.0955400466918945,0.11133799701929092),NumberSequenceKeypoint.new(0.3803679943084717,4.936309814453125,0.10426600277423859),NumberSequenceKeypoint.new(0.49539899826049805,5.063690185546875,0.09643249958753586),NumberSequenceKeypoint.new(0.6042940020561218,5,0.09076060354709625),NumberSequenceKeypoint.new(0.6993860006332397,5.0955400466918945,0.08520050346851349),NumberSequenceKeypoint.new(0.7960119843482971,5,0.08048229664564133),NumberSequenceKeypoint.new(0.8987730145454407,5.127389907836914,0.07215149700641632),NumberSequenceKeypoint.new(1,5,0.06369449943304062)});
					};
					Children = {};
				};
				{
					ID = 5;
					Type = "PointLight";
					Properties = {
						Color = Color3.new(0,1,61/85);
						Brightness = 0.10000000149011612;
						Range = 39;
					};
					Children = {};
				};
				{
					ID = 6;
					Type = "PointLight";
					Properties = {
						Color = Color3.new(0,1,61/85);
						Brightness = 1.659999966621399;
						Range = 24;
					};
					Children = {};
				};
				{
					ID = 7;
					Type = "PointLight";
					Properties = {
						Color = Color3.new(1,0,4/255);
						Brightness = 12212121;
						Range = 6;
					};
					Children = {};
				};
			};
		};
		{
			ID = 8;
			Type = "Sound";
			Properties = {
				Pitch = 0.550000011920929;
				EmitterSize = 5;
				RollOffMode = Enum.RollOffMode.Linear;
				Looped = true;
				TimePosition = 0.6852046602754388;
				PlaybackSpeed = 0.550000011920929;
				MaxDistance = 150;
				Name = "Footsteps";
				Volume = 0.2199999988079071;
				SoundId = "rbxassetid://8880765497";
				MinDistance = 5;
				Playing = true;
			};
			Children = {
				{
					ID = 9;
					Type = "DistortionSoundEffect";
					Properties = {
						Level = 1;
					};
					Children = {};
				};
				{
					ID = 10;
					Type = "FlangeSoundEffect";
					Properties = {
						Depth = 1;
						Rate = 0.20000000298023224;
						Mix = 1;
					};
					Children = {};
				};
				{
					ID = 11;
					Type = "EqualizerSoundEffect";
					Properties = {
						MidGain = -0.800000011920929;
						LowGain = -21.5;
						HighGain = 4.599999904632568;
					};
					Children = {};
				};
				{
					ID = 12;
					Type = "TremoloSoundEffect";
					Properties = {
						Duty = 0.8799999952316284;
						Depth = 0.9300000071525574;
						Frequency = 9.253999710083008;
					};
					Children = {};
				};
				{
					ID = 13;
					Type = "EchoSoundEffect";
					Properties = {
						Feedback = 1;
						Priority = 1;
						WetLevel = -2.5999999046325684;
						Delay = 0.9819999933242798;
					};
					Children = {};
				};
			};
		};
		{
			ID = 14;
			Type = "Sound";
			Properties = {
				PlaybackSpeed = 4;
				MaxDistance = 1000;
				Name = "Kill";
				EmitterSize = 4;
				SoundId = "rbxassetid://5263560896";
				MinDistance = 4;
				Pitch = 4;
				Volume = 0.11999999731779099;
			};
			Children = {
				{
					ID = 15;
					Type = "DistortionSoundEffect";
					Properties = {
						Priority = 5;
						Level = 0.9800000190734863;
					};
					Children = {};
				};
				{
					ID = 16;
					Type = "PitchShiftSoundEffect";
					Properties = {
						Octave = 0.5;
					};
					Children = {};
				};
				{
					ID = 17;
					Type = "FlangeSoundEffect";
					Properties = {
						Depth = 1;
						Priority = 2;
						Rate = 0.20000000298023224;
						Mix = 1;
					};
					Children = {};
				};
				{
					ID = 18;
					Type = "TremoloSoundEffect";
					Properties = {
						Duty = 0.9399999976158142;
						Priority = 2;
						Frequency = 20;
					};
					Children = {};
				};
			};
		};
		{
			ID = 19;
			Type = "Sound";
			Properties = {
				PlaybackSpeed = 0.800000011920929;
				MaxDistance = 250;
				Name = "Knock";
				EmitterSize = 6;
				SoundId = "rbxassetid://5579533230";
				MinDistance = 6;
				Pitch = 0.800000011920929;
				Volume = 0.4000000059604645;
			};
			Children = {
				{
					ID = 20;
					Type = "DistortionSoundEffect";
					Properties = {
						Level = 0.8799999952316284;
					};
					Children = {};
				};
				{
					ID = 21;
					Type = "FlangeSoundEffect";
					Properties = {
						Depth = 1;
						Rate = 0.20000000298023224;
						Mix = 1;
					};
					Children = {};
				};
				{
					ID = 22;
					Type = "EqualizerSoundEffect";
					Properties = {
						MidGain = 0;
						LowGain = 0;
						HighGain = -80;
					};
					Children = {};
				};
				{
					ID = 23;
					Type = "TremoloSoundEffect";
					Properties = {
						Duty = 0.9399999976158142;
						Frequency = 20;
					};
					Children = {};
				};
			};
		};
		{
			ID = 24;
			Type = "Sound";
			Properties = {
				PlaybackSpeed = 0.6000000238418579;
				MaxDistance = 1000;
				Name = "Repent";
				EmitterSize = 4;
				SoundId = "rbxassetid://5263560896";
				MinDistance = 4;
				Pitch = 0.6000000238418579;
				Volume = 0.30000001192092896;
			};
			Children = {
				{
					ID = 25;
					Type = "DistortionSoundEffect";
					Properties = {
						Level = 0.8899999856948853;
					};
					Children = {};
				};
				{
					ID = 26;
					Type = "EchoSoundEffect";
					Properties = {
						Feedback = 0.36000001430511475;
						Priority = 1;
						WetLevel = -2.5999999046325684;
						Delay = 0.15000000596046448;
					};
					Children = {};
				};
				{
					ID = 27;
					Type = "FlangeSoundEffect";
					Properties = {
						Depth = 1;
						Rate = 0.800000011920929;
						Mix = 1;
					};
					Children = {};
				};
				{
					ID = 28;
					Type = "EqualizerSoundEffect";
					Properties = {
						MidGain = -0.800000011920929;
						LowGain = -6.199999809265137;
						HighGain = 1;
					};
					Children = {};
				};
				{
					ID = 29;
					Type = "TremoloSoundEffect";
					Properties = {
						Duty = 0.9399999976158142;
						Frequency = 20;
					};
					Children = {};
				};
			};
		};
		{
			ID = 30;
			Type = "Sound";
			Properties = {
				PlaybackSpeed = 0.44999998807907104;
				MaxDistance = 1000;
				Name = "Scream";
				EmitterSize = 4;
				SoundId = "rbxassetid://5263560566";
				MinDistance = 4;
				Pitch = 0.44999998807907104;
				Volume = 0.20000000298023224;
			};
			Children = {
				{
					ID = 31;
					Type = "DistortionSoundEffect";
					Properties = {
						Level = 0.9599999785423279;
					};
					Children = {};
				};
				{
					ID = 32;
					Type = "EchoSoundEffect";
					Properties = {
						Feedback = 0.5899999737739563;
						Priority = 1;
						WetLevel = -2.5999999046325684;
						Delay = 0.10000000149011612;
					};
					Children = {};
				};
				{
					ID = 33;
					Type = "FlangeSoundEffect";
					Properties = {
						Depth = 1;
						Rate = 0.800000011920929;
						Mix = 1;
					};
					Children = {};
				};
				{
					ID = 34;
					Type = "EqualizerSoundEffect";
					Properties = {
						MidGain = -0.800000011920929;
						LowGain = -6.199999809265137;
						HighGain = -48.5;
					};
					Children = {};
				};
				{
					ID = 35;
					Type = "TremoloSoundEffect";
					Properties = {
						Duty = 0.9399999976158142;
						Frequency = 20;
					};
					Children = {};
				};
			};
		};
		{
			ID = 36;
			Type = "Attachment";
			Properties = {
				Rotation = Vector3.new(-180,0,-180);
				Name = "CamAttach";
				Position = Vector3.new(0,2.273453950881958,-6.896209716796875);
				Orientation = Vector3.new(-0,180,0);
				CFrame = CFrame.new(0,2.273453950881958,-6.896209716796875,-1,0,0,0,1,0,0,0,-1);
				Axis = Vector3.new(-1,0,0);
			};
			Children = {};
		};
		{
			ID = 37;
			Type = "SpecialMesh";
			Properties = {};
			Children = {};
		};
		{
			ID = 38;
			Type = "BodyGyro";
			Properties = {
				CFrame = CFrame.new(234.24261474609375,-8.999996185302734,3722.49560546875,0.7001465559005737,0.08548083901405334,-0.7088637351989746,-0.0000021494925022125244,0.9928078055381775,0.11971911042928696,0.7139991521835327,-0.08381939679384232,0.6951111555099487);
				cframe = CFrame.new(234.24261474609375,-8.999996185302734,3722.49560546875,0.7001465559005737,0.08548083901405334,-0.7088637351989746,-0.0000021494925022125244,0.9928078055381775,0.11971911042928696,0.7139991521835327,-0.08381939679384232,0.6951111555099487);
				MaxTorque = Vector3.new(400000,4000000,400000);
				maxTorque = Vector3.new(400000,4000000,400000);
			};
			Children = {};
		};
		{
			ID = 39;
			Type = "BodyVelocity";
			Properties = {
				Velocity = Vector3.new(107.09761047363281,0,-105.02428436279297);
				velocity = Vector3.new(107.09761047363281,0,-105.02428436279297);
				maxForce = Vector3.new(4000000,0,4000000);
				MaxForce = Vector3.new(4000000,0,4000000);
			};
			Children = {};
		};
		{
			ID = 40;
			Type = "Attachment";
			Properties = {
				CFrame = CFrame.new(0,2.339845895767212,0,1,0,0,0,1,0,0,0,1);
				Name = "FaceAttach";
				Position = Vector3.new(0,2.339845895767212,0);
			};
			Children = {};
		};
		{
			ID = 41;
			Type = "Sound";
			Properties = {
				Pitch = 0.5;
				EmitterSize = 5;
				RollOffMode = Enum.RollOffMode.LinearSquare;
				Looped = true;
				TimePosition = 0.22039758400880238;
				PlaybackSpeed = 0.5;
				MaxDistance = 300;
				Name = "PlaySound";
				Volume = 0.2199999988079071;
				SoundId = "rbxassetid://8880765497";
				MinDistance = 5;
				Playing = true;
			};
			Children = {
				{
					ID = 42;
					Type = "DistortionSoundEffect";
					Properties = {
						Priority = 3;
						Level = 1;
					};
					Children = {};
				};
				{
					ID = 43;
					Type = "FlangeSoundEffect";
					Properties = {
						Depth = 1;
						Priority = 3;
						Rate = 0.20000000298023224;
						Mix = 1;
					};
					Children = {};
				};
				{
					ID = 44;
					Type = "EqualizerSoundEffect";
					Properties = {
						MidGain = -6.199999809265137;
						Priority = 3;
						LowGain = 0.10000000149011612;
						HighGain = -30.5;
					};
					Children = {};
				};
				{
					ID = 45;
					Type = "TremoloSoundEffect";
					Properties = {
						Duty = 0.9399999976158142;
						Priority = 3;
						Frequency = 20;
					};
					Children = {};
				};
			};
		};
		{
			ID = 46;
			Type = "Attachment";
			Properties = {
				CFrame = CFrame.new(0,3.584420919418335,0,1,0,0,0,1,0,0,0,1);
				Name = "TrailAttach";
				Position = Vector3.new(0,3.584420919418335,0);
			};
			Children = {};
		};
		{
			ID = 47;
			Type = "Attachment";
			Properties = {
				CFrame = CFrame.new(0,-0.540579080581665,0,1,0,0,0,1,0,0,0,1);
				Name = "TrailAttach";
				Position = Vector3.new(0,-0.540579080581665,0);
			};
			Children = {};
		};
		{
			ID = 48;
			Type = "Sound";
			Properties = {
				MinDistance = 5;
				MaxDistance = 450;
				Name = "Sounds";
				EmitterSize = 5;
				RollOffMode = Enum.RollOffMode.LinearSquare;
				Looped = true;
				SoundId = "rbxassetid://9113218672";
				Volume = 0.4000000059604645;
			};
			Children = {
				{
					ID = 49;
					Type = "DistortionSoundEffect";
					Properties = {
						Priority = 3;
						Level = 0.7699999809265137;
					};
					Children = {};
				};
			};
		};
	};
};

return AmbushModel
