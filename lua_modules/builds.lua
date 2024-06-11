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

	},
	bst = {

	},
	ber = {

	},
}

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
				if rank > 0 and skill.CommonDamage then
					skill.CommonDamage(e, true, rank)
				end
			end
		end
		if e.attacker:IsClient() and className == e.attacker:GetClassName() then
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(e.attacker, skill.ID)
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
				if rank > 0 and skill.HealDamage then
					skill.HealDamage(e, true, rank)
				end
			end
		end
		if e.caster:IsClient() and className == e.caster:GetClassName() then
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(e.caster, skill.ID)
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
