--- activity is full of activity logic
local activity = {}

activity.innkeepers = {}
activity.name = ""
activity.timer = 0
activity.last_message = ""
activity.last_activity_id = 0

---@param mob Mob
---@returns string
function activity.InnkeeperSubscribe(mob)
    if not activity.innkeepers[mob:GetName()] then
        activity.innkeepers[mob:GetName()] = true
    end

    if activity.timer > os.time() then
        return ""
    end


    local innkeeper_names = {}
    for name, _ in pairs(activity.innkeepers) do
        table.insert(innkeeper_names, name)
    end

    if #innkeeper_names > 0 then
        activity.name = innkeeper_names[math.random(#innkeeper_names)]
    else
        return ""
    end


     if activity.name ~= mob:GetName() and activity.name ~= "" then
         return ""
    end



    local rand_delay = math.random(1, 10)
    -- use epoc time and add seconds
    activity.timer = os.time() + rand_delay
    activity.name = mob:GetName()
    activity.last_message = "insert message from db here " .. rand_delay
    return activity.last_message
end

---@param e NPCEventSay
function activity.OnInnkeeperSay(e)

end



return activity