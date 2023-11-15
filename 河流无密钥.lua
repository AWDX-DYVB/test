local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/f2vR5dJd"))()
 
OrionLib:MakeNotification({
  Name = "正在启动河脚本",
  Content = "脚本启动成功正在加载中-请耐心等待(正在启动)",
  Image = "rbxassetid://13317101016",
  Time = 10
})
wait(3)
local Window = OrionLib:MakeWindow({Name = "河流工作室(河脚本)(无密钥)", HidePremium = false, SaveConfig = false, IntroText = "正在启动(河脚本)(无密钥)", ConfigFolder = "无密钥"})
 
local Key = Window:MakeTab({
  Name = "河流无密钥",
  Icon = "rbxassetid://13169958031",
  PremiumOnly = false
})

playername=tostring(game.Players.LocalPlayer.Character);

Key:AddParagraph("你的用户名是:"..playername,"")

Key:AddButton({
	Name = "点击我启动河脚本(无密钥)",
	Callback = function()
      	OrionLib:MakeNotification({
            Name = "你已启动河脚本",
            Content = "河 脚 本 将 在 几 天 是  免 费 的 -开始时间5月12日\n结 束 时 间 5 月 2 0 日 祝 你 一 切 玩 得 开 心\n正 在 启 动 脚 本 - 请 耐 心 等 待",
            Image = "rbxassetid://13317101016",
            Time = 8
        })
        loadstring(game:HttpGet("https://pastebin.com/raw/9YNCv6Vm"))()
  	end
})

Key:AddParagraph("河脚本公告","将 在 今 天 取 消 一 人 一 密 钥 和 白 名 单")
Key:AddParagraph("河脚本取消密钥时间","这 段 时 间 河 脚 本 将 取 消 密 钥 系 统 和 白 名 单 系 统-------请 看 下 面 的 内 容")
Key:AddParagraph("开启时间-截止时间","开 启 时 间 1 1 月 1 5 日 ~ ~ ~ 停 止 时 间 未知 月 未知 日 这 段 时 间 河 脚 本 不 要 密 钥 和 白 名 单")

local s = Window:MakeTab({
Name = "脚本说明书",
Icon = "rbxassetid://13317101016",
PremiumOnly = false
})
s:AddParagraph("当前还未有任何说明","请 大 家 耐 心 等 待 - 我 们 这 边 还 正 在 制 作 中")

s:AddButton({
	Name = "全部-脚本说明书-河流制作",
	Callback = function()
      	OrionLib:MakeNotification({
            Name = "脚本说明书打开失败",
            Content = "该 脚 本 已 丢 失 源 码 暂 时 停 止 使 用",
            Image = "rbxassetid://13317101016",
            Time = 8
        })
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
 
OrionLib:Init()