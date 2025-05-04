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

	if e.spell_id ~= 42844 then -- nature's judgment spellid
		return true
	end

	if attacker:IsClient() == false then
		return true
	end

	local spells = attacker:CastToClient():GetMemmedSpells()
	local found_spells = {}
	if spells ~= nil then
		for _, spell_id in pairs(spells) do
			local spell = eq.get_spell(spell_id)
			local is_spell_valid = false
			if spell == nil then
				is_spell_valid = false
			elseif eq.is_detrimental_spell(spell_id) == false then
				is_spell_valid = false
			else
				is_spell_valid = true

				for i=0,11 do
					if spell:EffectID(i) == 0 and math.abs(spell:Base(i)) > 20 then -- current hp
						is_spell_valid = false
						break
					end

					if spell:EffectID(i) == 79 and math.abs(spell:Base(i)) > 20 then -- current hp once, could be something like a root so check base amount
						is_spell_valid = false
						break
					end
				end
			end

			if is_spell_valid then
				found_spells[spell_id] = true
			end
		end
	end

	for k, v in pairs(found_spells) do
		attacker:SpellFinished(k, defender)
		rb.Debug(origin, string.format("Nature's Judgment applied spell %s to %s", tostring(k), defender:GetCleanName()))
	end

	return false
end

return skill
