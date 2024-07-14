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
	if not attacker:HasOwner() then
		return e
	end
	if not attacker:IsPet() then
		return e
	end
	if attacker:GetOwnerID() ~= origin:GetID() then
		return e
	end
	-- Increases the damage of your pet by <em data-base='10'>10</em>%<span class='perLevel'> per rank</span>.

	-- Only regular attacks (1hs, 1hb, piercing, etc)
	local melee_skills = {[0]=1,[1]=1,[2]=1,[3]=1,[7]=1,[20]=1,[22]=1,[28]=1,[36]=1,[37]=1,[51]=1,[74]=1,[76]=1,[77]=1}
	if melee_skills[e.skill_used] == nil then
		return e
	end

	e.return_value = e.value * (rank * 0.1)
	builds.Debug(origin, string.format("Animal Bond increased damage of %s by %d.", attacker:GetCleanName(), e.return_value))
	e.return_value = e.return_value + e.value
	return e
end

return skill
