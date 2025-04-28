--- unlock is full of AA unlocks
local unlock = {}

---@param e PlayerEventTaskComplete
function unlock.OnTaskComplete(e)
    local player = e.self
    if player == nil then
        return
    end
    if not player.valid then
        return
    end
    if e.task_id == 1 then
        player:GrantAlternateAdvancementAbility(2001, 2, true)
        player:Message(15, "You have unlocked the ability to run faster!")
        return
    end
end

return unlock