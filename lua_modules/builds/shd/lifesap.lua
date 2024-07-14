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
	local attacker = e.self

	local melee_skills = {[0]=1,[1]=1,[2]=1,[3]=1,[7]=1,[20]=1,[22]=1,[28]=1,[36]=1,[37]=1,[51]=1,[74]=1,[76]=1,[77]=1}
	if melee_skills[e.skill_used] == nil then
		return e
	end

	local chance = 1 * rank
	local roll = math.random(100)
	if roll > chance then
		return e
	end

	local heal_amount = e.value * (0.1 * rank)
	attacker:HealDamage(heal_amount)
	builds.Debug(attacker, string.format("Life Sap healed you for %d points of damage.", heal_amount))
end

return skill
