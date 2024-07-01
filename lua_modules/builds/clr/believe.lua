local skill = {}

---@param e ModCommonDamage
---@param is_my_damage boolean -- is damage from the player
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, is_my_damage, rank)
	if not is_my_damage then
		return e
	end
	local ally = e.attacker
	local enemy = e.self
	local builds = require('builds')
	if not ally:IsClient() then
		return e
	end


	-- The cleric gains a 300 mod proc that deals (level * 0.75 * <em data-base='0.2'>0.2</em>) magic damage<span class='perLevel'> per rank</span>, and half the damage is returned as health back to the cleric.

	-- Only proc off of regular attacks (1hs, 1hb, piercing, etc)
	local melee_skills = {0,1,2,3,7,20,22,28,36,37,51,74,76,77}
	if melee_skills[e.skill_used] == nil then
		return e
	end

	if not builds.IsProcSuccess(ally, 300, Slot.Primary) then
		return e
	end

	local damage = ally:GetLevel() * 0.75 * (rank * 0.2)
	enemy:Damage(ally, damage, 0, Skill['1HBlunt'], false)
	ally:HealDamage(damage / 2)
	builds.Debug(ally, string.format("Believe dealt %d points of damage to %s and healed you for %d.", damage, enemy:GetCleanName(), damage / 2))
	return e
end

return skill
