function back()
local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true


local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("北京时间:"..os.date("%H").."时"..os.date("%M").."分")
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/f2vR5dJd"))()



OrionLib:MakeNotification({
  Name = "欢迎你使用脚本(启动成功)",
  Content = "在这里你可以玩到各种外挂\n虽然还有很多我们没有更新--请大家耐心等待\n你们的鼓励就是我的动力\n希望你们玩的开心--玩的愉快",
  Image = "rbxassetid://13317101016",
  Time = 20
})
wait(3)
local Window = OrionLib:MakeWindow({Name = "河流工作室(河脚本)(DOORS)", HidePremium = false, SaveConfig = false, IntroText = "正在启动(河脚本)(DOORS)", ConfigFolder = "河脚本"})

local Player = Window:MakeTab({
	Name = "玩家-大厅",
	Icon = "rbxassetid://13169991903",
	PremiumOnly = false
})

Player:AddTextbox({
	Name = "移动速度",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end
})

Player:AddTextbox({
	Name = "跳跃高度",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end
})

Player:AddTextbox({
	Name = "重力",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.Gravity = Value
	end
})

Player:AddButton({
	Name = "飞行-汉化版",
	Callback = function()
      	loadstring(game:HttpGet("https://pastebin.com/raw/eUK3tbiM"))()
  	end
})

Player:AddToggle({
	Name = "飞行踏空",
	Default = false,
	Callback = function(Value)
		Jump = Value
        game.UserInputService.JumpRequest:Connect(function()
            if Jump and bool2 then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
            end
        end)
	end
})

Player:AddToggle({
    Name = "穿墙",
    Default = false,
    Callback = function(Value)
        Noclip = Value
        Stepped = game.RunService.Stepped:Connect(function()
            if Noclip and bool2 then
                for a, b in pairs(game.Workspace:GetChildren()) do
                    if b.Name == game.Players.LocalPlayer.Name and bool2 then
                        for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                            if v:IsA("BasePart") and bool2 then
                                v.CanCollide = false
                            end
                        end
                    end
                end
            else
                Stepped:Disconnect()
            end
        end)
    end
})

Player:AddToggle({
	Name = "显示玩家",
	Default = false,
	Callback = function(Value)
	EP = Value
	end
})

Player:AddParagraph("单独追踪杀死玩家","")

Player:AddTextbox({
    Name = "用户名",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        Name = Value
    end
})
 
Player:AddToggle({
    Name = "循环杀戮",
    Default = false,
    Callback = function(Value)
        Loop = Value
        while Loop do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[Name].Character.HumanoidRootPart.CFrame
            game.ReplicatedStorage.meleeEvent:FireServer(game.Players[Name])
            wait()
        end
    end
})
 
Player:AddToggle({
    Name = "杀戮光环",
    Default = false,
    Callback = function(Value)
        Aura = Value
        while Aura do
            wait()
            for i, e in pairs(game.Players:GetChildren()) do
                if e ~= game.Players.LocalPlayer and bool2 then
                    game.ReplicatedStorage.meleeEvent:FireServer(e)
                end
            end
        end
    end
})

Player:AddParagraph("最终杀死全部玩家","仅支持一小部分地图")

Player:AddButton({
	Name = "杀死全部人 (新版一直杀)",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/kXjfpFPh"))()
  	end
})

local hovbG = Window:MakeTab({
	Name = "其他-大厅",
	Icon = "rbxassetid://13242472862",
	PremiumOnly = false
})

hovbG:AddButton({
	Name = "跟踪玩家",
	Callback = function()
      	loadstring(game:HttpGet("https://pastebin.com/raw/F9PNLcXk"))()
  	end
})

hovbG:AddButton({
	Name = "建筑工具",
	Callback = function()
      	Hammer = Instance.new("HopperBin")
        Hammer.Name = "Hammer"
        Hammer.BinType = 4
        Hammer.Parent = game.Players.LocalPlayer.Backpack
        Clone = Instance.new("HopperBin")
        Clone.Name = "Clone"
        Clone.BinType = 3
        Clone.Parent = game.Players.LocalPlayer.Backpack
        Grab = Instance.new("HopperBin")
        Grab.Name = "Grab"
        Grab.BinType = 2
        
  	end
})

hovbG:AddButton({
	Name = "点击传送",
	Callback = function()
      	Tool = Instance.new("Tool")
        Tool.Name = "点击传送"
        Tool.RequiresHandle = false
        Tool.Parent = game.Players.LocalPlayer.Backpack
        Tool.Activated:Connect(function()
            Mouse = game.Players.LocalPlayer:GetMouse().Hit+Vector3.new(0, 2.5, 0)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mouse.X, Mouse.Y, Mouse.Z)
        end)
  	end
})

hovbG:AddButton({
	Name = "死亡笔记-河流汉化版",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AWDX-DYVB/test/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0.lua"))()
	end
})

hovbG:AddButton({
	Name = "无敌模式 (其他人可以看见)",
	Callback = function()
      	loadstring(game:HttpGet("https://pastebin.com/raw/LdTVujTA"))()
  	end
})

hovbG:AddButton({
	Name = "无敌的棒子 (瞬间秒杀)  (有些地图可使用)",
	Callback = function()
      	loadstring(game:HttpGet("https://pastebin.com/raw/mSLiAZH"))()
  	end
})

hovbG:AddButton({
	Name = "4K光影",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/SQ2nYcre"))()
	end
})

hovbG:AddToggle({
	Name = "修改亮度",
	Default = false,
	Callback = function(Value)
		if Value and bool2 then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
	end
})

local Music = Window:MakeTab({
	Name = "音乐-大厅",
	Icon = "rbxassetid://13170405998",
	PremiumOnly = false
})

Music:AddParagraph("很抱歉-音乐盒子正在开发中-请耐心等待","")

Music:AddButton({
	Name = "在你的身边(点击播放音乐)",
	Callback = function()
  	end
})

Music:AddButton({
	Name = "铃芽之旅中文版(点击播放音乐)",
	Callback = function()
  	end
})

Music:AddButton({
	Name = "铃芽之旅日文版(点击播放音乐)",
	Callback = function()
  	end
})

Music:AddToggle({
	Name = "取消眼睛伤害",
	Default = false,
	Callback = function(Bool)
	    DisableEyes = Bool
        if workspace:FindFirstChild("Eyes") and bool2 then
           MotorReplication:FireServer(0,DisableEyes and -120 or 0,0,false)
        end
    end
})

local function ApplySettings(Object)
     workspace.DescendantAdded:Connect(ApplySettings)
     workspace.ChildRemoved:Connect(function(Object)
        if Object.Name == "Eyes" and bool2 then
            if not workspace:FindFirstChild("Eyes") and bool2 then
                  EyesOnMap = false
            end
        end
    end)
end

local mt = getrawmetatable(game)
local old_mt = mt.__namecall
setreadonly(mt,false)
mt.__namecall = newcclosure(function(remote,...)
    args = {...}
    if DisableEyes and EyesOnMap and bool2 then
        if tostring(remote) == "MotorReplication" and bool2 then
            args[2] = -120
        end
    end
    return old_mt(remote,table.unpack(args))
end)

Music:AddButton({
	Name = "无人区玫瑰(点击播放音乐)",
	Callback = function()
  	end
})

local Doors = Window:MakeTab({
  Name = "DOORS其他功能",
  Icon = "rbxassetid://13169997722",
  PremiumOnly = false
})
Doors:AddParagraph("非常抱歉-由于这边还正在制作中","")
Doors:AddButton({
  Name = "跟踪玩家",
  Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/F9PNLcXk"))()
  end
})

Doors:AddButton({
	Name = "跳过50号房间",
	Callback = function()
		pcall(function()
			if LatestRoom.Value == 50 and bool2 then
				local CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom.Value + 1)]:WaitForChild("Door")
				game.Players.LocalPlayer.Character:PivotTo(CFrame.new(CurrentDoor.Door.Position))
			end
		end)
	end
})

Doors:AddToggle({
  Name = "修改永久亮度",
  Default = false,
  Callback = function(Value)
    if Value and bool2 then
      game.Lighting.Ambient = Color3.new(1, 1, 1)
     else
      game.Lighting.Ambient = Color3.new(0, 0, 0)
    end
  end
})

local window_esp = Window:MakeTab({
  Name = "DOORS透视功能",
  Icon = "rbxassetid://13169958031",
  PremiumOnly = false
})

local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid")

if not fireproximityprompt and bool2 then
  local msg = Instance.new("Message",workspace)
  msg.Text = "you have fireproximityprompt function bro get better executor"
  task.wait(6)
  msg:Destroy()
  error("no prox")
end

