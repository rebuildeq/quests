local skill = {}

local builds = require('builds')

---@param e ModCommonDamage
---@param origin Client # Person who owns the build skill triggering this event
---@param attacker Mob # Mob who is instigating/casting/attacking
---@param defender Mob # Mob who is defender/target of spell/receiving
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, origin, attacker, defender, rank)
	if origin:GetID() ~= attacker:GetID() then
		return e
	end

	-- Increases melee damage by <em data-base='20'>20</em>%<span class='perLevel'> per rank</span>.",

	-- Only regular attacks (1hs, 1hb, piercing, etc)
	local melee_skills = {0,1,2,3,7,20,22,28,36,37,51,74,76,77}
	if melee_skills[e.skill_used] == nil then
		return e
	end

	e.return_value = e.value * (rank * 0.2)
	builds.Debug(attacker, string.format("Training of Zek increased damage by %d.", e.return_value))
	e.return_value = e.return_value + e.value
	return e
end

return skill
