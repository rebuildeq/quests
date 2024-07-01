local skill = {}

---@param e ModCommonDamage
---@param is_my_damage boolean -- is damage from the player
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, is_my_damage, rank)

	if is_my_damage then
		return e
	end

	if e.value <= 0 then
		return e
	end

	local ally = e.self
	local enemy = e.attacker
	local builds = require('builds')

	if ally:GetTarget() == nil or not ally:GetTarget().valid then
		return e
	end
	local target_id = e.self:GetTarget():GetID()

	if target_id ~= enemy:GetID() then
		return e
	end
	if target_id == ally:GetID() then
		return e
	end

	local damage = 4 * rank

	enemy:Damage(ally, damage, 0, Skill['Conjuration'], false)
	builds.Debug(ally, string.format("Gouging Skin (%d) dealt %d points of damage to %s.", rank, damage, enemy:GetCleanName()))
end

return skill
