local builds = {}

local builds_path = "lua_modules/builds/"

local skills = {
	war = {
		-- jarringstrike = { ID = 0 },
		-- ironcladchallenge = { ID = 2 },
	},
	clr = {
		-- believe = { ID = 0 },
		-- divinebash = { ID = 2 },
	},
	pal = {
		-- rodcetsgift = { ID = 0 },
		-- handofpiety = { ID = 2 },
	},
	rng = {
		-- venomousvolley = { ID = 0 },
		-- reinforcedbowstring = { ID = 2 },
	},
	shd = {
		-- lifesap = { ID = 0 },
		-- gougingskin = { ID = 2 },
		-- zevfeersfeast = { ID = 8},
	},
	dru = {
		-- verdantrenewal = { ID = 0 },
		-- onewithnature = { ID = 2 },
	},
	mnk = {
		-- intensifiedtraining = { ID = 0 },
		-- familiarity = { ID = 2 },
	},
	brd = {
		-- trainingofzek = { ID = 0 },
		-- healingtreble = { ID = 2 },
	},
	rog = {
		-- appraisal = { ID = 0 },
		-- jarringstab = { ID = 20 },
	},
	shm = {
		feralinfusion = { ID = 3526 },
		-- spiritualinfusion = { ID = 0 },
	},
	nec = {
		-- decayingoverkill = { ID = 2276 },
		-- corruption = { ID = 0 },
	},
	wiz = {
		-- weave = { ID = 0 },
	},
	mag = {
		-- arcanesurge = { ID = 0 },
		-- hydrosophist = { ID = 2 },
	},
	enc = {
		-- nightmare = { ID = 0 },
	},
	bst = {
		-- animalbond = { ID = 0 },
	},
	ber = {
		-- frenziedstrike = { ID = 0 },
		-- frenzyricochet = { ID = 2 },
	},
}

local current_skill_id = 0

--- Initialize the builds module
function builds.Init()
	for className, skillEntry in pairs(skills) do
		for skillName, skill in pairs(skillEntry) do

			local skill_path = className .. "/" .. skillName
			eq.debug(builds_path .. skill_path)
			skill.Event = require(builds_path .. skill_path)
			if type(skill.Event.CommonDamage) == "function" then
				skill.CommonDamage = skill.Event.CommonDamage
				--eq.debug("Added CommonDamage for " .. skillName)
			end
			if type(skill.Event.HealDamage) == "function" then
				skill.HealDamage = skill.Event.HealDamage
			end
			if type(skill.Event.Tick) == "function" then
				skill.Tick = skill.Event.Tick
			end
			if type(skill.Event.CheckHitChance) == "function" then
				skill.CheckHitChance = skill.Event.CheckHitChance
			end
			if type(skill.Event.SpellEffect) == "function" then
				skill.SpellEffect = skill.Event.SpellEffect
			end
		end
	end
end

--- Triggered On ModCommonDamage
---@param e ModCommonDamage
function builds.OnModCommonDamage(e)
	local origin = nil
	local attacker = e.attacker
	local defender = e.self

	for className, skillEntry in pairs(skills) do
		if attacker:IsClient() and className == attacker:GetClassShortName() then
			origin = attacker
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.CommonDamage then
					skill.CommonDamage(e, origin, attacker, defender, rank)
				end
			end
		end
		if defender:IsClient() and className == defender:GetClassShortName() then
			origin = defender
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.CommonDamage then
					skill.CommonDamage(e, origin, attacker, defender, rank)
				end
			end
		end
		if attacker:IsNPC() and attacker:HasOwner() and attacker:GetOwner():IsClient() and className == attacker:GetOwner():GetClassShortName() then
			origin = attacker:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.CommonDamage then
					skill.CommonDamage(e, origin, attacker, defender, rank)
				end
			end
		end
		if defender:IsNPC() and defender:HasOwner() and defender:GetOwner():IsClient() and className == defender:GetOwner():GetClassShortName() then
			origin = defender:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.CommonDamage then
					skill.CommonDamage(e, origin, attacker, defender, rank)
				end
			end
		end
	end
