rb = require('rb')

local builds = {}

local builds_path = "builds/"

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
		verdantruin = { ID = 237 },
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
		feralinfusion = { ID = 707 },
		cannibalization = { ID = 743 },
		windsofmalaise = { ID = 744 },
		-- spiritualinfusion = { ID = 0 },
	},
	nec = {
		soulsiphon = { ID = 456 },
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
		warderrecall = { ID = 113 },
		-- animalbond = { ID = 0 },
	},
	ber = {
		-- frenziedstrike = { ID = 0 },
		-- frenzyricochet = { ID = 2 },
	},
}

--- Initialize the builds module
function builds.Init()
	for className, skillEntry in pairs(skills) do
		for skillName, skill in pairs(skillEntry) do

			local skill_path = className .. "/" .. skillName

			local skill_module = require(builds_path .. skill_path)
			skill.Event = skill_module


			if type(skill_module.CommonDamage) == "function" then
				skill.CommonDamage = function(e, origin, attacker, defender, rank)
					return skill_module.CommonDamage(e, origin, attacker, defender, rank)
				end
				--eq.debug("Added CommonDamage for " .. skillName)
			end
			if type(skill_module.HealDamage) == "function" then
				skill.HealDamage = function(e, origin, attacker, defender, rank)
					return skill_module.HealDamage(e, origin, attacker, defender, rank)
				end
			end
			if type(skill_module.Tick) == "function" then
				skill.Tick = function(e, origin, attacker, defender, rank)
					return skill_module.Tick(e, origin, attacker, defender, rank)
				end
			end
			if type(skill_module.CheckHitChance) == "function" then
				skill.CheckHitChance = function(e, origin, attacker, defender, rank)
					return skill_module.CheckHitChance(e, origin, attacker, defender, rank)
				end
			end
			if type(skill_module.SpellEffect) == "function" then
				skill.SpellEffect = function(e, origin, attacker, defender, rank)
					return skill_module.SpellEffect(e, origin, attacker, defender, rank)
				end
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

				rb.SetCurrentSkillID(skill.ID)
				if rank > 0 and skill.CommonDamage then
					skill.CommonDamage(e, origin, attacker, defender, rank)
				end
			end
		end
		if defender:IsClient() and className == defender:GetClassShortName() then
			origin = defender
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				rb.SetCurrentSkillID(skill.ID)
				if rank > 0 and skill.CommonDamage then
					skill.CommonDamage(e, origin, attacker, defender, rank)
				end
			end
		end
		if attacker:IsNPC() and attacker:HasOwner() and attacker:GetOwner():IsClient() and className == attacker:GetOwner():GetClassShortName() then
			origin = attacker:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				rb.SetCurrentSkillID(skill.ID)
				if rank > 0 and skill.CommonDamage then
					skill.CommonDamage(e, origin, attacker, defender, rank)
				end
			end
		end
		if defender:IsNPC() and defender:HasOwner() and defender:GetOwner():IsClient() and className == defender:GetOwner():GetClassShortName() then
			origin = defender:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				rb.SetCurrentSkillID(skill.ID)
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
				rb.SetCurrentSkillID(skill.ID)
				if rank > 0 and skill.HealDamage then
					skill.HealDamage(e, origin, attacker, defender, rank)
				end
			end
		end
		if defender:IsClient() and className == defender:GetClassShortName() then
			origin = defender
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				rb.SetCurrentSkillID(skill.ID)
				if rank > 0 and skill.HealDamage then
					skill.HealDamage(e, origin, attacker, defender, rank)
				end
			end
		end
		if attacker:IsNPC() and attacker:HasOwner() and attacker:GetOwner():IsClient() and className == attacker:GetOwner():GetClassShortName() then
			origin = attacker:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				rb.SetCurrentSkillID(skill.ID)
				if rank > 0 and skill.HealDamage then
					skill.HealDamage(e, origin, attacker, defender, rank)
				end
			end
		end
		if defender:IsNPC() and defender:HasOwner() and defender:GetOwner():IsClient() and className == defender:GetOwner():GetClassShortName() then
			origin = defender:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				rb.SetCurrentSkillID(skill.ID)
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
				rb.SetCurrentSkillID(skill.ID)
				if rank > 0 and skill.CheckHitChance then
					skill.CheckHitChance(e, origin, attacker, defender, rank)
				end
			end
		end
		if defender:IsClient() and className == defender:GetClassShortName() then
			origin = defender
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				rb.SetCurrentSkillID(skill.ID)
				if rank > 0 and skill.CheckHitChance then
					skill.CheckHitChance(e, origin, attacker, defender, rank)
				end
			end
		end
		if attacker:IsNPC() and attacker:HasOwner() and attacker:GetOwner():IsClient() and className == attacker:GetOwner():GetClassShortName() then
			origin = attacker:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				rb.SetCurrentSkillID(skill.ID)
				if rank > 0 and skill.CheckHitChance then
					skill.CheckHitChance(e, origin, attacker, defender, rank)
				end
			end
		end
		if defender:IsNPC() and defender:HasOwner() and defender:GetOwner():IsClient() and className == defender:GetOwner():GetClassShortName() then
			origin = defender:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				rb.SetCurrentSkillID(skill.ID)
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
				rb.SetCurrentSkillID(skill.ID)
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
				rb.SetCurrentSkillID(skill.ID)
				if rank > 0 and skill.Tick then
					skill.Tick(e, origin, attacker, defender, rank)
				end
			end
		end
		if defender:IsClient() and className == defender:GetClassShortName() then
			origin = defender
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				rb.SetCurrentSkillID(skill.ID)
				if rank > 0 and skill.Tick then
					skill.Tick(e, origin, attacker, defender, rank)
				end
			end
		end
		if attacker:IsNPC() and attacker:HasOwner() and attacker:GetOwner():IsClient() and className == attacker:GetOwner():GetClassShortName() then
			origin = attacker:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				rb.SetCurrentSkillID(skill.ID)
				if rank > 0 and skill.Tick then
					skill.Tick(e, origin, attacker, defender, rank)
				end
			end
		end
		if defender:IsNPC() and defender:HasOwner() and defender:GetOwner():IsClient() and className == defender:GetOwner():GetClassShortName() then
			origin = defender:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				rb.SetCurrentSkillID(skill.ID)
				if rank > 0 and skill.Tick then
					skill.Tick(e, origin, attacker, defender, rank)
				end
			end
		end
	end
