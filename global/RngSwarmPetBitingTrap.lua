local spell_id = 42862 -- Biting Trap
local trigger_distance = 20
local trap_timer = "check_trap"
local depop_timer = "depop"

function event_spawn(e)
	e.self:TempName("Biting_Trap")
	eq.set_timer(trap_timer, 1000)
	e.self:SetLevel(e.self:GetOwner():GetLevel())
end

function event_timer(e)
	if e.timer == trap_timer then
		local npc_list = e.self:GetCloseMobList(trigger_distance) -- eq.get_entity_list():GetNPCList()
		local owner = e.self:GetOwner()

		if owner == nil then
			eq.depop()
			return
		end

		local best_dist = trigger_distance + 1
		local best_npc_id = -1
		for npc in npc_list.entries do
			-- Don't activate on clients, bots, mercs, or friendly pets (not checking npc:IsPet() because it returns false for swarm pets)
			local is_client_or_clients_pet = npc:IsOfClientBotMerc() or (npc:GetOwner() and npc:GetOwner():IsOfClientBotMerc())
			if npc.valid and npc:GetID() ~= e.self:GetID() and npc:GetID() ~= owner:GetID() and is_client_or_clients_pet == false and e.self:CheckLoS(npc) then
				local dist = e.self:CalculateDistance(npc:GetX(), npc:GetY(), npc:GetZ())
				if dist <= trigger_distance and dist < best_dist then
					best_dist = dist
					best_npc_id = npc:GetID()
				end
			end
		end

		if best_npc_id ~= -1 and owner.valid then
			owner:CastSpell(spell_id, best_npc_id) -- having owner cast the spell so the dot works
			eq.stop_timer(trap_timer)
			eq.set_timer(depop_timer, 100) -- delay depopping so the spell can be successfully cast
		end
	elseif e.timer == depop_timer then
		eq.depop()
	end
end
