ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(0)
    end
    if ESX.IsPlayerLoaded() then

        ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

local open = false
local Tacos = RageUI.CreateMenu("~b~Tacos","~b~Interaction")
Tacos.Display.Header = true
Tacos.Closed = function ()
    open = false
end

function TanourTacos()
    if open then
        open = false
        RageUI.Visible(Tacos,false)
        return
    else
        open = true
        RageUI.Visible(Tacos, true)
        CreateThread(function ()
            while open do
                RageUI.IsVisible(Tacos,function ()
                    
                    for k, v in pairs(Config.TacosLivraison) do
                    RageUI.Button("Livrer une commande", nil, {RightLabel = "~b~→→"}, true,{
                        onSelected = function ()
                            ClearGpsMultiRoute()
                            StartGpsMultiRoute(12, true, true)
                            AddPointToGpsMultiRoute(v.x, v.y, v.z)
                            SetGpsMultiRouteRender(true)
                            TriggerServerEvent('tanour:TacosCommande')
                        end
                    })
                    end
                    RageUI.Button("Arrêter la commande", nil, {RightLabel = "~b~→→"}, true,{
                        onSelected = function ()
                            ClearGpsMultiRoute()
                            TriggerServerEvent('tanour:EnleverTacosCommande')
                        end
                    })
                end)
                Wait(0)
            end
        end)
    end    
end

Citizen.CreateThread(function ()
    Citizen.Wait(100)
  if Config.BlipsTacos then
        for k, v in pairs(Config.BlipsTacosPosition) do
            local Blips = AddBlipForCoord(v.x, v.y, v.z)
  
            SetBlipSprite (Blips, Config.BlipsTacosId)
            SetBlipScale  (Blips, Config.BlipsTacosTaille)
            SetBlipColour (Blips, Config.BlipsTacosCouleur)
            SetBlipAsShortRange(Blips, true)
  
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(Config.BlipsTacosName)
            EndTextCommandSetBlipName(Blips)
        end
    end
end)

---- Marker ----

Citizen.CreateThread(function()
    while true do
    local wait = 750
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tacos' then
      for k, v in pairs(Config.Tacos) do
        local playerCoords = GetEntityCoords(PlayerPedId())
                local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)

                if distance <= Config.MarkerDistance then
                    wait = 0
                    DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
                end

                if distance <= Config.TextDistance then
                    wait = 0
                    Visual.Subtitle(Config.TextTacos, 1)
                    if IsControlJustPressed(1,51) then
                        TanourTacos()
                    end
                end
            end
        end
    Citizen.Wait(wait)
    end
end)

---- Livraison ----


local open = false
local TacosLivraison = RageUI.CreateMenu("~b~Tacos","~b~Interaction")
TacosLivraison.Display.Header = true
TacosLivraison.Closed = function ()
    open = false
end

function TanourTacosLivraison()
    if open then
        open = false
        RageUI.Visible(TacosLivraison,false)
        return
    else
        open = true
        RageUI.Visible(TacosLivraison, true)
        CreateThread(function ()
            while open do
                RageUI.IsVisible(TacosLivraison,function ()
                    
                    for k,v in pairs(Config.TacosLivraison) do
                    RageUI.Button("Livrer la commande", nil, {RightLabel = "~b~→→"}, true,{
                        onSelected = function ()
                            TriggerServerEvent('tanour:Tacos')
                            ClearGpsMultiRoute()
                        end
                    })
                end
                end)
                Wait(0)
            end
        end)
    end    
end


---- Marker ----

Citizen.CreateThread(function()
    while true do
    local wait = 750
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tacos' then
      for k, v in pairs(Config.TacosLivraison) do
        local playerCoords = GetEntityCoords(PlayerPedId())
                local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)

                if distance <= Config.MarkerDistance then
                    wait = 0
                    DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
                end

                if distance <= Config.TextDistance then
                    wait = 0
                    Visual.Subtitle(Config.TextTacosLivraison, 1)
                    if IsControlJustPressed(1,51) then
                        TanourTacosLivraison()
                    end
                end
            end
        end
    Citizen.Wait(wait)
    end
end)

----Tanour#5954
----https://github.com/Tanour
----https://discord.gg/PKHRT8pQC4