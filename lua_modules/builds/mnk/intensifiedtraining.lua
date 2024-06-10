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


	-- All melee attacks gain a 300 mod proc that deals (level * 1.25 * <em data-base='0.2'>0.2</em>) magic damage per rank.",

	-- Only proc off of regular attacks (1hs, 1hb, piercing, etc)
	local melee_skills = {0,1,2,3,7,20,22,28,36,37,51,74,76,77}
	if melee_skills[e.skill_used] == nil then
		return e
	end

	if !builds.Proc(300) then
		return e
	end

	local damage = ally:GetLevel() * 1.25 * (rank * 0.2)
	enemy:Damage(ally, damage, 0, Skill['1HBlunt'], false)
	ally:Message(MT.FocusEffect, string.format("Intensified Training dealt %d points of damage to %s.", damage, enemy:GetCleanName()))
	return e
end

return skill
