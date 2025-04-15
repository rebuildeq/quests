local skill = {}

local race = require("race_name")
local rb = require('rb')

---@param e ModCommonDamage
---@param origin Client # Person who owns the build skill triggering this event
---@param attacker Mob # Mob who is instigating/casting/attacking
---@param defender Mob # Mob who is defender/target of spell/receiving
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, origin, attacker, defender, rank)
	local is_my_damage = origin:GetID() == attacker:GetID()
	if is_my_damage then
		if not attacker:IsPet() then
			return e
		end
		if not attacker:GetOwner() or not attacker:GetOwner():IsClient() then
			return e
		end
		if attacker:GetOwner():GetID() ~= origin:GetID() then
			return e
		end
		local damage_reduction = 0.1 * rank
		e.return_value = e.value - (e.value * damage_reduction)
		e.ignore_default = true
		rb.Debug(origin, string.format("Hydrosophist reduced outgoing damage to pet by %d.", e.value - e.return_value))
		return e
	end

	if not defender:IsPet() then
		return e
	end
	if not defender:GetOwner() or not defender:GetOwner():IsClient() then
		return e
	end
	if defender:GetOwner():GetID() ~= origin:GetID() then
		return e
	end

	local damage_boost = 0.05 * rank
	e.return_value = e.value + (e.value * damage_boost)
	e.ignore_default = true
	rb.Debug(origin, string.format("Hydrosophist increased incoming to pet damage by %d.", e.return_value - e.value))
	return e
end

---@param self Client
---@param rank integer -- the rank of the skill
function skill.Tick(self, rank)
	local attacker = self

	if not attacker:HasPet() then
		return
	end

	local pet = attacker:GetPet()
	if not pet.valid then
		return
	end

	if pet:GetBaseRace() ~= race.WaterElemental and pet:GetBaseRace() ~= race.Elemental then
		return
	end

	local hydro_timer = tonumber(attacker:GetBucket("hydrosophist_timer"))
	if hydro_timer == nil then
		hydro_timer = 0
	end
	local next_hydro = os.time() + 18
	if hydro_timer > os.time() then
		return
	end

	if pet:GetHPRatio() < 50 then
		return
	end

	local most_hurt_mob = nil
	local most_hurt_mob_hp = 100

	if pet:GetHPRatio() < most_hurt_mob_hp then
		most_hurt_mob = pet
		most_hurt_mob_hp = pet:GetHPRatio()
	end

	if attacker:GetHPRatio() < most_hurt_mob_hp and
		pet:CalculateDistance(attacker:GetX(), attacker:GetY(), attacker:GetZ()) <= 50 then
		most_hurt_mob = attacker
		most_hurt_mob_hp = attacker:GetHPRatio()
	end

	local group = attacker:GetGroup()
	if group.valid then
		local members = group:GroupCount()
		for i = 1, members do
			local member = group:GetMember(i)
			if member.valid and
				pet:CalculateDistance(member:GetX(), member:GetY(), member:GetZ()) <= 50 and
				member:GetHPRatio() < most_hurt_mob_hp then
				most_hurt_mob = member
				most_hurt_mob_hp = member:GetHPRatio()
			end
		end
	end

	if most_hurt_mob == nil then
		return
	end

	attacker:SetBucket("hydrosophist_timer", string.format("%d", next_hydro))

	local heal_amount = pet:GetMaxHP() * (rank * 0.02)
	pet:Damage(pet, heal_amount, 0, 0, false, 0) -- hurt pet
	most_hurt_mob:HealDamage(heal_amount)
	most_hurt_mob:Message(MT.Spells, string.format("Hydrophist (%d) healed you for %d points of damage.", rank, heal_amount))
	if most_hurt_mob:GetID() == attacker:GetID() then
		return
	end

	rb.Debug(attacker, string.format("Hydrophist (%d) healed %s for %d points of damage.", rank, most_hurt_mob:GetCleanName(), heal_amount))
end

return skill
