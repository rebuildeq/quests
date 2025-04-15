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
	if not attacker:IsClient() then
		return e
	end

	if e.skill_used ~= Skill['Frenzy'] then
		return e
	end

	local chance = 15 * rank
	local roll = math.random(100)
	if roll > chance then
		return e
	end

	local hatelist = attacker:GetHateList()
	for ent in hatelist.entries do
		if not ent:IsMezzed() and ent:CalculateDistance(attacker:GetX(), attacker:GetY(), attacker:GetZ()) <= 15 then -- within range
			defender:Damage(attacker, e.value, 0, Skill['2HBlunt'], false)
			rb.Debug(origin, string.format("Frenzy Ricochet dealt %d points of damage to %s.", e.value, defender:GetCleanName()))
			return e
		end
	end
	return e
end

return skill
