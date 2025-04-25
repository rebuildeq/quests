local builds = require("builds")

-- Warder Recall
---@param e SpellEventSpellEffect
function event_spell_effect(e)
	return builds.OnSpellEffect(e)
end
