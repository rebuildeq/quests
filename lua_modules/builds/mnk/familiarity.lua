local skill = {}

local rb = require('rb')

---@param e ModCheckHitChance
---@param origin Client # Person who owns the build skill triggering this event
---@param attacker Mob # Mob who is instigating/casting/attacking
---@param defender Mob # Mob who is defender/target of spell/receiving
---@param rank integer - the rank of the skill
function CheckHitChance(e, origin, attacker, defender, rank)
	if origin:GetID() ~= attacker:GetID() then
		return e
	end
	local acc_bonus = tonumber(defender:GetBucket(string.format("%d_familiarity", attacker:CastToClient():CharacterID())))
	if acc_bonus == 0 then
		return e
	end

	local old_hit = e.hit.tohit
	e.IgnoreDefault = true
	e.hit.tohit = e.hit.tohit * (acc_bonus * 0.01)
	rb.Debug(origin, string.format("Familiarity increased accuracy from %d to %d.", old_hit, e.hit.tohit))
	return e
end

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

	local acc_bonus = tonumber(defender:GetBucket(string.format("%d_familiarity", attacker:CastToClient():CharacterID())))
	local acc_original_bonus = acc_bonus
	acc_bonus = acc_bonus + rank
	local acc_max = rank * 10
	if acc_bonus > acc_max then
		acc_bonus = acc_max
	end
	if acc_bonus ~= acc_original_bonus then
		defender:SetBucket(string.format("%d_familiarity", attacker:CastToClient():CharacterID()), acc_bonus)
	end

	rb.Debug(origin, string.format("Familiarity increased accuracy to %d/%d.", acc_bonus, acc_max))
	return e
end

return skill
