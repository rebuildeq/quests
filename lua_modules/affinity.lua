local affinity = {}

affinity.NONE = 0
affinity.SPIRIT = 1
affinity.FIRE = 2
affinity.WATER = 3
affinity.EARTH = 4
affinity.AIR = 5

--- Triggered On ModCommonDamage
---@param e ModCommonDamage
function affinity.OnModCommonDamage(e)
	if not e.self.valid or not e.attacker.valid then
		return e
	end

	local is_good = false
    local ally = e.self
    local enemy = e.attacker
    if not ally.valid then
        return e
    end
    if not enemy.valid then
        return e
    end
    if not ally:IsClient() then
        if ally:HasOwner() and ally:GetOwner():IsClient() then
            ally = ally:GetOwner() -- pet
        else
            is_good = true
            ally = e.attacker
            enemy = e.self
            if not ally:IsClient() then
                if not ally:HasOwner() then
                    return e
                end
                if not ally:GetOwner():IsClient() then
                    return e
                end
                ally = ally:GetOwner() -- pet
            end
        end
    end

	e.ignore_default = true
	if is_good then
		e.value = ally:AffinityDamage(e.value, enemy)
		return e
	end
	e.value = enemy:AffinityDamage(e.value, ally)
	return e
end

return affinity
