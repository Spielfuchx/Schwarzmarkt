ESX = nil


local store = { 
    [_U('open_store')] = { title="Schwarzmarkt", x = 3821.34, y = 4440.05, z = 1.8},
}

local NPC = {
    {seller = true, model = "ig_claypain", x = 3821.01, y = 4439.65, z = 1.8, h = 314.194},
}


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	if Config.EnableNpc then
			for _, v in pairs(NPC) do
				RequestModel(GetHashKey(v.model))
				while not HasModelLoaded(GetHashKey(v.model)) do
					Wait(1)
				end
				local npc = CreatePed(4, v.model, v.x, v.y, v.z, v.h,  false, true)
				SetPedFleeAttributes(npc, 0, 0)
				SetPedDropsWeaponsWhenDead(npc, false)
				SetPedDiesWhenInjured(npc, false)
				SetEntityInvincible(npc , true)
				FreezeEntityPosition(npc, true)
				SetBlockingOfNonTemporaryEvents(npc, true)
				if v.seller then 
					RequestAnimDict("missfbi_s4mop")
					while not HasAnimDictLoaded("missfbi_s4mop") do
						Wait(1)
					end
					TaskPlayAnim(npc, "missfbi_s4mop" ,"guard_idle_a" ,8.0, 1, -1, 49, 0, false, false, false)
				else
					GiveWeaponToPed(npc, GetHashKey("WEAPON_ADVANCEDRIFLE"), 2800, true, true)
				end
			end
	end
	
	local bool = true
  
  if bool then
  
   
   end
	
	
end)

Citizen.CreateThread(function()
	while true do
      
	Citizen.Wait(5)
	
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for k, v in pairs(store) do
			if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 100 then
				DrawMarker(0, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 1.0, 255, 255, 255, 50, false, true, 2, false, false, false, false)
			end		
		end

	end
	
end)


Citizen.CreateThread(function()
	while true do
      
	Citizen.Wait(5)
	
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for k, v in pairs(store) do
			if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.5 then
				DrawText3D(v.x-0.4, v.y-0.5, v.z+1.9, k, 0.50)
				if IsControlPressed(0, 38) then
					OpenShopMenu()
				end
			end
		end
		
		
	end
end)

function OpenShopMenu()
    ESX.UI.Menu.CloseAll()

     ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'Black_market',
         {
            title    = _U('Black_market'),
            elements = {
				{label = ('Portabler Methlabor - <span style="color:red;">1300$</span>'), item = 'methlab', price = 1300, amount = 1},
				{label = ('Blauer USB - <span style="color:red;">1000$</span>'), item = 'methburn', price = 1000, amount = 1},
				{label = ('Roter USB - <span style="color:red;">1000$</span>'), item = 'cokeburn', price = 1000, amount = 1},
				{label = ('Gelber USB - <span style="color:red;">1000$</span>'), item = 'weedburn', price = 1000, amount = 1},
				{label = ('Hanf Samen - <span style="color:red;">70$</span>'), item = 'weed_seed', price = 70, amount = 1},
				{label = ('Hackertool - <span style="color:red;">1124$</span>'), item = 'hackerDevice', price = 1124, amount = 1},
				{label = ('Hacking Laptop - <span style="color:red;">1134$</span>'), item = 'hacking_laptop', price = 1134, amount = 1},
				{label = ('Papiertüte - <span style="color:red;">200$</span>'), item = 'headbag', price = 200, amount = 1},
				{label = ('Schere - <span style="color:red;">200$</span>'), item = 'schere', price = 200, amount = 1},
				{label = ('Kabelbinder - <span style="color:red;">200$</span>'), item = 'kabelbinder', price = 200, amount = 1},
				{label = ('Lithium Batterie - <span style="color:red;">120$</span>'), item = 'lithium', price = 120, amount = 1},
				{label = ('Acetone - <span style="color:red;">40$</span>'), item = 'acetone', price = 40, amount = 1},
				{label = ('Wäschereikarte- <span style="color:red;">100$</span>'), item = 'hackingdevice', price = 100, amount = 1},
				{label = ('Kugelsichere Weste (Schwer)- <span style="color:red;">5000$</span>'), item = 'bulletproof2', price = 5000, amount = 1},


				

            }
        },
        function(data, menu)
			local item = data.current.item
			local price = data.current.price
			local amount = data.current.amount
            TriggerServerEvent('esx:Schwarzmarkt', item, price, amount)
        end,
    function(data, menu)
        menu.close()
    end)
end



function DrawText3D(x,y,z, text, scl, font) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end
