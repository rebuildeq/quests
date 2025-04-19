local vitality = {}

--- Triggers when a player first connects
--- @param client Client
--- @param last_login integer
function vitality.OnConnect(client, last_login)
    local is_rested = vitality.InRestedArea(client)
    vitality.RestedBuffCheck(is_rested, client)
    vitality.UpdateUI(client)

    local seconds_since_last_login = os.time() - last_login
    if seconds_since_last_login < 60 then
        return
    end


    local seconds_since_last_login = os.time() - last_login
    local days = math.floor(seconds_since_last_login / 86400)
    local hours = math.floor((seconds_since_last_login % 86400) / 3600)
    local minutes = math.floor((seconds_since_last_login % 3600) / 60)
    local seconds = seconds_since_last_login % 60

    if days > 0 then
        client:Message(13, string.format("You last logged in %d days, %d hours, %d minutes, and %d seconds ago.", days, hours, minutes, seconds))
    elseif hours > 0 then
        client:Message(13, string.format("You last logged in %d hours, %d minutes, and %d seconds ago.", hours, minutes, seconds))
    elseif minutes > 0 then
        client:Message(13, string.format("You last logged in %d minutes, and %d seconds ago.", minutes, seconds))
    else
        client:Message(13, string.format("You last logged in %d seconds ago.", seconds))
    end

    if vitality.InRestedArea(client) then
        vitality.AddRestedVitality(client, seconds_since_last_login, true)
    end

    eq.debug("Last logged in:" .. seconds_since_last_login .. " seconds ago")
    if not is_rested then
        return
    end
end

--- Triggers when a player zones
--- @param client Client
function vitality.OnZone(client)
    vitality.UpdateUI(client)
end


--- Every tick checks if in a rested area
--- @param client Client
function vitality.OnTick(client)
    local is_rested = vitality.InRestedArea(client)
    vitality.RestedBuffCheck(is_rested, client)

    vitality.UpdateUI(client) -- expensive, we can move it away from OnTick if we can track exp changes


    --vitality.AddRestedVitality(client, 10000, false)
    if not is_rested then
        return
    end
    vitality.AddRestedVitality(client, 6, false)
end

--- Applies a rested buff if situation is met
--- @param is_rested boolean
--- @param client Client
function vitality.RestedBuffCheck(is_rested, client)
    local has_buff = client:FindBuff(42603)

    if not is_rested then
        if has_buff then
            client:BuffFadeBySpellID(42603)
        end
        return
    end

    if not has_buff then
        client:ApplySpellBuff(42603)
    end
end

--- Updates the UI for vitality
--- @param client Client
function vitality.UpdateUI(client)

    local total_vitality = 0

    local vitality_pool = tonumber(client:GetBucket("vitality_v1")) or 0
    total_vitality = total_vitality + vitality_pool
    vitality_pool = tonumber(client:GetBucket("vitality_v2")) or 0
    total_vitality = total_vitality + vitality_pool
    vitality_pool = tonumber(client:GetBucket("vitality_v3")) or 0
    total_vitality = total_vitality + vitality_pool


    local exp_next_level = vitality.GetEXPForLevel(client:GetLevel()+1)


    if vitality_pool > exp_next_level then
        vitality_pool = exp_next_level
    end

    --eq.debug("vitality pool: " .. total_vitality .. " exp_next_level: " .. exp_next_level)
    local pack = Packet(0x2CC6, 32, true) -- 28 bytes
    pack:WriteInt64(total_vitality) -- curVitality
    pack:WriteInt64(exp_next_level) -- maxVitality
    pack:WriteInt64(0) -- curAAVitality
    pack:WriteInt64(0) -- maxAAVitality
    client:QueuePacket(pack) -- send packet
end

--- Adds rested experience based on a duration
--- @param client Client
--- @param seconds integer
--- @param is_login boolean
function vitality.AddRestedVitality(client, seconds, is_login)
    local vitality_amount = 0

    local exp_needed = vitality.GetEXPForLevel(client:GetLevel()+1)
    local exp_multi = exp_needed / 20 / 60 / 60 -- 20 hrs of resting gives you rested exp worth of next level
    vitality_amount = math.floor(exp_multi * seconds)
    if vitality_amount < 1 then
        vitality_amount = 1
    end

    eq.debug("needed: " .. exp_needed .. " multi: " .. exp_multi .. " amount " .. vitality_amount)

    if is_login then
        local exp_cap = vitality.GetEXPForLevel(client:GetLevel()+2)
        local exp_current = tonumber(client:GetBucket("vitality_v1")) or 0
        local vitality_total = exp_current + vitality_amount
        local cap_message = ""

        if vitality_total > exp_cap then
            vitality_amount = exp_cap - exp_current
            cap_message = ", reaching maximum capacity"
        end

        client:Message(MT.Experience, string.format("You have acquired " .. vitality_amount .. " vitality while signed off%s.", cap_message))
    end

    vitality.AddVitality(client, 1, vitality_amount)
end

--- Adds vitality based on category. Category is 1 to 3
--- @param client Client
--- @param category integer
--- @param amount integer
function vitality.AddVitality(client, category, amount)
    if category > 3 or category < 1 then
        eq.debug("Invalid category " .. category .. " for vitality")
        return
    end
    local vitality_pool = tonumber(client:GetBucket("vitality_v" .. category))
    if vitality_pool == nil then
        vitality_pool = 0
    end
    vitality_pool = vitality_pool + amount

    local exp_needed = vitality.GetEXPForLevel(client:GetLevel()+1)
    if category == 1 then
        exp_needed = vitality.GetEXPForLevel(client:GetLevel()+2)
    end
    if vitality_pool > exp_needed then
        vitality_pool = exp_needed
    end

    client:SetBucket("vitality_v" .. category, tostring(vitality_pool))
    if category == 3 then
        client:Message(MT.Experience, "You have acquired " .. amount .. " vitality. You now have " .. vitality_pool .. " activity vitality.")
    end
