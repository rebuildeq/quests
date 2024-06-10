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

	local weave_spell_id = ally:GetBucket("weave_spell_id")
	local weave_cooldown = ally:GetBucket("weave_cooldown")
	local next_cooldown = os.time() + 10

	if weave_spell_id == "" then
		ally:SetBucket("weave_spell_id", string.format("%d", spell:ID()))
		ally:SetBucket("weave_cooldown", string.format("%d", next_cooldown))
		return e
	end

	if weave_cooldown == "" then
		-- never casted a spell before
		ally:SetBucket("weave_spell_id", string.format("%d", spell:ID()))
		ally:SetBucket("weave_cooldown", string.format("%d", next_cooldown))
		return e
	end

	if weave_cooldown > os.time() then
		-- still on cooldown
		return e
	end

	if weave_spell_id == string.format("%d", spell:ID()) then
		-- same spell
		return e
	end


	ally:SetBucket("weave_spell_id", string.format("%d", spell:ID()))
	ally:SetBucket("weave_cooldown", string.format("%d", next_cooldown))

	-- "When you cast two different single target DD spells that are within 10 levels of your current level, a bonus (level * <em data-base='10'>10</em>) damage spell is applied to target<span class='perLevel'> per rank</span>.",

	local damage = ally:GetLevel() * (rank * 10)
	ally:Message(MT.FocusEffect, string.format("Weave dealt %d damage to %s.", damage, e.self:GetCleanName()))
	enemy:Damage(ally, damage, spell:ID(), 0)
	return e
end

return skill
