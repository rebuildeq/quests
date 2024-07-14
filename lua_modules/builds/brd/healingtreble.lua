local skill = {}


local builds = require('builds')

---@param e SpellEventSpellBuffTic
---@param origin Client
---@param attacker Mob
---@param defender Mob
---@param rank integer -- the rank of the skill
function skill.SpellBuffTic(e, origin, attacker, defender, rank)
	if origin:GetID() ~= attacker:GetID() then
		return e
	end

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
			--local effect_value = e.self:CalcSpellEffectValue(spell:ID(), effect_id, attacker:GetLevel(), attacker:GetInstrumentMod(spell:ID(), attacker, e.tics_remaining, e.attacker_id))
			if effect_value < 1 then
				return e
			end
			local bonus_healing = effect_value * (rank * 0.1)
			e.target:HealDamage(bonus_healing, attacker)
			builds.Debug(attacker, string.format("Healing Treble healed for %d.", bonus_healing))
		end
	end
end

return skill
