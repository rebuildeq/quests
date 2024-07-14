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
	if e.skill_used ~= 7 then
		return e
	end

	e.ignore_default = true
	e.return_value = e.value * 0.1 * (5 * rank)

	builds.Debug(attacker, string.format("Reinforced Bowstring increased damage by %d.", e.return_value))
	e.return_value = e.value + e.return_value
end

return skill
