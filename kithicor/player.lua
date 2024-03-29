function event_enter_zone(e)
    if e.self:GetClass() == 8 then
        local qglobals = eq.get_qglobals(e.self)
        if qglobals["bard15"] == "5" then
            local entity_list = eq.get_entity_list()
            if entity_list:IsMobSpawnedByNpcTypeID(20290) == false and entity_list:IsMobSpawnedByNpcTypeID(20291) == false and entity_list:IsMobSpawnedByNpcTypeID(20292) == false then
                eq.spawn2(20290, 140, 0, 1157, 537, 131, 490)
            end
        end
	elseif (e.self:GetClass() == 6 ) then
		local qglobals = eq.get_qglobals(e.self)
        if qglobals["druid_epic"] == "7" then
				local entity_list = eq.get_entity_list()
				if entity_list:IsMobSpawnedByNpcTypeID(20299) == false then
					eq.spawn2(20299, 0, 0, -696.6,-523.8,-33,78)
				end
		end
    end
end

function event_loot(e)
	if(e.self:Class() == "Druid" and e.item:GetID() == 62862) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["druid_epic"] == "7") then
			if(qglobals["druid_chest_kith"] == nil ) then
				eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
				eq.set_global("druid_chest_kith","1",5,"F");
			end
		else
			return 1;
		end
	end
end

