
---@param e PlayerEventConsider
---@return boolean # true if the command was handled
function con_npc(e)
	local target = eq.get_entity_list():GetMobID(e.entity_id)

    if not target.valid then
        return false
    end
    if not target:IsNPC() then
        return false
    end
    local npc = target:CastToNPC()

	local rare_flag = "normal"
	if npc:IsRareSpawn() then
		rare_flag = "rare"
	end

	local raid_flag = "non-raid"
	if npc:IsRaidTarget() then
		raid_flag = "raid"
	end

	local experience = require('experience')

    local base_exp = experience.get_base(target)
	local hp = target:GetMaxHP()
	local ratio = base_exp / hp

    local spawnGroupMsg = ""

	local sp2 = npc:GetSp2()
    if not sp2 then
        spawnGroupMsg = "and has no spawn info"
    else
		spawnGroupMsg = string.format("and is part of spawngroup %d", sp2)
    end
	local tag_string = target:Tags()
	if tag_string ~= "" then
		tag_string = "[" .. tag_string .. "]"
	end

    e.self:Message(MT.White, string.format("%s %s is a %s %s npc with npctypeid %d %s and hp %d xp %d (ratio %d)", npc:GetCleanName(), tag_string, rare_flag, raid_flag, npc:GetID(), spawnGroupMsg, hp, base_exp, ratio));
	local mighty_multiplier = require("mighty_multiplier")
	local msg_out, _ = mighty_multiplier.good_damage_bonus(e.self, npc)
	local msg_in, _ = mighty_multiplier.bad_damage_penalty(e.self, npc)

	e.self:Message(MT.White, string.format("mighty out: %s, in: %s", msg_out, msg_in))
    return true
end

---@param e PlayerEventConsider
---@return boolean # true if the command was handled
function con_player(e)
	local target = eq.get_entity_list():GetMobID(e.entity_id)

    if not target.valid then
        return false
    end
    if not target:IsClient() then
        return false
    end

	local tag_string = target:Tags()
	if tag_string ~= "" then
		tag_string = "[" .. tag_string .. "]"
	end


    local client = target:CastToClient()
    e.self:Message(MT.White, string.format("%s %s is a player", target:GetCleanName(), tag_string));
    return true
end

---@param e PlayerEventConsider
---@return boolean # true if the command was handled
function con_corpse(e)
	local target = eq.get_entity_list():GetMobID(e.entity_id)

    if not target.valid then
        return false
    end
    if not target:IsCorpse() then
        return false
    end
    e.self:Message(MT.White, string.format("%s is a corpse with id ", target:GetCleanName(), target:GetID()));
    return true
end
