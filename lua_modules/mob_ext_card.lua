local race = {}

---@ type RaceEntry[]
local tags = {
	{ID = 100100, Name = "Dragon", Weight = 500},
	{ID = 100101, Name = "Insect", Weight = 500},
	{ID = 100102, Name = "Animal", Weight = 500},
	{ID = 100103, Name = "Construct", Weight = 500},
	{ID = 100104, Name = "Extra Planar", Weight = 500},
	{ID = 100105, Name = "Giant", Weight = 500},
	{ID = 100106, Name = "Humanoid", Weight = 500},
	{ID = 100107, Name = "Lycanthrope", Weight = 500},
	{ID = 100108, Name = "Magical", Weight = 500},
	{ID = 100109, Name = "Monster", Weight = 500},
	{ID = 100110, Name = "Plant", Weight = 500},
	{ID = 100111, Name = "Summoned", Weight = 500},
	{ID = 100112, Name = "Undead", Weight = 500},
	{ID = 100113, Name = "Gnoll", Weight = 500},
	{ID = 100114, Name = "Aviak", Weight = 500},
	{ID = 100115, Name = "Werewolf", Weight = 500},
	{ID = 100116, Name = "Kobold", Weight = 500},
	{ID = 100117, Name = "Orc", Weight = 500},
	{ID = 100118, Name = "Fungus", Weight = 500},
	{ID = 100119, Name = "Goblin", Weight = 500},
	{ID = 100120, Name = "Evil Eye", Weight = 500},
	{ID = 100121, Name = "Human", Weight = 500},
	{ID = 100122, Name = "Barbarian", Weight = 500},
	{ID = 100123, Name = "Erudite", Weight = 500},
	{ID = 100124, Name = "Wood Elf", Weight = 500},
	{ID = 100125, Name = "High Elf", Weight = 500},
	{ID = 100126, Name = "Dark Elf", Weight = 500},
	{ID = 100127, Name = "Half Elf", Weight = 500},
	{ID = 100128, Name = "Dwarf", Weight = 500},
	{ID = 100129, Name = "Troll", Weight = 500},
	{ID = 100130, Name = "Ogre", Weight = 500},
	{ID = 100131, Name = "Halfling", Weight = 500},
	{ID = 100132, Name = "Gnome", Weight = 500},
	{ID = 100133, Name = "Froglok", Weight = 500},
	{ID = 100134, Name = "Shadowed Man", Weight = 500},
	{ID = 100135, Name = "Spider", Weight = 500},
	{ID = 100136, Name = "Beetle", Weight = 500},
	{ID = 100137, Name = "Snake", Weight = 500},
	{ID = 100138, Name = "Wolf", Weight = 10000},
	{ID = 100139, Name = "Bear", Weight = 500},
	{ID = 100140, Name = "Ghoul", Weight = 500},
	{ID = 100141, Name = "Zombie", Weight = 500},
	{ID = 100142, Name = "Skeleton", Weight = 500},
	{ID = 100143, Name = "Chromadrac", Weight = 500},
	{ID = 100144, Name = "Dozekar the Cursed", Weight = 1000},
	{ID = 100145, Name = "Drake", Weight = 500}
}

---@class RaceEntry
---@field ID integer
---@field Name string
---@field Weight integer


