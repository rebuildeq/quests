local activity = require("activity")
local last_message = ""

---@param e NPCEventSpawn
function event_spawn(e)
    local message = activity.InnkeeperSubscribe(e.self)
    if message ~= last_message then
        e.self:Say(message)
    end
    eq.set_timer("activity", 60 * 1000)
end

---@param e NPCEventSay
function event_say(e)
    activity.OnInnkeeperSay(e)
end

---@param e NPCEventTimer
function event_timer(e)
    if e.timer ~= "activity" then
        return
    end
    local message = activity.InnkeeperSubscribe(e.self)
    if message ~= last_message then
        e.self:Say(message)
    end
end