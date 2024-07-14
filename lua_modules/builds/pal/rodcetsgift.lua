local skill = {}

local builds = require('builds')

---@param e ModHealDamage
---@param origin Client
---@param attacker Mob
---@param defender Mob
---@param rank integer -- the rank of the skill
function skill.HealDamage(e, origin, attacker, defender, rank)
	if origin:GetID() ~= attacker:GetID() then
		return e
	end

	local spell = eq.get_spell(e.spell_id)
	if spell == nil then
		-- only spells valid
		return e
	end
	if spell:AoeRange() > 0 then
		-- aoe spells are not supported
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

	-- Single defender healing spells now spread to allies within <em data-base="10">10</em>m of the healed defender, healing them for <em data-base="2">2</em>% the original heal amount<span class="perLevel"> per rank</span>.'

	local group = attacker:GetGroup()
	if not group.valid then
		-- only works in group
		return e
	end

	local members = group:GroupCount()
	if members < 1 then
		-- only affects other allies
		return e
	end

	local distance = 10 * rank
	local heal_amount = e.value * (rank * 0.02)
	if heal_amount < 1 then
		heal_amount = 1
	end
	for i = 1, members do
		local member = group:GetMember(i)
		if member.valid and
			member.GetID ~= defender:GetID() and -- don't heal the defender
			defender:CalculateDistance(member:GetX(), member:GetY(), member:GetZ()) <= distance then -- within range
			member:HealDamage(heal_amount)
			member:Message(MT.Spells, string.format("You were healed for %d points of damage by %s.", heal_amount, attacker:GetCleanName()))
			builds.Debug(origin, string.format("Rodcet's Gift healed %s for %d points of damage.", member:GetCleanName(), heal_amount))
		end
	end

	return e
end

return skill
