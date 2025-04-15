local builds = require("builds")

---@param e ModHealDamage
function HealDamage(e)
	builds.OnModHealDamage(e)
end

---@param e ModCommonDamage
function CommonDamage(e)
	builds.OnModCommonDamage(e)
end

---@param e ModCheckHitChance
function CheckHitChance(e)
	builds.OnCheckHitChance(e)
end
