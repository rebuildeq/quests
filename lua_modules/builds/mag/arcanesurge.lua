local skill = {}

---@param e ModCommonDamage
---@param is_my_spell boolean -- is damage from the player
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, is_my_spell, rank)
	if not is_my_spell then
		-- only triggers when player casts a spell
		return e
	end
	local ally = e.attacker
	local enemy = e.self
	local builds = require('builds')

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
	if spell:BuffDuration() > 0 then
		-- only instant spells
		return e
	end
	if e.value > 0 then
		-- only spells that deal damage
		return e
	end

	local my_level = e.self:GetLevel()
	local spell_level = 0 -- TODO: Get spell level of spell? May need to get all wiz spells add them manually
	if spell_level < (my_level-10) then
		-- only spells within 10 levels of the player
		return e
	end

	local surge_cooldown = ally:GetBucket("surge_cooldown")
	local next_cooldown = os.time() + 10

	if surge_cooldown > os.time() then
		-- still on cooldown
		return e
	end


	ally:SetBucket("surge_cooldown", string.format("%d", next_cooldown))

	local damage = ally:GetLevel() * (rank * 8)
	builds.Debug(ally, string.format("Arcane Surge dealt %d damage to %s.", damage, enemy:GetCleanName()))
	enemy:Damage(ally, damage, spell:ID(), 0)
	return e
end

return skill