end

--- Triggered On SpellEvent
---@param e SpellEventSpellEffect
---@return boolean
function builds.OnSpellEffect(e)
	local origin = nil
	local attacker = eq.get_entity_list():GetClientByID(e.caster_id)
	local defender = e.target

	for className, skillEntry in pairs(skills) do
		if attacker:IsClient() and className == attacker:GetClassShortName() then
			origin = attacker
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				rb.SetCurrentSkillID(skill.ID)
				if rank > 0 and skill.Event.SpellEffect then
					local result = skill.Event.SpellEffect(e, origin, attacker, defender, rank)
					if result == false then
						return false -- consumed
					end
				end
			end
		end

		if defender:IsClient() and className == defender:GetClassShortName() then
			origin = defender
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				rb.SetCurrentSkillID(skill.ID)
				if rank > 0 and skill.Event.SpellEffect then
					local result = skill.Event.SpellEffect(e, origin, attacker, defender, rank)
					if result == false then
						return false -- consumed
					end
				end
			end
		end

		if attacker:IsNPC() and attacker:HasOwner() and attacker:GetOwner():IsClient() and className == attacker:GetOwner():GetClassShortName() then
			origin = attacker:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				rb.SetCurrentSkillID(skill.ID)
				if rank > 0 and skill.Event.SpellEffect then
					local result = skill.Event.SpellEffect(e, origin, attacker, defender, rank)
					if result == false then
						return false -- consumed
					end
				end
			end
		end

		if defender:IsNPC() and defender:HasOwner() and defender:GetOwner():IsClient() and className == defender:GetOwner():GetClassShortName() then
			origin = defender:GetOwner()
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(origin, skill.ID)
				rb.SetCurrentSkillID(skill.ID)
				if rank > 0 and skill.Event.SpellEffect then
					local result = skill.Event.SpellEffect(e, origin, attacker, defender, rank)
					if result == false then
						return false -- consumed
					end
				end
			end
		end
	end
	return true
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
--					rb.SetCurrentSkillID(= skill.ID)
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


--- Triggered when a player enters a zone
---@param e PlayerEventEnterZone
function builds.OnEnterZone(e)
	local build = e.self:GetBucket("build")
	if build == "" then
		build = string.rep("0", 53)
		e.self:SetBucket("build", build)
	end

	local unspent_points = e.self:GetAAPoints()
	if unspent_points > 0 then
		e.self:Message(MT.Experience, "You have unspent AA points. Visit your AAs to spend them.")
	end
end

--- Triggered when a player uses the #builds command
---@param e PlayerEventCommand
function builds.OnBuildCommand(e)

end

--- Triggered when a player uses the #builds reset command
---@param e PlayerEventCommand
function builds.OnBuildResetCommand(e)

	--e.self:Message(MT.White, "exp: " .. e.self:GetAA(4500))
	e.self:ResetAA()
	e.self:SetAAPoints(e.self:GetLevel())
	if e.self:IsTaskActive(1) then
		e.self:GrantAlternateAdvancementAbility(2001, 1, true)
	end
	if e.self:IsTaskCompleted(1) then
		e.self:GrantAlternateAdvancementAbility(2001, 2, true)
	end
	e.self:SyncAA()

	e.self:Message(MT.White, "You have reset your AA points.")
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


---@param client Client
---@return string[]
function builds.BuildIDs(client)
	build_ids = {}
	if not client or not client.valid then
		return build_ids
	end
	if not client:IsClient() then
		return build_ids
	end
	for className, skillEntry in pairs(skills) do
		if className == client:GetClassShortName() then
			for skillName, skill in pairs(skillEntry) do
				table.insert(build_ids, skill.ID)
			end
		end
	end
	return build_ids
end


---@param client Client
function builds.SyncBuildPoints(client)
	if not client or not client.valid then
		return
	end

	local player_level = client:GetLevel()
	local unspent_points = client:GetAAPoints()
	local spent_points = client:GetSpentAA()

	if player_level <= unspent_points + spent_points then
		return
	end

	local aas_to_gain = player_level - spent_points
	client:SetAAPoints(aas_to_gain)

	-- client:Message(MT.Experience, string.format("You have %d unspent build points.", unspent_points))
end

builds.Init()
return builds
