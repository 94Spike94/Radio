local currentRadio = nil
local isPlaying = false

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        local closestRadio = nil
        local isInRange = false

        -- Überprüfe jedes Radio, um zu sehen, ob der Spieler sich innerhalb des Bereichs befindet
        for _, radio in ipairs(Config.Radios) do
            local distance = #(playerCoords - radio.coords)

            -- Überprüfe, ob der Spieler innerhalb des Radius ist
            if distance <= radio.radius then
                closestRadio = radio
                isInRange = true
                break
            end
        end

        if isInRange and closestRadio then
            -- Starte das Radio, falls es noch nicht läuft
            if not isPlaying or currentRadio ~= closestRadio then
                currentRadio = closestRadio
                isPlaying = true
                SendNUIMessage({type = 'play', file = closestRadio.file, volume = closestRadio.volume})
            end
        else
            -- Stoppe die Musik, wenn der Spieler nicht mehr im Bereich ist
            if isPlaying then
                isPlaying = false
                SendNUIMessage({type = 'stop'})
            end
        end

        Citizen.Wait(1000)  -- Überprüfung alle 1 Sekunde
    end
end)
