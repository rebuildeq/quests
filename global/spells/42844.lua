local builds = require("builds")

-- Affinity Burst
---@param e SpellEventSpellEffect
function event_spell_effect(e)
	return builds.OnSpellEffect(e)
end
