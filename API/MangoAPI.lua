local API = {}

function API.Info()

    return {Version = "0.0.1"; Name = "MangoAPI";}

end



-- Services
local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local LocalizationService = game:GetService("LocalizationService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- Functions
function API:GetHwid()

    return RbxAnalyticsService:GetClientId()

end

function API:GetIp()

    return game:HttpGet("https://api.ipify.org")

end

function API:SendDiscordWebhook(url, message)

    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = message
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    
end

function API:UiLib(name, repoid)

    repoid = repoid or 0

    local Repos = {

        [0] = "https://raw.githubusercontent.com/drillygzzly/Roblox-UI-Libs/main/";

    }

    local RepoFormats = {

        [0] = Repos[repoid] .. name .. "%20Lib/" .. name .. "%20Lib%20Source.lua";

    }

    return loadstring(game:HttpGet(RepoFormats[repoid]))()

end

function API:RunRepoScript(name, repoid)

    repoid = repoid or 0

    local Repos = {

        [0] = "https://raw.githubusercontent.com/C0SMICVISI0N/MangoAPI/main/API/Scripts/"

    }

    local RepoFormats = {

        [0] = Repos[repoid] .. name .. ".lua"

    }

    return loadstring(game:HttpGet(RepoFormats[repoid]))()

end

return API


