local skill = {}

---@param e ModCommonDamage
---@param is_my_damage boolean -- is damage from the player
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, is_my_damage, rank)
	if not is_my_damage then
		return e
	end
	if not e.attacker:HasOwner() then
		return e
	end
	local ally = e.attacker
	if not ally:IsPet() then
		return e
	end
	local owner = ally:GetOwner()
	if not owner:IsClient() then
		return e
	end

	local enemy = e.self
	local builds = require('builds')

	-- Increases the damage of your pet by <em data-base='10'>10</em>%<span class='perLevel'> per rank</span>.

	-- Only regular attacks (1hs, 1hb, piercing, etc)
	local melee_skills = {0,1,2,3,7,20,22,28,36,37,51,74,76,77}
	if melee_skills[e.skill_used] == nil then
		return e
	end

	e.return_value = e.value * (rank * 0.1)
	builds.Debug(owner, string.format("Animal Bond increased damage of %s by %d.", ally:GetCleanName(), e.return_value))
	e.return_value = e.return_value + e.value
	return e
end

return skill
