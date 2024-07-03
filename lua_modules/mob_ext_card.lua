
local mob_ext_card = {}

local race_name = require("race_name")

---@ type RaceEntry[]
local tags = {
	{ID = 148101, Name = "Dragon", Chance = 500, Check = function(self) return (self:GetBaseRace() == 195 or self:GetBaseRace() == 19 or self:GetBaseRace() == race_name.DragonSkeleton or self:GetBaseRace() == race_name.LavaDragon or self:GetNPCTypeID() == 96073 or self:GetBaseRace() == 184 or self:GetNPCTypeID() == 96089) end},
	{ID = 148102, Name = "Insect", Chance = 500, Check = function(self) return self:GetBodyType() == BT.Insect end},
	{ID = 148103, Name = "Animal", Chance = 500, Check = function(self) return (self:GetBodyType() == BT.Animal or self:GetBaseRace() == 36 or self:GetBaseRace() == 156 or self:GetBaseRace() == 415) end},
	{ID = 148104, Name = "Construct", Chance = 500, Check = function(self) return self:GetBodyType() == BT.Construct or self:GetBaseRace() == race_name.Golem or self:GetBaseRace() == race_name.Golem2 end},
	{ID = 148105, Name = "Extra Planar", Chance = 500, Check = function(self) return self:GetBodyType() == BT.Extraplanar end},
	{ID = 148106, Name = "Giant", Chance = 500, Check = function(self) return (self:GetBodyType() == BT.Giant or self:GetBodyType() == BT.RaidGiant or self:GetBodyType() == BT.Zek) end},
	{ID = 148107, Name = "Humanoid", Chance = 500, Check = function(self) return self:GetBodyType() == BT.Humanoid end},
	{ID = 148108, Name = "Lycanthrope", Chance = 500, Check = function(self) return self:GetBodyType() == BT.Lycanthrope end},
	{ID = 148109, Name = "Magical", Chance = 500, Check = function(self) return self:GetBodyType() == BT.Magical end},
	{ID = 148110, Name = "Monster", Chance = 500, Check = function(self) return self:GetBodyType() == BT.Monster end},
	{ID = 148111, Name = "Plant", Chance = 500, Check = function(self) return self:GetBodyType() == BT.Plant end},
	{ID = 148112, Name = "Summoned", Chance = 500, Check = function(self) return (self:GetBodyType() == BT.Summoned or self:GetBodyType() == BT.Summoned2 or self:GetBodyType() == BT.Summoned3 or self:GetBodyType() == BT.SummonedUndead) end},
	{ID = 148113, Name = "Undead", Chance = 500, Check = function(self) return (self:GetBodyType() == BT.Undead or self:GetBodyType() == BT.SummonedUndead or self:GetBodyType() == BT.Vampire) end},
	{ID = 148114, Name = "Gnoll", Chance = 500, Check = function(self) return self:GetBaseRace() == race_name.Gnoll end},
	{ID = 148115, Name = "Aviak", Chance = 500, Check = function(self) return self:GetBaseRace() == race_name.Aviak end},
	{ID = 148116, Name = "Werewolf", Chance = 500, Check = function(self) return self:GetBaseRace() == 14 end},
	{ID = 148117, Name = "Kobold", Chance = 500, Check = function(self) return (self:GetBaseRace() == 48 or self:GetBaseRace() == 455) end},
	{ID = 148118, Name = "Orc", Chance = 500, Check = function(self) return self:GetBaseRace() == 54 end},
	{ID = 148119, Name = "Fungus", Chance = 500, Check = function(self) return (self:GetBaseRace() == 28 or self:GetBaseRace() == 456) end},
	{ID = 148120, Name = "Goblin", Chance = 500, Check = function(self) return (self:GetBaseRace() == 40 or self:GetBaseRace() == 433 or self:GetBaseRace() == 137) end},
	{ID = 148121, Name = "Evil Eye", Chance = 500, Check = function(self) return (self:GetBaseRace() == 21) end},
	{ID = 148122, Name = "Human", Chance = 500, Check = function(self) return (self:GetBaseRace() == race_name.Human or self:GetBaseRace() == 44 or self:GetBaseRace() == 71) end},
	{ID = 148123, Name = "Barbarian", Chance = 500, Check = function(self) return self:GetBaseRace() == race_name.Barbarian end},
	{ID = 148124, Name = "Erudite", Chance = 500, Check = function(self) return self:GetBaseRace() == race_name.Erudite end},
	{ID = 148125, Name = "Wood Elf", Chance = 500, Check = function(self) return self:GetBaseRace() == race_name.WoodElf end},
	{ID = 148126, Name = "High Elf", Chance = 500, Check = function(self) return self:GetBaseRace() == race_name.HighElf end},
	{ID = 148127, Name = "Dark Elf", Chance = 500, Check = function(self) return self:GetBaseRace() == race_name.DarkElf end},
	{ID = 148128, Name = "Half Elf", Chance = 500, Check = function(self) return self:GetBaseRace() == race_name.HalfElf end},
	{ID = 148129, Name = "Dwarf", Chance = 500, Check = function(self) return self:GetBaseRace() == race_name.Dwarf end},
	{ID = 148130, Name = "Troll", Chance = 500, Check = function(self) return self:GetBaseRace() == race_name.Troll end},
	{ID = 148131, Name = "Ogre", Chance = 500, Check = function(self) return self:GetBaseRace() == race_name.Ogre end},
	{ID = 148132, Name = "Halfling", Chance = 500, Check = function(self) return self:GetBaseRace() == race_name.Halfling end},
	{ID = 148133, Name = "Gnome", Chance = 500, Check = function(self) return self:GetBaseRace() == race_name.Gnome end},
	{ID = 148134, Name = "Froglok", Chance = 500, Check = function(self) return (self:GetBaseRace() == race_name.Froglok or self:GetBaseRace() == 26 or self:GetBaseRace() == 27 ) end},
	{ID = 148135, Name = "Shadowed Man", Chance = 500, Check = function(self) return (self:GetBaseRace() == race_name.Invisible_Man or self:GetBaseRace() == race_name.Dervish or self:GetBaseRace() == 431) end},
	{ID = 148136, Name = "Spider", Chance = 500, Check = function(self) return (self:GetBaseRace() == 38 or self:GetBaseRace() == 440 or self:GetBaseRace() == 450 ) end},
	{ID = 148137, Name = "Beetle", Chance = 500, Check = function(self) return (self:GetBaseRace() == 22) end},
	{ID = 148138, Name = "Snake", Chance = 500, Check = function(self) return (self:GetBaseRace() == 37) end},
	{ID = 148139, Name = "Wolf", Chance = 10000, Check = function(self) return (self:GetBaseRace() == 42) end},
	{ID = 148140, Name = "Bear", Chance = 500, Check = function(self) return (self:GetBaseRace() == 43) end},
	{ID = 148141, Name = "Ghoul", Chance = 500, Check = function(self) return (self:GetBaseRace() == 33) end},
	{ID = 148142, Name = "Zombie", Chance = 500, Check = function(self) return (self:GetBaseRace() == 70) end},
	{ID = 148143, Name = "Skeleton", Chance = 500, Check = function(self) return (self:GetBaseRace() == 367 or self:GetBaseRace() == 161) end},
	{ID = 148144, Name = "Chromadrac", Chance = 500, Check = function(self) return (self:GetBaseRace() == 154) and self:GetCleanName():find("chroma") end},
	{ID = 148145, Name = "Dozekar the Cursed", Chance = 1000, Check = function(self) return self:GetCleanName():find("Dozekar") end},
	{ID = 148146, Name = "Drake", Chance = 500, Check = function(self) return self:GetBodyType() == BT['Dragon'] end},
}

---@class RaceEntry # A card that can be dropped
---@field ID integer # ID of the card
---@field Name string # Name of the card
---@field Chance integer # 1 in X chance
---@field Check function(self:Mob):boolean # Optional function to check if the mob is valid for this card

--- Returns an array of cards that this NPC can drop.
---@param self Mob
---@return RaceEntry[]
function mob_ext_card.CardDrops(self)
	local loot_list = {}
	local mob_name = self:GetCleanName()

	local mob = self:CastToMob()

	for _, tag in ipairs(tags) do
		if tag.Check ~= nil and tag.Check(mob) then
			--eq.debug("Adding tag " .. tag.Name .. " to " .. mob_name)
			table.insert(loot_list, tag)
		end
	end

	return loot_list
end

--- Returns a string of tags a NPC can drop
---@param self Mob
---@return string
function mob_ext_card.Tags(self)
	local loot_list = self:CardDrops()
	local tag_string = ""
	for tag, i in pairs(loot_list) do
		tag_string = tag_string .. i.Name .. ", "
	end
	if tag_string == "" then
		return ""
	end
	tag = tag_string:sub(1, -3)
	return tag
end

return mob_ext_card