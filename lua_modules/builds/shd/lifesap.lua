local skill = {}

---@param e ModCommonDamage
---@param is_my_damage boolean -- is damage from the player
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, is_my_damage, rank)
	if e.value < 10 then
		return e
	end
	if not is_my_damage then
		return e
	end
	local ally = e.self
	local enemy = e.attacker

	local melee_skills = {0,1,2,3,7,8,10,20,21,22,23,26,28,30,36,37,38,51,52,74,76,77}
	if melee_skills[e.skill_used] == nil then
		return e
	end

	local chance = 1 * rank
	local roll = math.random(100)
	if roll > chance then
		return e
	end

	local heal_amount = e.value * (0.1 * rank)
	ally:HealDamage(heal_amount)
	ally:Message(MT.FocusEffect, string.format("Life Sap healed you for %d points of damage.", heal_amount))
end

return skill
