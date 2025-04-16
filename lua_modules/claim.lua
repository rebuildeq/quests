local claim = {}

--- Triggers when a player first connects
--- @param client Client
function claim.OnConnect(client)
    local claim_daily_next_timestamp = tonumber(client:GetBucket("claim_daily_next_timestamp"))
    if claim_daily_next_timestamp == nil then
        claim_daily_next_timestamp = os.time() - 1000
    end
    if claim_daily_next_timestamp <= 0 then
        claim_daily_next_timestamp = os.time() - 1000
    end
    if os.time() < claim_daily_next_timestamp then
        return
    end
    local claim_daily_next = os.time() + 20 * 60 * 60
    client:SetBucket("claim_daily_next_timestamp", tostring(claim_daily_next))

    local claim_count = tonumber(client:GetBucket("claim_count"))
    if claim_count == nil then
        claim_count = 0
    end
    claim_count = claim_count + 1
    client:SetBucket("claim_count", tostring(claim_count))


    client:Message(MT.Experience, "You have acquired the daily login reward [#claim]! In 20 hours a new reward will be available to [#claim].")
end

return claim