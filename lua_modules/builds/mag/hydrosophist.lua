local skill = {}

local race = require("race_name")

---@param e ModCommonDamage
---@param is_my_damage boolean -- is damage from the player
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, is_my_damage, rank)
	local ally = e.self
	local enemy = e.attacker
	if is_my_damage then
		ally = e.attacker
		enemy = e.self
	end
	if not ally:IsPet() then
		return e
	end
	local owner = ally:GetOwner()
	if not owner:IsClient() then
		return e
	end
	local builds = require('builds')
	if is_my_damage then
		local damage_reduction = 0.1 * rank
		e.return_value = e.value - (e.value * damage_reduction)
		e.ignore_default = true
		builds.Debug(owner, string.format("Hydrosophist reduced outgoing damage to pet by %d.", e.value - e.return_value))
		return e
	end

	local damage_boost = 0.05 * rank
	e.return_value = e.value + (e.value * damage_boost)
	e.ignore_default = true
	builds.Debug(owner, string.format("Hydrosophist increased incoming to pet damage by %d.", e.return_value - e.value))
	return e
end

---@param self Client
---@param rank integer -- the rank of the skill
function skill.Tick(self, rank)
	local builds = require('builds')

	local ally = self

	if not ally:HasPet() then
		return
	end

	local pet = ally:GetPet()
	if not pet.valid then
		return
	end

	if pet:GetBaseRace() ~= race.WaterElemental and pet:GetBaseRace() ~= race.Elemental then
		return
	end

	local hydro_timer = tonumber(ally:GetBucket("hydrosophist_timer"))
	if hydro_timer == nil then
		hydro_timer = 0
	end
	local next_hydro = os.time() + 18
	if hydro_timer > os.time() then
		return
	end

	local most_hurt_mob = nil
	local most_hurt_mob_hp = 100

	if pet:GetHPRatio() < most_hurt_mob_hp then
		most_hurt_mob = pet
		most_hurt_mob_hp = pet:GetHPRatio()
	end

	if ally:GetHPRatio() < most_hurt_mob_hp and
		pet:CalculateDistance(ally:GetX(), ally:GetY(), ally:GetZ()) <= 50 then
		most_hurt_mob = ally
		most_hurt_mob_hp = ally:GetHPRatio()
	end


	local group = ally:GetGroup()
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

	ally:SetBucket("hydrosophist_timer", string.format("%d", next_hydro))

	local heal_amount = pet:GetMaxHP() * (rank * 0.02)
	most_hurt_mob:HealDamage(heal_amount)
	most_hurt_mob:Message(MT.Spells, string.format("Hydrophist (%d) healed you for %d points of damage.", rank, heal_amount))
	if most_hurt_mob:GetID() == ally:GetID() then
		return
	end
	builds.Debug(ally, string.format("Hydrophist (%d) healed %s for %d points of damage.", rank, most_hurt_mob:GetCleanName(), heal_amount))
end

return skill
