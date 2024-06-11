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


	-- Add 400 mod proc that deals (level * 3 * 0.2) magic damage as well as a fleeting fury buff

	-- Only proc off of regular attacks (1hs, 1hb, piercing, etc)
	local melee_skills = {0,1,2,3,7,20,22,28,36,37,51,74,76,77}
	if melee_skills[e.skill_used] == nil then
		return e
	end

	-- TODO: How to simulate a proc rate? And did Appraisal even benefit from ranks?
	if !builds.IsProcSuccess(ally, 400, Slot.Primary) then
		return e
	end

	ally:ApplySpellBuff(271) -- Fleeting Fury, verify same spell id on Rebuild
	local damage = ally:GetLevel() * 0.6
	enemy:Damage(ally, damage, 0, Skill['1HPiercing'], false)
	ally:Message(MT.FocusEffect, string.format("Appraisal dealt %d points of damage to %s.", damage, enemy:GetCleanName()))

	return e
end

return skill
