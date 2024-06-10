local skill = {}

---@param e ModHealDamage
---@param is_my_spell boolean -- is healing from the player
---@param rank integer -- the rank of the skill
function skill.HealDamage(e, is_my_spell, rank)
	if not is_my_spell then
		return e
	end
	local mob_ally = e.caster
	local target = e.self
	local builds = require('builds')

	if not mob_ally:IsClient() then
		return e
	end
	local ally = mob_ally:CastToClient()

	local spell = eq.get_spell(e.spell_id)
	if spell == nil then
		-- only spells valid
		return e
	end
	if spell:AoeRange() > 0 then
		-- aoe spells are not supported
		return e
	end

	-- Single target healing spells now spread to allies within <em data-base="10">10</em>m of the healed target, healing them for <em data-base="2">2</em>% the original heal amount<span class="perLevel"> per rank</span>.'

	local group = ally:GetGroup()
	if not group.valid then
		return e
	end

	local members = group:GroupCount()
	if members < 2 then
		return e
	end

	local distance = 10 * rank
	local heal_amount = e.value * (rank * 0.02)
	for i = 1, members do
		local member = group:GetMember(i)
		if member.valid and
			target:CalculateDistance(member:GetX(), member:GetY(), member:GetZ()) <= distance then
			member:HealDamage(heal_amount)
			member:Message(MT.Spells, string.format("You were healed for %d points of damage by %s.", heal_amount, ally:GetCleanName()))
			ally:Message(MT.FocusEffect, string.format("Rodcet's Gift healed %s for %d points of damage.", member:GetCleanName(), heal_amount))
		end
	end

	return e
end

return skill
