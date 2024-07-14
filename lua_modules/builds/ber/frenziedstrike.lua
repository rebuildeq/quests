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

	if not attacker:IsClient() then
		return e
	end

	-- All melee attacks gain a 300 mod proc that deals (level * 1.25 * <em data-base='0.2'>0.2</em>) magic damage per rank.",

	-- Only proc off of regular attacks (1hs, 1hb, piercing, etc)
	local melee_skills = {[0]=1,[1]=1,[2]=1,[3]=1,[7]=1,[20]=1,[22]=1,[28]=1,[36]=1,[37]=1,[51]=1,[74]=1,[76]=1,[77]=1}
	if melee_skills[e.skill_used] == nil then
		return e
	end

	if not builds.IsProcSuccess(attacker, 400, Slot.Primary) then
		return e
	end

	local damage = origin:GetLevel() * 1.50 * (rank * 0.2)
	defender:Damage(attacker, damage, 0, Skill['1HBlunt'], false)
	builds.Debug(origin, string.format("Intensified Training dealt %d points of damage to %s.", damage, defender:GetCleanName()))
	return e
end

return skill
