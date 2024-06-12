local builds = {}

local builds_path = "lua_modules/builds/"

local skills = {
	war = {
		jarringstrike = { ID = 0 },
	},
	clr = {
		believe = { ID = 0 },
	},
	pal = {
		rodcetsgift = { ID = 0 },
	},
	rng = {
		venomousvolley = { ID = 0 },
		reinforcedbowstring = { ID = 2 },
	},
	shd = {
		lifesap = { ID = 0 },
		gougingskin = { ID = 2 },
	},
	dru = {
		verdantrenewal = { ID = 0 },
	},
	mnk = {
		intensifiedtraining = { ID = 0 },
	},
	brd = {
		trainingofzek = { ID = 0 },
	},
	rog = {
		appraisal = { ID = 0 },
		jarringstab = { ID = 20 },
	},
	shm = {
		spiritualinfusion = { ID = 0 },
	},
	nec = {
		corruption = { ID = 0 },
	},
	wiz = {
		weave = { ID = 0 },
	},
	mag = {
		arcanesurge = { ID = 0 },
	},
	enc = {
		nightmare = { ID = 0 },
	},
	bst = {
		animalbond = { ID = 0 },
	},
	ber = {
		frenziedstrike = { ID = 0 },
		frenzyricochet = { ID = 2 },
	},
}

local current_skill_id = 0

function builds.Init()
	for className, skillEntry in pairs(skills) do
		for skillName, skill in pairs(skillEntry) do
			local skill_path = className .. "/" .. skillName
			skill.Event = require(builds_path .. skill_path)
			if type(_G[skill.Event.CommonDamage]) == "function" then
				skill.CommonDamage = _G[skill.Event.CommonDamage]
			end
			if type(_G[skill.Event.HealDamage]) == "function" then
				skill.HealDamage = _G[skill.Event.HealDamage]
			end
		end
	end
end

---@param e ModCommonDamage
function builds.OnModCommonDamage(e)
	if not e.self.valid or not e.attacker.valid then
		return e
	end
	-- builds require at least one client for build related triggers
	if not e.self:IsClient() and not e.attacker:IsClient() then
		return e
	end

	for className, skillEntry in pairs(skills) do
		if e.self:IsClient() and className == e.self:GetClassName() then
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(e.self, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.CommonDamage then
					skill.CommonDamage(e, true, rank)
				end
			end
		end
		if e.attacker:IsClient() and className == e.attacker:GetClassName() then
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(e.attacker, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.CommonDamage then
					skill.CommonDamage(e, false, rank)
				end
			end
		end

		if e.attacker:IsNPC() and e.attacker:HasOwner() and e.attacker:GetOwner():IsClient() then
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(e.attacker:GetOwner(), skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.CommonDamage then
					skill.CommonDamage(e, false, rank)
				end
			end
		end
	end
end

---@param e ModHealDamage
function builds.OnModHealDamage(e)
	if not e.self.valid or not e.caster.valid then
		return e
	end
	-- builds require at least one client for build related triggers
	if not e.self:IsClient() and not e.caster:IsClient() then
		return e
	end

	for className, skillEntry in pairs(skills) do
		if e.self:IsClient() and className == e.self:GetClassName() then
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(e.self, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.HealDamage then
					skill.HealDamage(e, true, rank)
				end
			end
		end
		if e.caster:IsClient() and className == e.caster:GetClassName() then
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(e.caster, skill.ID)
				current_skill_id = skill.ID
				if rank > 0 and skill.HealDamage then
					skill.HealDamage(e, false, rank)
				end
			end
		end
	end
end

---@param self Mob
---@param skillID integer
---@return integer
function builds.Rank(self, skillID)
	if not self:IsClient() then
		return 0
	end

	local build = self:GetBucket("build")
	if skillID > string.len(build) then
		return 0
	end

	local rank = tonumber(string.sub(build, skillID, skillID))
	if rank then
		return rank
	end
	return 0
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
	if weapon_speed < RuleI.Get(Rule['MinWeaponSpeed']) then
		weapon_speed = RuleI.Get(Rule['MinWeaponSpeed'])
	end


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

builds.Init()
return builds
