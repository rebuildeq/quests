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

	-- "All melee attacks gain a 100 mod proc that deals (level * 3 * <em data-base='0.2'>0.2</em>) magic damage and heals the most hurt ally for (level * 3 * <em data-base='0.2'>0.2</em>) within 100m<span class='perLevel'> per rank</span>.",

	-- Only proc off of regular attacks (1hs, 1hb, piercing, etc)
	local melee_skills = {0,1,2,3,7,20,22,28,36,37,51,74,76,77}
	if melee_skills[e.skill_used] == nil then
		return e
	end

	if not builds.IsProcSuccess(ally, 100, Slot.Primary) then
		return e
	end

	local damage = ally:GetLevel() * 3 * (rank * 0.2)
	enemy:Damage(ally, damage, 0, Skill['1HBlunt'], false)
	local heal_amount = ally:GetMaxHP() * (rank * 0.04)
	local most_hurt = nil
	local most_hurt_hp = 99
	if ally:GetHPRatio() < most_hurt_hp then
		most_hurt = ally
		most_hurt_hp = ally:GetHPRatio()
	end
	local group = ally:GetGroup()
	local distance = 100
	for member in group.members do
		if member:GetHPRatio() < most_hurt_hp and
		ally:CalculateDistance(member:GetX(), member:GetY(), member:GetZ()) <= distance then
			most_hurt = member
			most_hurt_hp = member:GetHPRatio()
		end
	end

	if most_hurt == nil then
		builds.Debug(ally, string.format("Hand of Piety dealt %d points of damage to %s.", damage, enemy:GetCleanName()))
		return e
	end

	builds.Debug(ally, string.format("Hand of Piety dealt %d points of damage to %s and healed you for %d.", damage, enemy:GetCleanName(), damage))
	most_hurt:HealDamage(heal_amount)
	return e
end

return skill
