CreateThread(function()
    while true do
        Wait(0)
        if LocalPlayer.state['isLoggedIn'] then
            Wait((1000 * 60) * QBCore.Config.UpdateInterval)
            TriggerServerEvent('QBCore:UpdatePlayer')
        end
    end
end)

CreateThread(function()
    while true do
        Wait(QBCore.Config.StatusInterval)
        if LocalPlayer.state['isLoggedIn'] then
            if not QBCore.Functions.GetPlayerData().metadata['inlaststand'] and not QBCore.Functions.GetPlayerData().metadata['isdead'] then
                if QBCore.Functions.GetPlayerData().metadata['hunger'] <= 0 or QBCore.Functions.GetPlayerData().metadata['thirst'] <= 0 then
                    local ped = PlayerPedId()
                    local currentHealth = GetEntityHealth(ped)
                    --SetEntityHealth(ped, currentHealth - math.random(5, 10))
                    SetEntityHealth(ped, currentHealth - math.random(1, 3))
                end
            end
        end
    end
end)