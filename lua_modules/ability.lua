--- Abilities are stored in a capacity of ability_count, buckets like ability_0, ability_1, etc
local ability = {}

local ability_db = require("ability_db")

--- Return an ability name assigned to an NPC, if any
---@param self NPC
---@return Ability[]?, integer
function ability.OnNPCAggro(self)
	--eq.debug("OnNPCAggro")

	local ability_count = 0
	local ability_max_count = ability_db.Count(self)
	ability_count = 0
	local frequency = 10000

	local is_enhanced = self:GetEntityBucket("enhanced") ~= ""
	for ability_name, a in pairs(ability_db.Abilities) do
		if a.Check ~= nil and a.Check(self) then
			ability_count = ability_count + 1
			--eq.debug("Giving ability" .. ability_name .. " to " .. self:GetCleanName())
			self:SetEntityBucket(string.format("ability_%d_name", ability_count), tostring(ability_name))
			self:SetEntityBucket(string.format("ability_%d_cooldown", ability_count), tostring(a.CooldownInit(is_enhanced)))
			--eq.debug("ability " .. ability_name .. " assigned to " .. self:GetCleanName())
			if frequency > a.SignalFrequency then
				frequency = math.random(a.SignalFrequency-1, a.SignalFrequency+1)
			end
		end
		if ability_count >= ability_max_count then
			break
		end
	end
	if ability_count == 0 then
		return nil, 0
	end
	for ai_name, ai in pairs(ability_db.AbilityAIs) do
		if ai.Check ~= nil and ai.Check(self) then
			self:SetEntityBucket("ability_ai", tostring(ai_name))
		end
	end
	self:SetEntityBucket(string.format("ability_count"), tostring(ability_count))
	return ability.Abilities(self), frequency
end

---@class AbilityCache
---@field Name string
---@field Ability Ability
---@field Cooldown integer

--- Return an array of abilities assigned to an NPC
---@param self NPC
---@return AbilityCache[]
function ability.Abilities(self)
	local abilities = {}

	local ability_count = tonumber(self:GetEntityBucket("ability_count"))
	if ability_count == nil or ability_count == 0 then
		return abilities
	end

	--eq.debug("abilities NPC has " .. ability_count .. " abilities")
	for i = 1, ability_count do
		local ability_name = self:GetEntityBucket(string.format("ability_%d_name", i))
		if ability_name ~= "" then
			--eq.debug("Ability " .. i .. " is " .. ability_name)
			abilities[i] = {}
			abilities[i].Name = ability_name
			abilities[i].Ability = ability_db.Abilities[ability_name]
			abilities[i].Cooldown = tonumber(self:GetEntityBucket(string.format("ability_%d_cooldown", i)))
			if abilities[i].Cooldown == nil then
				abilities[i].Cooldown = 60
			end
		end
	end
	return abilities
end

--- Triggered on tick
---@param self NPC
---@return integer # next tick to trigger in seconds
function ability.OnTick(self)
	--eq.debug("ontick")
	local next_tick = 90
	local abilities = ability.Abilities(self)
	--eq.debug("NPC has " .. #abilities .. " abilities")
	for i, ae in ipairs(abilities) do
		--eq.debug("Ability " .. ae.Name)

		local a = ae.Ability
		if next_tick > ae.Cooldown and ae.Cooldown > 0 then
			next_tick = ae.Cooldown
		end
		if ae.Cooldown < os.time() then
			local new_tick = ability.tick(self, i, a, ae.Cooldown)
			if new_tick < next_tick and new_tick > 0 then
				next_tick = new_tick
			end
		end
	end
	return next_tick
end

--- Triggered on ability tick
---@param self NPC
---@param index integer
---@param a Ability
---@return integer # next tick to trigger in seconds
function ability.tick(self, index, a, next_tick)
	if a == nil then
		return next_tick
	end

	local ability_casting_cooldown = tonumber(self:GetEntityBucket("ability_casting_cooldown"))
	local casting_name = self:GetEntityBucket("ability_casting_name")
	if ability_casting_cooldown ~= nil and casting_name ~= "" and casting_name == a.Name then
		if ability_casting_cooldown > os.time() then
			--eq.debug("still casting..")
			return next_tick
		end
		--eq.debug("done casting")

		a.OnAbilityFinish(self)
		self:DeleteEntityBucket("ability_casting_cooldown")
		self:DeleteEntityBucket("ability_casting_name")
		return next_tick
	end

	if not self:IsEngaged() then
		return next_tick
	end

	local ai_name = self:GetEntityBucket("ability_ai")
	if ai_name == "" then
		return next_tick
	end
	local ai = ability_db.AbilityAIs[ai_name]
	if ai == nil then
		return next_tick
	end
	local is_enhanced = self:GetEntityBucket("enhanced") ~= ""

	local ability_cooldown = tonumber(self:GetEntityBucket(string.format("ability_%d_cooldown", index)))
	if ability_cooldown == nil then
		ability_cooldown = 0
	end

	if ability_cooldown > os.time() then
		--eq.debug(string.format("On cooldown (%d seconds remain)", ability_cooldown - os.time()))
		return next_tick
	end

	-- ability ready to be casted, check if AI decides not to
	if not ai.IsValidTime(self, a) then
		return next_tick
	end

	-- time to cast!
	next_tick = math.random(24, 120)
	if is_enhanced then
		next_tick = math.random(24, 48)
	end
	ability_cooldown = os.time() + next_tick
	self:SetEntityBucket(string.format("ability_%d_cooldown", index), tostring(ability_cooldown))
	self:SetEntityBucket("ability_casting_cooldown", tostring(os.time() + a.CastTime))
	self:SetEntityBucket("ability_casting_name", tostring(a.Name))
	a.OnAbilityStart(self)
	self:Stun(a.CastTime * 1000)
	self:DoAnim(42)

	-- add a second for next_tick
	next_tick = next_tick + 1
	return next_tick
end

--- Triggered on ability interrupt hitting a mob
---@param self NPC
---@param caster Mob
function ability.OnInterrupt(self, caster)
	local casting_name = self:GetEntityBucket("ability_casting_name")
	if casting_name == "" then
		return
	end
	local a = ability_db.Abilities[casting_name]
	if a == nil then
		return
	end
	a.OnAbilityInterrupt(self, mob:GetCleanName())
	self:UnStun()
	self:DeleteEntityBucket("ability_casting_cooldown")
	self:DeleteEntityBucket("ability_casting_name")
end

--- @param e ModCommonDamage
--- @return ModCommonDamage
function ability.OnCommonDamage(e)
	local result = e
	if e.self:IsNPC() then
		local npc = e.self:CastToNPC()
		local abilities = ability.Abilities(npc)
		for i, ae in ipairs(abilities) do
			--eq.debug("Ability " .. ae.Name)

			local a = ae.Ability
			local ability_value = tonumber(e.self:GetEntityBucket(string.format("ability_%d_value", i)))
			if ability_value ~= nil then
				local new_result = a.OnCommonDamage(e, false, ability_value)
				if new_result ~= nil and new_result.ignore_default then
					result.ignore_default = true
					if new_result.value > result.value then
						result.value = new_result.value
					end
				end
			end
		end
	end
end

--- Triggered on NPC death
---@param self NPC
function ability.Flush(self)
	if not self:IsNPC() then
		return
	end

	local ability_count = tonumber(self:GetEntityBucket("ability_count"))
	if ability_count == nil or ability_count == 0 then
		return
	end
	self:DeleteEntityBucket("ability_count")
end


return ability