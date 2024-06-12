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

	if e.skill_used ~= Skill['Frenzy'] then
		return e
	end

	local chance = 15 * rank
	local roll = math.random(100)
	if roll > chance then
		return e
	end

	local hatelist = ally:GetHateList()
	for ent in hatelist.entries do
		if not ent:IsMezzed() and ent:CalculateDistance(ally:GetX(), ally:GetY(), ally:GetZ()) <= 15 then -- within range
			enemy:Damage(ally, e.value, 0, Skill['2HBlunt'], false)
			builds.Debug(ally, string.format("Frenzy Ricochet dealt %d points of damage to %s.", e.value, enemy:GetCleanName()))
			return e
		end
	end
	return e
end

return skill
