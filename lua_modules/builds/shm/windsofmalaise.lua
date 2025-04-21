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

	if e.spell_id ~= 42610 then
		return true
	end

	-- Get all mobs close to the defender (target of the spell)
	local cml = eq.get_entity_list():GetCloseMobList(defender, 50 * rank) -- 50 * rank is the range of the spell
	for close in cml.entries do
		if close.valid then
			-- Get the close mob's hatelist and see if the attacker is in it
			local hl = close:GetHateList()
			for hated in hl.entries do
				if hated.valid and hated.ent:IsClient() and hated.ent:GetID() == attacker:GetID() then
					origin:SpellFinished(1578, close) -- For now, just cast Malo
				end
			end
		end
	end

	return false
end

return skill
