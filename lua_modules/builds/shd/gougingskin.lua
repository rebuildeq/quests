local skill = {}

---@param e ModCommonDamage
---@param is_my_damage boolean -- is damage from the player
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, is_my_damage, rank)
	if is_my_damage then
		return e
	end
	local ally = e.attacker
	local enemy = e.self

	if ally:GetTarget() ~= enemy then
		return e
	end

	local damage = 4 * rank
	enemy:Damage(ally, damage, 0, Skill['Conjuration'], false)
	ally:Message(MT.FocusEffect, string.format("Gouging Skin dealt %d points of damage to %s.", damage, enemy:GetCleanName()))
end

return skill
