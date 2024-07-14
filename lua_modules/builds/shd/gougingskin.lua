local skill = {}
local builds = require('builds')

---@param e ModCommonDamage
---@param origin Client # Person who owns the build skill triggering this event
---@param attacker Mob # Mob who is instigating/casting/attacking
---@param defender Mob # Mob who is defender/target of spell/receiving
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, origin, attacker, defender, rank)
	if origin:GetID() == attacker:GetID() then
		return e -- only when attacker is someone else
	end
	if e.value <= 0 then
		return e
	end

	if defender:GetTarget() == nil or not defender:GetTarget().valid then
		return e
	end
	local target_id = e.self:GetTarget():GetID()

	if target_id ~= attacker:GetID() then
		return e
	end
	if target_id == defender:GetID() then
		return e
	end

	local damage = 4 * rank

	attacker:Damage(defender, damage, 0, Skill['Conjuration'], false)
	builds.Debug(origin, string.format("Gouging Skin (%d) dealt %d points of damage to %s.", rank, damage, attacker:GetCleanName()))
end

return skill
