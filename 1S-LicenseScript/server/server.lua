local QBCore = exports['qb-core']:GetCoreObject()
local Player = QBCore.Functions.GetPlayer(source)

function dump(o)
	if type(o) == 'table' then
	   local s = '{ '
	   for k,v in pairs(o) do
		  if type(k) ~= 'number' then k = '"'..k..'"' end
		  s = s .. '['..k..'] = ' .. dump(v) .. ','
	   end
	   return s .. '} '
	else
	   return tostring(o)
	end
 end

-- Command to open the license menu
RegisterCommand('checklicense', function(source, args)
    local player = source
    local xPlayer = QBCore.Functions.GetPlayer(player)

    
    if xPlayer then
        local licenses = xPlayer.PlayerData.metadata["licenses"]
        
        if licenses then
            local menuElements = {}
            
            for licenseType, isLicensed in pairs(licenses) do
                local status = isLicensed and "Licensed" or "Not Licensed"
                table.insert(menuElements, {label = licenseType, value = status})
            end
            
            TriggerClientEvent("qb-core:client:ShowLicenseMenu", player, menuElements)
        else
            TriggerClientEvent("QBCore:Notify", player, "You do not have any licenses.", "error")
        end
    else
        print("Error: Player not found.")
    end
end, false)



-- Concealed Firearms License
RegisterNetEvent("concealedlicensefirearms")

-- The event handler function follows after registering the event first.
AddEventHandler("concealedlicensefirearms", function(eventParam)


local cashcount = exports.ox_inventory:GetItem(source, 'cash', nil, true) 

if cashcount > 75000  then
    --Pay For License
    exports.ox_inventory:RemoveItem(source, 'cash', 75000)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    local licenseTable = xPlayer.PlayerData.metadata['licences']
            
    licenseTable["conceled_license"] = true
    xPlayer.Functions.SetMetaData('licences', licenseTable)

    TriggerClientEvent('concealedlicensesucces', source)
else

    TriggerClientEvent('concealedlicensefail', source)

end
end)



-- Open Carry Licenses
RegisterNetEvent("opencarrylicensefirarm")

-- The event handler function follows after registering the event first.
AddEventHandler("opencarrylicensefirarm", function(eventParam)


local cashcount = exports.ox_inventory:GetItem(source, 'cash', nil, true) 

if cashcount > 110000  then
    --Pay For License
    exports.ox_inventory:RemoveItem(source, 'cash', 110000)
    TriggerClientEvent('opencarrylicensesucces', source)

    local xPlayer = QBCore.Functions.GetPlayer(source)

    local licenseTable = xPlayer.PlayerData.metadata['licences']
            
    licenseTable["opencarry_license"] = true
    xPlayer.Functions.SetMetaData('licences', licenseTable)
else
    TriggerClientEvent('opencarrylicensefail', source)

end
end)




-- Hunting License
RegisterNetEvent("huntinglicense")

-- The event handler function follows after registering the event first.
AddEventHandler("huntinglicense", function(eventParam)


local cashcount = exports.ox_inventory:GetItem(source, 'cash', nil, true) 

if cashcount > 50000  then
    --Pay For License
    exports.ox_inventory:RemoveItem(source, 'cash', 50000)
    TriggerClientEvent('huntinglicensesucces', source)
    
    local xPlayer = QBCore.Functions.GetPlayer(source)


    local licenseTable = xPlayer.PlayerData.metadata['licences']
            
    licenseTable["hunting_license"] = true
    xPlayer.Functions.SetMetaData('licences', licenseTable)
else
    TriggerClientEvent('huntinglicensefail', source)

end
end)


local branding = 
[[ 
    --   
    --  ██ ███████               ██████  ███████ ██    ██ 
    -- ███ ██                    ██   ██ ██      ██    ██ 
    --  ██ ███████     █████     ██   ██ █████   ██    ██ 
    --  ██      ██               ██   ██ ██       ██  ██  
    --  ██ ███████               ██████  ███████   ████   
    --                                                    
    --                                                                                                                                                                                                                                  
  ]]

  versionChecker = true -- Set to false to disable version checker


  -- Don't touch
  resourcename = "1S-LicenseScript"
  version = "1.0.4"
  rawVersionLink = "https://raw.githubusercontent.com/Swqppingg/RPCore/main/version.txt"
  
  -- Check for version updates.
  if versionChecker then
  print(branding)
  PerformHttpRequest(rawVersionLink, function(errorCode, result, headers)
      if (string.find(tostring(result), version) == nil) then
          print("\n\r[".. GetCurrentResourceName() .."] ^1WARNING: Your version of ".. resourcename .." is not up to date. Please make sure to update whenever possible.\n\r")
      else
          print("\n\r[".. GetCurrentResourceName() .."] ^2You are running the latest version of ".. resourcename ..".\n\r")
      end
  end, "GET", "", "")
  end




