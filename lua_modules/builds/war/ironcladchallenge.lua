local skill = {}
local rb = require('rb')

---@param e ModCommonDamage
---@param origin Client # Person who owns the build skill triggering this event
---@param attacker Mob # Mob who is instigating/casting/attacking
---@param defender Mob # Mob who is defender/target of spell/receiving
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, origin, attacker, defender, rank)
	if origin:GetID() ~= attacker:GetID() then
		return e
	end

	-- Only proc off of regular attacks (1hs, 1hb, piercing, etc)
	local melee_skills = {[0]=1,[1]=1,[2]=1,[3]=1,[7]=1,[20]=1,[22]=1,[28]=1,[36]=1,[37]=1,[51]=1,[74]=1,[76]=1,[77]=1}
	if melee_skills[e.skill_used] == nil then
		return e
	end

	if not rb.IsProcSuccess(attacker, 300, Slot.Primary) then
		return e
	end

	local damage = attacker:GetLevel() * 0.75 * (rank * 0.2)
	defender:Damage(attacker, damage, 0, Skill['1HBlunt'], false)
	defender:SetHate(attacker, defender:GetHateAmount(attacker, false)+damage)
	attacker:HealDamage(damage / 2)
	rb.Debug(origin, string.format("Ironclad Challenge dealt %d points of damage to %s and added double hate.", damage, defender:GetCleanName()))
	return e
end

return skill
