---@param e ModHealDamage
function HealDamage(e)
	local builds = require("builds")
	builds.OnModHealDamage(e)
end

---@param e ModCommonDamage
function CommonDamage(e)
	local builds = require("builds")
	builds.OnModCommonDamage(e)
end

---@param e ModCheckHitChance
function CheckHitChance(e)
	local builds = require("builds")
	builds.OnCheckHitChance(e)
end
