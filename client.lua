local insertKey = 121

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsControlJustPressed(1, insertKey) and not IsControlPressed(1, 36) and not IsControlPressed(1, 341) and not IsControlPressed(1, 344) then
            TriggerServerEvent("checkInsertKey")
            Citizen.Wait(500)
        end
    end
end)
