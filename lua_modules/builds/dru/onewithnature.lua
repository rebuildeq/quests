local skill = {}

local rb = require('rb')

---@param e ModCommonDamage
---@param origin Client # Person who owns the build skill triggering this event
---@param attacker Mob # Mob who is instigating/casting/attacking
---@param defender Mob # Mob who is defender/target of spell/receiving
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
	rb.Debug(origin, string.format("One With Nature restored %d mana.", defender:GetCleanName(), mana_gain))
	return e
end

return skill
