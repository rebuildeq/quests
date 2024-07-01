local skill = {}

---@param e ModCheckHitChance
---@param is_my_hit boolean -- is hit from the player
---@param rank integer - the rank of the skill
function CheckHitChance(e, is_my_hit, rank)
	if not is_my_hit then
		return e
	end
	local ally = e.other
	local enemy = e.self
	local builds = require('builds')

	local acc_bonus = tonumber(enemy:GetBucket(string.format("%d_familiarity", ally:CastToClient():CharacterID())))
	if acc_bonus == 0 then
		return e
	end

	local old_hit = e.hit.tohit
	e.IgnoreDefault = true
	e.hit.tohit = e.hit.tohit * (acc_bonus * 0.01)
	builds.Debug(ally, string.format("Familiarity increased accuracy from %d to %d.", old_hit, e.hit.tohit))
	return e
end

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
	if not ally:IsClient() then
		return e
	end

	local acc_bonus = tonumber(enemy:GetBucket(string.format("%d_familiarity", ally:CastToClient():CharacterID())))
	local acc_original_bonus = acc_bonus
	acc_bonus = acc_bonus + rank
	local acc_max = rank * 10
	if acc_bonus > acc_max then
		acc_bonus = acc_max
	end
	if acc_bonus ~= acc_original_bonus then
		enemy:SetBucket(string.format("%d_familiarity", ally:CastToClient():CharacterID()), acc_bonus)
	end

	builds.Debug(ally, string.format("Familiarity increased accuracy to %d/%d.", acc_bonus, acc_max))
	return e
end

return skill
