---@param e NPCEventSay
function event_say(e)
    if e.other:IsTaskCompleted(1) then
        e.self:Say("Thank you again for letting me inspect the boots.")
        return
    end

	if e.message:findi("hail") then
		e.self:Say("Have you seen a gnome running around these parts? Ever since he put on those [boots] he has been running like a pack of wolves.")
        return
    end
    if e.message:findi("boots") then
        e.self:Say("He spoke of discovering a ring from an ancient cyclops, and somehow transforming it into a pair of boots. I have no idea how he did it, but I do know that he is now the fastest.")
        e.self:Say("If you [find] a pair of these boots, let me see them and I can perhaps discover the secret behind them.")
        return
    end
    if e.message:findi("find") then
        if not e.other:HasItem(2300) then
            e.self:Say("Perhaps talking to Hasten Bootstrutter will help you find the boots.")
            return
        end
        if e.other:IsTaskActive(1) then
            e.self:Say("Let me know when you finish my task")
            return
        end
        e.self:Emote("inspects the boots closely, and then hands them back to you.")
        e.self:Say("I see that these boots are indeed special. I can tell you that they are embedded with magic, and I can even unlock this magic for you.")
        e.self:Say("However to reveal my findings, help me with a hill giant problem.")
        e.other:AssignTask(1) -- Give Innate Runspeed Task
        e.other:GrantAlternateAdvancementAbility(2001, 1, true)
        return
    end
end
