local skill = {}

---@param e ModCommonDamage
---@param is_my_damage boolean -- is damage from the player
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, is_my_damage, rank)
	if is_my_damage then
		return e
	end
	local ally = e.self
	local enemy = e.attacker
	local builds = require('builds')
	if not ally:IsClient() then
		return e
	end

	local mana_gain = e.value * 0.02 * rank
	ally:SetMana(ally:GetMana() + mana_gain)
	builds.Debug(ally, string.format("One With Nature restored %d mana.", enemy:GetCleanName(), mana_gain))
	return e
end

return skill
