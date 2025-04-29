--- rb is short for Rebuild, is full of helper functions related to builds
local rb = {}

local current_skill_id = 0


--- IsProcSuccess returns true if the proc is successful
---@param self Mob
---@param mod integer # proc mod
---@param hand number # hand
---@return boolean
function rb.IsProcSuccess(self, mod, hand)

	-- Mob::TryWeaponProc and Mob::GetProcChances influenced

	local proc_chance = 0
	local weapon_speed = 0
	-- TODO: Get weapon speed by hand
	if hand == Slot.Primary then
		-- attack timer
	end
	if hand == Slot.Secondary then
		return false
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

	-- eq.debug(string.format("Proc chance: %f", proc_chance))

	if hand == Slot.Secondary then
		proc_chance = proc_chance / 2
	end

	local chance = 	proc_chance * (100 + mod)/100

	local roll = math.random(100)

	-- eq.debug(string.format("Proc roll: %d vs chance: %d", roll, chance))

	if roll > chance then
		return false
	end

	return true
end

--- Set the current skill id
--- This is used to determine if the skill is enabled or not
--- @param skill_id integer # skill id
function rb.SetCurrentSkillID(skill_id)
    current_skill_id = skill_id
end


--- Send a debug message
---@param self Mob
---@param message string
function rb.Debug(self, message)
	local value = self:GetBucket("build_debug_" .. current_skill_id)
	if value ~= "1" then
		return
	end

	self:Message(MT.FocusEffect, message)
end


---@param caster Mob
---@param target Mob
---@param mod integer
---@param resist_type integer
---@param level_override boolean
---@return integer
function rb.ResistSpell(caster, target, mod, resist_type, level_override)
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


return rb