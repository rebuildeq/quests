
local ability = require("ability")

---@param e NPCEventSpawn
function event_spawn(e)

	e.self:AddCardDrops()

    -- peq_halloween
    if (eq.is_content_flag_enabled("peq_halloween")) then
        -- exclude mounts and pets
        if (e.self:GetCleanName():findi("mount") or e.self:IsPet()) then
            return;
        end

        -- soulbinders
        -- priest of discord
        if (e.self:GetCleanName():findi("soulbinder") or e.self:GetCleanName():findi("priest of discord")) then
            e.self:ChangeRace(eq.ChooseRandom(14,60,82,85));
            e.self:ChangeSize(6);
            e.self:ChangeTexture(1);
            e.self:ChangeGender(2);
        end

        -- Shadow Haven
        -- The Bazaar
        -- The Plane of Knowledge
        -- Guild Lobby
        local halloween_zones = eq.Set { 202, 150, 151, 344 }
        local not_allowed_bodytypes = eq.Set { 11, 60, 66, 67 }
        if (halloween_zones[eq.get_zone_id()] and not_allowed_bodytypes[e.self:GetBodyType()] == nil) then
            e.self:ChangeRace(eq.ChooseRandom(14,60,82,85));
            e.self:ChangeSize(6);
            e.self:ChangeTexture(1);
            e.self:ChangeGender(2);
        end
    end
end

---@param e NPCEventCombat
function event_combat(e)
	eq.debug("on aggro")
	local a, signal_frequency = ability.OnNPCAggro(e.self)
	if a ~= nil and signal_frequency > 0 then
		eq.debug("triggering timer at " .. signal_frequency .. " seconds for NPC " .. e.self:GetCleanName())
		eq.set_timer("ability_timer", signal_frequency * 1000)
	end
end

---@param e NPCEventDeath
function event_death(e)
	ability.Flush(e.self)
end


---@param e NPCEventTimer
function event_timer(e)
	if e.timer == "ability_timer" then
		eq.debug("triggering timer for NPC " .. e.self:GetCleanName())
		ability.OnTick(e.self)
	end
end
