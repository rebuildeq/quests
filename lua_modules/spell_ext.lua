
local affinity = require("affinity")

local SpellTags = {
	[6] = {Affinity = affinity.FIRE, Tag = "Fire Dot" }, -- Ignite Blood
	[14] = {Affinity = affinity.SPIRIT, Tag = "Retribution" }, -- Strike
	[16] = {Affinity = affinity.SPIRIT, Tag = "Retribution" }, -- Smite
	[22] = {Affinity = affinity.AIR, Tag = "Force" }, -- Force Snap
	[23] = {Affinity = affinity.AIR, Tag = "Force" }, -- Force Strike
	[27] = {Affinity = affinity.SPIRIT, Tag = "Spirit Dot" }, -- Pogonip
	[28] = {Affinity = affinity.EARTH, Tag = "Earth AE" }, -- Avalanche
	[29] = {Affinity = affinity.WATER, Tag = "Water Nuke" }, -- Ice
	[30] = {Affinity = affinity.FIRE, Tag = "Fire Nuke" }, -- Blazing Comet
	[31] = {Affinity = affinity.AIR, Tag = "Disease Dot" }, -- Scourge
	[32] = {Affinity = affinity.AIR, Tag = "Disease Dot" }, -- Plague
	[38] = {Affinity = affinity.SPIRIT, Tag = "Spirit Nuke" }, -- Lightning Bolt
	[54] = {Affinity = affinity.WATER, Tag = "Water Nuke" }, -- Frost Bolt
	[57] = {Affinity = affinity.FIRE, Tag = "Fire Nuke" }, -- Firestrike
	[68] = {Affinity = affinity.FIRE, Tag = "Fire Bolt" }, -- Bolt of Flame
	[69] = {Affinity = affinity.FIRE, Tag = "Fire Bolt" }, -- Cinder Bolt
	[70] = {Affinity = affinity.FIRE, Tag = "Fire Bolt" }, -- Lava Bolt
	[71] = {Affinity = affinity.SPIRIT, Tag = "Stun Nuke" }, -- Anarchy
	[73] = {Affinity = affinity.SPIRIT, Tag = "Gravity Flux" }, -- Gravity Flux
	[75] = {Affinity = affinity.AIR, Tag = "Disease Dot" }, -- Sicken
	[76] = {Affinity = affinity.NONE, Tag = "" }, -- Ensnaring Roots
	[77] = {Affinity = affinity.NONE, Tag = "" }, -- Engulfing Roots
	[78] = {Affinity = affinity.NONE, Tag = "" }, -- Immolate
	[79] = {Affinity = affinity.NONE, Tag = "" }, -- Spirit Sight
	[80] = {Affinity = affinity.NONE, Tag = "" }, -- See Invisible
	[81] = {Affinity = affinity.NONE, Tag = "" }, -- Phantom Chain
	[82] = {Affinity = affinity.NONE, Tag = "" }, -- Phantom Plate
	[83] = {Affinity = affinity.NONE, Tag = "" }, -- Rain of Fire
	[84] = {Affinity = affinity.NONE, Tag = "" }, -- Shifting Sight
	[85] = {Affinity = affinity.NONE, Tag = "" }, -- Firestorm
	[86] = {Affinity = affinity.NONE, Tag = "" }, -- Enduring Breath
	[87] = {Affinity = affinity.NONE, Tag = "" }, -- Lay on Hands
	[88] = {Affinity = affinity.NONE, Tag = "" }, -- Harm Touch
	[89] = {Affinity = affinity.NONE, Tag = "" }, -- Daring
	[90] = {Affinity = affinity.NONE, Tag = "" }, -- Shadow Sight
	[91] = {Affinity = affinity.NONE, Tag = "" }, -- Ignite
	[92] = {Affinity = affinity.NONE, Tag = "" }, -- Burst of Fire
	[93] = {Affinity = affinity.NONE, Tag = "" }, -- Burst of Flame
	[94] = {Affinity = affinity.NONE, Tag = "" }, -- Burn
	[95] = {Affinity = affinity.NONE, Tag = "" }, -- Counteract Poison
	[96] = {Affinity = affinity.NONE, Tag = "" }, -- Counteract Disease
	[97] = {Affinity = affinity.NONE, Tag = "" }, -- Abolish Poison
	[98] = {Affinity = affinity.NONE, Tag = "" }, -- Abolish Disease
	[99] = {Affinity = affinity.NONE, Tag = "" }, -- Creeping Crud
	[100] = {Affinity = affinity.NONE, Tag = "" }, -- Summon Throwing Dagger
	[101] = {Affinity = affinity.NONE, Tag = "" }, -- Summon Arrows
	[102] = {Affinity = affinity.NONE, Tag = "" }, -- Spear of Warding
}

--- Returns spell tag
--- @return string # tag
function Spell:Tag()
	if SpellTags[self:ID()] then
		return SpellTags[self:ID()].Tag
	end
	return ""
end

--- Returns spell affinity
--- @return number # affinity
function Spell:Affinity()
	if SpellTags[self:ID()] then
		return SpellTags[self:ID()].Affinity
	end
end
