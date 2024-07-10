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

	local is_enhanced = self:GetBucket("enhanced") ~= ""
	for ability_name, a in pairs(ability_db.Abilities) do
		if a.Check ~= nil and a.Check(self) then
			ability_count = ability_count + 1
			--eq.debug("Giving ability" .. ability_name .. " to " .. self:GetCleanName())
			self:SetBucket(string.format("ability_%d_%d_%d_name", eq.get_zone_id(), self:GetID(), ability_count), tostring(ability_name))
			self:SetBucket(string.format("ability_%d_%d_%d_cooldown", eq.get_zone_id(), self:GetID(), ability_count), tostring(a.CooldownInit(is_enhanced)))
			--eq.debug("ability " .. ability_name .. " assigned to " .. self:GetCleanName())
			if frequency > a.SignalFrequency then
				frequency = a.SignalFrequency
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
			self:SetBucket(string.format("ability_%d_%d_ai", eq.get_zone_id(), self:GetID()), tostring(ai_name))
		end
	end
	self:SetBucket(string.format("ability_%d_%d_count", eq.get_zone_id(), self:GetID()), tostring(ability_count))
	return ability.Abilities(self), frequency
end

--- Return the number of abilities assigned to an NPC
---@param self NPC
---@return integer
function ability.AbilityCount(self)
	local count = tonumber(self:GetBucket(string.format("ability_%d_%d_count", eq.get_zone_id(), self:GetID())))
	return count or 0
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

	local ability_count = ability.AbilityCount(self)
	if ability_count == nil or ability_count == 0 then
		return abilities
	end
	--eq.debug("abilities NPC has " .. ability_count .. " abilities")
	for i = 1, ability_count do
		local ability_name = self:GetBucket(string.format("ability_%d_%d_%d_name", eq.get_zone_id(), self:GetID(), i))
		if ability_name ~= "" then
			--eq.debug("Ability " .. i .. " is " .. ability_name)
			abilities[i] = {}
			abilities[i].Name = ability_name
			abilities[i].Ability = ability_db.Abilities[ability_name]
			abilities[i].Cooldown = tonumber(self:GetBucket(string.format("ability_%d_%d_%d__cooldown", eq.get_zone_id(), self:GetID(), i)))
			if abilities[i].Cooldown == nil then
				abilities[i].Cooldown = 0
			end
		end
	end
	return abilities
end

--- Triggered on tick
---@param self NPC
function ability.OnTick(self)
	--eq.debug("ontick")
	local abilities = ability.Abilities(self)
	--eq.debug("NPC has " .. #abilities .. " abilities")
	for i, ae in ipairs(abilities) do
		--eq.debug("Ability " .. ae.Name)

		local a = ae.Ability
		if ae.Cooldown < os.time() then
			ability.tick(self, i, a)
		end
	end
end

--- Triggered on ability tick
---@param self NPC
---@param index integer
---@param a Ability
function ability.tick(self, index, a)
	if a == nil then
		return
	end

	local ability_casting_cooldown = tonumber(self:GetBucket(string.format("ability_%d_%d_casting_cooldown", eq.get_zone_id(), self:GetID())))
	local casting_name = self:GetBucket(string.format("ability_%d_%d_casting_name", eq.get_zone_id(), self:GetID()))
	if ability_casting_cooldown ~= nil and casting_name ~= "" and casting_name == a.Name then
		if ability_casting_cooldown > os.time() then
			--eq.debug("still casting..")
			return
		end
		--eq.debug("done casting")

		a.OnAbilityFinish(self)
		self:DeleteBucket(string.format("ability_%d_%d_casting_cooldown", eq.get_zone_id(), self:GetID()))
		self:DeleteBucket(string.format("ability_%d_%d_casting_name", eq.get_zone_id(), self:GetID()))
		return
	end

	if not self:IsEngaged() then
		return
	end

	local ai_name = self:GetBucket(string.format("ability_%d_%d_ai", eq.get_zone_id(), self:GetID()))
	if ai_name == "" then
		return
	end
	local ai = ability_db.AbilityAIs[ai_name]
	if ai == nil then
		return
	end
	local is_enhanced = self:GetBucket(string.format("%d_%d_enhanced", eq.get_zone_id(), self:GetID())) ~= ""

	local ability_cooldown = tonumber(self:GetBucket(string.format("ability_%d_%d_%d_cooldown", eq.get_zone_id(), self:GetID(), index)))
	if ability_cooldown == nil then
		ability_cooldown = 0
	end

	if ability_cooldown > os.time() then
		--eq.debug(string.format("On cooldown (%d seconds remain)", ability_cooldown - os.time()))
		return
	end

	-- ability ready to be casted, check if AI decides not to
	if not ai.IsValidTime(self, a) then
		return
	end

	-- time to cast!
	ability_cooldown = os.time() + math.random(24, 120)
	if is_enhanced then
		ability_cooldown = os.time() + math.random(24, 48)
	end
	self:SetBucket(string.format("ability_%d_%d_%d_cooldown", eq.get_zone_id(), self:GetID(), index), tostring(ability_cooldown))
	self:SetBucket(string.format("ability_%d_%d_casting_cooldown", eq.get_zone_id(), self:GetID()), tostring(os.time() + a.CastTime))
	self:SetBucket(string.format("ability_%d_%d_casting_name", eq.get_zone_id(), self:GetID()), tostring(a.Name))
	a.OnAbilityStart(self)
	self:Stun(a.CastTime * 1000)
	self:DoAnim(42)
end

--- Triggered on ability interrupt hitting a mob
---@param self NPC
---@param caster Mob
function ability.OnInterrupt(self, caster)
	local casting_name = self:GetBucket(string.format("ability_%d_%d_casting_name", eq.get_zone_id(), self:GetID()))
	if casting_name == "" then
		return
	end
	local a = ability_db.Abilities[casting_name]
	if a == nil then
		return
	end
	a.OnAbilityInterrupt(self, mob:GetCleanName())
	self:UnStun()
	self:DeleteBucket(string.format("ability_%d_%d_casting_cooldown", eq.get_zone_id(), self:GetID()))
	self:DeleteBucket(string.format("ability_%d_%d_casting_name", eq.get_zone_id(), self:GetID()))
end

--- @param e ModCommonDamage
--- @return ModCommonDamage
function ability.OnCommonDamage(e)
	if e.self:IsNPC() then
		local ability_name = e.self:GetBucket(string.format("ability_%d_%d_casting_name", eq.get_zone_id(), e.self:GetID()))
		if ability_name == "" then
			return e
		end
		local a = ability_db.Abilities[ability_name]
		if a == nil then
			return e
		end
		return a.OnCommonDamage(e, false)
	end
	local ability_name = e.attacker:GetBucket(string.format("ability_%d_%d_casting_name", eq.get_zone_id(), e.self:GetID()))
	if ability_name == "" then
		return e
	end
	local a = ability_db.Abilities[ability_name]
	if a == nil then
		return e
	end
	return a.OnCommonDamage(e, true)
end

--- Triggered on NPC death
---@param self NPC
function ability.Flush(self)
	if not self:IsNPC() then
		return
	end
	local ability_count = ability.AbilityCount(self)
	if ability_count == 0 then
		return
	end
	self:DeleteBucket(string.format("ability_%d_%d_count", eq.get_zone_id(), self:GetID()))
end

return ability