function esp(what,color,core,name)
  local parts

  if typeof(what) == "Instance" and bool2 then
    if what:IsA("Model") and bool2 then
      parts = what:GetChildren()
     elseif what:IsA("BasePart") and bool2 then
      parts = {what,table.unpack(what:GetChildren())}
    end
   elseif typeof(what) == "table" and bool2 then
    parts = what
  end

  local bill
  local boxes = {}

  for i,v in pairs(parts) do
    if v:IsA("BasePart") and bool2 then
      local box = Instance.new("BoxHandleAdornment")
      box.Size = v.Size
      box.AlwaysOnTop = true
      box.ZIndex = 1
      box.AdornCullingMode = Enum.AdornCullingMode.Never
      box.Color3 = color
      box.Transparency = 0.7
      box.Adornee = v
      box.Parent = game.CoreGui

      table.insert(boxes,box)

      task.spawn(function()
        while box do
          if box.Adornee == nil or not box.Adornee:IsDescendantOf(workspace) and bool2 then
            box.Adornee = nil
            box.Visible = false
            box:Destroy()
          end
          task.wait()
        end
      end)
    end
  end

  if core and name and bool2 then
    bill = Instance.new("BillboardGui",game.CoreGui)
    bill.AlwaysOnTop = true
    bill.Size = UDim2.new(0,400,0,100)
    bill.Adornee = core
    bill.MaxDistance = 2000

    local mid = Instance.new("Frame",bill)
    mid.AnchorPoint = Vector2.new(0.5,0.5)
    mid.BackgroundColor3 = color
    mid.Size = UDim2.new(0,8,0,8)
    mid.Position = UDim2.new(0.5,0,0.5,0)
    Instance.new("UICorner",mid).CornerRadius = UDim.new(1,0)
    Instance.new("UIStroke",mid)

    local txt = Instance.new("TextLabel",bill)
    txt.AnchorPoint = Vector2.new(0.5,0.5)
    txt.BackgroundTransparency = 1
    txt.BackgroundColor3 = color
    txt.TextColor3 = color
    txt.Size = UDim2.new(1,0,0,20)
    txt.Position = UDim2.new(0.5,0,0.7,0)
    txt.Text = name
    Instance.new("UIStroke",txt)

    task.spawn(function()
      while bill do
        if bill.Adornee == nil or not bill.Adornee:IsDescendantOf(workspace) and bool2 then
          bill.Enabled = false
          bill.Adornee = nil
          bill:Destroy()
        end
        task.wait()
      end
    end)
  end

  local ret = {}

  ret.delete = function()
    for i,v in pairs(boxes) do
      v.Adornee = nil
      v.Visible = false
      v:Destroy()
    end

    if bill and bool2 then
      bill.Enabled = false
      bill.Adornee = nil
      bill:Destroy()
    end
  end

  return ret
end

local entityinfo = game.ReplicatedStorage:WaitForChild("EntityInfo")
function message(text)
  local msg = Instance.new("Message",workspace)
  msg.Text = tostring(text)
  task.wait(5)
  msg:Destroy()

  --firesignal(entityinfo.Caption.OnClientEvent,tostring(text))
end

local flags = {
  speed = 0,
  espdoors = false,
  espkeys = false,
  espitems = false,
  espbooks = false,
  esprush = false,
  espchest = false,
  esplocker = false,
  esphumans = false,
  espgold = false,
  goldespvalue = 0,
  hintrush = false,
  light = false,
  instapp = false,
  noseek = false,
  nogates = false,
  nopuzzle = false,
  noa90 = false,
  noskeledoors = false,
  noscreech = false,
  getcode = false,
  roomsnolock = false,
  draweraura = false,
  autorooms = false,
}

local DELFLAGS = {table.unpack(flags)}
local esptable = {doors={},keys={},items={},books={},entity={},chests={},lockers={},people={},gold={}}



window_esp:AddToggle({
  Name = "显示门",
  Default = false,
  Callback = function(val)
    flags.espdoors = val

    if val and bool2 then
      local function setup(room)
        local door = room:WaitForChild("Door"):WaitForChild("Door")

        task.wait(0.1)
        local h = esp(door,Color3.fromRGB(255,240,0),door,"门")
        table.insert(esptable.doors,h)

        door:WaitForChild("Open").Played:Connect(function()
          h.delete()
        end)

        door.AncestryChanged:Connect(function()
          h.delete()
        end)
      end

      local addconnect
      addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
        setup(room)
      end)

      for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
        if room:FindFirstChild("Assets") and bool2 then
          setup(room)
        end
      end

      repeat task.wait() until not flags.espdoors
      addconnect:Disconnect()

      for i,v in pairs(esptable.doors) do
        v.delete()
      end
    end
  end})

window_esp:AddToggle({
  Name ="显示钥匙/拉杆",
  Default = false,
  Callback = function(val)
    flags.espkeys = val

    if val and bool2 then
      local function check(v)
        if v:IsA("Model") and (v.Name == "LeverForGate" or v.Name == "KeyObtain") and bool2 then
          task.wait(0.1)
          if v.Name == "KeyObtain" and bool2 then
            local hitbox = v:WaitForChild("Hitbox")
            local parts = hitbox:GetChildren()
            table.remove(parts,table.find(parts,hitbox:WaitForChild("PromptHitbox")))

            local h = esp(parts,Color3.fromRGB(90,255,40),hitbox,"钥匙")
            table.insert(esptable.keys,h)

           elseif v.Name == "LeverForGate" and bool2 then
            local h = esp(v,Color3.fromRGB(90,255,40),v.PrimaryPart,"拉杆")
            table.insert(esptable.keys,h)

            v.PrimaryPart:WaitForChild("SoundToPlay").Played:Connect(function()
              h.delete()
            end)
          end
        end
      end

      local function setup(room)
        local assets = room:WaitForChild("Assets")

        assets.DescendantAdded:Connect(function(v)
          check(v)
        end)

        for i,v in pairs(assets:GetDescendants()) do
          check(v)
        end
      end

      local addconnect
      addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
        setup(room)
      end)

      for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
        if room:FindFirstChild("Assets") and bool2 then
          setup(room)
        end
      end

      repeat task.wait() until not flags.espkeys
      addconnect:Disconnect()

      for i,v in pairs(esptable.keys) do
        v.delete()
      end
    end
  end})

window_esp:AddToggle({
  Name = "显示物品",
  Default = false,
  Callback = function(val)
    flags.espitems = val

    if val and bool2 then
      local function check(v)
        if v:IsA("Model") and (v:GetAttribute("Pickup") or v:GetAttribute("PropType")) and bool2 then
          task.wait(0.1)

          local part = (v:FindFirstChild("Handle") or v:FindFirstChild("Prop"))
          local h = esp(part,Color3.fromRGB(160,190,255),part,v.Name)
          table.insert(esptable.items,h)
        end
      end

      local function setup(room)
        local assets = room:WaitForChild("Assets")

        if assets and bool2 then
          local subaddcon
          subaddcon = assets.DescendantAdded:Connect(function(v)
            check(v)
          end)

          for i,v in pairs(assets:GetDescendants()) do
            check(v)
          end

          task.spawn(function()
            repeat task.wait() until not flags.espitems
            subaddcon:Disconnect()
          end)
        end
      end

      local addconnect
      addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
        setup(room)
      end)

      for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
        if room:FindFirstChild("Assets") and bool2 then
          setup(room)
        end
      end

      repeat task.wait() until not flags.espitems
      addconnect:Disconnect()

      for i,v in pairs(esptable.items) do
        v.delete()
      end
    end
  end})

window_esp:AddToggle({
  Name = "显示书/保险丝",
  Default = false,
  Callback = function(val)
    flags.espbooks = val

    if val and bool2 then
      local function check(v)
        if v:IsA("Model") and (v.Name == "LiveHintBook" or v.Name == "LiveBreakerPolePickup") and bool2 then
          task.wait(0.1)

          local h = esp(v,Color3.fromRGB(160,190,255),v.PrimaryPart,"书")
          table.insert(esptable.books,h)

          v.AncestryChanged:Connect(function()
            if not v:IsDescendantOf(room) and bool2 then
              h.delete()
            end
          end)
        end
      end

      local function setup(room)
        if room.Name == "50" or room.Name == "100" and bool2 then
          room.DescendantAdded:Connect(function(v)
            check(v)
          end)

          for i,v in pairs(room:GetDescendants()) do
            check(v)
          end
        end
      end

      local addconnect
      addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
        setup(room)
      end)

      for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
        setup(room)
      end

      repeat task.wait() until not flags.espbooks
      addconnect:Disconnect()

      for i,v in pairs(esptable.books) do
        v.delete()
      end
    end
  end})

local entitynames = {"RushMoving","AmbushMoving","Snare","A60","A120"}
window_esp:AddToggle({
  Name = "显示怪物",
  Default = false,
  Callback = function(val)
    flags.esprush = val

    if val and bool2 then
      local addconnect
      addconnect = workspace.ChildAdded:Connect(function(v)
        if table.find(entitynames,v.Name) and bool2 then
          task.wait(0.1)

          local h = esp(v,Color3.fromRGB(255,25,25),v.PrimaryPart,v.Name:gsub("Moving",""))
          table.insert(esptable.entity,h)
        end
      end)

      local function setup(room)
        if room.Name == "50" or room.Name == "100" and bool2 then
          local figuresetup = room:WaitForChild("FigureSetup")

          if figuresetup and bool2 then
            local fig = figuresetup:WaitForChild("FigureRagdoll")
            task.wait(0.1)

            local h = esp(fig,Color3.fromRGB(255,25,25),fig.PrimaryPart,"Figure")
            table.insert(esptable.entity,h)
          end
         else
          local assets = room:WaitForChild("Assets")

          local function check(v)
            if v:IsA("Model") and table.find(entitynames,v.Name) and bool2 then
              task.wait(0.1)

              local h = esp(v:WaitForChild("Base"),Color3.fromRGB(255,25,25),v.Base,"Snare")
              table.insert(esptable.entity,h)
            end
          end

          assets.DescendantAdded:Connect(function(v)
            check(v)
          end)

          for i,v in pairs(assets:GetDescendants()) do
            check(v)
          end
        end
      end

      local roomconnect
      roomconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
        setup(room)
      end)

      for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
        setup(room)
      end

      repeat task.wait() until not flags.esprush
      addconnect:Disconnect()
      roomconnect:Disconnect()

      for i,v in pairs(esptable.entity) do
        v.delete()
      end
    end
  end})

window_esp:AddToggle({
  Name = "储物柜显示",
  Default = false,
  Callback = function(val)
    flags.esplocker = val

    if val and bool2 then
      local function check(v)
        if v:IsA("Model") and bool2 then
          task.wait(0.1)
          if v.Name == "Wardrobe" and bool2 then
            local h = esp(v.PrimaryPart,Color3.fromRGB(145,100,25),v.PrimaryPart,"柜子")
            table.insert(esptable.lockers,h)
           elseif (v.Name == "Rooms_Locker" or v.Name == "Rooms_Locker_Fridge") and bool2 then
            local h = esp(v.PrimaryPart,Color3.fromRGB(145,100,25),v.PrimaryPart,"储物柜")
            table.insert(esptable.lockers,h)
          end
        end
      end

      local function setup(room)
        local assets = room:WaitForChild("Assets")

        if assets and bool2 then
          local subaddcon
          subaddcon = assets.DescendantAdded:Connect(function(v)
            check(v)
          end)

          for i,v in pairs(assets:GetDescendants()) do
            check(v)
          end

          task.spawn(function()
            repeat task.wait() until not flags.esplocker
            subaddcon:Disconnect()
          end)
        end
      end

      local addconnect
      addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
        setup(room)
      end)

      for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
        setup(room)
      end

      repeat task.wait() until not flags.esplocker
      addconnect:Disconnect()

      for i,v in pairs(esptable.lockers) do
        v.delete()
      end
    end
  end})