end

--- Check if player is in a rested area
--- @param client Client
--- @return boolean
function vitality.InRestedArea(client)

    if eq.get_zone_id() == Zone.qcat then
        return true
    end

	if eq.get_zone_id() == Zone.qeynos then
		return true
	end
	if eq.get_zone_id() == Zone.qeynos2 then
		return true
	end
	if eq.get_zone_id() == Zone.qrg then
		return true
	end
	if eq.get_zone_id() == Zone.freportn then
		return true
	end
	if eq.get_zone_id() == Zone.freportw then
		return true
	end
	if eq.get_zone_id() == Zone.freporte then
		return true
	end
	if eq.get_zone_id() == Zone.rivervale then
		return true
	end
	if eq.get_zone_id() == Zone.erudnint then
		return true
	end
	if eq.get_zone_id() == Zone.erudnext then
		return true
	end
	if eq.get_zone_id() == Zone.halas then
		return true
	end
	if eq.get_zone_id() == Zone.neriaka then
		return true
	end
	if eq.get_zone_id() == Zone.neriakb then
		return true
	end
	if eq.get_zone_id() == Zone.neriakc then
		return true
	end
	if eq.get_zone_id() == Zone.neriakd then
		return true
	end
	if eq.get_zone_id() == Zone.oggok then
		return true
	end
	if eq.get_zone_id() == Zone.grobb then
		return true
	end
	if eq.get_zone_id() == Zone.gfaydark then
		return true
	end
	if eq.get_zone_id() == Zone.akanon then
		return true
	end
	if eq.get_zone_id() == Zone.kaladima then
		return true
	end
	if eq.get_zone_id() == Zone.felwithea then
		return true
	end
	if eq.get_zone_id() == Zone.felwitheb then
		return true
	end
	if eq.get_zone_id() == Zone.kaladimb then
		return true
	end

    if eq.get_zone_id() >= 40 and eq.get_zone_id() <= 42 then -- neriaka to c
        return true
    end

    if eq.get_zone_id() == Zone.cabwest then -- cabwest
        return true
    end

    if eq.get_zone_id() == Zone.cabwest then -- cabwest
        return true
    end


    if eq.get_zone_id() == 22 and -- ecommons
        client:GetX() < 100 and client:GetX() > -800 and
        client:GetY() < -1500 and client:GetY() > -2000 then
        return true
    end

    if (eq.get_zone_id() == 115 or eq.get_zone_id() == 129) and -- thurgadin a or b
        client:GetCharacterFactionLevel(1152) < Faction.Dubious then
        return true
    end

    if eq.get_zone_id() == 113 and -- kael
        client:GetCharacterFactionLevel(188) < Faction.Dubious then
        return true
    end

    if eq.get_zone_id() == 114 and -- skyshrine
        client:GetCharacterFactionLevel(42) < Faction.Dubious then
        return true
    end

    if eq.get_zone_id() == 93 and -- overthere
        client:GetX() < 3645 and client:GetX() > 1921 and
        client:GetY() < 3726 and client:GetY() > 2182 and
        client:GetCharacterFactionLevel(353) < Faction.Dubious then
        return true
    end

    if eq.get_zone_id() == 84 and -- firiona
        client:GetX() < 3245 and client:GetX() > 917 and
        client:GetY() < -2242 and client:GetY() > -4817 and
        client:GetCharacterFactionLevel(418) < Faction.Dubious then
        return true
    end

    return false
end


--- Returns the amount of experience needed for a level
--- @param level number
function vitality.GetEXPForLevel(level)
    local exp_table = {
        0, -- level 1, copy from sheets below values
		5000,
        28000,
        117000,
        314000,
        625000,
        1016000,
        1543000,
        2312000,
        3229000,
        4500000,
        5831000,
        7728000,
        10197000,
        12744000,
        15875000,
        19596000,
        23913000,
        28332000,
        33859000,
        40000000,
        46261000,
        52648000,
        60167000,
        68824000,
        77625000,
        87576000,
        98683000,
        108952000,
        121389000,
        133700000,
        147770100,
        161044800,
        174530700,
        189234400,
        203450000,
        217987200,
        232783600,
        247846400,
        263182800,
        283200000,
        299597296,
        316314400,
        333359104,
        350739200,
        369575000,
        388270400,
        407352192,
        426828800,
        446708608,
        467000000,
        492976496,
        520972800,
        551090896,
        581181600,
        609387488,
        633916800,
        662982496,
        696802400,
        736137024,
        769600000,
        803641088,
        838816768,
        875145728,
        912646400,
        951337472,
        991237632,
        1032365312,
        1074739200,
        1118377920,
        1163299968,
        1209524096,
        1257068800,
        1305952640,
        1356194432,
        1407812480,
        1460825600,
        1515252352,
        1571111168,
        1628420864,
        1687200000,
        1747467136,
        1809240832,
        1872539648,
        1937382400,
        2003787520,
        2071773568,
        2141359360,
        2212563200,
        2285403904,
        2359899904,
        2436070144,
        2513932800,
        2593506816,
        2674810368,
        2757862400,
        2842681600,
        2929286400,
        3017695232,
        3107926784,
        3200000000,
	};

    if level < 1 or level > #exp_table then
        eq.debug("Invalid level " .. level .. " for experience table")
        return 0
    end

    return exp_table[level]
end

return vitality