--- Returns an array of cards that this NPC can drop.
---@return RaceEntry[]
function Mob:CardDrops()
	local loot_list = {}
	local mob_name = self:GetCleanName()
	for tag, i in ipairs(tags) do
		if i.ID == 100100 and (self:GetRace() == 195 or self:GetRace() == 19 or self:GetRace() == 49 or self:GetNPCTypeID() == 96073 or self:GetRace() == 184 or self:GetNPCTypeID() == 96089) then loot_list[i.ID] = i end
		if i.ID == 100101 and self:GetBodyType() == BT.Insect then loot_list[i.ID] = i end --Insect Card
		if i.ID == 100102 and (self:GetBodyType() == BT.Animal or self:GetRace() == 36 or self:GetRace() == 156 or self:GetRace() == 415) then loot_list[i.ID] = i end --Animal Card
		if i.ID == 100103 and self:GetBodyType() == BT.Construct then loot_list[i.ID] = i end --Construct Card
		if i.ID == 100104 and self:GetBodyType() == BT.Extraplanar then loot_list[i.ID] = i end --Extra Planar Card
		if i.ID == 100105 and (self:GetBodyType() == BT.Giant or self:GetBodyType() == BT.RaidGiant or self:GetBodyType() == BT.Zek) then loot_list[i.ID] = i end --Giant Card
		if i.ID == 100106 and self:GetBodyType() == BT.Humanoid then loot_list[i.ID] = i end --Humanoid Card
		if i.ID == 100107 and self:GetBodyType() == BT.Lycanthrope then loot_list[i.ID] = i end --Lycanthrope Card
		if i.ID == 100108 and self:GetBodyType() == BT.Magical then loot_list[i.ID] = i end --Magical Card
		if i.ID == 100109 and self:GetBodyType() == BT.Monster then loot_list[i.ID] = i end --Monster Card
		if i.ID == 100110 and self:GetBodyType() == BT.Plant then loot_list[i.ID] = i end --Plant Card
		if i.ID == 100111 and (self:GetBodyType() == BT.Summoned or self:GetBodyType() == BT.Summoned2 or self:GetBodyType() == BT.Summoned3 or self:GetBodyType() == BT.SummonedUndead) then loot_list[i.ID] = i end --Summoned Card
		if i.ID == 100112 and (self:GetBodyType() == BT.Undead or self:GetBodyType() == BT.SummonedUndead or self:GetBodyType() == BT.Vampire) then loot_list[i.ID] = i end --Undead Card
		if i.ID == 100113 and self:GetRaceName() == "Gnoll" then loot_list[i.ID] = i end --Gnoll Card 50hp
		if i.ID == 100114 and self:GetRaceName() == "Aviak" then loot_list[i.ID] = i end --Aviak Card
		if i.ID == 100115 and self:GetRace() == 14 then loot_list[i.ID] = i end --Werewolf Card
		if i.ID == 100116 and (self:GetRace() == 48 or self:GetRace() == 455) then loot_list[i.ID] = i end --Kobold Card
		if i.ID == 100117 and self:GetRace() == 54 then loot_list[i.ID] = i end --Orc Card 15ac
		if i.ID == 100118 and (self:GetRace() == 28 or self:GetRace() == 456) then loot_list[i.ID] = i end --Fungus Card
		if i.ID == 100119 and (self:GetRace() == 40 or self:GetRace() == 433 or self:GetRace() == 137) then loot_list[i.ID] = i end --Goblin Card
		if i.ID == 100120 and (self:GetRace() == 21) then loot_list[i.ID] = i end --Evil Eye Card
		if i.ID == 100121 and (self:GetRace() == race.HUMAN or self:GetRace() == 44 or self:GetRace() == 71) then loot_list[i.ID] = i end --Human Card
		if i.ID == 100122 and self:GetRaceName() == race.BARBARIAN then loot_list[i.ID] = i end --Barbarian Card
		if i.ID == 100123 and self:GetRace() == race.ERUDITE then loot_list[i.ID] = i end --Erudite Card
		if i.ID == 100124 and self:GetRace() == race.WOOD_ELF then loot_list[i.ID] = i end --Wood Elf Card
		if i.ID == 100125 and self:GetRace() == race.HIGH_ELF then loot_list[i.ID] = i end --High Elf Card
		if i.ID == 100126 and self:GetRace() == race.DARK_ELF then loot_list[i.ID] = i end --Dark Elf Card
		if i.ID == 100127 and self:GetRace() == race.HALF_ELF then loot_list[i.ID] = i end --Half Elf Card
		if i.ID == 100128 and self:GetRace() == race.DWARF then loot_list[i.ID] = i end --Dwarf Card
		if i.ID == 100129 and self:GetRace() == race.TROLL then loot_list[i.ID] = i end --Troll Card
		if i.ID == 100130 and self:GetRace() == race.OGRE then loot_list[i.ID] = i end --Ogre Card
		if i.ID == 100131 and self:GetRace() == race.HALFLING then loot_list[i.ID] = i end --Halfling Card
		if i.ID == 100132 and self:GetRace() == race.GNOME then loot_list[i.ID] = i end --Gnome Card
		if i.ID == 100133 and (self:GetRace() == race.FROGLOK or self:GetRace() == 26 or self:GetRace() == 27 ) then loot_list[i.ID] = i end --Froglok Card
		if i.ID == 100134 and (self:GetRace() == race.INVISIBLE_MAN or self:GetRace() == race.DERVISH or self:GetRace() == 431) then loot_list[i.ID] = i end --Shadowed Man Card
		if i.ID == 100135 and (self:GetRace() == 38 or self:GetRace() == 440 or self:GetRace() == 450 ) then loot_list[i.ID] = i end --Spider Card
		if i.ID == 100136 and (self:GetRace() == 22) then loot_list[i.ID] = i end --Beetle card
		if i.ID == 100137 and (self:GetRace() == 37) then loot_list[i.ID] = i end --Snake card
		if i.ID == 100138 and (self:GetRace() == 42) then loot_list[i.ID] = i end --Wolf card
		if i.ID == 100139 and (self:GetRace() == 43) then loot_list[i.ID] = i end --Bear card
		if i.ID == 100140 and (self:GetRace() == 33) then loot_list[i.ID] = i end --Ghoul card
		if i.ID == 100141 and (self:GetRace() == 70) then loot_list[i.ID] = i end --Zombie card
		if i.ID == 100142 and (self:GetRace() == 367 or self:GetRace() == 161) then loot_list[i.ID] = i end --Skeleton card
		if i.ID == 100143 and (self:GetRace() == 154) and mob_name:find("chroma") then loot_list[i.ID] = i end --Chromadrac Card
		if i.ID == 100144 and mob_name:find("Dozekar") then loot_list[i.ID] = i end --Dozekar the Cursed Card
		if i.ID == 100145 and self:GetBodyType() == BT['Dragon'] then loot_list[i.ID] = i end
	end

	return loot_list
end

--- Returns a string of tags a NPC can drop
---@return string
function Mob:Tags()
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
