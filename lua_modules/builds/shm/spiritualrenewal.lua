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


	-- All melee attacks gain a 300 mod proc that deals (level * 1.5 * 0.2) magic damage and restores <em data-base='2'>2</em> mana from the target<span class='perLevel'> per rank</span>.",

	-- Only proc off of regular attacks (1hs, 1hb, piercing, etc)
	local melee_skills = {0,1,2,3,7,20,22,28,36,37,51,74,76,77}
	if melee_skills[e.skill_used] == nil then
		return e
	end

	if !builds.Proc(300) then
		return e
	end

	local damage = ally:GetLevel() * 0.75 * (rank * 0.2)
	enemy:Damage(ally, damage, 0, Skill['1HBlunt'], false)
	local mana_gain = 2 * rank
	ally:SetMana(ally:GetMana() + mana_gain)
	ally:Message(MT.FocusEffect, string.format("Spiritual Renewal dealt %d points of damage to %s and restored %d mana.", damage, enemy:GetCleanName(), damage / 2))
	return e
end

return skill
