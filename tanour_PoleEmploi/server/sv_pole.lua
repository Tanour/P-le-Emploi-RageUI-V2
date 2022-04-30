ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('tanour:Setjob')
AddEventHandler('tanour:Setjob', function(label,name)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.setJob(name, 0)  
    TriggerClientEvent("esx:showNotification", _source, "<C>Désormais, votre métier est : ~b~"..label)
end)

RegisterServerEvent('tanour:Chomeur')
AddEventHandler('tanour:Chomeur', function(job)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.setJob("unemployed", 0)  
end)

RegisterServerEvent('tanour:TacosCommande')
AddEventHandler('tanour:TacosCommande', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local item = "commandetacos"
    local limiteitem = 1
    local inventaire = xPlayer.getInventoryItem(item).count

    if inventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "<C>~r~Tu as déjà reçu ta commande !")
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showAdvancedNotification', source, "Tacos", "~b~Tokyo Développement", "<C>Dépêches toi de livrer cette commande", "CHAR_ORTEGA", 8)

    end
end)

RegisterServerEvent('tanour:EnleverTacosCommande')
AddEventHandler('tanour:EnleverTacosCommande', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local item = "commandetacos"
    local limiteitem = 1
    local inventaire = xPlayer.getInventoryItem(item).count

    if inventaire < limiteitem then
        TriggerClientEvent('esx:showNotification', source, "<C>~r~Tu n'as aucune commande en cours")
    else
        xPlayer.removeInventoryItem(item, 1)
        TriggerClientEvent('esx:showAdvancedNotification', source, "Tacos", "~b~Tokyo Développement", "<C>Tu sers à rien finalement", "CHAR_ORTEGA", 8) 
    end
end)

RegisterServerEvent('tanour:Tacos')
AddEventHandler('tanour:Tacos', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local item = "commandetacos"
    local commande = 1
    local inventaire = xPlayer.getInventoryItem(item).count

    if inventaire >= commande then
        xPlayer.removeInventoryItem(item, 1)
        xPlayer.addMoney(Config.PrixLivraisonTacos)
        TriggerClientEvent('esx:showNotification', source, "<C>Vous avez gagner "..Config.PrixLivraisonTacos.."~g~$")
    else
        TriggerClientEvent('esx:showAdvancedNotification', source, "Tacos", "~b~Tokyo Développement", "<C>~r~Elle est ou ma commande ? Tu as voulu m'arnaquer !", "CHAR_ORTEGA", 8) 
    end
end)

RegisterNetEvent('tanour:RecolteJardinier')
AddEventHandler('tanour:RecolteJardinier', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local item = "plante"
    local inventaire = xPlayer.getInventoryItem(item).count
    local limiteitem = 50
    

    if inventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "<C>~r~Ton inventaire est rempli")
        recoltepossible = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "<C>~g~Récolte en cours...")
    end
end)

RegisterServerEvent('tanour:VenteJardinier')
AddEventHandler('tanour:VenteJardinier', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local item = "plante"
    local plante = 1
    local inventaire = xPlayer.getInventoryItem(item).count
    
    if inventaire >= plante then
        xPlayer.removeInventoryItem(item, 1)
        xPlayer.addMoney(Config.PrixVenteJardinier)
        TriggerClientEvent('esx:showNotification', source, "<C>Vous avez gagner "..Config.PrixVenteJardinier.."~g~$")
    else 
        TriggerClientEvent('esx:showNotification', source, "<C>~r~Vous n'avez plus de plantes à vendre")
    end
end)

----Tanour#5954
----https://github.com/Tanour
----https://discord.gg/PKHRT8pQC4
