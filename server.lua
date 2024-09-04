local webhookURL = ""

local function sendToDiscord(playerId)
    local playerName = GetPlayerName(playerId)
    local discordId = nil

    for _, identifier in ipairs(GetPlayerIdentifiers(playerId)) do
        if string.match(identifier, "discord:") then
            discordId = string.sub(identifier, 9)
            break
        end
    end

    if discordId then
        PerformHttpRequest(webhookURL, function(err, text, headers) end, 'POST', json.encode({
            username = "Insert Logger",
            embeds = {{
                ["color"] = 16711680,
                ["title"] = "Stlačený pravý Insert",
                ["description"] = "**Nick:** " .. playerName .. "\n**Discord ID:** " .. discordId,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }}
        }), { ['Content-Type'] = 'application/json' })
    else
        print("Discord ID nebolo možné nájsť pre hráča " .. playerName)
    end
end

RegisterServerEvent("checkInsertKey")
AddEventHandler("checkInsertKey", function()
    local _source = source
    sendToDiscord(_source)
end)
