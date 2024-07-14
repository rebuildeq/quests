local skill = {}
local builds = require('builds')

---@param e ModCommonDamage
---@param origin Client
---@param attacker Mob
---@param defender Mob
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, origin, attacker, defender, rank)
	if origin:GetID() ~= attacker:GetID() then
		return e
	end

	-- When the rogue successfully backstabs an enemy, all enemies that are
	-- hated by the rogue have a reduction of (0.2 * damage) hate per rank.

	if e.skill_used ~= 8 then -- Only works with Backstab
		return e
	end

	local hate_reduction = e.value * 0.2
	local hatelist = attacker:GetHateList()
	for ent in hatelist.entries do
		ent.damage = ent.damage - hate_reduction -- Assuming ent.damage is hate amount
	end

	builds.Debug(origin, string.format("Jarring Stab (%d) reduced your hate by your enemies by %d.", rank, hate_reduction))
	return e
end

return skill
