local skill = {}

--Zevfeer's Feast - When lifetapping, Zevfeer's Hunger has a  <em data-base='10'>10</em>% chance, to deal an additional <em data-base='2'>2</em>% damage. This damage is returned in the form of mana for yourself and party."
---@param e ModCommonDamage
---@param is_my_damage boolean -- is damage from the player
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, is_my_damage, rank)
	eq.debug('This is zevfeers feast being activated')
	if e.value < 1 then
		return e
	end
	if not is_my_damage then
		return e
	end
	local ally = e.attacker:CastToClient()
	if ally == nil or not ally.valid then
		return e
	end

	local builds = require('builds')

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
	local group = ally:GetGroup()
	if group.valid then
		members = group:GroupCount()
		for i = 1, members do
			local member = group:GetMember(i)
			if member.valid and ally:CalculateDistance(member:GetX(), member:GetY(), member:GetZ()) <= distance then
				local mana_given = dmg_amount
				local mana_diff = member:GetMaxMana() - member:GetMana()
				if mana_diff < mana_given then
					mana_given = mana_diff
				end
				member:SetMana(member:GetMana() + mana_given)
				member:Message(MT.Spells, string.format("You were gifted %d mana from %s.", mana_given, ally:GetCleanName()))
				builds.Debug(ally, string.format("Zevfeer's Feast (%d) has gifted %d mana to %s.",rank, mana_given, member:GetCleanName()))
				total_mana = total_mana + mana_given
			end
		end
	else
		eq.debug('No Group Member, Setting our mana only.')
		local mana_given = dmg_amount
		eq.debug('This is our mana given amount:'.. mana_given)
		local mana_diff = ally:GetMaxMana() - ally:GetMana()
		eq.debug('Max Mana:'.. tostring(ally:GetMaxMana()))
		eq.debug('Current Mana:'.. tostring(ally:GetMana()))

		if mana_diff < mana_given then
			mana_given = mana_diff
		end
		eq.debug('This is our mana diff amount:'.. mana_diff)

		ally:SetMana(ally:GetMana() + mana_given)
		eq.debug('Set our mana.')
		total_mana = total_mana + mana_given

	end
	builds.Debug(ally, string.format("Zevfeer's Feast (%d) dealed an additional %d damage, returning it in the form of mana, for a total of %d mana.", rank, dmg_amount, total_mana))
	return e

end


return skill
