local skill = {}
local rb = require('rb')

---@param e ModHealDamage
---@param origin Client # Person who owns the build skill triggering this event
---@param attacker Mob # Mob who is instigating/casting/attacking
---@param defender Mob # Mob who is defender/target of spell/receiving
---@param rank integer -- the rank of the skill
function skill.HealDamage(e, origin, attacker, defender, rank)
	if attacker:IsClient() == false then
		return e
	end

	local spell = eq.get_spell(e.spell_id)

	if spell == nil then
		-- only spells valid
		return e
	end
	if spell:AoeRange() > 0 then
		-- aoe spells are not supported -- could also check targettype ~= 5
		return e
	end
	if spell:Mana() == 0 then
		-- only spells that cost mana
		return e
	end
	if e.value <= 0 then
		-- only spells that heal
		return e
	end
	if eq.is_detrimental_spell(e.spell_id) then
		return e
	end

	local group = attacker:CastToClient():GetGroup()
	if not group.valid then
		-- only works in group
		return e
	end

	local members = group:GroupCount()
	if members < 1 then
		-- only affects other allies
		return e
	end

	-- see what this does with hots/regen spells

	local distance = 100
	local heal_amount = e.value * (rank * 0.1)
	if heal_amount < 1 then
		heal_amount = 1
	end
	local best_ratio = 100
	local best_member = nil
	for i = 0, members - 1 do
		local member = group:GetMember(i)
		if member.valid and
				member:GetID() ~= defender:GetID() and -- don't heal the defender
				attacker:CalculateDistance(member:GetX(), member:GetY(), member:GetZ()) <= distance then -- within range
			if member:GetHPRatio() < best_ratio then
				best_ratio = member:GetHPRatio()
				best_member = member
			end
		end
	end

	if best_member ~= nil then
		best_member:HealDamage(heal_amount)
		best_member:Message(MT.Spells, string.format("You were healed for %d points of damage by %s via Branching Life.", heal_amount, attacker:GetCleanName()))
		rb.Debug(origin, string.format("Branching Life healed %s for %d points of damage.", best_member:GetCleanName(), heal_amount))
	end

	return e
end

return skill
