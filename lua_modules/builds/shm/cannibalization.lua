local skill = {}
local rb = require('rb')

---@param e SpellEventSpellEffect
---@param origin Client # Person who owns the build skill triggering this event
---@param attacker Mob # Mob who is instigating/casting/attacking
---@param defender Mob # Mob who is defender/target of spell/receiving
---@param rank integer -- the rank of the skill
---@return boolean
function skill.SpellEffect(e, origin, attacker, defender, rank)
	if origin:GetID() ~= attacker:GetID() then
		return true
	end

	if e.spell_id ~= 2749 then
		return true
	end

	e.spell_id = 0

	local damage = attacker:GetHP() * 0.5
	defender:Damage(attacker, damage, 2749, Skill['Evocation'], false)
	local mana_gain = damage * 0.5
	defender:SetMana(attacker:GetMana() + mana_gain)

	rb.Debug(origin, string.format("Cannibalization dealt %d points of damage to %s and restored %d mana.", damage, defender:GetCleanName(), mana_gain))
	return false
end

return skill
