local builds = require("builds")
local affinity = require("affinity")

---@param e ModHealDamage
function HealDamage(e)
	builds.OnModHealDamage(e)
end

---@param e ModCommonDamage
function CommonDamage(e)
	builds.OnModCommonDamage(e)
	affinity.OnModCommonDamage(e)
end

---@param e ModCheckHitChance
function CheckHitChance(e)
	builds.OnCheckHitChance(e)
end
