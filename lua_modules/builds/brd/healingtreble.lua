local skill = {}

---@param e SpellEventSpellBuffTic
---@param caster Client -- who casted the buff
---@param rank integer -- the rank of the skill
function skill.SpellBuffTic(e, caster, rank)
	if not caster or not caster.valid then
		return e
	end

	local ally = e.target
	local builds = require('builds')
	local spell = e.spell
	if not spell or not spell.valid then
		return e
	end
	if spell:ShortBuffBox() == 0 then
		return e
	end
	for i = 0, 13 do
		local effect_id = spell:EffectID(i)
		if effect_id == 0 then -- SE_CURRENTHP
			local effect_value = 0
			-- TODO: fix effect_value
			--local effect_value = e.self:CalcSpellEffectValue(spell:ID(), effect_id, caster:GetLevel(), caster:GetInstrumentMod(spell:ID(), caster, e.tics_remaining, e.caster_id))
			if effect_value < 1 then
				return e
			end
			local bonus_healing = effect_value * (rank * 0.1)
			e.target:HealDamage(bonus_healing, caster)
			builds.Debug(caster, string.format("Healing Treble healed for %d.", bonus_healing))
		end
	end
end

return skill