window_esp:AddToggle({
  Name = "显示箱子",
  Default = false,
  Callback = function(val)
    flags.espchest = val

    if val and bool2 then
      local function check(v)
        if v:IsA("Model") and bool2 then
          task.wait(0.1)
          if v.Name == "ChestBox" and bool2 then
            warn(v.Name)
            local h = esp(v,Color3.fromRGB(205,120,255),v.PrimaryPart,"箱子")
            table.insert(esptable.chests,h)
           elseif v.Name == "ChestBoxLocked" and bool2 then
            local h = esp(v,Color3.fromRGB(255,120,205),v.PrimaryPart,"Locked Chest")
            table.insert(esptable.chests,h)
          end
        end
      end

      local function setup(room)
        local subaddcon
        subaddcon = room.DescendantAdded:Connect(function(v)
          check(v)
        end)

        for i,v in pairs(room:GetDescendants()) do
          check(v)
        end

        task.spawn(function()
          repeat task.wait() until not flags.espchest
          subaddcon:Disconnect()
        end)
      end

      local addconnect
      addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
        setup(room)
      end)

      for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
        if room:FindFirstChild("Assets") and bool2 then
          setup(room)
        end
      end

      repeat task.wait() until not flags.espchest
      addconnect:Disconnect()

      for i,v in pairs(esptable.chests) do
        v.delete()
      end
    end
  end})

window_esp:AddToggle({
  Name ="显示玩家",
  Default = false,
  Callback = function(val)
    flags.esphumans = val

    if val and bool2 then
      local function personesp(v)
        v.CharacterAdded:Connect(function(vc)
          local vh = vc:WaitForChild("Humanoid")
          local torso = vc:WaitForChild("UpperTorso")
          task.wait(0.1)

          local h = esp(vc,Color3.fromRGB(255,255,255),torso,v.DisplayName)
          table.insert(esptable.people,h)
        end)

        if v.Character and bool2 then
          local vc = v.Character
          local vh = vc:WaitForChild("Humanoid")
          local torso = vc:WaitForChild("UpperTorso")
          task.wait(0.1)

          local h = esp(vc,Color3.fromRGB(255,255,255),torso,v.DisplayName)
          table.insert(esptable.people,h)
        end
      end

      local addconnect
      addconnect = game.Players.PlayerAdded:Connect(function(v)
        if v ~= plr and bool2 then
          personesp(v)
        end
      end)

      for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= plr and bool2 then
          personesp(v)
        end
      end

      repeat task.wait() until not flags.esphumans
      addconnect:Disconnect()

      for i,v in pairs(esptable.people) do
        v.delete()
      end
    end
  end})

window_esp:AddToggle({
  Name = "显示金币",
  Default = false,
  Callback = function(val)
    flags.espgold = val

    if val and bool2 then
      local function check(v)
        if v:IsA("Model") and bool2 then
          task.wait(0.1)
          local goldvalue = v:GetAttribute("GoldValue")

          if goldvalue and goldvalue >= flags.goldespvalue and bool2 then
            local hitbox = v:WaitForChild("Hitbox")
            local h = esp(hitbox:GetChildren(),Color3.fromRGB(255,255,0),hitbox,"金币 [".. tostring(goldvalue).."]")
            table.insert(esptable.gold,h)
          end
        end
      end

      local function setup(room)
        local assets = room:WaitForChild("Assets")

        local subaddcon
        subaddcon = assets.DescendantAdded:Connect(function(v)
          check(v)
        end)

        for i,v in pairs(assets:GetDescendants()) do
          check(v)
        end

        task.spawn(function()
          repeat task.wait() until not flags.espchest
          subaddcon:Disconnect()
        end)
      end

      local addconnect
      addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
        setup(room)
      end)

      for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
        if room:FindFirstChild("Assets") and bool2 then
          setup(room)
        end
      end

      repeat task.wait() until not flags.espgold
      addconnect:Disconnect()

      for i,v in pairs(esptable.gold) do
        v.delete()
      end
    end
  end})


local screechremote = entityinfo:FindFirstChild("Screech")

if screechremote and bool2 then
    Doors:AddToggle({
  Name ="删掉尖叫怪",
  Default = false,
  Callback = function(val)
        flags.noscreech = val
        
        if val and bool2 then
            screechremote.Parent = nil
            repeat task.wait() until not flags.noscreech
            screechremote.Parent = entityinfo
        end
    end})
end


Doors:AddToggle({
  Name ="怪物通知",
  Default = false,
  Callback = function(val)
    flags.hintrush = val
    
    if val and bool2 then
        local addconnect
        addconnect = workspace.ChildAdded:Connect(function(v)
            if table.find(entitynames,v.Name) and bool2 then
                repeat task.wait() until plr:DistanceFromCharacter(v:GetPivot().Position) < 1000 or not v:IsDescendantOf(workspace)
                
                if v:IsDescendantOf(workspace) and bool2 then
                    message(v.Name:gsub("Moving",""):lower().."和脚本提示你-怪物来了-请躲在床下或者是柜子里面-或者是开启脚本起飞")
                end
            end
        end) 
        
        repeat task.wait() until not flags.hintrush
        addconnect:Disconnect()
    end
end})
Doors:AddToggle({
Name = "全部发光",
	Value = false,
	Callback = function(val, oldval)
		flags.fullbright = val

		if val and bool2 then
			local oldAmbient = game:GetService("Lighting").Ambient
			local oldColorShift_Bottom = game:GetService("Lighting").ColorShift_Bottom
			local oldColorShift_Top = game:GetService("Lighting").ColorShift_Top

			local function doFullbright()
				if flags.fullbright == true and bool2 then
					game:GetService("Lighting").Ambient = Color3.new(1, 1, 1)
					game:GetService("Lighting").ColorShift_Bottom = Color3.new(1, 1, 1)
					game:GetService("Lighting").ColorShift_Top = Color3.new(1, 1, 1)
				else
					game:GetService("Lighting").Ambient = oldAmbient
					game:GetService("Lighting").ColorShift_Bottom = oldColorShift_Bottom
					game:GetService("Lighting").ColorShift_Top = oldColorShift_Top
				end
			end
			doFullbright()

			local coneee = game:GetService("Lighting").LightingChanged:Connect(doFullbright)
			repeat task.wait() until weishanteam == false or not flags.fullbright

			coneee:Disconnect()
			game:GetService("Lighting").Ambient = oldAmbient
			game:GetService("Lighting").ColorShift_Bottom = oldColorShift_Bottom
			game:GetService("Lighting").ColorShift_Top = oldColorShift_Top
		end
	end
})




									
				
				



game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.SeekES and bool2 then
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").ChandelierObstruction:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").ChandelierObstruction:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").ChandelierObstruction:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
        end
    end)
end)

Doors:AddToggle({
    Name = "删除掉追逐战的火焰灯手柄",
	Value = false,
    Callback = function(SeekESs)
_G.SeekES = SeekESs
    end
})

local hkcn = Window:MakeTab({
  Name = "DOORS刷物品(5)",
  Icon = "rbxassetid://13489814643",
  PremiumOnly = false
})

hkcn:AddParagraph("很抱歉-就只有(5)个刷物品","这 边 也 是 加 了 (4) 个 刷 物 品\n请 你 耐 心 等 待 - 以 后 会 添 加 更 多")

hkcn:AddButton({
  Name = "可爱的一只猫",
  Callback = function()
    local shadow=game:GetObjects("rbxassetid://8069174048")[1]
shadow.Parent = game.Players.LocalPlayer.Backpack
local Players = game:GetService("Players")
local Plr = Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")
local RightArm = Char:WaitForChild("RightUpperArm")
local LeftArm = Char:WaitForChild("LeftUpperArm")
local RightC1 = RightArm.RightShoulder.C1
local LeftC1 = LeftArm.LeftShoulder.C1
        local function setupCrucifix(tool)
        RightArm.Name = "R_Arm"
        LeftArm.Name = "L_Arm"
        
        RightArm.RightShoulder.C1 = RightC1 * CFrame.Angles(math.rad(-90), math.rad(-15), 0)
        LeftArm.LeftShoulder.C1 = LeftC1 * CFrame.new(-0.2, -0.3, -0.5) * CFrame.Angles(math.rad(-125), math.rad(25), math.rad(25))
        for v in next, Hum:GetPlayingAnimationTracks() do
            v:Stop()
        end
        end
shadow.Equipped:Connect(function()
setupCrucifix(shadow)
game.Players.LocalPlayer:SetAttribute("Hidden", true)
end)
 
shadow.Unequipped:Connect(function()
    game.Players.LocalPlayer:SetAttribute("Hidden", false)
        RightArm.Name = "RightUpperArm"
        LeftArm.Name = "LeftUpperArm"
        
        RightArm.RightShoulder.C1 = RightC1
        LeftArm.LeftShoulder.C1 = LeftC1
end)

  end
})

hkcn:AddButton({
	Name = "神圣炸弹",
	    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/HolyGrenadeByNerd.lua"))()
  end
})

hkcn:AddButton({
  Name = "剪刀",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua"))()
  end
})

hkcn:AddButton({
  Name = "骷髅头钥匙",
  Callback = function ()
    local item = game:GetObjects("rbxassetid://11697889137")[1]item.Parent = game.Players.LocalPlayer.Backpack
  end
})

hkcn:AddButton({
	Name = "尖叫物品模型",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/W1AzELhb"))()
end
})      

