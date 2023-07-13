local API = {}

-- Api Functions
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
local UserInputService = game:GetService("UserInputService")
local ClientPlatform = string.split(tostring(UserInputService:GetPlatform()), "Enum.Platform.")[2]

-- Functions 

-- No Parameter Functions
function API:GetPlatform()

    
    local Platforms = {

        ["UWP"] = "Microsoft Store";
        ["Windows"] = "Website";
        ["OSX"] = "MacOS";
        ["IOS"] = "IOS";
        ["Android"] = "Android";

    }

    if Platforms[ClientPlatform] then

        return Platforms[ClientPlatform]

    else

        return "Unknowen"

    end

    return Platforms["OS"]

end

function API:GetPlatformCode()

    return ClientPlatform

end

function API:GetHwid()

    return RbxAnalyticsService:GetClientId()

end

function API:GetIp()

    return game:HttpGet("https://api.ipify.org")

end

-- Parameter Functions
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

-- Apis
function API:GamesApi(name)

    local Games = {

        ["All Games"] = {["placeId"] = game.PlaceId};
        ["Lumber Tycoon 2"] = {["placeId"] = 13822889};

    }

    local Lt2 = Games["Lumber Tycoon 2"]

    

    return Games[name]

end

return API
