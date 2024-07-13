local ability = require("ability")
local guildmaster = require("guildmaster")
local autoscribe = require("autoscribe")

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
	-- local a, signal_frequency = ability.OnNPCAggro(e.self)
	-- if a ~= nil and signal_frequency > 0 then
	-- 	eq.set_timer("ability_timer", signal_frequency * 1000)
	-- end
end

---@param e NPCEventDeath
function event_death(e)
	ability.Flush(e.self)
end


---@param e NPCEventTimer
function event_timer(e)
	if e.timer == "ability_timer" then
		eq.stop_timer(e.timer)
		eq.debug("triggering timer for NPC " .. e.self:GetCleanName())
		local next_timer = ability.OnTick(e.self)

		eq.debug("next timer at " .. next_timer .. " seconds for NPC " .. e.self:GetCleanName())
		if next_timer > 0 then
			eq.set_timer("ability_timer", next_timer * 1000)
		end
	end
end

---@param e NPCEventSay
function event_say(e)
	guildmaster.OnSay(e)
	autoscribe.OnSay(e)
end