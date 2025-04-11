local salvage = {}

---@param e PlayerEventCombine
---@return boolean
function salvage.OnCombine(e)
    local bag_id = e.self:GetItemIDAt(e.container_slot);
    if bag_id < 151001 or bag_id > 151007 then
        -- e.self:Message(MT.Red, "You can only salvage in a Salvage Container.")
        return false
    end

    local part_value = 0

    -- e.self:UseAugmentContainer(bag_id)
    local inv = e.self:GetInventory()
    for i = 0, 20 do
        local item = inv:GetItem(e.container_slot, i)
        local slot_id = inv:CalcSlotId(e.container_slot, i)
        local item_quantity = 1
        if item:IsStackable() then
            item_quantity = item:GetCharges()
        end
        if item.valid then
            part_value = part_value + (eq.get_item_stat(item:GetID(), "price") * item_quantity)
            e.self:Message(MT.Yellow, "Container Slot: " .. e.container_slot .. ", Item Slot: " .. slot_id .. " Price: " .. eq.get_item_stat(item:GetID(), "price") ..  " StackSize: " .. item_quantity .. " Name: " .. item:GetName())

            e.self:DeleteItemInInventory(slot_id, item:GetCharges(), true)
        end
    end

    e.self:Message(MT.Yellow, "Pre 10 percent tax: " .. part_value)

    local final_value = part_value - (part_value * 0.20) -- 10% salvage loss
    e.self:Message(MT.Yellow, "Post 10 percent tax: " .. final_value)

    local penalty = math.random(10)
    e.self:Message(MT.Yellow, "Penalty percent: " .. penalty .. "%")
    local penalty_value = final_value - (final_value * (0.01 * penalty))
    local final_value = penalty_value


    e.self:Message(MT.Yellow, "pre-cut: " .. final_value)
    part_id = 151101

    local context = "rusty"
    local currency = "copper"
    if penalty_value > 10000 then
        part_id = 151105
        final_value = final_value / 10000
        part_value = part_value / 1000
        currency = "platinum"
        context = "gem encrusted"
    elseif penalty_value > 1000 then
        part_id = 151104
        final_value = (final_value / 1000)
        part_value = part_value / 1000
        currency = "platinum"
        context = "mithril"
    elseif penalty_value > 100 then
        part_id = 151103
        final_value = (final_value / 100)
        part_value = part_value / 100
        currency = "gold"
        context = "steel"
    elseif penalty_value > 10 then
        part_id = 151102
        final_value = (final_value / 10)
        part_value = part_value / 10
        currency = "silver"
        context = "bronze"
    end
    if part_value < 1 then
        part_value = 1
    end

    final_value = math.floor(final_value + 0.5)

    if final_value < 1 then
        final_value = 1
    end

    e.self:Message(MT.Yellow, "You have salvaged " .. part_value .. " " .. currency .. " worth of items to make " .. final_value .. " " .. context .. " parts.")

    e.self:SummonItem(part_id, final_value)
    return true
end

return salvage