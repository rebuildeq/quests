local skill = {}

---@param e ModCommonDamage
---@param is_my_damage boolean -- is damage from the player
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, is_my_damage, rank)
	if e.value < 10 then
		return e
	end
	if not is_my_damage then
		return e
	end
	local ally = e.self
	local enemy = e.attacker

	local slam_skills = {10,30}
	if slam_skills[e.skill_used] == nil then
		return e
	end

	local chance = 1 * rank
	local roll = math.random(100)
	if roll > chance then
		return e
	end

	local stun_duration = 0.5 * rank
	enemy:Stun(stun_duration)
	ally:Message(MT.FocusEffect, string.format("Jarring Strike stunned %s for %d seconds.", enemy:GetCleanName(), stun_duration))
end

return skill
