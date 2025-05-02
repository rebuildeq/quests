local builds = require("builds")

-- Verdant Ruin
---@param e SpellEventSpellEffect
function event_spell_effect(e)
	return builds.OnSpellEffect(e)
end
