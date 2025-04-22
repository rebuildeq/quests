local vitality = require("vitality")

local function rested(e)
    local message =""
    local v1_pool = tonumber(e.self:GetBucket("vitality_v1")) or 0
    message = message .. "v1: " .. v1_pool .. "<br>"
    local v2_pool = tonumber(e.self:GetBucket("vitality_v2")) or 0
    message = message .. "v2: " .. v2_pool .. "<br>"
    local v3_pool = tonumber(e.self:GetBucket("vitality_v3")) or 0
    message = message .. "v3: " .. v3_pool .. "<br>"
    local total_pool = v1_pool + v2_pool + v3_pool

    if total_pool > 0 then
        message = message .. "Total: " .. total_pool .. "<br>"
    else
        message = message .. "No vitality<br>"
    end


    local vitality_cap = vitality.GetEXPForLevel(e.self:GetLevel()+2) - vitality.GetEXPForLevel(e.self:GetLevel())
    message = message .. "v1 cap: " .. vitality_cap .. "<br>"

    message = message .. "<br>In certain areas across Norrath, players are able to obtain rested vitality.<br>Rested vitality represents your character's rested state, and is consumed as a bonus to normal experience.<br>You are able to obtain rested Vitality while online or offline if you're within a rested area."
    eq.popup("Rested Vitality", message)
end

return rested;