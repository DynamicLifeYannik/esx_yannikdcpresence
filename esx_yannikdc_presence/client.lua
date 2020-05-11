ESX                             = nil
PlayerData                = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end

	while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end

  	PlayerData = ESX.GetPlayerData()
end)

local WaitTime = 2500
-- https://discord.com/developers/applications/ -> create a new RichAppID.
local DiscordAppId = tonumber(GetConvar("RichAppId", "Your RichAppID"))
local DiscordAppAsset = GetConvar("RichAssetId", "logo")
	
Citizen.CreateThread(function()
	SetDiscordAppId(DiscordAppId)
	SetDiscordRichPresenceAsset(DiscordAppAsset)
	while true do
		Citizen.Wait(WaitTime)
        local playerCount = #GetActivePlayers()

            local maxPlayerSlots = "1024"
            SetRichPresence(string.format("%s/%s | Job: %s", playerCount, maxPlayerSlots, PlayerData.job.label))

	end
end)
