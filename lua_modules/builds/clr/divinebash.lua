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

	-- "Bash heals for <em data-base='4'>4</em>% (<em data-base='1'>1</em>% if self) of the cleric's max hp<span class='perLevel'> per rank</span> to the most hurt ally within <em data-base='10'>10</em>m.",

	if e.skill_used ~= Skill['Bash'] then
		return e
	end

	local heal_amount = ally:GetMaxHP() * (rank * 0.04)
	local most_hurt = nil
	local most_hurt_hp = 99
	if ally:GetHPRatio() < most_hurt_hp then
		most_hurt = ally
		most_hurt_hp = ally:GetHPRatio()
	end
	local group = ally:GetGroup()
	local distance = 10 * rank
	for member in group.members do
		if member:GetHPRatio() < most_hurt_hp and
		ally:CalculateDistance(member:GetX(), member:GetY(), member:GetZ()) <= distance then
			most_hurt = member
			most_hurt_hp = member:GetHPRatio()
		end
	end

	if most_hurt == nil then
		return e
	end


	most_hurt:HealDamage(heal_amount)
	builds.Debug(ally, string.format("Divine Bash healed %s for %d.", most_hurt:GetCleanName(), heal_amount))
	return e
end

return skill
