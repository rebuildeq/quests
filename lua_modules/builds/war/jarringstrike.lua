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
	if e.value < 10 then
		return e
	end
	local slam_skills = {[10]=1,[30]=1}
	if slam_skills[e.skill_used] == nil then
		return e
	end

	local chance = 1 * rank
	local roll = math.random(100)
	if roll > chance then
		return e
	end

	local stun_duration = 0.5 * rank
	defender:Stun(stun_duration)
	builds.Debug(attacker, string.format("Jarring Strike stunned %s for %d seconds.", defender:GetCleanName(), stun_duration))
end

return skill