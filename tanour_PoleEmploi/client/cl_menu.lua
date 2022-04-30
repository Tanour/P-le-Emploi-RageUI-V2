Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)      
		Citizen.Wait(0)
	end
end)

local open = false 
local Tanour = RageUI.CreateMenu("~b~Pôle Emploi","~b~Interaction")
local Libre = RageUI.CreateSubMenu(Tanour,"~b~Pôle Emploi","~b~Interaction")
local Whitelist = RageUI.CreateSubMenu(Tanour,"~b~Pôle Emploi","~b~Interaction")
Tanour.Display.Header = true
Tanour.Closed = function ()
    open = false
end

function TanourPole()
    if open then
        open = false
        RageUI.Visible(Tanour,false)
        return
    else
        open = true
        RageUI.Visible(Tanour,true)
        CreateThread(function ()
        while open do
            RageUI.IsVisible(Tanour, function ()

            RageUI.Button("Métiers Libres", nil, {RightLabel = "~b~→→"}, true, {}, Libre)

            RageUI.Button("Métiers Whitelists", nil, {RightLabel = "~b~→→"}, true, {}, Whitelist)

            RageUI.Separator("____________________") 

            RageUI.Button("Chômage", nil, {RightLabel = "~b~→→"}, true, {
                onSelected = function ()
                    TriggerServerEvent('tanour:Chomeur')
                    ClearGpsMultiRoute()
                    ESX.ShowNotification("<C>~b~Tu es désormais au chômage")
                end
             }) 
    end)

        RageUI.IsVisible(Libre, function ()

            for k,v in pairs(Config.Libre) do
            RageUI.Button(v.label, v.objectif, {RightLabel = "~b~→→"}, true, {
                onSelected = function ()
                    TriggerServerEvent('tanour:Setjob', v.label, v.name)
                                        ClearGpsMultiRoute()
                                        StartGpsMultiRoute(12, true, true)
                                        AddPointToGpsMultiRoute(v.x, v.y, v.z)
                                        SetGpsMultiRouteRender(true)
                    ESX.ShowNotification("<C>"..v.message)
                end
            })
        end
    end)
        
        RageUI.IsVisible(Whitelist,function ()
            
            for k,v in pairs(Config.Whitelist) do
            RageUI.Button(v.label, nil, {RightLabel = "~b~→→"}, true, {
                onSelected = function ()
                   -- ESX.ShowNotification("<C>"..v.message)
                    ESX.ShowAdvancedNotification(v.Title, v.SubTitle, "<C>"..v.message, "CHAR_MOLLY", 8)
                end
            })
                end
              end)
              Wait(0)
            end
        end)
    end
end

--- Ped ----

Citizen.CreateThread(function ()
    for k, v in pairs(Config.Ped) do
    while not HasModelLoaded(v.pedModel) do
        RequestModel(v.pedModel)
        Wait(0)
    end
    Ped = CreatePed(2, GetHashKey(v.pedModel), v.position, 0, 0)
    FreezeEntityPosition(Ped, 1)
    TaskStartScenarioInPlace(Ped, v.pedModel, 0, false)
    SetEntityInvincible(Ped, true) 
    SetBlockingOfNonTemporaryEvents(Ped, 1)
end
end)

---- Blips ----

Citizen.CreateThread(function ()
    Citizen.Wait(100)
  if Config.BlipsPoleEmploi then
        for k, v in pairs(Config.BlipsPoleEmploiPosition) do
            local Blips = AddBlipForCoord(v.x, v.y, v.z)
  
            SetBlipSprite (Blips, Config.BlipsPoleEmploiId)
            SetBlipScale  (Blips, Config.BlipsPoleEmploiTaille)
            SetBlipColour (Blips, Config.BlipsPoleEmploiCouleur)
            SetBlipAsShortRange(Blips, true)
  
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(Config.BlipsPoleEmploiName)
            EndTextCommandSetBlipName(Blips)
        end
    end
  end)

---- Marker ----

Citizen.CreateThread(function()
    while true do
    local wait = 750
      for k, v in pairs(Config.PoleEmploi) do
        local playerCoords = GetEntityCoords(PlayerPedId())
                local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)

                if distance <= Config.MarkerDistance then
                    wait = 0
                    DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
                end

                if distance <= 2.0 then
                    wait = 0
                    Visual.Subtitle(Config.Text, 1)
                    if IsControlJustPressed(1,51) then
                        TanourPole()
                    end
                end
        end
    Citizen.Wait(wait)
    end
end)

----Tanour#5954
----https://github.com/Tanour
----https://discord.gg/PKHRT8pQC4