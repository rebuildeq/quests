local skill = {}

local race = require("race_name")
local builds = require('builds')

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
		local damage_increase = 0.1 * rank
		e.return_value = e.value + (e.value * damage_increase)
		e.ignore_default = true
		builds.Debug(origin, string.format("Pyromancy (%d) increased outgoing damage from pet by %d.", rank, e.value - e.return_value))
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

	local damage_boost = 0.1 * rank
	e.return_value = e.value + (e.value * damage_boost)
	e.ignore_default = true
	builds.Debug(origin, string.format("Pyromancy (%d) increased incoming to pet damage by %d.", rank, e.return_value - e.value))
	return e
end

---@param self Client
---@param rank integer -- the rank of the skill
function skill.Tick(self, rank)
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

	local pyro_timer = tonumber(ally:GetBucket("pyro_timer"))
	if pyro_timer == nil then
		pyro_timer = 0
	end
	local next_pyro = os.time() + 6
	if pyro_timer > os.time() then
		return
	end

	if pet:GetHPRatio() < 30 then
		return
	end

	local target = pet:GetTarget()
	if target == nil or not target.valid then
		return
	end

	if target:CalculateDistance(pet:GetX(), pet:GetY(), pet:GetZ()) > 20 then
		return
	end

	local damage = pet:GetMaxHP() * (rank * 0.05)

	local max_enemies = 2 * rank
	local enemy_count = 0

	local hate_list = ally:GetHateList()
	for ent in hate_list.entries do
		if not ent:IsMezzed() and ent:CalculateDistance(ally:GetX(), ally:GetY(), ally:GetZ()) <= 30 then -- within range
			local damage = damage * builds.ResistSpell(pet, target, 100, 0, false)/100
			ent:Damage(pet, damage, 0, Skill['Evocation'], false)
			ally:AddToHateList(ent, damage, 0)
			pet:Damage(pet, damage/2, 0, Skill['Evocation'], false)


			enemy_count = enemy_count + 1
			if enemy_count >= max_enemies then
				break
			end
		end
	end


	ally:SetBucket("pyro_timer", string.format("%d", next_pyro))
	builds.Debug(ally, string.format("Pyromancy (%d) dealt %d fire damage to %d enemies pre-resists.", rank, damage, enemy_count))
end

return skill
