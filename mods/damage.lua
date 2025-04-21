local builds = require("builds")
local damage = require("damage")

---@param e ModHealDamage
function HealDamage(e)
	builds.OnModHealDamage(e)
end

---@param e ModCommonDamage
function CommonDamage(e)
    damage.OnDeathTouch(e)
    damage.OnPetIncomingDamage(e)
	builds.OnModCommonDamage(e)
end

---@param e ModCheckHitChance
function CheckHitChance(e)
	builds.OnCheckHitChance(e)
end
