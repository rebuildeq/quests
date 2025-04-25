local skill = {}
local rb = require('rb')

---@param e SpellEventSpellEffect
---@param origin Client # Person who owns the build skill triggering this event
---@param attacker Mob # Mob who is instigating/casting/attacking
---@param defender Mob # Mob who is defender/target of spell/receiving
---@param rank integer -- the rank of the skill
---@return boolean
function skill.SpellEffect(e, origin, attacker, defender, rank)
	if origin:GetID() ~= attacker:GetID() then
		return true
	end

	if e.spell_id ~= 42805 then
		return true
	end

	if not defender:IsPet() then
		return true
	end

	if not origin:IsClient() then
		return true
	end

	-- Move pet to caster position
	defender:GMMove(origin:GetX(), origin:GetY(), origin:GetZ(), origin:GetHeading())

	-- Wipe the hatelists of the pet and caster
	eq.get_entity_list():RemoveFromHateLists(defender)
	eq.get_entity_list():RemoveFromHateLists(origin)

	--[[
	local el = eq.get_entity_list():GetMobList()
	for mob in el.entries do
		if mob.valid then
			mob:SetHate(defender, -0, 0)
			mob:SetHate(origin, 0, 0)
			--mob:WipeHateList()
			rb.Debug(origin, string.format("Setting hate to 0 for %s", mob:GetCleanName()))
		end
	end
	]]--

	--local hate_list = e.self:GetHateListClients()
	--for entry in hate_list.entries do

	defender:WipeHateList() -- Wipe pet's hatelist so it won't keep attacking the target

	rb.Debug(origin, string.format("Warder Recall triggered"))
	return false
end

return skill