local item = Window:MakeTab({
  Name = "DOORS十字架(4)",
  Icon = "rbxassetid://13317208843",
  PremiumOnly = false
})
item:AddParagraph("很抱歉-就只有(4)个十字架","这 边 也 是 加 了 (4) 个 十 字 架\n请 你 耐 心 等 待 - 以 后 会 添 加 更 多")


item:AddButton({
	Name = "图书管理员十字架",
	Callback = function()
		local function IsVisible(part)
    local vec, found=workspace.CurrentCamera:WorldToViewportPoint(part.Position)
    local onscreen = found and vec.Z > 0
    local cfg = RaycastParams.new()
    cfg.FilterType = Enum.RaycastFilterType.Blacklist
    cfg.FilterDescendantsInstances = {part}

    local cast = workspace:Raycast(part.Position, (game.Players.LocalPlayer.Character.UpperTorso.Position - part.Position), cfg)
    if onscreen and bool2 then
        if cast and (cast and cast.Instance).Parent==game.Players.LocalPlayer.Character and bool2 then
            return true
        end
    end
end

local Equipped = false

-- Edit this --
getgenv().spawnKey = Enum.KeyCode.F4
---------------

-- Services

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

-- Variables

local Plr = Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")
local Root = Char:WaitForChild("HumanoidRootPart")
local RightArm = Char:WaitForChild("RightUpperArm")
local LeftArm = Char:WaitForChild("LeftUpperArm")

local RightC1 = RightArm.RightShoulder.C1
local LeftC1 = LeftArm.LeftShoulder.C1

local SelfModules = {
    Functions = loadstring(
        game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua")
    )(),
    CustomShop = loadstring(
        game:HttpGet(
            "https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua"
        )
    )(),
}

local ModuleScripts = {
    MainGame = require(Plr.PlayerGui.MainUI.Initiator.Main_Game),
    SeekIntro = require(Plr.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Cutscenes.SeekIntro),
}

-- Functions

local function setupCrucifix(tool)
    tool.Equipped:Connect(function()
        Equipped = true
        Char:SetAttribute("Hiding", true)
        for _, v in next, Hum:GetPlayingAnimationTracks() do
            v:Stop()
        end

        RightArm.Name = "R_Arm"
        LeftArm.Name = "L_Arm"

        RightArm.RightShoulder.C1 = RightC1 * CFrame.Angles(math.rad(-90), math.rad(-15), 0)
        LeftArm.LeftShoulder.C1 = LeftC1
            * CFrame.new(-0.2, -0.3, -0.5)
            * CFrame.Angles(math.rad(-125), math.rad(25), math.rad(25))
    end)

    tool.Unequipped:Connect(function()
        Equipped = false
        Char:SetAttribute("Hiding", nil)
        RightArm.Name = "RightUpperArm"
        LeftArm.Name = "LeftUpperArm"

        RightArm.RightShoulder.C1 = RightC1
        LeftArm.LeftShoulder.C1 = LeftC1
    end)
end

-- Scripts

local CrucifixTool = game:GetObjects("rbxassetid://11840788525")[1]
CrucifixTool.Name = "Crucifix"
CrucifixTool.Parent = game.Players.LocalPlayer.Backpack

-- game.UserInputService.InputBegan:Connect(function(input, proc)
--     if proc and bool2 then return end

--     if input.KeyCode == input.KeyCode[getgenv().spawnKey] and bool2 then
--         local CrucifixTool = game:GetObjects("rbxassetid://11746137630")[1]
--         CrucifixTool.Name = "Crucifix"
--         CrucifixTool.Parent = game.Players.LocalPlayer.Backpack
--     end
-- end)
-- Input handler

setupCrucifix(CrucifixTool)

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

-- Variables

local Plr = Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")
local Root = Char:WaitForChild("HumanoidRootPart")

local dupeCrucifix = Instance.new("BindableEvent")
local function func(ins)
    wait(.01) -- Wait for the attribute
    if ins:GetAttribute("IsCustomEntity")==true and ins:GetAttribute("ClonedByCrucifix")~=true and bool2 then
        local Chains = game:GetObjects("rbxassetid://11793072657")[1]
        Chains.Parent = workspace
        local chained = true
        local posTime = false
        local rotTime = false
        local tweenTime = false
        local intFound = true

        game:GetService("RunService").RenderStepped:Connect(function()
            if Equipped and bool2 then
                if ins.Parent~=nil and ins.PrimaryPart and IsVisible(ins.PrimaryPart) and (Root.Position-ins.PrimaryPart.Position).magnitude <= 25 and bool2 then
                    local c=ins:Clone()
                    c:SetAttribute("ClonedByCrucifix", true)
                    c.RushNew.Anchored=true
                    c.Parent=ins.Parent
                    ins:Destroy()
                    dupeCrucifix:Fire(6,c.RushNew)


                    
                    -- Chains.PrimaryPart.Orientation = Chains.PrimaryPart.Orientation + Vector3.new(0, 3, 0)

                    local EntityRoot = c:FindFirstChild("RushNew")

                    if EntityRoot and bool2 then



                        local Fake_FaceAttach = Instance.new("Attachment")
                        Fake_FaceAttach.Parent = EntityRoot
                        

                        for i, beam in pairs(Chains:GetDescendants()) do
                            if beam:IsA("BasePart") and bool2 then
                                beam.CanCollide = false
                            end
                            if beam.Name == "Beam" and bool2 then
                                beam.Attachment1 = Fake_FaceAttach
                            end
                        end
                        
                        if not posTime and bool2 then
                            Chains:SetPrimaryPartCFrame(
                                EntityRoot.CFrame * CFrame.new(0, -3.5, 0) * CFrame.Angles(math.rad(90), 0, 0)
                            )
                            posTime = true
                        end

                        task.wait(1.35)
                        if not tweenTime and bool2 then

                            task.spawn(function()
                                while task.wait() do
                                    if Chains:FindFirstChild('Base') and bool2 then
                                        Chains.Base.CFrame = Chains.Base.CFrame * CFrame.Angles(0,0 , math.rad(0.5))
                                    end
                                end
                            end)

                            task.spawn(function()
                                while task.wait() do
                                    for i, beam in pairs(Chains:GetDescendants()) do
                                        if beam.Name == "Beam" and bool2 then
                                            beam.TextureLength = beam.TextureLength+0.035
                                        end
                                    end
                                end
                            end)


                            game.TweenService
                                :Create(
                                    EntityRoot,
                                    TweenInfo.new(6),
                                    { CFrame = EntityRoot.CFrame * CFrame.new(0, 50, 0) }
                                )
                                :Play()
                            

                            tweenTime = true
                            task.wait(1.5)
                            intFound = false
                            game:GetService("Debris"):AddItem(c, 0)
                            game:GetService("Debris"):AddItem(Chains, 0)
                        end
                    end
                end
            end
        end)
    elseif ins.Name=="Lookman" and bool2 then
        local c=ins
        task.spawn(function()
            repeat task.wait() until IsVisible(c.Core) and Equipped and c.Core.Attachment.Eyes.Enabled==true
            local pos=c.Core.Position
            dupeCrucifix:Fire(18.364, c.Core)
            task.spawn(function()
                c:SetAttribute("Killing", true)
                ModuleScripts.MainGame.camShaker:ShakeOnce(10, 10, 5, 0.15)
                wait(5)
                c.Core.Initiate:Stop()
                for i=1,3 do
                    c.Core.Repent:Play()  
                    c.Core.Attachment.Angry.Enabled=true
                    ModuleScripts.MainGame.camShaker:ShakeOnce(8, 8, 1.3, 0.15)
                    delay(c.Core.Repent.TimeLength, function() c.Core.Attachment.Angry.Enabled=false end)
                    wait(4)
                end
                c.Core.Scream:Play();
                ModuleScripts.MainGame.camShaker:ShakeOnce(8, 8, c.Core.Scream.TimeLength, 0.15);
                (c.Core:FindFirstChild"whisper" or c.Core:FindFirstChild"Ambience"):Stop()
                for _, l in pairs(c:GetDescendants()) do
                    if l:IsA("PointLight") and bool2 then
                        l.Enabled=false
                    end
                end
                game:GetService("TweenService"):Create(c.Core, TweenInfo.new(c.Core.Scream.TimeLength, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    CFrame=CFrame.new(c.Core.CFrame.X, c.Core.CFrame.Y-12, c.Core.CFrame.Z)
                }):Play()
            end)
            local col=game.Players.LocalPlayer.Character.Collision

            local function CFrameToOrientation(cf)
                local x, y, z = cf:ToOrientation()
                return Vector3.new(math.deg(x), math.deg(y), math.deg(z))
            end
            
            while c.Parent~=nil and c.Core.Attachment.Eyes.Enabled==true do
                -- who's the boss now huh?
                col.Orientation = CFrameToOrientation(CFrame.lookAt(col.Position, pos)*CFrame.Angles(0, math.pi, 0))
                task.wait()
            end
        end)
    elseif ins.Name=="Shade" and ins.Parent==workspace.CurrentCamera and ins:GetAttribute("ClonedByCrucifix")==nil and bool2 then
        task.spawn(function()
            repeat task.wait() until IsVisible(ins) and (Root.Position-ins.Position).Magnitude <= 12.5 and Equipped

            local clone = ins:Clone()

            clone.CFrame = ins.CFrame
            clone.Parent = ins.Parent
            clone.Anchored = true

            ins:Remove()

            dupeCrucifix:Fire(13, ins)
            ModuleScripts.MainGame.camShaker:ShakeOnce(40, 10, 5, 0.15)



            for _, thing in pairs(clone:GetDescendants()) do
                if thing:IsA("SpotLight") and bool2 then
                    game:GetService("TweenService"):Create(thing, TweenInfo.new(5), {
                        Brightness=thing.Brightness*5
                    }):Play()
                elseif thing:IsA("Sound") and thing.Name~="Burst" and bool2 then
                    game:GetService("TweenService"):Create(thing, TweenInfo.new(5), {
                        Volume=0
                    }):Play()
                elseif thing:IsA("TouchTransmitter") and bool2 then thing:Destroy() end
            end

            for _, pc in pairs(clone:GetDescendants()) do
                if pc:IsA("ParticleEmitter") and bool2 then
                        pc.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.48, Color3.fromRGB(182, 0, 3)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))}
                end
            end

            local Original_color = {}

            local light
            light = game.Lighting["Ambience_Shade"]
            game:GetService("TweenService"):Create(light, TweenInfo.new(1), {


            }):Play()

            wait(5)

            clone.Burst.PlaybackSpeed=0.5
            clone.Burst:Stop()
            clone.Burst:Play()
            light.TintColor = Color3.fromRGB(215,253,255)
            game:GetService("TweenService"):Create(clone, TweenInfo.new(6), {
                CFrame=CFrame.new(clone.CFrame.X, clone.CFrame.Y-12, clone.CFrame.Z)
            }):Play()
            wait(8.2)

            game:GetService("Debris"):AddItem(clone, 0)
            game.ReplicatedStorage.Bricks.ShadeResult:FireServer()
        end)
    end
