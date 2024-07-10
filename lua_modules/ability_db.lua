local ability_db = {}

local race = require("race_name")

---@class Ability
---@field Name string -- The name of the ability
---@field SignalFrequency integer -- How often the ability should be triggered in seconds
---@field CastTime integer -- How long the ability should take to cast in seconds
---@field Check fun(self: NPC): boolean -- Check if the ability should be used
---@field OnAbilityStart fun(self: NPC) -- Triggered when the ability starts
---@field OnAbilityInterrupt fun(self: NPC, interrupter_name: string) -- Triggered when the ability is interrupted
---@field OnAbilityFinish fun(self: NPC) -- Triggered when the ability finishes
---@field OnCommonDamage fun(e: ModCommonDamage, is_attacker: boolean): ModCommonDamage -- Triggered on common damage
---@field CooldownInit fun(is_enhanced: boolean): integer -- The cooldown of the ability

---@type Ability[]
ability_db.Abilities = {
	["Strengthen"] = { -- 30% damage boost
		Name = "Strengthen",
		SignalFrequency = 6,
		CastTime = 6,
		CooldownInit = function(is_enhanced) return math.random(24, 120) end,
		Check = function(self)
			if self:GetBaseRace() == race.Dragon then return true end
			return true
			--return false
		end,
		OnAbilityStart = function(self)
			self:Emote("begins to gather strength from it's surroundings")
		end,
		OnAbilityInterrupt = function(self, interrupter_name)
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
ability_db.AbilityAIs = {
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
		Check = function(self)
			return true
		end,
		IsValidTime = function(self, a)
			return true
		end
	}
}

--- Return a count of maximum abilities for a provided NPC
---@param self NPC
---@return integer
function ability_db.Count(self)
	if self:IsRaidTarget() then
		return 3
	end
	if self:GetLevel() < 10 then
		return 1
	end
	if self:GetLevel() < 20 then
		return math.random(1, 2)
	end
	if self:GetLevel() < 30 then
		return math.random(1, 3)
	end
	if self:GetLevel() < 40 then
		return math.random(1, 4)
	end
	if self:GetLevel() < 50 then
		return math.random(1, 5)
	end
	if self:GetLevel() < 60 then
		return math.random(1, 6)
	end
	if self:GetLevel() < 70 then
		return math.random(1, 7)
	end
	if self:GetLevel() < 80 then
		return math.random(1, 8)
	end
	if self:GetLevel() < 90 then
		return math.random(1, 9)
	end
	return math.random(1, 10)
end


return ability_db