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
	-- DoT damage is increased by <em data-base='6'>6</em>%<span class='perLevel'> per rank</span>.",
	e.return_value = e.value * (rank * 0.06)

	builds.Debug(attacker, string.format("Corruption increased DoT damage by %d.", e.return_value))
	e.ignore_default = true
	e.return_value = e.value + e.return_value
	return e
end

return skill