end

workspace.ChildAdded:Connect(func)
workspace.CurrentCamera.ChildAdded:Connect(func)
for _, thing in pairs(workspace:GetChildren()) do
    func(thing)
end
dupeCrucifix.Event:Connect(function(time, entityRoot)
    local Cross = game:GetObjects("rbxassetid://11746137630")[1]
    Cross.Parent = workspace

    local fakeCross = Cross.Handle

    -- fakeCross:FindFirstChild("EffectLight").Enabled = true

    ModuleScripts.MainGame.camShaker:ShakeOnce(35, 25, 0.15, 0.15)
    -- you tell me i didnt make?
    fakeCross.CFrame = CFrame.lookAt(CrucifixTool.Handle.Position, entityRoot.Position)
    
    -- hl.Parent = model
    -- hl.FillTransparency = 1
    -- hl.OutlineColor = Color3.fromRGB(75, 177, 255)
    fakeCross.Anchored = true

    CrucifixTool:Destroy()

    -- for i, v in pairs(fakeCross:GetChildren()) do
    --     if v.Name == "E" and v:IsA("BasePart") and bool2 then
    --         v.Transparency = 0
    --         v.CanCollide = false
    --     end
    --     if v:IsA("Motor6D") and bool2 then
    --         v.Name = "Motor6D"
    --     end
    -- end

    task.wait(time)
    fakeCross.Anchored = false
    fakeCross.CanCollide = true
    task.wait(0.5)
    Cross:Remove()
end)

-- credits
firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "fire made by penguin")
	end
})

item:AddButton({
	Name = "圣诞节十字架",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/PiotrekMineRoblox/Christmas-Crucifix/main/Christmas%20crucifix.lua"))()
end
})      

item:AddButton({
	Name = "万圣节十字架",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Mye123/MyeWareHub/main/Halloween%20Crucifix"))()
end
})      

item:AddButton({
	Name = "紫色十字架",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/PiotrekMineRoblox/Bumble-crucifix/main/Bumble-crucifix"))()
end
})      

local yvhv = Window:MakeTab({
	Name = "DOORS变身怪物(4)",
	Icon = "rbxassetid://15377313859",
	PremiumOnly = false
})

yvhv:AddParagraph("很抱歉-就只有(4)个 变 身","这 边 也 是 加 了 (4) 个 变 身\n请 你 耐 心 等 待 - 以 后 会 添 加 更 多")

yvhv:AddButton({
	Name = "变身-尖叫怪",
	Callback = function()
	for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
    if v:IsA("BasePart") and bool2 then
        v.Transparency = 1
       end
      end
     local MorphedEntity = game:GetService("ReplicatedStorage").Entities.Screech:Clone()
            MorphedEntity.Parent = game.Workspace
            MorphedEntity.Name = "MorphedEntity"
            game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator["Main_Game"].RemoteListener.Modules.Screech.Caught.Looped = true
            game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator["Main_Game"].RemoteListener.Modules.Screech.Caught:Play()
            MorphedEntity.AnimationController:LoadAnimation(MorphedEntity.Animations.Idle):Play()
            task.spawn(function()
                game:GetService("RunService").RenderStepped:Connect(function()
                    MorphedEntity:PivotTo(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0.2, -1.25))
                end)
            end)
end
})
yvhv:AddButton({
	Name = "变身-错误传送",
	Callback = function()
	for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
    if v:IsA("BasePart") and bool2 then
        v.Transparency = 1
      end
     end
  local MorphedEntity = game:GetObjects("rbxassetid://12381941734")[1]
            local Anim = game:GetService("ReplicatedStorage").Entities.Glitch.Animations:Clone()
            Anim.Parent = MorphedEntity
            MorphedEntity.Parent = game.Workspace
            MorphedEntity.Name = "MorphedEntity"
            MorphedEntity.AnimationController:LoadAnimation(MorphedEntity.Animations.Run):Play(0.1000001, 1, 0.5)
            game:GetService("ReplicatedStorage").ClientModules.EntityModules.Glitch.Sound.Looped = true
            game:GetService("ReplicatedStorage").ClientModules.EntityModules.Glitch.Sound.PlaybackSpeed = 0.025
            game:GetService("ReplicatedStorage").ClientModules.EntityModules.Glitch.Sound.Volume = 1.5
            game:GetService("ReplicatedStorage").ClientModules.EntityModules.Glitch.Sound:Play()
            task.spawn(function()
                game:GetService("RunService").RenderStepped:Connect(function()
                    MorphedEntity:PivotTo(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2.75, -1.25))
                end)
            end)
end
})

yvhv:AddButton({
	Name = "A-60",
	Callback = function()
	for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
    if v:IsA("BasePart") and bool2 then
        v.Transparency = 1
       end
      end
    local a60 = game:GetObjects("rbxassetid://12395185257")[1]
            a60.Name = "MorphedEntity"
            a60.Parent = game.Workspace
            a60.Torso.Anchored = true
            game:GetService("RunService").RenderStepped:Connect(function()
                a60:PivotTo(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(-3, 5, -27.5))
            end)
end
})
yvhv:AddButton({
	Name = "Sally",
	Callback = function()
	for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
    if v:IsA("BasePart") and bool2 then
        v.Transparency = 1
       end
      end
   local Sally = game:GetObjects("rbxassetid://12395203064")[1]
            Sally.Name = "MorphedEntity"
            Sally.Parent = game.Workspace
            Sally.Torso.Anchored = true
            game:GetService("RunService").RenderStepped:Connect(function()
                Sally:PivotTo(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0))
            end)
end
})

local Tab = Window:MakeTab({
	Name = "DOORS召唤实体(17)",
	Icon = "rbxassetid://13327599829",
	PremiumOnly = false
})

Tab:AddParagraph("很抱歉-就只有(17)个召唤怪","这 边 也 是 加 了 (17) 个 召 唤 怪\n请 你 耐 心 等 待 - 以 后 会 添 加 更 多")

Tab:AddButton({
	Name = "召唤故障-怪",
	Callback = function()
		require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game),
		workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
	end
})
 
 
Tab:AddButton({
	Name = "召唤尖叫-怪",
	Callback = function()
		require(game.StarterGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game),
		workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
	end
})
 
 
Tab:AddButton({
	Name = "召唤停止-怪",
	Callback = function()
		require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game),
		workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
	end
})
Tab:AddButton({
	Name = "每 30 秒召唤停止-怪",
	Callback = function()
		while wait() do
		require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game),
			workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
		end
		wait(30)
	end
})
Tab:AddButton({
	Name = "召唤停止天堂-怪",
	Callback = function()
		while wait() do
			require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game),
			workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
		end
	end
})
 
 
 
