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

	if e.spell_id ~= 99999 then -- affinity burst spellid
		return true
	end

	if attacker:IsClient() == false then
		return true
	end

	local num_fire = 0
	local num_cold = 0

	local spells = attacker:CastToClient():GetMemmedSpells()
	if spells ~= nil then
		for _, spell_id in pairs(spells) do
			local spell = eq.get_spell(spell_id)
			if spell ~= nil and eq.is_detrimental_spell(spell_id) then
				if spell:ResistType() == 2 then
					num_fire = num_fire + 1
				elseif spell:ResistType() == 3 then
					num_cold = num_cold + 1
				end
			end
		end
	end

	local spell_id_to_use = 0
	if num_fire > num_cold then
		-- cast fire spell
		spell_id_to_use = 42846
	elseif num_cold > num_fire then
		-- cast cold spell
		spell_id_to_use = 42845
	else
		-- cast a randomly chosen spell between the two
		if math.random(1,100) <= 50 then
			spell_id_to_use = 42846
		else
			spell_id_to_use = 42845
		end
	end

	if spell_id_to_use ~= 0 then
		attacker:SpellFinished(spell_id_to_use, defender)
		rb.Debug(origin, string.format("Affinity Burst applied spell %s to %s", tostring(spell_id_to_use), defender:GetCleanName()))
	else
		rb.Debug(origin, string.format("Affinity Burst failed to apply any spell to %s", defender:GetCleanName()))
	end

	return false
end

return skill
