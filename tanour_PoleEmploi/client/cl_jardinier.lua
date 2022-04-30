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
local Jardinier = RageUI.CreateMenu("~b~Jardinier", "~b~Interaction")
Jardinier.Display.Header = true
Jardinier.Closed = function ()
    open = false
end

function TanourJardinier()
    if open then
        open = false
        RageUI.Visible(Jardinier, false)
        return
    else
        open = true
        RageUI.Visible(Jardinier, true)
        CreateThread(function ()
            while open do
                RageUI.IsVisible(Jardinier,function ()
                    
                    for k, v in pairs(Config.JardinierRecolte) do
                    RageUI.Button("Point GPS vers la récolte", nil, {RightLabel = "~b~→→"}, true, {
                        onSelected = function ()
                            ClearGpsMultiRoute()
                            StartGpsMultiRoute(12, true, true)
                            AddPointToGpsMultiRoute(v.x, v.y, v.z)
                            SetGpsMultiRouteRender(true)
                            ESX.ShowNotification("<C>~b~Point GPS défini vers la récolte")
                        end
                    })
                end
                    RageUI.Button("Vendre des plantes", nil, {RightLabel = "~b~→→"}, true, {
                        onSelected = function ()
                        TriggerServerEvent("tanour:VenteJardinier")
                        ClearGpsMultiRoute()
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
  if Config.BlipsJardinier then

        for k, v in pairs(Config.BlipsJardinierPosition) do
            local Blips = AddBlipForCoord(v.x, v.y, v.z)
  
            SetBlipSprite (Blips, Config.BlipsJardinierId)
            SetBlipScale  (Blips, Config.BlipsJardinierTaille)
            SetBlipColour (Blips, Config.BlipsJardinierCouleur)
            SetBlipAsShortRange(Blips, true)
  
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(Config.BlipsJardinierName)
            EndTextCommandSetBlipName(Blips)
        end
    end
end)

---- Marker ----

Citizen.CreateThread(function()
    while true do
    local wait = 750
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'jardinier' then
      for k, v in pairs(Config.Jardinier) do
        local playerCoords = GetEntityCoords(PlayerPedId())
                local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)

                if distance <= Config.MarkerDistance then
                    wait = 0
                    DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
                end

                if distance <= Config.TextDistance then
                    wait = 0
                    Visual.Subtitle(Config.TextJardinier, 1)
                    if IsControlJustPressed(1,51) then
                        TanourJardinier()
                    end
                end
            end
        end
    Citizen.Wait(wait)
    end
end)

local lock = false
local open = false
local JardinierRecolte = RageUI.CreateMenu("~b~Jardinier", "~b~Interaction")
JardinierRecolte.Display.Header = true
JardinierRecolte.Closed = function ()
    open = false
    SetPlayerControl(PlayerId(), true, 12)
end

function TanourJardinierRecolte()
    if open then
        open = false
        RageUI.Visible(JardinierRecolte, false)
        return
    else
        open = true
        SetPlayerControl(PlayerId(), false, 12)
        RageUI.Visible(JardinierRecolte, true)
        CreateThread(function ()
            while open do
                RageUI.IsVisible(JardinierRecolte,function ()
                    
                    for k, v in pairs(Config.JardinierRecolte) do
                    RageUI.Button("Récolter des plantes", nil, {RightLabel = "~b~→→"}, not lock, {
                        onSelected = function ()
                            lock = true
                            local playerPed = PlayerPedId()
                            TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_GARDENER_PLANT', 0, true)
                            StartRecolte()
                            ClearGpsMultiRoute()
                            Citizen.SetTimeout(1000, function()
                                lock = false
                        end)
                    end
                    })
                end
                    RageUI.Button("Stopper la récolte", nil, {RightLabel = "~b~→→"}, true, {
                        onSelected = function ()
                        StopRecolte()
                        local playerPed = PlayerPedId()
                        ClearPedTasksImmediately(playerPed)
                        end
                    })
                end)
                Wait(0)
            end
        end)
    end
end

function StartRecolte()
    if not recoltepossible then
        recoltepossible = true
    while recoltepossible do
        Citizen.Wait(5000)
        TriggerServerEvent('tanour:RecolteJardinier')
    end
    else
        recoltepossible = false
    end
end

function StopRecolte()
    if recoltepossible then
    	recoltepossible = false
    end
end

---- Marker ----

Citizen.CreateThread(function()
    while true do
    local wait = 750
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'jardinier' then
      for k, v in pairs(Config.JardinierRecolte) do
        local playerCoords = GetEntityCoords(PlayerPedId())
                local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)

                if distance <= Config.MarkerDistance then
                    wait = 0
                    DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
                end

                if distance <= Config.TextDistance then
                    wait = 0
                    Visual.Subtitle(Config.TextJardinierRecolte, 1)
                    if IsControlJustPressed(1,51) then
                        TanourJardinierRecolte()
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
