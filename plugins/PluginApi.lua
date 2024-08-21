local PluginAPI = {}
function PluginAPI:CreatePlugin(name, description) 
	local Functions = {}
	local Plugin = {
		["PluginName"] = name,
		["PluginDescription"] = description,
		["Commands"] = {}
	}
	function Functions:AddCommand(Name, ListName, Description, Aliases, Callback) 
		Plugin["Commands"][Name] = {
			["ListName"] = ListName,
			["Description"] = Description,
			["Aliases"] = Aliases,
			["Function"] = Callback
		}
	end
	return {PluginTable = Plugin, Functions = Functions}
end
--[[Example Code:
local PluginAPI = loadstring(game:HttpGet("https://raw.githubusercontent.com/RyXeleron/Infinite-Store/master/plugins/PluginApi.lua"))()
local Plugin = PluginAPI:CreatePlugin("example plugin", "made by stroketon")
Plugin.Functions:AddCommand("notify", "notify [text]",  "Notifes", {"noti"}, function(args,speaker) 
	notify(table.concat(args, " "))
end)
return Plugin.PluginTable]]
return PluginAPI
