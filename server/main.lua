local QBCore = exports['qb-core']:GetCoreObject()

-- server/main.lua
QBCore.Commands.Add('reporte', 'Enviar reporte a staff', {}, false, function(source, args)
    if source == 0 then return end
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    TriggerClientEvent('ds-reportes:client:mostrarUI', source)
end, 'user')

RegisterNetEvent('ds-reporte:server:sendReport', function(data)   
    local src = source
    local discordWebhookURL = 'https://discord.com/api/webhooks/1028490676905709598/W4s9OGMmqFPm4pLfb8FkYrFDUmAGxlOgoajMrRlMkJraV84f2uY-drU_HWAVoYdqL2Ky'

    local Player = QBCore.Functions.GetPlayer(src)
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local citizenid = Player.PlayerData.citizenid

    local embed = {
        {
            ["title"] = "Reporte de tipo "..data.type,
            ["description"] = data.text,
            ["color"] = 16711680,
            ["fields"] = {
                {
                    ["name"] = "ID | Usuario",
                    ["value"] = src.. " | ".. GetPlayerName(src),
                    ["inline"] = true
                },
                {
                    ["name"] = "PJ",
                    ["value"] = citizenid.." | "..firstName.." "..lastName,
                    ["inline"] = true
                },
            },
            ["footer"] = {
                text = os.date('%Y-%m-%d %H:%M:%S') -- Fecha y hora del reporte
            }
        }
    }

    if data.screenshot then
        embed[1]["image"] = { ["url"] = data.screenshot }
    end

    --print("Datos del embed:", json.encode(embed))

    local payload = {
        username = "Report Bot",
        embeds = embed,
    }

    PerformHttpRequest(discordWebhookURL, function(error, text, headers)
        if error == 200 then
            print("Reporte enviado con éxito")
        else
            print("Error al enviar el reporte:", error, text)
        end
    end, 'POST', json.encode(payload), { ['Content-Type'] = 'application/json' })
end)