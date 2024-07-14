local skill = {}

--Zevfeer's Feast - When lifetapping, Zevfeer's Hunger has a  <em data-base='10'>10</em>% chance, to deal an additional <em data-base='2'>2</em>% damage. This damage is returned in the form of mana for yourself and party."
local builds = require('builds')

---@param e ModCommonDamage
---@param origin Client # Person who owns the build skill triggering this event
---@param attacker Mob # Mob who is instigating/casting/attacking
---@param defender Mob # Mob who is defender/target of spell/receiving
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, origin, attacker, defender, rank)
	if origin:GetID() ~= attacker:GetID() then
		return e
	end
	if e.value < 1 then
		return e
	end

	local lifetaps = {[447]= 1}
	if lifetaps[e.spell_id] == nil then
		return e
	end

	local chance = 100
	local roll = math.random(100)
	if roll > chance then
		return e
	end

	local dmg_amount = e.value * (0.02 * rank)
	e.ignore_default = true
	e.value = e.value + dmg_amount
	local distance = 200
	local total_mana = 0
	local members
	local group = attacker:GetGroup()
	if group.valid then
		members = group:GroupCount()
		for i = 1, members do
			local member = group:GetMember(i)
			if member.valid and attacker:CalculateDistance(member:GetX(), member:GetY(), member:GetZ()) <= distance then
				local mana_given = dmg_amount
				local mana_diff = member:GetMaxMana() - member:GetMana()
				if mana_diff < mana_given then
					mana_given = mana_diff
				end
				member:SetMana(member:GetMana() + mana_given)
				member:Message(MT.Spells, string.format("You were gifted %d mana from %s.", mana_given, attacker:GetCleanName()))
				builds.Debug(attacker, string.format("Zevfeer's Feast (%d) has gifted %d mana to %s.",rank, mana_given, member:GetCleanName()))
				total_mana = total_mana + mana_given
			end
		end
	else
		local mana_given = dmg_amount
		local mana_diff = attacker:GetMaxMana() - attacker:GetMana()

		if mana_diff < mana_given then
			mana_given = mana_diff
		end

		attacker:SetMana(attacker:GetMana() + mana_given)
		total_mana = total_mana + mana_given

	end
	builds.Debug(attacker, string.format("Zevfeer's Feast (%d) dealed an additional %d damage, returning it in the form of mana, for a total of %d mana.", rank, dmg_amount, total_mana))

	return e
end


return skill
