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

	if e.spell_id ~= 42842 then -- verdant ruin spellid
		return true
	end

	if attacker:IsClient() == false then
		return true
	end

	local spells = attacker:CastToClient():GetMemmedSpells()
	if spells == nil then
		return true
	end

	local found_spells = {}
	for _, spell_id in pairs(spells) do
		local spell = eq.get_spell(spell_id)
		if spell ~= nil and eq.is_detrimental_spell(spell_id) then
			if spell:BuffDuration() > 0 then
				-- Check all effects for Current HP effect, this helps filter out spells like Ice that are detrimental and have a duration but is actually a nuke
				for i=0,11 do
					if spell:EffectID(i) == 0 and spell:Base(i) ~= 0 then
						found_spells[spell_id] = spell:Mana()
						break
					end
					--eq.debug(tostring(i))
				end
				--found_spells[spell_id] = spell:Mana()
			end
		end
	end

	if next(found_spells) == nil then
		return true
	end

	local keys = {}
	for k, v in pairs(found_spells) do
		table.insert(keys, {key = k, value = v})
	end

	table.sort(keys, function(a, b)
		return a.value > b.value
	end)

	local spells_cast = 0
	for _, entry in pairs(keys) do
		if spells_cast >= 2 then
			break
		end
		attacker:SpellFinished(entry.key, defender)
		rb.Debug(origin, string.format("Verdant Ruin applied spell %s to %s", eq.get_spell(entry.key):Name(), defender:GetCleanName()))
		spells_cast = spells_cast + 1
	end

	return false
end

return skill
