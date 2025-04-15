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


	-- Add 400 mod proc that deals (level * 3 * 0.2) magic damage as well as a fleeting fury buff

	-- Only proc off of regular attacks (1hs, 1hb, piercing, etc)
	local melee_skills = {[0]=1,[1]=1,[2]=1,[3]=1,[7]=1,[20]=1,[22]=1,[28]=1,[36]=1,[37]=1,[51]=1,[74]=1,[76]=1,[77]=1}
	if melee_skills[e.skill_used] == nil then
		return e
	end

	local passed_check = false
	for i, curskill in ipairs(melee_skills) do
		if curskill == e.skill_used then
			passed_check = true
			break
		end
	end
	if not passed_check then
		return e
	end

	-- TODO: Appraisal doesn't currently benefit from ranks
	if not rb.IsProcSuccess(attacker, 400, Slot.Primary) then
	  return e
	end

	attacker:ApplySpellBuff(271) -- Fleeting Fury
	local damage = attacker:GetLevel() * 0.6
	defender:Damage(attacker, damage, 0, Skill['Evocation'], false) -- Evocation so appraisal doesn't proc itself
	rb.Debug(attacker, string.format("Appraisal (%d) dealt %d points of damage to %s.", rank, damage, defender:GetCleanName()))
	return e
end

return skill