end

--- Triggered On ModHealDamage
---@param e ModHealDamage
function builds.OnModHealDamage(e)
	local origin = nil
	local attacker = e.caster
	local defender = e.self

	for className, skillEntry in pairs(skills) do
		if attacker:IsClient() and className == attacker:GetClassShortName() then
			origin = attacker
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.HealDamage then
					skill.HealDamage(e, origin, attacker, defender, rank)
				end
			end
		end
		if defender:IsClient() and className == defender:GetClassShortName() then
			origin = defender
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.HealDamage then
					skill.HealDamage(e, origin, attacker, defender, rank)
				end
			end
		end
		if attacker:IsNPC() and attacker:HasOwner() and attacker:GetOwner():IsClient() and className == attacker:GetOwner():GetClassShortName() then
			origin = attacker:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.HealDamage then
					skill.HealDamage(e, origin, attacker, defender, rank)
				end
			end
		end
		if defender:IsNPC() and defender:HasOwner() and defender:GetOwner():IsClient() and className == defender:GetOwner():GetClassShortName() then
			origin = defender:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.HealDamage then
					skill.HealDamage(e, origin, attacker, defender, rank)
				end
			end
		end
	end
end

--- Triggered On CheckHitChance
---@param e ModCheckHitChance
function builds.OnCheckHitChance(e)

	local origin = nil
	local attacker = e.self
	local defender = e.other

	for className, skillEntry in pairs(skills) do
		if attacker:IsClient() and className == attacker:GetClassShortName() then
			origin = attacker
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.CheckHitChance then
					skill.CheckHitChance(e, origin, attacker, defender, rank)
				end
			end
		end
		if defender:IsClient() and className == defender:GetClassShortName() then
			origin = defender
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.CheckHitChance then
					skill.CheckHitChance(e, origin, attacker, defender, rank)
				end
			end
		end
		if attacker:IsNPC() and attacker:HasOwner() and attacker:GetOwner():IsClient() and className == attacker:GetOwner():GetClassShortName() then
			origin = attacker:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.CheckHitChance then
					skill.CheckHitChance(e, origin, attacker, defender, rank)
				end
			end
		end
		if defender:IsNPC() and defender:HasOwner() and defender:GetOwner():IsClient() and className == defender:GetOwner():GetClassShortName() then
			origin = defender:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.CheckHitChance then
					skill.CheckHitChance(e, origin, attacker, defender, rank)
				end
			end
		end
	end
end

