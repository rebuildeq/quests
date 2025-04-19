local builds = require("builds")

-- Cannibalization
---@param e SpellEventSpellEffect
function event_spell_effect(e)
	return builds.OnSpellEffect(e)
end


