local QBCore = exports['qb-core']:GetCoreObject()

-- client/main.lua
RegisterNetEvent('ds-reportes:client:mostrarUI', function()
    SendNUIMessage({type = 'open'})
    SetNuiFocus(true, true)
end)

RegisterNetEvent('ds-reportes:client:cerrarUI', function()
    SendNUIMessage({type = 'close'})
    SetNuiFocus(false, false)
end)

RegisterNUICallback('cerrar', function(data, cb)
    SendNUIMessage({type = 'close'})
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('enviar', function(reporte, cb)
    SendNUIMessage({type = 'close'})
    SetNuiFocus(false, false)
    -- Capturar pantalla
    exports['screenshot-basic']:requestScreenshotUpload('--------CONFIGURAR URL del repositorio', 'image', function(data)
        local resp = json.decode(data)
        if resp and resp.url then
            reporte.screenshot = resp.url
            TriggerServerEvent('ds-reporte:server:sendReport', reporte)
        else
            TriggerServerEvent('ds-reporte:server:sendReport', reporte)
        end
    end)
    cb('ok')
end)