--- Triggered On Tick
---@param self Client
function builds.OnTick(self)
	if not self:IsClient() then
		return
	end

	for className, skillEntry in pairs(skills) do
		if className == self:GetClassShortName() then
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(self, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.Tick then
					skill.Tick(self, rank)
				end
			end
		end
	end
end


--- Triggered On SpellBuffTic
---@param e SpellEventSpellBuffTic
function builds.OnSpellBuffTic(e)
	local origin = nil
	local attacker = eq.get_entity_list():GetClientByID(e.caster_id)
	local defender = e.target
	for className, skillEntry in pairs(skills) do
		if attacker:IsClient() and className == attacker:GetClassShortName() then
			origin = attacker
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.Tick then
					skill.Tick(e, origin, attacker, defender, rank)
				end
			end
		end
		if defender:IsClient() and className == defender:GetClassShortName() then
			origin = defender
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.Tick then
					skill.Tick(e, origin, attacker, defender, rank)
				end
			end
		end
		if attacker:IsNPC() and attacker:HasOwner() and attacker:GetOwner():IsClient() and className == attacker:GetOwner():GetClassShortName() then
			origin = attacker:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.Tick then
					skill.Tick(e, origin, attacker, defender, rank)
				end
			end
		end
		if defender:IsNPC() and defender:HasOwner() and defender:GetOwner():IsClient() and className == defender:GetOwner():GetClassShortName() then
			origin = defender:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.Tick then
					skill.Tick(e, origin, attacker, defender, rank)
				end
			end
		end
	end
end

--- Triggered On Tick
---@param e SpellEventSpellEffect
function builds.OnSpellEffect(e)
	local origin = nil
	local attacker = eq.get_entity_list():GetClientByID(e.caster_id)
	local defender = e.target

	for className, skillEntry in pairs(skills) do
		if attacker:IsClient() and className == attacker:GetClassShortName() then
			origin = attacker
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.Event.SpellEffect then
					skill.Event.SpellEffect(e, origin, attacker, defender, rank)
				end
			end
		end

		if defender:IsClient() and className == defender:GetClassShortName() then
			origin = defender
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.Event.SpellEffect then
					skill.Event.SpellEffect(e, origin, attacker, defender, rank)
				end
			end
		end

		if attacker:IsNPC() and attacker:HasOwner() and attacker:GetOwner():IsClient() and className == attacker:GetOwner():GetClassShortName() then
			origin = attacker:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.Event.SpellEffect then
					skill.Event.SpellEffect(e, origin, attacker, defender, rank)
				end
			end
		end

		if defender:IsNPC() and defender:HasOwner() and defender:GetOwner():IsClient() and className == defender:GetOwner():GetClassShortName() then
			origin = defender:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.Event.SpellEffect then
					skill.Event.SpellEffect(e, origin, attacker, defender, rank)
				end
			end
		end
	end
end


-- --- Triggered On CalcSpellEffectValue_formula
-- ---@param e ModCalcSpellEffectValue_formula
-- function builds.OnCalcSpellEffectValue_formula(e)
-- 	local caster = eq.get_entity_list():GetClientByID(e.caster_id)
-- 	if not caster or not caster.valid then
-- 		return e
-- 	end
-- 	for className, skillEntry in pairs(skills) do
-- 		if className == caster:GetClassShortName() then
-- 			for skillName, skill in pairs(skillEntry) do
-- 				local rank = builds.Rank(caster, skill.ID)
-- 				current_skill_id = skill.ID
-- 				if rank > 0 and skill.Tick then
-- 					skill.SpellBuffTic(e, caster, rank)
-- 				end
-- 			end
-- 		end
-- 	end
-- end

--- Gets the rank of a skill
---@param self Mob
---@param skillID integer
---@return integer
function builds.Rank(self, skillID)
	if not self:IsClient() then
		return 0
	end

	return self:GetAAByAAID(skillID)
end

--- Send a debug message
---@param self Mob
---@param message string
function builds.Debug(self, message)
	local debug_string = self:GetBucket("build_debug")
	if debug_string == "" then
		return
	end

	if current_skill_id > string.len(debug_string) then
		return
	end

	local is_enabled = tonumber(string.sub(debug_string, current_skill_id, current_skill_id))
	if is_enabled == 0 then
		return
	end

	self:Message(MT.FocusEffect, message)
end

--- Set a debug message enabled or not for a skill ID
---@param self Mob
---@param skillID integer
---@param is_enabled boolean
function builds.SetDebug(self, skillID, is_enabled)
	local value = is_enabled and 1 or 0
	local debug_string = self:GetBucket("build_debug")
	if skillID > string.len(debug_string) then
		return
	end

	local new_debug_string = ""
	for i = 1, string.len(debug_string) do
		if i == skillID then
			new_debug_string = new_debug_string .. value
		else
			new_debug_string = new_debug_string .. string.sub(debug_string, i, i)
		end
	end

	self:SetBucket("build_debug", new_debug_string)
end

--- Set All Debug Messages to a value
--- @param self Mob
--- @param is_enabled boolean
function builds.SetDebugAll(self, is_enabled)
	local value = is_enabled and 1 or 0
	local new_debug_string = ""
	for i = 1, 20 do
		new_debug_string = new_debug_string .. value
	end

	self:SetBucket("build_debug", new_debug_string)
end

--- IsProcSuccess returns true if the proc is successful
---@param self Mob
---@param mod integer # proc mod
---@param hand number # hand
---@return boolean
function builds.IsProcSuccess(self, mod, hand)

	-- Mob::TryWeaponProc and Mob::GetProcChances influenced

	local proc_chance = 0
	local weapon_speed = 0
	-- TODO: Get weapon speed by hand
	if hand == Slot.Primary then
		-- attack timer
	end
	if hand == Slot.Secondary then
		-- attack_dw
	end
	if hand == Slot.Range then
		-- range timer
	end
	-- TODO: Add MinWeaponSpeed rule
	-- if weapon_speed < RuleI.Get(Rule['MinWeaponSpeed']) then
	-- 	weapon_speed = RuleI.Get(Rule['MinWeaponSpeed'])
	-- end


	proc_chance = ((mod + 100)/100)

	local dex = self:GetDEX()

	if RuleB.Get(Rule['AdjustProcPerMinute']) then
		proc_chance = (weapon_speed * RuleR.Get(Rule['AvgProcsPerMinute']) / 60000)
		proc_chance = proc_chance + (dex * RuleR.Get(Rule['ProcPerMinDexContrib']))
	else
		proc_chance = RuleR.Get(Rule['BaseProcChance']) + (dex / RuleR.Get(Rule['ProcDexDivideBy']))
	end

	eq.debug(string.format("Proc chance: %f", proc_chance))

	if hand == Slot.Secondary then
		proc_chance = proc_chance / 2
	end

	local chance = 	proc_chance * (100 + mod)/100

	local roll = math.random(100)

	eq.debug(string.format("Proc roll: %d vs chance: %d", roll, chance))

	if roll < chance then
		return false
	end

	return true
end

--- Get the number of unspent build points
---@param level number
---@param build string
---@return number
function builds.UnspentPoints(level, build)
	local totalSpent = 0
    for i = 1, 53 do
        local points = tonumber(string.sub(build, i, i))
        if points and points >= 1 and points <= 5 then
            totalSpent = totalSpent + points
        end
    end
    if totalSpent >= level then
        return 0
    end
    return level - totalSpent
end

--- Triggered when a player enters a zone
---@param e PlayerEventEnterZone
function builds.OnEnterZone(e)
	local build = e.self:GetBucket("build")
	if build == "" then
		build = string.rep("0", 53)
		e.self:SetBucket("build", build)
	end
	local unspent_points = builds.UnspentPoints(e.self:GetLevel(), build)
	if unspent_points > 0 then
		e.self:Message(MT.Experience, string.format("You have unspent build points. Visit %s to spend them.", eq.say_link("#builds")))
	end
end

--- Triggered when a player uses the #builds command
---@param e PlayerEventCommand
function builds.OnBuildCommand(e)

end

--- Triggered when a player uses the #builds reset command
---@param e PlayerEventCommand
function builds.OnBuildResetCommand(e)
	local target = e.self:GetTarget()
	if not target.valid then
		target = e.self
	end
	e.self:Message(MT.White, "TODO")
end



--- Triggered when a player uses the #builds reset command
---@param e PlayerEventCommand
function builds.OnBuildInspectCommand(e)
	local target = e.self:GetTarget()
	if not target.valid then
		target = e.self
	end
	e.self:Message(MT.White, "TODO")
end


---@param caster Mob
---@param target Mob
---@param mod integer
---@param resist_type integer
---@param level_override boolean
---@return integer
function builds.ResistSpell(caster, target, mod, resist_type, level_override)
	if caster == nil or not caster.valid then
		return 100
	end
	if target:GetSpecialAbility(SpecialAbility.immune_casting_from_range) > 0 and not target:CombatRange(caster) then
		return 0
	end

	if target:GetSpecialAbility(SpecialAbility.immune_magic) > 0 then
		return 0
	end


	return 100
end

builds.Init()
return builds
