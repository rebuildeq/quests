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

	if not attacker:IsClient() then
		return e
	end

	local mana_gain = e.value * 0.02 * rank
	attacker:SetMana(attacker:GetMana() + mana_gain)
	builds.Debug(origin, string.format("One With Nature restored %d mana.", defender:GetCleanName(), mana_gain))
	return e
end

return skill
