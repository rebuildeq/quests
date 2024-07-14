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

	-- The cleric gains a 300 mod proc that deals (level * 0.75 * <em data-base='0.2'>0.2</em>) magic damage<span class='perLevel'> per rank</span>, and half the damage is returned as health back to the cleric.

	-- Only proc off of regular attacks (1hs, 1hb, piercing, etc)
	local melee_skills = {[0]=1,[1]=1,[2]=1,[3]=1,[7]=1,[20]=1,[22]=1,[28]=1,[36]=1,[37]=1,[51]=1,[74]=1,[76]=1,[77]=1}
	if melee_skills[e.skill_used] == nil then
		return e
	end

	if not builds.IsProcSuccess(attacker, 300, Slot.Primary) then
		return e
	end

	local damage = attacker:GetLevel() * 0.75 * (rank * 0.2)
	defender:Damage(attacker, damage, 0, Skill['1HBlunt'], false)
	attacker:HealDamage(damage / 2)
	builds.Debug(origin, string.format("Believe dealt %d points of damage to %s and healed you for %d.", damage, defender:GetCleanName(), damage / 2))
	return e
end

return skill
