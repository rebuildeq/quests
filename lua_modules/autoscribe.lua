local autoscribe = {}

local autoscribe_db = require("autoscribe_db")

local expansion_name = "Kunark"
local expansion_number = 1

---@param client Client
---@param total_cost number
function autoscribe.TakeMoney(client, total_cost)
    local copper = 1000 * total_cost

    local result = client:TakeMoneyFromPP(copper, true)
    if result then
        client:Message(15, total_cost .. " platinum pieces have been removed from your inventory.")
    end

    return result
end

---@param level integer
function autoscribe.ConvienceFee(level)
	local fee = 1000
	if level >= 10 then
		fee = fee + 10000
	end
	if level >= 20 then
		fee = fee + 20000
	end
	if level >= 30 then
		fee = fee + 40000
	end
	if level >= 40 then
		fee = fee + 80000
	end
	if level >= 50 then
		fee = fee + 160000
	end
	if level >= 60 then
		fee = fee + 320000
	end
	if level > 70 then
		fee = fee + 640000
	end
	if level > 80 then
		fee = fee + 1280000
	end
	if level > 90 then
		fee = fee + 2560000
	end
	if level > 100 then
		fee = fee + 5120000
	end
	return fee
end

---@param e NPCEventSay
---@return integer, integer # number_of_spells, total_cost
function autoscribe.CalculateCosts(e)
	local total_cost = 0
	local number_of_spells = 0
	local last_level = 0
	--local last_level = tonumber(e.other:GetBucket("autoscribe_last_level")) or 0
	local class = e.other:GetClass()
	for level = last_level + 1, e.other:GetLevel() do
		for _, spell in ipairs(autoscribe_db.Spells[class][level]) do
			if not e.other:HasSpellScribed(spell.ID) and
				spell.Expansion <= expansion_number then
				total_cost = total_cost + spell.Cost + autoscribe.ConvienceFee(level)
				number_of_spells = number_of_spells + 1
			end
		end
	end

	if total_cost < 1000 then -- minimum 1 plat
		total_cost = 1000
	end

	total_cost = total_cost / 1000 -- convert to plat

	return number_of_spells, total_cost
end

---@param e NPCEventSay
function autoscribe.OnSay(e)
	local npc_class = e.self:GetClass()
	local player_class = e.other:GetClass()
	local classes = {
		[Class.WARRIOR] = Class.WARRIORGM,
		[Class.CLERIC] = Class.CLERICGM,
		[Class.PALADIN] = Class.PALADINGM,
		[Class.RANGER] = Class.RANGERGM,
		[Class.SHADOWKNIGHT] = Class.SHADOWKNIGHTGM,
		[Class.DRUID] = Class.DRUIDGM,
		[Class.MONK] = Class.MONKGM,
		[Class.BARD] = Class.BARDGM,
		[Class.ROGUE] = Class.ROGUEGM,
		[Class.SHAMAN] = Class.SHAMANGM,
		[Class.NECROMANCER] = Class.NECROMANCERGM,
		[Class.WIZARD] = Class.WIZARDGM,
		[Class.MAGICIAN] = Class.MAGICIANGM,
		[Class.ENCHANTER] = Class.ENCHANTERGM,
		[Class.BEASTLORD] = Class.BEASTLORDGM,
		[Class.BERSERKER] = Class.BERSERKERGM,
	}
	if classes[player_class] ~= nil and npc_class ~= classes[player_class] then
		return
	end

	if e.message:findi("explain") then
		e.self:Say("I calculate the cost by checking the spells you have scribed and comparing them to the spells I can teach you. I then add up the cost of the spells you do not have, with a convienence fee added.")
		e.self:Say("I can only teach spells up to " ..expansion_name .. " for now.")
		return
	end

	if e.message:findi("pay") then
		local spells = {}
		local total_cost = 0

		local last_level = 0
		--local last_level = tonumber(e.other:GetBucket("autoscribe_last_level")) or 0
		for level = last_level + 1, e.other:GetLevel() do
			for _, spell in ipairs(autoscribe_db.Spells[player_class][level]) do
				if not e.other:HasSpellScribed(spell.ID) and
					spell.Expansion <= expansion_number then
						spells[#spells + 1] = spell.ID
						total_cost = total_cost + spell.Cost + autoscribe.ConvienceFee(level)
				end
			end
		end

		if total_cost < 1000 then -- minimum 1 plat
			total_cost = 1000
		end

		total_cost = total_cost / 1000 -- convert to plat

		if not autoscribe.TakeMoney(e.other, total_cost) then
			e.self:Say("You do not have enough money.")
			return
		end

		for _, spell_id in ipairs(spells) do
			e.other:ScribeSpell(spell_id, e.other:GetNextAvailableSpellBookSlot())
		end

		--e.other:SetBucket("autoscribe_last_level", tostring(e.other:GetLevel()))
		e.self:Say(string.format("I have taught you %d spells for %d platinum pieces.", #spells, total_cost))
		return
	end

	if e.message:findi("autoscribe") then
		local number_of_spells, total_cost = autoscribe.CalculateCosts(e)
		if number_of_spells == 0 then
			e.self:Say("You already have all the spells I can teach you.")
			return
		end
		e.self:Say(string.format("I can teach you %d spells. The total cost is %d platinum pieces. I can %s further on how I calculated the cost, or you can %s me.", number_of_spells, total_cost, eq.say_link("explain", false, "explain"), eq.say_link("pay", false, "pay")))
		return
	end

	e.self:Say(string.format("I can %s spells for you for a fee.", eq.say_link("autoscribe", false, "autoscribe")))
end

return autoscribe