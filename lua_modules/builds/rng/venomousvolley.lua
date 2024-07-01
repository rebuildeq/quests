local skill = {}

---@param e ModCommonDamage
---@param is_my_spell boolean -- is damage from the player
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, is_my_spell, rank)
	if not is_my_spell then
		-- only triggers when player casts a spell
		return e
	end
	local ally = e.attacker
	local builds = require('builds')

	local spell = eq.get_spell(e.spell_id)
	if spell == nil then
		-- only spells valid
		return e
	end
	if spell:AoeRange() > 0 then
		-- aoe spells are not supported
		return e
	end
	if spell:Mana() == 0 then
		-- only spells that cost mana
		return e
	end

	if spell:BuffDuration() < 1 then
		-- only spells that have a duration
		return e
	end
	if e.value > 0 then
		-- only spells that deal damage
		return e
	end
	-- DoT damage is increased by <em data-base='8'>8</em>%<span class='perLevel'> per rank</span>.",
	e.return_value = e.value * (rank * 0.08)

	builds.Debug(ally, string.format("Venomous Volley increased DoT damage by %d.", e.return_value))
	e.ignore_default = true
	e.return_value = e.value + e.return_value
	return e
end

return skill
