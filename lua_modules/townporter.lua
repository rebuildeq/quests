local townporter = {}


---@param e NPCEventSay
function townporter.OnSay(e)
    local mob_class = e.self:GetClass()
    -- if (e.self:GetCleanName() == "Priest of Discord") then townporter.OnSayTownPorter(e)
    -- elseif (e.self:GetNPCTypeID() == 345004) then townporter.OnSayTownPorter(e) -- porter in guildhall
    -- elseif (eq.get_zone_id() == Zone.guildlobby and e.self:GetCleanName():find("Guardian")) then townporter.OnSayTownPorter(e) -- guards in guildlobby
    -- end
end


---@param client Client
function townporter.PortCalculateCost(client)
    local level = client:GetLevel()
    -- If the player is less than or equal to level 10, don't charge the player anything
    if level <= 10 then
        return 0
    end
    if level <= 20 then
        return level*20
    end

    if level <= 30 then
        return level*30
    end

    if level <= 40 then
        return level*50
    end

    if level <= 50 then
        return level*80
    end

    if level <= 60 then
        return level*100
    end

    -- Otherwise, charge the player 1pp per level. 11 = 1pp, 60 = 50pp
    return level*40
end


---@param client Client
function townporter.PortTakeMoney(client)
    local plat = townporter.PortCalculateCost(client)
    local copper = 1000 * townporter.PortCalculateCost(client)

    local result = client:TakeMoneyFromPP(copper, true)
    if result then
        client:Message(15, plat .. " platinum pieces have been removed from your inventory")
    end

    return result
end


---@param e NPCEventSay
function townporter.OnSayTownPorter(e)
    local ports = {}
    ports["everfrost"] = {x = 0, y = 0, z =  0, zone_id = 0} -- Barbarians
    ports["nektulos"] = {x = 0, y = 0, z =  0, zone_id = 0} -- Dark Elves
    ports["butcherblock"] = {x = 0, y = 0, z =  0, zone_id = 0} -- Dwarves
    ports["toxx"] = {x = 0, y = 0, z =  0, zone_id = 0} -- Erudites
    ports["steamfont"] = {x = 0, y = 0, z =  0, zone_id = 0} -- Gnomes
    ports["kithicor"] = {x = 0, y = 0, z =  0, zone_id = 0} -- Halflings
    ports["freportw"] = {x = 0, y = 0, z =  0, zone_id = 0} -- Humans
    ports["qeynos"] = {x = 0, y = 0, z =  0, zone_id = 0} -- Humans
    ports["fieldofbone"] = {x = 0, y = 0, z =  0, zone_id = 0} -- Iksars
    ports["feerrott"] = {x = 0, y = 0, z =  0, zone_id = 0} -- Trolls and Ogres
    ports["gfaydark"] = {x = 0, y = 0, z =  0, zone_id = 0} -- Wood Elves and High Elves

    if (e.message:findi("teleport")) then
        e.other:Message(MT.Say, "I can teleport you to the following locations: " .. townporter.BuildSayLinks(ports))
		return
	end

	if (e.message:findi("bind")) then
		e.other:Message(MT.Say, "Binding your soul. You will return here when you die.");
		e.self:CastSpell(2049,e.other:GetID(),0,1); -- Spell: Bind Affinity
		return
	end

    for k, v in pairs(ports) do
        if (e.message:findi(k)) then
            if (townporter.PortTakeMoney(e.other)) then
                e.other:MovePC(v.zone_id, v.x, v.y, v.z, v.heading)
                e.other:Message(MT.Say, "Teleporting you to " .. k .. ".")
                return
            end
            e.other:Message(MT.Say, "I'm sorry, I cannot teleport you unless you have sufficient money.")
            return
        end
    end


	local plat = townporter.PortCalculateCost(e.other)
	if plat > 0 then
		e.other:Message(MT.Say, "As a townporter, for a fee of " .. plat .. " platinum pieces, I can [" .. eq.say_link("teleport", true) .. "] you.")
	else
		e.other:Message(MT.Say, "As a townporter, for no fee, I can [" .. eq.say_link("teleport", true) .. "] you until you reach level 20.")
	end
	e.other:Message(MT.Say, string.format("I can %s your soul.", eq.say_link("bind", true)))
end

-- Helper functions
---@param t table
---@param f function
---@return function
function townporter.PairsByKeys(t, f)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
      i = i + 1
      if a[i] == nil then return nil
      else return a[i], t[a[i]]
      end
    end
    return iter
end

---@param t1 table
---@param ... table
function townporter.MergeTables(t1, ...)
    for i,v in ipairs(arg) do
        for k, v in pairs(v) do
            t1[k] = v
        end
    end
end

---@param t table
---@return string
function townporter.BuildSayLinks(t)
    local buff_links = ""
    for k, v in townporter.PairsByKeys(t) do
        buff_links = buff_links .. "" .. eq.say_link(k) .. ", "
    end
    buff_links = buff_links:sub(1, -3) -- remove last comma and space

    return buff_links
end

return townporter