local skill = {}

---@param e ModCommonDamage
---@param is_my_damage boolean -- is damage from the player
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, is_my_damage, rank)
	if not is_my_damage then
		return e
	end

	local ally = e.attacker
	local builds = require('builds')

	-- When the rogue successfully backstabs an enemy, all enemies that are
	-- hated by the rogue have a reduction of (0.2 * damage) hate per rank.

	if e.skill_used ~= 8 then -- Only works with Backstab
		return e
	end

	local hate_reduction = e.value * 0.2
	local hatelist = ally:GetHateList()
	for ent in hatelist.entries do
		ent.damage = ent.damage - hate_reduction -- Assuming ent.damage is hate amount
	end

	builds.Debug(ally, string.format("Jarring Stab (%d) reduced your hate by your enemies by %d.", rank, hate_reduction))
	return e
end

return skill
