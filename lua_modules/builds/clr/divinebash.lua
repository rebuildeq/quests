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

	-- "Bash heals for <em data-base='4'>4</em>% (<em data-base='1'>1</em>% if self) of the cleric's max hp<span class='perLevel'> per rank</span> to the most hurt attacker within <em data-base='10'>10</em>m.",

	if e.skill_used ~= Skill['Bash'] then
		return e
	end

	local heal_amount = attacker:GetMaxHP() * (rank * 0.04)
	local most_hurt = nil
	local most_hurt_hp = 99
	if attacker:GetHPRatio() < most_hurt_hp then
		most_hurt = attacker
		most_hurt_hp = attacker:GetHPRatio()
	end
	local group = attacker:GetGroup()
	local distance = 10 * rank
	for member in group.members do
		if member:GetHPRatio() < most_hurt_hp and
		attacker:CalculateDistance(member:GetX(), member:GetY(), member:GetZ()) <= distance then
			most_hurt = member
			most_hurt_hp = member:GetHPRatio()
		end
	end

	if most_hurt == nil then
		return e
	end


	most_hurt:HealDamage(heal_amount)
	rb.Debug(origin, string.format("Divine Bash healed %s for %d.", most_hurt:GetCleanName(), heal_amount))
	return e
end

return skill
