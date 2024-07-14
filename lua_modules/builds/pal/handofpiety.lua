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

	-- "All melee attacks gain a 100 mod proc that deals (level * 3 * <em data-base='0.2'>0.2</em>) magic damage and heals the most hurt attacker for (level * 3 * <em data-base='0.2'>0.2</em>) within 100m<span class='perLevel'> per rank</span>.",

	-- Only proc off of regular attacks (1hs, 1hb, piercing, etc)
	local melee_skills = {[0]=1,[1]=1,[2]=1,[3]=1,[7]=1,[20]=1,[22]=1,[28]=1,[36]=1,[37]=1,[51]=1,[74]=1,[76]=1,[77]=1}
	if melee_skills[e.skill_used] == nil then
		return e
	end

	if not builds.IsProcSuccess(attacker, 100, Slot.Primary) then
		return e
	end

	local damage = attacker:GetLevel() * 3 * (rank * 0.2)
	defender:Damage(attacker, damage, 0, Skill['1HBlunt'], false)
	local heal_amount = attacker:GetMaxHP() * (rank * 0.04)
	local most_hurt = nil
	local most_hurt_hp = 99
	if attacker:GetHPRatio() < most_hurt_hp then
		most_hurt = attacker
		most_hurt_hp = attacker:GetHPRatio()
	end
	local group = attacker:GetGroup()
	local distance = 100
	for member in group.members do
		if member:GetHPRatio() < most_hurt_hp and
		attacker:CalculateDistance(member:GetX(), member:GetY(), member:GetZ()) <= distance then
			most_hurt = member
			most_hurt_hp = member:GetHPRatio()
		end
	end

	if most_hurt == nil then
		builds.Debug(origin, string.format("Hand of Piety dealt %d points of damage to %s.", damage, defender:GetCleanName()))
		return e
	end

	builds.Debug(origin, string.format("Hand of Piety dealt %d points of damage to %s and healed you for %d.", damage, defender:GetCleanName(), damage))
	most_hurt:HealDamage(heal_amount)
	return e
end

return skill
