local skill = {}

---@param e ModCommonDamage
---@param is_my_damage boolean -- is damage from the player
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, is_my_damage, rank)
	if not is_my_damage then
		return e
	end
	local ally = e.self
	local enemy = e.attacker

	if e.skill_used ~= 7 then
		return e
	end

	e.ignore_default = true
	e.return_value = e.value * 0.1 * (5 * rank)

	ally:Message(MT.FocusEffect, string.format("Reinforced Bowstring increased damage by %d.", enemy:GetCleanName(), e.return_value))
	e.return_value = e.value + e.return_value
end

return skill
