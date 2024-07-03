local ability = {}
local race = require("race_name")

---@class Ability
---@field Name string -- The name of the ability
---@field TickFrequency integer -- How often the ability should be triggered in seconds
---@field CastTime integer -- How long the ability should take to cast in seconds
---@field Check fun(self: NPC): boolean -- Check if the ability should be used
---@field OnAbilityStart fun(self: NPC) -- Triggered when the ability starts
---@field OnAbilityInterrupt fun(self: NPC) -- Triggered when the ability is interrupted
---@field OnAbilityFinish fun(self: NPC) -- Triggered when the ability finishes
---@field OnCommonDamage fun(e: ModCommonDamage, is_attacker: boolean): ModCommonDamage -- Triggered on common damage

---@type Ability[]
local abilities = {
	["Strengthen"] = { -- 30% damage boost
		Name = "Strengthen",
		TickFrequency = 6,
		CastTime = 6,
		Check = function(self)
			if self:GetBaseRace() == race.Dragon then return true end
			return false
		end,
		OnAbilityStart = function(self)
			self:Emote("begins to gather strength from it's surroundings")
		end,
		OnAbilityInterrupt = function(self)
			local interrupter_name = self:GetBucket("ability_interrupter")
			if interrupter_name == "" then
				return
			end
			self:Emote(string.format("stops gathering strength, as it was interrupted by %s", interrupter_name))
		end,
		OnAbilityFinish = function(self)
			self:Emote("gathers strength from it's surroundings")
		end,
		OnCommonDamage = function(e, is_attacker)
			if not is_attacker then
				return e
			end
			if e.value <= 0 then
				return e
			end
			local damage_boost = 0.3
			e.value = e.value + (e.value * damage_boost)
			e.ignore_default = true
			return e
		end,
	},
}

---@class AbilityAI
---@field Check fun(self: NPC): boolean -- Check if the AI should be used
---@field IsValidTime fun(self: NPC, a:Ability): boolean -- Check if the AI should be used

---@type AbilityAI[]
local ability_ais = {
	["Smart"] = {
		Check = function(self)
			local roll = math.random(1, 100)
			if roll < 20 then return false end
			if self:GetLevel() < 30 then return false end
			return false
		end,
		IsValidTime = function(self, a)
			if a.name == "Strengthen" then return true end
			return false
		end
	},
	["Coward"] = {
	},
	["Ego"] = {
	},
	["Adept"] = {
	},
	["Engaging"] = {
	},
	["Insane"] = {
	},
	["Neutral"] = {
	}
}

--- Return an ability name assigned to an NPC, if any
---@param self NPC
---@return Ability?
function ability.Ability(self)
	local ability_name = self:GetBucket("ability")
	if ability_name ~= "" then
		return abilities[ability_name]
	end
	for ability_name, a in pairs(abilities) do
		if a.Check(self) then
			for ai_name, ai in pairs(ability_ais) do
				if ai.Check(self) then
					self:SetBucket("ability_ai", tostring(ai_name))
					self:SetBucket("ability", tostring(ability_name))
					local ability_cooldown = 0
					ability_cooldown = os.time() + math.random(30, 120)
					if self:GetBucket("enhanced") ~= "" then
						ability_cooldown = os.time() + math.random(20, 40)
					else
					end
					self:SetBucket("ability_cooldown", tostring(ability_cooldown))
					return a
				end
			end
		end
	end
	return nil
end

--- Triggered on tick
---@param self NPC
function ability.OnTick(self)
	local name = self:GetBucket("ability")
	if name == "" then
		return
	end
	local a = abilities[name]

	local ability_casting_cooldown = tonumber(self:GetBucket("ability_casting_cooldown"))
	if ability_casting_cooldown ~= nil then
		if ability_casting_cooldown > os.time() then
			return
		end

		a.OnAbilityFinish(self)
		self:DeleteBucket("ability_casting_cooldown")
		return
	end

	if a == nil then
		return
	end
	local ai_name = self:GetBucket("ability_ai")
	if ai_name == "" then
		return
	end
	local ai = ability_ais[ai_name]
	if ai == nil then
		return
	end
	local is_enhanced = self:GetBucket("enhanced") ~= ""

	local ability_cooldown = tonumber(self:GetBucket("ability_cooldown"))
	if ability_cooldown == nil then
		ability_cooldown = 0
	end
	if ability_cooldown > os.time() then
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
	self:SetBucket("ability_cooldown", tostring(ability_cooldown))
	self:SetBucket("ability_casting_cooldown", tostring(os.time() + a.CastTime))
	a.OnAbilityStart(self)
	self:Stun(a.CastTime * 1000)
	self:DoAnim(42)
end

--- Triggered on ability interrupt hitting a mob
---@param self NPC
---@param caster Mob
function ability.OnInterrupt(self, caster)
	local name = self:GetBucket("ability")
	if name == "" then
		return
	end
	local a = abilities[name]
	if a == nil then
		return
	end
	local ability_casting_cooldown = tonumber(self:GetBucket("ability_casting_cooldown"))
	if ability_casting_cooldown == nil then
		return
	end
	if ability_casting_cooldown < os.time() then
		return
	end
	self:SetBucket("ability_interrupter", mob:GetCleanName())
	a.OnAbilityInterrupt(self)
	self:UnStun()
	self:DeleteBucket("ability_casting_cooldown")
end

--- @param e ModCommonDamage
--- @return ModCommonDamage
function ability.OnCommonDamage(e)
	if e.self:IsNPC() then
		local name = e.self:GetBucket("ability")
		if name == "" then
			return e
		end
		local a = abilities[name]
		if a == nil then
			return e
		end
		return a.OnCommonDamage(e, false)
	end
	local name = e.attacker:GetBucket("ability")
	if name == "" then
		return e
	end
	local a = abilities[name]
	if a == nil then
		return e
	end
	return a.OnCommonDamage(e, true)
end
return ability