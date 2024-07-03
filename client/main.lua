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
    exports['screenshot-basic']:requestScreenshotUpload('https://api.fivemanage.com/api/image',
    'image',
    {
        headers = {
            Authorization = "Configura la key del repositorio"
        }
    },
    function(data)
        local resp = json.decode(data)
        if resp then
            reporte.screenshot = resp.url
            TriggerServerEvent('ds-reporte:server:sendReport', reporte)
        else
            TriggerServerEvent('ds-reporte:server:sendReport', reporte)
        end
    end)
    cb('ok')
end)