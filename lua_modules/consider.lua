local consider = {}
local ability = require("ability")

---@param e PlayerEventConsider
---@return boolean # true if the command was handled
function consider.con_npc(e)
	local target = eq.get_entity_list():GetMobID(e.entity_id)


    if not target.valid then
        return false
    end
    if not target:IsNPC() then
        return false
    end
    local npc = target:CastToNPC()


	if e.self:Admin() > 80 then
		local abilities = ability.Abilities(npc)
		local ai_name = npc:GetBucket(string.format("ability_%d_%d_ai", eq.get_zone_id(), npc:GetID()))
		local ability_string = ""
		for _, a in ipairs(abilities) do
			ability_string = ability_string .. a.Ability.Name .. " "
		end
		e.self:Message(MT.White, string.format("(GM): %s has AI of %s and abilities: %s", npc:GetCleanName(), ai_name, ability_string))
	end

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
	if tag_string == "" then
		tag_string = "None"
	end

    e.self:Message(MT.White, string.format("%s (%s) is a %s %s npc with npctypeid %d %s and hp %d xp %d (ratio %d)", npc:GetCleanName(), tag_string, rare_flag, raid_flag, npc:GetID(), spawnGroupMsg, hp, base_exp, ratio));
	return true
end

---@param e PlayerEventConsider
---@return boolean # true if the command was handled
function consider.con_player(e)
	local target = eq.get_entity_list():GetMobID(e.entity_id)

    if not target.valid then
        return false
    end
    if not target:IsClient() then
        return false
    end

	local tag_string = target:Tags()
	if tag_string == "" then
		tag_string = "None"
	end


    local client = target:CastToClient()
    e.self:Message(MT.White, string.format("%s (%s) is a player", target:GetCleanName(), tag_string));
    return true
end

---@param e PlayerEventConsider
---@return boolean # true if the command was handled
function consider.con_corpse(e)
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

return consider