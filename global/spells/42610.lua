local builds = require("builds")

-- Winds of Malaise
---@param e SpellEventSpellEffect
function event_spell_effect(e)
	return builds.OnSpellEffect(e)
end
