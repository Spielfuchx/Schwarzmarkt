ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('esx:Schwarzmarkt')
AddEventHandler('esx:Schwarzmarkt', function(item, price, amount)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if Config.blackmoney then
		if xPlayer.getAccount('black_money').money >= price then
			xPlayer.removeAccountMoney('black_money', price)
			xPlayer.addInventoryItem(item, amount)

			cb(true)
		else
			TriggerClientEvent('esx:showAdvancedNotification', _source, "Verkäufer", "", "Du hast nicht genug Schwarzgeld" , "CHAR_LESTER_DEATHWISH", 1)
			cb(false)
		end
	else
		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(item, amount)

			cb(true)
		else
			TriggerClientEvent('esx:showAdvancedNotification', _source, "Verkäufer", "", "Du hast nicht genug Geld" , "CHAR_LESTER_DEATHWISH", 1)
			cb(false)
		end
	end
end)