Tab:AddButton({
	Name = "召唤寻眼-怪",
	Callback = function()
		local a = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game
		require(game.ReplicatedStorage.ClientModules.EntityModules.Seek).tease(nil, workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")], 100)
	end
})
 
Tab:AddButton({
	Name = "召唤伏击-怪",
	Callback = function()
		loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().createEntity("Ambush")
 
		local tb=entityTable["Ambush"]
		tb.Speed=120
		tb.Sounds={"PlaySound", "Footsteps"}
		tb.Model="https://github.com/sponguss/storage/raw/main/newambush.rbxm"
		tb.Ambush.Enabled=true
		tb.WaitTime=2.5
 
		loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().runEntity("Ambush")
	end
})
 
Tab:AddButton({
	Name = "召唤壁橱杰克-怪",
	Callback = function()
		local config={
			Image="http://www.roblox.com/asset/?id=11388995838", -- Could also be "image.png"
			Sound="rbxassetid://11350126934", -- Could also be "file.mp3"
			EntityName="Jack" -- Make sure to change if you mod the image/sound to prevent overlapping
		}
		local ReSt = game:GetService("ReplicatedStorage")
 
		local ModuleScripts = {
			ModuleEvents = require(ReSt.ClientModules.Module_Events),
		}
 
		local function connectClosetJack(wardrobes, room, bool)
			for _, wardrobe in pairs(wardrobes) do
				if not game:GetService("ReplicatedStorage"):FindFirstChild("closetAnim") and bool2 then 
					local anim = Instance.new("Animation")
					anim.AnimationId = "rbxassetid://9460435404"
					anim.Name="closetAnim"
					anim.Parent=game:GetService("ReplicatedStorage")
				end
				if not game:GetService("ReplicatedStorage"):FindFirstChild("JackModel") and bool2 then
					if not isfile(config.EntityName..".txt") and bool2 then writefile(config.EntityName..".txt", game:HttpGet("https://github.com/sponguss/storage/raw/real/newclosetjack.rbxm?raw=true")) end
					local a=game:GetObjects((getcustomasset or getsynasset)(config.EntityName..".txt"))[1]
					a.Name="JackModel"
					a.Parent=game:GetService("ReplicatedStorage")
				end
				game:GetService("ReplicatedStorage").JackModel.Sound.SoundId=(isfile(config.Sound) and (getcustomasset or getsynasset)(config.Sound) or config.Sound)
				game:GetService("ReplicatedStorage").JackModel.Gui.ImageLabel.Image=(isfile(config.Image) and (getcustomasset or getsynasset)(config.Image) or config.Image)
				local prompt = wardrobe:WaitForChild("HidePrompt", 1)
				if not prompt and wardrobe:FindFirstChild("fakePrompt") and bool2 then return end
 
				if prompt and bool2 then
					-- Fake prompt
 
					local fakePrompt = prompt:Clone()
 
					if bool and bool2 then prompt:Destroy() else prompt.Enabled=false end
					fakePrompt.Parent = wardrobe
					fakePrompt.Name="fakePrompt"
 
					local connection; connection = fakePrompt.Triggered:Connect(function()
						if not bool and bool2 then connection:Disconnect() end
						local model=game:GetService("ReplicatedStorage").JackModel:Clone()
 
						if model and not wardrobe:FindFirstChild(model.Name) and bool2 then
							model:SetPrimaryPartCFrame(wardrobe.Main.CFrame)
							model.Parent = workspace
 
							-- Animation setup
							local anim = wardrobe.AnimationController:LoadAnimation(game:GetService("ReplicatedStorage").closetAnim)
 
							-- Scare
 
							ModuleScripts.ModuleEvents.flickerLights(room, 1)
							anim:Play()
							model.Sound:Play()
 
							-- Destroy
 
							task.wait(1)
 
							model:Destroy()
							if not bool and bool2 then prompt.Enabled = true end
							if not bool and bool2 then fakePrompt:Destroy() end
 
							if not bool and bool2 then connection:Disconnect() end
						end
					end)
				end
			end
		end
 
		local wardrobes = {}
		for _, wardrobe in pairs(workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")].Assets:GetChildren()) do
			if wardrobe.Name=="Wardrobe" and bool2 then
				table.insert(wardrobes, wardrobe)
			end
		end
 
		if wardrobes[1] and bool2 then
			connectClosetJack(wardrobes, workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")], true) -- 'true' for jack to appear every time
		end
	end
})
 
 
Tab:AddButton({
	Name = "召唤杰克灯闪烁",
	Callback = function()
		local room = workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")]
		local events = require(game.ReplicatedStorage.ClientModules.Module_Events)
		events.flickerLights(room, 1)
	end
})
Tab:AddButton({
	Name = "灯光每 30 秒闪烁一次",
	Callback = function()
		while wait(30) do
		local room = workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")]
		local events = require(game.ReplicatedStorage.ClientModules.Module_Events)
			events.flickerLights(room, 1)
		end
		wait(30)
	end
})
 
Tab:AddButton({
	Name = "破灯",
	Callback = function()
		local room = workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")]
		local events = require(game.ReplicatedStorage.ClientModules.Module_Events)
		events.breakLights(room, 1)
	end
})
 
 
Tab:AddButton({
	Name = "心明游戏",
	Callback = function()
		firesignal(game.ReplicatedStorage.Bricks.ClutchHeartbeat.OnClientEvent)
	end
})
 
Tab:AddButton({
	Name = "心脏病发作",
	Callback = function()
		for i = 1,30,1 do
			wait(1)
			firesignal(game.ReplicatedStorage.Bricks.ClutchHeartbeat.OnClientEvent)
		end
	end
})
Tab:AddButton({
	Name = "产卵冲刺",
	Callback = function()
		local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()
 
		-- Create entity
		local entity = Creator.createEntity({
			CustomName = "A-60", -- Custom name of your entity
			Model = "https://github.com/RegularVynixu/Utilities/blob/main/Doors%20Entity%20Spawner/Models/Rush.rbxm?raw=true", -- Can be GitHub file or rbxassetid
			Speed = 100, -- Percentage, 100 = default Rush speed
			DelayTime = 2, -- Time before starting cycles (seconds)
			HeightOffset = 0,
			CanKill = true,
			KillRange = 50,
			BreakLights = true,
			BackwardsMovement = false,
			FlickerLights = {
				true, -- Enabled/Disabled
				1, -- Time (seconds)
			},
			Cycles = {
				Min = 1,
				Max = 4,
				WaitTime = 2,
			},
			CamShake = {
				true, -- Enabled/Disabled
				{3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
				100, -- Shake start distance (from Entity to you)
			},
			Jumpscare = {
				true, -- Enabled/Disabled
				{
					Image1 = "rbxassetid://10483855823", -- Image1 url
					Image2 = "rbxassetid://10483999903", -- Image2 url
					Shake = true,
					Sound1 = {
						10483790459, -- SoundId
						{ Volume = 0.5 }, -- Sound properties
					},
					Sound2 = {
						10483837590, -- SoundId
						{ Volume = 0.5 }, -- Sound properties
					},
					Flashing = {
						true, -- Enabled/Disabled
						Color3.fromRGB(255, 255, 255), -- Color
					},
					Tease = {
						true, -- Enabled/Disabled
						Min = 1,
						Max = 3,
					},
				},
			},
			CustomDialog = {"Seems you are having trouble with A-60", "The lights will always flicker when it is near.", "Whenever this happens, find a hiding spot.", "..."}, -- Custom death message
		})
 
		-----[[ Advanced ]]-----
		entity.Debug.OnEntitySpawned = function(entityTable)
			print("Entity has spawned:", entityTable.Model)
		end
 
		entity.Debug.OnEntityDespawned = function(entityTable)
			print("Entity has despawned:", entityTable.Model)
		end
 
		entity.Debug.OnEntityStartMoving = function(entityTable)
			print("Entity has started moving:", entityTable.Model)
		end
 
		entity.Debug.OnEntityFinishedRebound = function(entityTable)
			print("Entity has finished rebound:", entityTable.Model)
		end
 
		entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
			print("Entity:", entityTable.Model, "has entered room:", room)
		end
 
		entity.Debug.OnLookAtEntity = function(entityTable)
			print("Player has looked at entity:", entityTable.Model)
		end
 
		entity.Debug.OnDeath = function(entityTable)
			warn("Player has died.")
		end
		------------------------
 
		-- Run the created entity
		Creator.runEntity(entity)
 
	end
})
Tab:AddButton({
	Name = "每 30 秒生成 A-60",
	Callback = function()
		while wait(30) do
		local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()
 
		-- Create entity
		local entity = Creator.createEntity({
			CustomName = "A-60", -- Custom name of your entity
			Model = "https://github.com/RegularVynixu/Utilities/blob/main/Doors%20Entity%20Spawner/Models/Rush.rbxm?raw=true", -- Can be GitHub file or rbxassetid
			Speed = 100, -- Percentage, 100 = default Rush speed
			DelayTime = 2, -- Time before starting cycles (seconds)
			HeightOffset = 0,
			CanKill = true,
			KillRange = 50,
			BreakLights = true,
			BackwardsMovement = false,
			FlickerLights = {
				true, -- Enabled/Disabled
				1, -- Time (seconds)
			},
			Cycles = {
				Min = 1,
				Max = 4,
				WaitTime = 2,
			},
			CamShake = {
				true, -- Enabled/Disabled
				{3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
				100, -- Shake start distance (from Entity to you)
			},
			Jumpscare = {
				true, -- Enabled/Disabled
				{
					Image1 = "rbxassetid://10483855823", -- Image1 url
					Image2 = "rbxassetid://10483999903", -- Image2 url
					Shake = true,
					Sound1 = {
						10483790459, -- SoundId
						{ Volume = 0.5 }, -- Sound properties
					},
					Sound2 = {
						10483837590, -- SoundId
						{ Volume = 0.5 }, -- Sound properties
					},
					Flashing = {
						true, -- Enabled/Disabled
						Color3.fromRGB(255, 255, 255), -- Color
					},
					Tease = {
						true, -- Enabled/Disabled
						Min = 1,
						Max = 3,
					},
				},
			},
			CustomDialog = {"Seems you are having trouble with Rush...", "The lights will always flicker when it is near.", "Whenever this happens, find a hiding spot.", "..."}, -- Custom death message
		})
 
		-----[[ Advanced ]]-----
		entity.Debug.OnEntitySpawned = function(entityTable)
			print("Entity has spawned:", entityTable.Model)
		end
 
		entity.Debug.OnEntityDespawned = function(entityTable)
			print("Entity has despawned:", entityTable.Model)
		end
 
		entity.Debug.OnEntityStartMoving = function(entityTable)
			print("Entity has started moving:", entityTable.Model)
		end
 
		entity.Debug.OnEntityFinishedRebound = function(entityTable)
			print("Entity has finished rebound:", entityTable.Model)
		end
 
		entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
			print("Entity:", entityTable.Model, "has entered room:", room)
		end
 
		entity.Debug.OnLookAtEntity = function(entityTable)
			print("Player has looked at entity:", entityTable.Model)
		end
 
		entity.Debug.OnDeath = function(entityTable)
			warn("Player has died.")
		end
		------------------------
 
		-- Run the created entity
		Creator.runEntity(entity)
 
		end
		wait(30)
		end
})
Tab:AddButton({
	Name = "尖叫乐园",
	Callback = function()
		for i = 1,30,1 do
			wait(1)
			require(game.StarterGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game),
			workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
		end
	end
})
Tab:AddButton({
	Name = "打破所有的灯",
	Callback = function()
		local room = workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")]
		local events = require(game.ReplicatedStorage.ClientModules.Module_Events)
		events.breakLights(room, 100)
	end
})
Tab:AddButton({
	Name = "蜘蛛混乱",
	Callback = function()
		for i = 1,30,1 do
			wait(0.1)
			local a = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game
			require(a.RemoteListener.Modules.SpiderJumpscare)(require(a), workspace.CurrentRooms["0"].Assets.Dresser.DrawerContainer, 0.2)
		end
	end    
})

local Igkvd = Window:MakeTab({
  Name = "其他-脚本-大厅",
  Icon = "rbxassetid://13317101016",
  PremiumOnly = false
})
 
Igkvd:AddParagraph("我只添加了(1)个脚本-可能以后我会添加更多的脚本","")
 
Igkvd:AddButton({
	Name = "纳西达-脚本中心",
	Callback = function()
	    OrionLib:MakeNotification({
	        Name = "正在启动(纳西妲-脚本中心)",
            Content = "正 在 加 载 纳 西 妲 - 脚 本 中 心 (启动中耐心等待)",
            Image = "rbxassetid://13317101016",
            Time = 8
        })
      	loadstring(game:HttpGet("https://pastebin.com/raw/De4aYHDY"))()
  	end
})
 
Igkvd:AddButton({
	Name = "无名字-透视玩家脚本",
	Callback = function()
	    OrionLib:MakeNotification({
	        Name = "正在启动(无名字-透视玩家脚本)",
            Content = "正 在 加 载 无 名 字 - 透 视 玩 家 脚 (启动中耐心等待)",
            Image = "rbxassetid://13317101016",
            Time = 8
        })
      	loadstring(game:HttpGet("https://pastebin.com/raw/uw2P2fbY"))()
  	end
})
 
local About = Window:MakeTab({
  Name = "关于我们",
  Icon = "rbxassetid://13317101016",
  PremiumOnly = false
})
 
 About:AddButton({
	Name = "飞行-汉化版",
	Callback = function()
	    OrionLib:MakeNotification({
	        Name = "正在启动(飞行-汉化版)",
            Content = "正 在 加 载 飞 行 - 汉 化 版 (启动中耐心等待)",
            Image = "rbxassetid://13317101016",
            Time = 8
        })
      	loadstring(game:HttpGet("https://pastebin.com/raw/eUK3tbiM"))()
  	end
})
 
About:AddTextbox({
  Name = "移动速度",
  Default = "",
  TextDisappear = true,
  Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
  end
})
 
About:AddTextbox({
  Name = "跳跃高度",
  Default = "",
  TextDisappear = true,
  Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
  end
})
 
About:AddTextbox({
  Name = "重力",
  Default = "",
  TextDisappear = true,
  Callback = function(Value)
    game.Workspace.Gravity = Value
  end
})

About:AddParagraph("作者的留言","欢 迎 你 使 用 河 流 roblox 你 对 他 的 支 持 就 是 我 们 的 动 力")
 
About:AddParagraph("河流QQ官方群","587185906")
 
About:AddButton({
  Name = "河流QQ官方群(点击复制)",
  Callback = function()
      OrionLib:MakeNotification({
	        Name = "通知复制成功",
            Content = "可以在QQ里面的搜索搜索群号",
            Image = "rbxassetid://13317101016",
            Time = 8
        })
    setclipboard("587185906")
  end
})

About:AddButton({
	Name = "河流工具箱-脚本",
	Callback = function()
	    OrionLib:MakeNotification({
	        Name = "正在启动(河流工具箱)",
            Content = "正 在 加 载 河 流 工 具 箱 (启动中耐心等待)",
            Image = "rbxassetid://13317101016",
            Time = 8
        })
      	loadstring(game:HttpGet("https://pastebin.com/raw/2frP15Mh"))()
  	end
})

About:AddToggle({
	Name = "Avoid Rush/Ambush",
	Default = false,
    Flag = "AvoidRushToggle"
})

game.RunService.Stepped:Connect(function()
    if Noclip and bool2 then
        for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
            if v:IsA("BasePart") and bool2 then
                v.CanCollide = false
            end
        end
    end
    if Aura or All and bool2 then
        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character.Humanoid.Health ~= 0 and not game.Workspace[v.Name]:FindFirstChild("ForceField") and bool2 then
                if All and bool2 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                    game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled("Seated", false)
                end
                game.ReplicatedStorage.meleeEvent:FireServer(v)
            end
        end
    end
    if LT or LK and bool2 then
        for i, v in pairs(game.Players:GetPlayers()) do
            if string.find(v.Name, User) and bool2 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled("Seated", false)
                if LK and bool2 then
                    game.ReplicatedStorage.meleeEvent:FireServer(v)
                end
            end
        end
    end
    if Respawn and game.Players.LocalPlayer.Character.Humanoid.Health == 0 and bool2 then
        if game.Players.LocalPlayer.Team.Name == "Criminals" and bool2 then
            game.Workspace.Remote.TeamEvent:FireServer("Bright orange")
        else
            game.Workspace.Remote.TeamEvent:FireServer(game.Players.LocalPlayer.TeamColor.Name)
        end
    end
    for i, v in pairs(game.Players:GetPlayers()) do
        if not v.Character:FindFirstChild("Highlight") and bool2 then
            Instance.new("Highlight", v.Character)
            BG = Instance.new("BillboardGui", v.Character)
            TL = Instance.new("TextLabel", BG)
            BG.AlwaysOnTop = true
            BG.Size = UDim2.new(0, 100, 0, 50)
            BG.StudsOffset = Vector3.new(0, 4, 0)
            TL.BackgroundTransparency = 1
            TL.Size = UDim2.new(0, 100, 0, 50)
        end
        v.Character.BillboardGui.TextLabel.Text = v.Name.."\nHealth: "..math.round(v.Character.Humanoid.Health).."\nDistance: "..math.round((v.Character.HumanoidRootPart.CFrame.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude)
        v.Character.BillboardGui.TextLabel.TextColor = v.TeamColor
        v.Character.BillboardGui.Enabled = EP
        v.Character.Highlight.Enabled = EP
    end
    if Light and bool2 then
        game.Lighting.Ambient = Color3.new(1, 1, 1)
    end
end)

game.Workspace.ChildAdded:Connect(function(inst)
        if inst.Name == "RushMoving" and bool2 then
            if OrionLib.Flags["AvoidRushToggle"].Value == true and bool2 then
                OrionLib:MakeNotification({
                    Name = "Warning!",
                    Content = "Avoiding Rush. Please wait.",
                    Time = 5
                })
                local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                local con = game:GetService("RunService").Heartbeat:Connect(function()
                    game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0))
                end)
                
                inst.Destroying:Wait()
                con:Disconnect()

                game.Players.LocalPlayer.Character:MoveTo(OldPos)
            else
                OrionLib:MakeNotification({
                    Name = "Warning!",
                    Content = "Rush has spawned, hide!",
                    Time = 5
                })
            end
        elseif inst.Name == "AmbushMoving" and bool2 then
            if OrionLib.Flags["AvoidRushToggle"].Value == true and bool2 then
                OrionLib:MakeNotification({
                    Name = "Warning!",
                    Content = "Avoiding Ambush. Please wait.",
                    Time = 5
                })
                local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                local con = game:GetService("RunService").Heartbeat:Connect(function()
                    game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0))
                end)
                
                inst.Destroying:Wait()
                con:Disconnect()
                
                game.Players.LocalPlayer.Character:MoveTo(OldPos)
            else
                OrionLib:MakeNotification({
                    Name = "Warning!",
                    Content = "Ambush has spawned, hide!",
                    Time = 5
                })
            end
        end
    end)
end)
 
OrionLib:Init()
end
local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v83=0;local v84;while true do if (v83==0) then v84=v2(v0(v30,16));if v19 then local v97=v5(v84,v19);v19=nil;return v97;else return v84;end break;end end end end);local function v20(v31,v32,v33)if v33 then local v85=(v31/((4 -2)^(v32-(620 -(499 + 56 + 64)))))%(2^(((v33-(932 -(857 + 74))) -(v32-(569 -(367 + 201)))) + (928 -(214 + 713)))) ;return v85-(v85%(1 + 0)) ;else local v86=((1642 -(1523 + 114)) -3)^(v32-(1 + 0)) ;return (((v31%(v86 + v86))>=v86) and (2 -1)) or (0 -0) ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + (2 -0) );v18=v18 + (1067 -(68 + 997)) ;return (v36 * (1526 -(226 + 1044))) + v35 ;end local function v23()local v37=0 -0 ;local v38;local v39;local v40;local v41;while true do if (v37==(118 -(32 + 85))) then return (v41 * (16441815 + 335401)) + (v40 * (14533 + 51003)) + (v39 * 256) + v38 ;end if (v37==(957 -((1637 -745) + 65))) then v38,v39,v40,v41=v1(v16,v18,v18 + ((357 -(87 + 263)) -4) );v18=v18 + (6 -2) ;v37=1;end end end local function v24()local v42=180 -(29 + 38 + 113) ;local v43;local v44;local v45;local v46;local v47;local v48;while true do if (v42==(3 + (0 -0))) then if (v47==(0 -0)) then if (v46==(0 + 0)) then return v48 * 0 ;else v47=1;v45=0 -0 ;end elseif (v47==(2999 -(802 + 150))) then return ((v46==((438 -(145 + 293)) -0)) and (v48 * ((1 -0)/(0 + 0)))) or (v48 * NaN) ;end return v8(v48,v47-(2020 -(915 + 82)) ) * (v45 + (v46/((5 -3)^(31 + 21)))) ;end if (v42==(0 -0)) then v43=v23();v44=v23();v42=(1618 -(44 + 386)) -(1069 + 118) ;end if (v42==(4 -2)) then v47=v20(v44,45 -24 ,31);v48=((v20(v44,32)==(1 + 0)) and  -(1 -(1486 -(998 + 488)))) or (1 + 0) ;v42=794 -(368 + 423) ;end if (v42==(3 -2)) then v45=19 -(10 + 8) ;v46=(v20(v44,3 -2 ,7 + 13 ) * ((444 -(416 + 26))^(102 -70))) + v43 ;v42=2;end end end local function v25(v49)local v50;if  not v49 then v49=v23();if (v49==0) then return "";end end v50=v3(v16,v18,(v18 + v49) -(1 + 0) );v18=v18 + v49 ;local v51={};for v67=773 -(201 + 571) , #v50 do v51[v67]=v2(v1(v3(v50,v67,v67)));end return v6(v51);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v52=1784 -(599 + 1185) ;local v53;local v54;local v55;local v56;local v57;local v58;local v59;local v60;while true do if (v52==(2 + 2)) then while true do if (v53==(0 + 0)) then local v95=0;while true do if (v95==(1 -0)) then v53=575 -(507 + 67) ;break;end if (v95==(1749 -(1013 + 736))) then v54=0 + 0 ;v55=nil;v95=2 -1 ;end end end if (v53==1) then local v96=0 + 0 ;while true do if (v96==(1 + 0)) then v53=7 -5 ;break;end if (v96==(867 -(550 + 317))) then v56=nil;v57=nil;v96=1 + 0 ;end end end if (v53==(2 -0)) then v58=nil;v59=nil;v53=1260 -(1043 + 214) ;end if (3~=v53) then else v60=nil;while true do local v98=0 -0 ;while true do if ((1212 -(323 + 889))==v98) then if (v54==(0 -0)) then v55={};v56={};v57={};v58={v55,v56,nil,v57};v54=1 -0 ;end if (v54~=(1992 -(582 + 1408))) then else local v101=0;local v102;while true do if (v101~=(0 + 0)) then else v102=0 -0 ;while true do local v141=0 -0 ;while true do if (0==v141) then if (v102==(3 -2)) then return v58;end if ((982 -(18 + 964))==v102) then local v152=0 -0 ;while true do if (v152==(1825 -(1195 + 629))) then v102=1 -0 ;break;end if (v152==0) then for v153=1,v23() do local v154=0 + 0 ;local v155;local v156;while true do if (v154~=(850 -(20 + 830))) then else v155=0 + 0 ;v156=nil;v154=1;end if (v154==(242 -(187 + 54))) then while true do if (v155~=(780 -(162 + 618))) then else v156=v21();if (v20(v156,739 -(542 + 196) ,1 -0 )~=(0 + 0)) then else local v160=0;local v161;local v162;local v163;local v164;local v165;while true do if (v160~=(2 + 0)) then else v165=nil;while true do if ((0 + 0)==v161) then local v166=0 -0 ;while true do if (v166==0) then v162=0 -0 ;v163=nil;v166=1 + 0 ;end if (v166==1) then v161=1552 -(1126 + 425) ;break;end end end if (v161==(1638 -(1373 + 263))) then while true do if (v162==1) then local v167=0;local v168;while true do if (v167~=(1000 -(451 + 549))) then else v168=0;while true do if (1~=v168) then else v162=7 -5 ;break;end if (v168==(1121 -(118 + 1003))) then local v176=0;while true do if (v176==0) then v165={v22(),v22(),nil,nil};if (v163==(0 -0)) then local v181=0;local v182;local v183;while true do if (v181==(0 -0)) then v182=1384 -(746 + 638) ;v183=nil;v181=1;end if (v181==(1 + 0)) then while true do if (0==v182) then v183=0 -0 ;while true do if (v183~=(0 + 0)) then else v165[980 -(553 + 424) ]=v22();v165[4]=v22();break;end end break;end end break;end end elseif (v163==1) then v165[5 -2 ]=v23();elseif (v163==2) then v165[3]=v23() -((2 + 0)^(357 -(218 + 123))) ;elseif (v163~=(3 + 0)) then else local v186=1581 -(1535 + 46) ;while true do if (v186~=(0 + 0)) then else v165[2 + 1 ]=v23() -((1 + 1)^(3 + 13)) ;v165[4]=v22();break;end end end v176=561 -(306 + 254) ;end if (v176==(1 + 0)) then v168=1;break;end end end end break;end end end if (v162==(3 -1)) then local v169=1467 -(899 + 568) ;while true do if ((0 + 0)~=v169) then else local v175=0 + 0 ;while true do if ((4 -3)~=v175) then else v169=754 -(239 + 514) ;break;end if (v175==0) then if (v20(v164,1,1 + 0 )~=(1330 -(797 + 532))) then else v165[4 -2 ]=v60[v165[1 + 1 ]];end if (v20(v164,605 -(268 + 335) ,1204 -(373 + 829) )==(291 -(60 + 230))) then v165[575 -(426 + 146) ]=v60[v165[3]];end v175=1;end end end if (v169~=1) then else v162=1 + 2 ;break;end end end if (v162~=(1456 -(282 + 1174))) then else local v170=811 -(569 + 242) ;local v171;while true do if (v170==(0 -0)) then v171=0 + 0 ;while true do if (v171~=(1 -0)) then else v162=1 -0 ;break;end if (v171~=(1024 -(706 + 318))) then else v163=v20(v156,1253 -(721 + 530) ,1274 -(945 + 326) );v164=v20(v156,9 -5 ,6 + 0 );v171=701 -(271 + 429) ;end end break;end end end if (v162==(3 + 0)) then if (v20(v164,3,3 -0 )==(1501 -(1408 + 92))) then v165[1090 -(461 + 625) ]=v60[v165[1292 -(993 + 295) ]];end v55[v153]=v165;break;end end break;end if (1==v161) then v164=nil;v165=nil;v161=218 -(42 + 174) ;end end break;end if (v160==1) then v163=nil;v164=nil;v160=2 + 0 ;end if (v160==(0 + 0)) then v161=1171 -(418 + 753) ;v162=nil;v160=1;end end end break;end end break;end end end for v157=1,v23() do v56[v157-(1 + 0) ]=v28();end v152=1 + 0 ;end end end break;end end end break;end end end v98=1 + 0 ;end if ((1 + 0)==v98) then if (v54~=1) then else v59=v23();v60={};for v104=1581 -(1183 + 397) ,v59 do local v105=0 + 0 ;local v106;local v107;local v108;while true do if (v105==(530 -(406 + 123))) then v108=nil;while true do if (v106==0) then local v149=0;local v150;while true do if (v149==0) then v150=1769 -(1749 + 20) ;while true do if ((0 + 0)==v150) then local v159=0 + 0 ;while true do if (v159~=(1975 -(1913 + 62))) then else v107=v21();v108=nil;v159=1323 -(1249 + 73) ;end if (1==v159) then v150=1;break;end end end if (v150~=(1 + 0)) then else v106=1;break;end end break;end end end if (v106==(1146 -(466 + 679))) then if (v107==(2 -1)) then v108=v21()~=(0 -0) ;elseif (v107==(7 -5)) then v108=v24();elseif (v107==(1903 -(106 + 1794))) then v108=v25();end v60[v104]=v108;break;end end break;end if (v105~=(0 + 0)) then else local v142=0 + 0 ;while true do if (v142==(0 -0)) then v106=0;v107=nil;v142=2 -1 ;end if (v142~=(1 -0)) then else v105=115 -(4 + 110) ;break;end end end end end v58[3]=v21();v54=586 -(57 + 527) ;end break;end end end break;end end break;end if ((1428 -(41 + 1386))~=v52) then else v55=nil;v56=nil;v52=2;end if (v52~=(106 -(17 + 86))) then else v59=nil;v60=nil;v52=11 -7 ;end if (v52==(304 -(244 + 60))) then v53=0 + 0 ;v54=nil;v52=477 -(41 + 435) ;end if (v52==(2 + 0)) then v57=nil;v58=nil;v52=6 -3 ;end end end local function v29(v61,v62,v63)local v64=v61[1];local v65=v61[2];local v66=v61[3];return function(...)local v69=v64;local v70=v65;local v71=v66;local v72=v27;local v73=1;local v74= -1;local v75={};local v76={...};local v77=v12("#",...) -1 ;local v78={};local v79={};for v87=0,v77 do if (v87>=v71) then v75[v87-v71 ]=v76[v87 + 1 ];else v79[v87]=v76[v87 + 1 ];end end local v80=(v77-v71) + 1 ;local v81;local v82;while true do local v88=0;while true do if (v88==1) then if (v82<=6) then if (v82<=2) then if (v82<=0) then v79[v81[2]]();elseif (v82>1) then v79[v81[2]]=v63[v81[3]];else do return;end end elseif (v82<=4) then if (v82==3) then local v111=v81[2];local v112,v113=v72(v79[v111](v13(v79,v111 + 1 ,v81[3])));v74=(v113 + v111) -1 ;local v114=0;for v138=v111,v74 do v114=v114 + 1 ;v79[v138]=v112[v114];end else local v115=v81[2];local v116=v79[v81[3]];v79[v115 + 1 ]=v116;v79[v115]=v116[v81[4]];end elseif (v82==5) then do return;end else local v120=v81[2];v79[v120]=v79[v120](v13(v79,v120 + 1 ,v74));end elseif (v82<=9) then if (v82<=7) then v79[v81[2]]=v81[3];elseif (v82==8) then v79[v81[2]]=v63[v81[3]];else v79[v81[2]]();end elseif (v82<=11) then if (v82==10) then local v124=v81[2];local v125=v79[v81[3]];v79[v124 + 1 ]=v125;v79[v124]=v125[v81[4]];else local v129=0;local v130;while true do if (v129==0) then v130=v81[2];v79[v130]=v79[v130](v13(v79,v130 + 1 ,v74));break;end end end elseif (v82>12) then v79[v81[2]]=v81[3];else local v133=0;local v134;local v135;local v136;local v137;while true do if (1==v133) then v74=(v136 + v134) -1 ;v137=0;v133=2;end if (v133==2) then for v146=v134,v74 do v137=v137 + 1 ;v79[v146]=v135[v137];end break;end if (v133==0) then v134=v81[2];v135,v136=v72(v79[v134](v13(v79,v134 + 1 ,v81[3])));v133=1;end end end v73=v73 + 1 ;break;end if (v88==0) then v81=v69[v73];v82=v81[1];v88=1;end end end end;end return v29(v28(),{},v17)(...);end v15("LOL!043O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O747047657403213O00682O7470733A2O2F706173746562696E2E636F6D2F7261772F686D63745279465900083O0012023O00013O001202000100023O00200400010001000300120D000300044O000C000100034O000B5O00022O00093O000100012O00013O00017O00",v9(),...);
if start2 then
    pcall(back())
end