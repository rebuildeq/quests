local skill = {}

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

	if pet:GetRaceName() ~= "Water Elemental" then
		return
	end

	local hydro_timer = ally:GetBucket("hydrosophist_timer")
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

	local heal_amount = most_hurt_mob:GetMaxHP() * (rank * 0.1)
	most_hurt_mob:HealDamage(heal_amount)
	most_hurt_mob:Message(MT.Spells, string.format("Hydrophist healed you for %d (%d%%) points of damage.", heal_amount, (rank * 0.1)))
	builds.Debug(ally, string.format("Hydrophist healed %s for %d (%d%%) points of damage.", most_hurt_mob:GetCleanName(), heal_amount, (rank * 0.1)))
end

return skill
