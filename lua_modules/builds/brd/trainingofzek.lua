local skill = {}

---@param e ModCommonDamage
---@param is_my_damage boolean -- is damage from the player
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, is_my_damage, rank)
	if not is_my_damage then
		return e
	end
	local ally = e.attacker
	local enemy = e.self
	local builds = require('builds')
	if not ally:IsClient() then
		return e
	end


	-- Increases melee damage by <em data-base='20'>20</em>%<span class='perLevel'> per rank</span>.",

	-- Only regular attacks (1hs, 1hb, piercing, etc)
	local melee_skills = {0,1,2,3,7,20,22,28,36,37,51,74,76,77}
	if melee_skills[e.skill_used] == nil then
		return e
	end

	e.return_value = e.value * (rank * 0.2)
	builds.Debug(ally, string.format("Training of Zek increased damage by %d.", e.return_value))
	e.return_value = e.return_value + e.value
	return e
end

return skill
