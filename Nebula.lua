---@diagnostic disable: undefined-global
--// A kah script I made for fun. Is it good? Absolutely not

--// Removes kill bricks

local obbyShit = workspace.Terrain["_Game"].Workspace:FindFirstChild("Obby")
if obbyShit then
	obbyShit:Destroy()
else
	
end

--// The actual script lmao
local player = game:GetService("Players").LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local msgPrefix = "[Nebula]: "
local addPrefix = false
rconsolename("Nebula")

local pads = workspace.Terrain["_Game"].Admin.Pads:GetChildren()
local regen = workspace.Terrain["_Game"].Admin.Regen.ClickDetector


function getRandomPad()
	if pads then local randomPad = pads[math.random(1, #pads)]; return randomPad end
end

function getPad(type)
	local randomPad = getRandomPad()
	if type == "regen" then
		if regen then fireclickdetector(regen); player.Character.HumanoidRootPart.CFrame = randomPad:FindFirstChild("Head").CFrame; task.wait(0.1); player.Character.HumanoidRootPart.CFrame = CFrame.new(-40.9999847, 8.22999954, 54.1057205, -1, 3.27799725e-08, -1.93254852e-08, 3.27799725e-08, 1, 3.75985891e-08, 1.9325487e-08, 3.75985891e-08, -1); end;
	elseif type == "steal" then
		for _,v in next, pads do if v.Name == "Touch to get admin" then player.Character.HumanoidRootPart.CFrame = v:FindFirstChild("Head").CFrame; task.wait(1); end; end;
	else
		if randomPad.Name == "Touch to get admin" then player.Character.HumanoidRootPart.CFrame = randomPad:FindFirstChild("Head").CFrame; task.wait(0.1); player.Character.HumanoidRootPart.CFrame = CFrame.new(-40.9999847, 8.22999954, 54.1057205, -1, 3.27799725e-08, -1.93254852e-08, 3.27799725e-08, 1, 3.75985891e-08, 1.9325487e-08, 3.75985891e-08, -1); end; 
	end
end

function chat(msg)
	if addPrefix then
		replicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(defaultBotMessagePrefix..msg, "All")
	else
		replicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
	end
end

chat("[Nebula]: Executed script")

local commands = {
	argstest = function(arguments)
		print(arguments[1], arguments[2])
	end,
	stealpads = function(arguments)
		getPad("steal")
	end,
	house = function(arguments)
		player.Character.HumanoidRootPart.CFrame = CFrame.new(-40.9999847, 8.22999954, 54.1057205, -1, 3.27799725e-08, -1.93254852e-08, 3.27799725e-08, 1, 3.75985891e-08, 1.9325487e-08, 3.75985891e-08, -1)
	end,
	regenpads = function(arguments)
		getPad("regen")
	end,
	pad = function(arguments)
		getPad()
	end,
	rejoin = function(arguments)
		game:GetService("TeleportService"):Teleport(game.PlaceId, player)
	end,
	floodchat = function(arguments)
		num = tonumber(arguments[1])
		for i = 1, num do
			chat("ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻ׁ⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻")
		end
	end,
}

player.Chatted:Connect(function(message)
	local split = message:split(" ")
	local cmdname = split[1]
	if commands[cmdname] then
		local arguments = {}
		for i = 2, #split, 1 do table.insert(arguments, split[i]) end;
		commands[cmdname](arguments)
	end
	rconsoleprint("["..player.Name.."]: "..message.."\n")
end)
