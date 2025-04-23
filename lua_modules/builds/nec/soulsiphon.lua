local skill = {}
local rb = require('rb')

---@param e ModCommonDamage
---@param origin Client # Person who owns the build skill triggering this event
---@param attacker Mob # Mob who is instigating/casting/attacking
---@param defender Mob # Mob who is defender/target of spell/receiving
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, origin, attacker, defender, rank)
	if origin:GetID() ~= attacker:GetID() then
		return e
	end

	local spell = eq.get_spell(e.spell_id)
	if spell == nil then
		-- only spells valid
		return e
	end
	if spell:Mana() == 0 then
		-- only spells that cost mana
		return e
	end
	if spell:BuffDuration() < 1 then
		-- only spells that have a duration
		return e
	end
	if e.value <= 0 then
		-- only spells that deal damage
		return e
	end

	local diceroll = math.random(1,100)
	if diceroll >= 75 then
		local group_list = attacker:CastToClient():GetGroup()
		local heal_amount = 10 * rank
		if group_list:GroupCount() == 0 then
			-- heal the solo player
			attacker:HealDamage(heal_amount)
			rb.Debug(attacker, string.format("Soul Siphon healed %s for %d.", attacker:GetName(), heal_amount))
		else
			-- heal the entire group
			local distance = 100
			for i = 0, group_list:GroupCount() - 1 do
				local player = group_list:GetMember(i)
				if player.valid and attacker:CalculateDistance(player:GetX(), player:GetY(), player:GetZ()) <= distance then
					player:HealDamage(heal_amount)
					rb.Debug(attacker, string.format("Soul Siphon healed %s for %d.", player:GetName(), heal_amount))
				end
			end
		end
	end

	return e
end

return skill
