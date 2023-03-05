
local DevelopmentBranch = getgenv().DevelopmentBranch or false  
local NotificationTime = getgenv().NotificationTime or 5
local Debug = getgenv().Debug or false

local Request = (syn and syn.request)
or (http and http.request) or request
DevelopmentBranch = DevelopmentBranch
and "development" or "main"

local function HTTPGet(Url)
    local Responce = Request({Url = Url,Method = "GET"})
    if Responce then return Responce.Body end
end

loadstring(HTTPGet(("https://raw.githubusercontent.com/AlexR32/Parvus/%s/Loader.lua")
:format(DevelopmentBranch)))(Debug,DevelopmentBranch,NotificationTime)
