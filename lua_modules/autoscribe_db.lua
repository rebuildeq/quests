
--[[
select CONCAT('{ID = ', sn.id, ', Cost = ', i.price, ', Expansion = 0}, -- ', sn.name, ' lvl ', sn.classes5) from spells_new sn
inner join items i on i.scrolleffect = sn.id
where sn.classes5 > 0 and sn.classes5 < 254 order by sn.classes5 asc;
]]

local autoscribe_db = {}

autoscribe_db.Spells = {
	[Class.WARRIOR] = {
		[1] = {
			{ID = 5225, Cost = 20, Expansion = 0}, -- Throw Stone
		},
		[5] = {
			{ID = 25060, Cost = 28, Expansion = 4}, -- Elbow Strike
		},
		[10] = {
			{ID = 4721, Cost = 92, Expansion = 0}, -- Focused Will Discipline
		},
		[20] = {
			{ID = 4608, Cost = 780, Expansion = 0}, -- Provoke
		},
		[30] = {
			{ID = 4585, Cost = 3332, Expansion = 0}, -- Resistant Discipline
		},
		[40] = {
			{ID = 4587, Cost = 10043, Expansion = 0}, -- Fearless Discipline
		},
		[52] = {
			{ID = 4681, Cost = 31293, Expansion = 0}, -- Bellow
			{ID = 4503, Cost = 31056, Expansion = 0}, -- Evasive Discipline
		},
		[53] = {
			{ID = 4672, Cost = 33775, Expansion = 0}, -- Charge Discipline
		},
		[54] = {
			{ID = 4514, Cost = 36413, Expansion = 0}, -- Mighty Strike Discipline
		},
		[55] = {
			{ID = 4499, Cost = 39849, Expansion = 0}, -- Defensive Discipline
			{ID = 8921, Cost = 79361, Expansion = 99}, -- Myrmidon's Aura
		},
		[56] = {
			{ID = 4682, Cost = 42242, Expansion = 0}, -- Berate
			{ID = 4674, Cost = 46308, Expansion = 0}, -- Furious Discipline
		},
		[57] = {
			{ID = 4501, Cost = 46180, Expansion = 0}, -- Precision Discipline
		},
		[58] = {
			{ID = 4675, Cost = 53380, Expansion = 0}, -- Fellstrike Discipline
		},
		[59] = {
			{ID = 4670, Cost = 52194, Expansion = 0}, -- Fortitude Discipline
		},
		[60] = {
			{ID = 4498, Cost = 56986, Expansion = 0}, -- Aggressive Discipline
		},
		[61] = {
			{ID = 4689, Cost = 71073, Expansion = 0}, -- Spirit of Rage Discipline
			{ID = 6750, Cost = 0, Expansion = 0}, -- Whirlwind Blade
		},
		[63] = {
			{ID = 4687, Cost = 80231, Expansion = 0}, -- Healing Will Discipline
			{ID = 4697, Cost = 80074, Expansion = 0}, -- Incite
		},
		[65] = {
			{ID = 5015, Cost = 115500, Expansion = 99}, -- Bellow of the Mastruq
			{ID = 4688, Cost = 99477, Expansion = 0}, -- Stonewall Discipline
		},
		[66] = {
			{ID = 6191, Cost = 131396, Expansion = 99}, -- Aura of Runes Discipline
		},
		[68] = {
			{ID = 8000, Cost = 167105, Expansion = 99}, -- Commanding Voice
			{ID = 6192, Cost = 148352, Expansion = 99}, -- Savage Onslaught Discipline
		},
		[69] = {
			{ID = 6173, Cost = 156129, Expansion = 99}, -- Bazu Bellow
			{ID = 6725, Cost = 169887, Expansion = 99}, -- Cyclone Blade
		},
		[70] = {
			{ID = 8468, Cost = 194782, Expansion = 99}, -- Champion's Aura
			{ID = 8467, Cost = 197129, Expansion = 99}, -- Mock
			{ID = 6190, Cost = 164521, Expansion = 99}, -- Shocking Defense Discipline
		},
		[71] = {
			{ID = 10959, Cost = 217927, Expansion = 99}, -- Aura of Draconic Runes
		},
		[72] = {
			{ID = 10965, Cost = 234832, Expansion = 99}, -- Final Stand Discipline
			{ID = 11913, Cost = 246051, Expansion = 13}, -- Second Wind
			{ID = 11914, Cost = 10000, Expansion = 99}, -- Second Wind Rk. II
			{ID = 11915, Cost = 10000, Expansion = 99}, -- Second Wind Rk. III
		},
		[73] = {
			{ID = 10968, Cost = 246777, Expansion = 99}, -- Throat Jab
		},
		[74] = {
			{ID = 11916, Cost = 274458, Expansion = 99}, -- Brutal Onslaught Discipline
			{ID = 11917, Cost = 10000, Expansion = 99}, -- Brutal Onslaught Discipline Rk. II
			{ID = 11918, Cost = 10000, Expansion = 99}, -- Brutal Onslaught Discipline Rk. III
			{ID = 10971, Cost = 255975, Expansion = 99}, -- Vortex Blade
		},
		[75] = {
			{ID = 10974, Cost = 274829, Expansion = 99}, -- Scowl
		},
		[76] = {
			{ID = 15345, Cost = 315927, Expansion = 14}, -- Armor of Draconic Runes
		},
		[77] = {
			{ID = 15369, Cost = 339471, Expansion = 99}, -- Shield Reflect
			{ID = 14192, Cost = 335076, Expansion = 14}, -- Third Wind
		},
		[78] = {
			{ID = 15376, Cost = 2531106, Expansion = 99}, -- Opportunistic Strike Rk. II
			{ID = 15377, Cost = 15268000, Expansion = 99}, -- Opportunistic Strike Rk. III
		},
		[79] = {
			{ID = 15357, Cost = 373033, Expansion = 99}, -- Whorl Blade
		},
		[80] = {
			{ID = 15379, Cost = 2441698, Expansion = 99}, -- Knuckle Smash Rk. II
			{ID = 15380, Cost = 11570470, Expansion = 99}, -- Knuckle Smash Rk. III
			{ID = 15360, Cost = 385857, Expansion = 99}, -- Sneer
		},
		[81] = {
			{ID = 19516, Cost = 434497, Expansion = 99}, -- Armor of Timeworn Runes
			{ID = 19537, Cost = 428326, Expansion = 99}, -- Bazu Bluster
		},
		[82] = {
			{ID = 18213, Cost = 449224, Expansion = 15}, -- Fourth Wind
		},
		[84] = {
			{ID = 19528, Cost = 499913, Expansion = 99}, -- Maelstrom Blade
			{ID = 19552, Cost = 501711, Expansion = 99}, -- Punch Through
		},
		[85] = {
			{ID = 19531, Cost = 528486, Expansion = 99}, -- Jeer
		},
		[86] = {
			{ID = 25012, Cost = 601338, Expansion = 99}, -- Armor of Phantasmic Runes
			{ID = 25018, Cost = 601883, Expansion = 99}, -- Bazu Roar
			{ID = 25000, Cost = 605412, Expansion = 17}, -- Respite
		},
		[87] = {
			{ID = 25003, Cost = 631864, Expansion = 17}, -- Fifth Wind
			{ID = 25021, Cost = 625467, Expansion = 99}, -- Flash of Anger
			{ID = 25006, Cost = 622942, Expansion = 99}, -- Weapon Affiliation
		},
		[88] = {
			{ID = 25024, Cost = 655052, Expansion = 99}, -- Rallying Roar
			{ID = 25027, Cost = 655544, Expansion = 99}, -- Strategic Strike
		},
		[89] = {
			{ID = 25033, Cost = 693010, Expansion = 99}, -- Forceful Attraction
			{ID = 25009, Cost = 695848, Expansion = 99}, -- Jab Through
			{ID = 25030, Cost = 694283, Expansion = 99}, -- Wheeling Blades
		},
		[90] = {
			{ID = 25036, Cost = 728069, Expansion = 99}, -- Field Outfitter
			{ID = 25042, Cost = 725838, Expansion = 99}, -- Knuckle Snap
			{ID = 25045, Cost = 718237, Expansion = 99}, -- Scoff
			{ID = 25051, Cost = 716545, Expansion = 99}, -- Staunch Defense
		},
		[91] = {
			{ID = 28015, Cost = 1184150, Expansion = 99}, -- Armor of Mystical Runes
			{ID = 28021, Cost = 1183960, Expansion = 99}, -- Grendlaen Roar
		},
	},
	[Class.CLERIC] = {
		[1] = {
			{ID = 202, Cost = 20, Expansion = 0}, -- Courage
			{ID = 203, Cost = 20, Expansion = 0}, -- Cure Poison
			{ID = 207, Cost = 20, Expansion = 0}, -- Divine Aura
			{ID = 201, Cost = 20, Expansion = 0}, -- Flash of Light
			{ID = 11, Cost = 20, Expansion = 0}, -- Holy Armor
			{ID = 208, Cost = 20, Expansion = 0}, -- Lull
			{ID = 200, Cost = 20, Expansion = 0}, -- Minor Healing
			{ID = 209, Cost = 20, Expansion = 0}, -- Spook the Dead
			{ID = 14, Cost = 20, Expansion = 0}, -- Strike
			{ID = 205, Cost = 20, Expansion = 0}, -- True North
			{ID = 210, Cost = 20, Expansion = 0}, -- Yaulp
		},
		[2] = {
			{ID = 215, Cost = 20, Expansion = 0}, -- Reckless Strength
			{ID = 216, Cost = 20, Expansion = 0}, -- Stun
		},
		[3] = {
			{ID = 212, Cost = 22, Expansion = 0}, -- Cure Blindness
			{ID = 211, Cost = 20, Expansion = 0}, -- Summon Drink
		},
		[4] = {
			{ID = 213, Cost = 20, Expansion = 0}, -- Cure Disease
			{ID = 17, Cost = 24, Expansion = 0}, -- Light Healing
			{ID = 218, Cost = 24, Expansion = 0}, -- Ward Undead
		},
		[5] = {
			{ID = 560, Cost = 28, Expansion = 0}, -- Furor
			{ID = 36, Cost = 24, Expansion = 0}, -- Gate
			{ID = 501, Cost = 28, Expansion = 0}, -- Soothe
			{ID = 42605, Cost = 20, Expansion = 0}, -- Rekindle
		},
		[6] = {
			{ID = 227, Cost = 34, Expansion = 0}, -- Endure Poison
			{ID = 229, Cost = 20, Expansion = 0}, -- Fear
			{ID = 2501, Cost = 71, Expansion = 0}, -- Sanctuary
		},
		[7] = {
			{ID = 219, Cost = 42, Expansion = 0}, -- Center
			{ID = 223, Cost = 43, Expansion = 0}, -- Hammer of Wrath
			{ID = 230, Cost = 22, Expansion = 0}, -- Root
		},
		[8] = {
			{ID = 224, Cost = 20, Expansion = 0}, -- Endure Fire
			{ID = 4056, Cost = 241, Expansion = 0}, -- Remove Minor Curse
			{ID = 50, Cost = 20, Expansion = 0}, -- Summon Food
		},
		[9] = {
			{ID = 221, Cost = 20, Expansion = 0}, -- Sense the Dead
			{ID = 231, Cost = 72, Expansion = 0}, -- Word of Pain
		},
		[10] = {
			{ID = 35, Cost = 93, Expansion = 0}, -- Bind Affinity
			{ID = 12, Cost = 92, Expansion = 0}, -- Healing
			{ID = 4258, Cost = 374, Expansion = 0}, -- Iony's Lesser Augury
			{ID = 42606, Cost = 200, Expansion = 0}, -- Requiescence
		},
		[11] = {
			{ID = 226, Cost = 55, Expansion = 0}, -- Endure Disease
			{ID = 235, Cost = 20, Expansion = 0}, -- Invisibility versus Undead
			{ID = 485, Cost = 119, Expansion = 0}, -- Symbol of Transal
		},
		[12] = {
			{ID = 234, Cost = 71, Expansion = 0}, -- Halo of Light
			{ID = 2168, Cost = 154, Expansion = 0}, -- Reanimation
			{ID = 232, Cost = 22, Expansion = 0}, -- Sense Summoned
		},
		[13] = {
			{ID = 48, Cost = 43, Expansion = 0}, -- Cancel Magic
			{ID = 225, Cost = 20, Expansion = 0}, -- Endure Cold
			{ID = 233, Cost = 195, Expansion = 0}, -- Expulse Undead
		},
		[14] = {
			{ID = 4282, Cost = 771, Expansion = 0}, -- Iony's Lesser Cleansing
			{ID = 4270, Cost = 791, Expansion = 0}, -- Iony's Lesser Exorcism
			{ID = 16, Cost = 243, Expansion = 0}, -- Smite
		},
		[15] = {
			{ID = 3575, Cost = 653, Expansion = 4}, -- Blessing of Piety
			{ID = 47, Cost = 297, Expansion = 0}, -- Calm
			{ID = 368, Cost = 297, Expansion = 0}, -- Spirit Armor
		},
		[16] = {
			{ID = 228, Cost = 373, Expansion = 0}, -- Endure Magic
			{ID = 123, Cost = 371, Expansion = 0}, -- Holy Might
			{ID = 43, Cost = 366, Expansion = 0}, -- Yaulp II
		},
		[17] = {
			{ID = 89, Cost = 452, Expansion = 0}, -- Daring
			{ID = 248, Cost = 20, Expansion = 0}, -- Ward Summoned
		},
		[18] = {
			{ID = 2169, Cost = 544, Expansion = 0}, -- Reconstitution
		},
		[19] = {
			{ID = 2502, Cost = 657, Expansion = 3}, -- Celestial Remedy
			{ID = 413, Cost = 660, Expansion = 0}, -- Word of Shadow
		},
		[20] = {
			{ID = 15, Cost = 783, Expansion = 0}, -- Greater Healing
			{ID = 37, Cost = 1260, Expansion = 0}, -- Hammer of Striking
			{ID = 4088, Cost = 1952, Expansion = 0}, -- Ward of Vie
		},
		[21] = {
			{ID = 126, Cost = 918, Expansion = 0}, -- Inspire Fear
			{ID = 486, Cost = 925, Expansion = 0}, -- Symbol of Ryltan
			{ID = 128, Cost = 931, Expansion = 0}, -- Wave of Fear
		},
		[22] = {
			{ID = 244, Cost = 1084, Expansion = 0}, -- Bravery
			{ID = 95, Cost = 1100, Expansion = 0}, -- Counteract Poison
			{ID = 2170, Cost = 1100, Expansion = 0}, -- Reparation
		},
		[23] = {
			{ID = 117, Cost = 1276, Expansion = 0}, -- Dismiss Undead
			{ID = 4259, Cost = 2927, Expansion = 0}, -- Iony's Augury
			{ID = 4057, Cost = 10031, Expansion = 0}, -- Remove Lesser Curse
		},
		[24] = {
			{ID = 4283, Cost = 3376, Expansion = 0}, -- Iony's Cleansing
			{ID = 4271, Cost = 3372, Expansion = 0}, -- Iony's Exorcism
		},
		[25] = {
			{ID = 18, Cost = 1718, Expansion = 0}, -- Guard
			{ID = 2503, Cost = 2567, Expansion = 3}, -- Sermon of the Righteous
		},
		[26] = {
			{ID = 59, Cost = 1695, Expansion = 0}, -- Panic the Dead
			{ID = 414, Cost = 1976, Expansion = 0}, -- Word of Spirit
		},
		[27] = {
			{ID = 663, Cost = 193, Expansion = 0}, -- Expulse Summoned
			{ID = 131, Cost = 457, Expansion = 0}, -- Instill
			{ID = 391, Cost = 2247, Expansion = 0}, -- Revive
		},
		[28] = {
			{ID = 52, Cost = 2604, Expansion = 0}, -- Abundant Drink
			{ID = 96, Cost = 1087, Expansion = 0}, -- Counteract Disease
		},
		[29] = {
			{ID = 2175, Cost = 4226, Expansion = 4}, -- Celestial Health
			{ID = 130, Cost = 2915, Expansion = 0}, -- Divine Barrier
			{ID = 1885, Cost = 2972, Expansion = 1}, -- Imbue Amber
			{ID = 1894, Cost = 2929, Expansion = 4}, -- Imbue Black Pearl
			{ID = 1897, Cost = 2916, Expansion = 4}, -- Imbue Black Sapphire
			{ID = 1895, Cost = 2933, Expansion = 4}, -- Imbue Diamond
			{ID = 1888, Cost = 2921, Expansion = 4}, -- Imbue Emerald
			{ID = 1798, Cost = 2951, Expansion = 4}, -- Imbue Opal
			{ID = 1898, Cost = 2962, Expansion = 0}, -- Imbue Peridot
			{ID = 1800, Cost = 2972, Expansion = 3}, -- Imbue Plains Pebble
			{ID = 1896, Cost = 2942, Expansion = 4}, -- Imbue Rose Quartz
			{ID = 1887, Cost = 2968, Expansion = 0}, -- Imbue Ruby
			{ID = 1886, Cost = 2981, Expansion = 4}, -- Imbue Sapphire
			{ID = 1799, Cost = 2948, Expansion = 4}, -- Imbue Topaz
			{ID = 3994, Cost = 2936, Expansion = 0}, -- Mass Imbue Amber
			{ID = 3995, Cost = 2937, Expansion = 4}, -- Mass Imbue Black Pearl
			{ID = 3996, Cost = 2929, Expansion = 4}, -- Mass Imbue Black Sapphire
			{ID = 3997, Cost = 2970, Expansion = 4}, -- Mass Imbue Diamond
			{ID = 3998, Cost = 2944, Expansion = 4}, -- Mass Imbue Emerald
			{ID = 4002, Cost = 2979, Expansion = 4}, -- Mass Imbue Opal
			{ID = 4003, Cost = 2911, Expansion = 4}, -- Mass Imbue Peridot
			{ID = 4004, Cost = 2907, Expansion = 4}, -- Mass Imbue Plains Pebble
			{ID = 4005, Cost = 2962, Expansion = 4}, -- Mass Imbue Rose Quartz
			{ID = 4006, Cost = 2915, Expansion = 4}, -- Mass Imbue Ruby
			{ID = 4007, Cost = 2919, Expansion = 4}, -- Mass Imbue Sapphire
			{ID = 4008, Cost = 2979, Expansion = 4}, -- Mass Imbue Topaz
			{ID = 329, Cost = 2915, Expansion = 0}, -- Wrath
		},
		[30] = {
			{ID = 62, Cost = 3332, Expansion = 0}, -- Resist Poison
			{ID = 9, Cost = 3346, Expansion = 0}, -- Superior Healing
			{ID = 135, Cost = 3301, Expansion = 0}, -- Word of Health
			{ID = 42607, Cost = 1200, Expansion = 0}, -- Renaissance
		},
		[31] = {
			{ID = 124, Cost = 3810, Expansion = 0}, -- Force
			{ID = 504, Cost = 3723, Expansion = 0}, -- Frenzied Strength
			{ID = 487, Cost = 3770, Expansion = 0}, -- Symbol of Pinzarn
		},
		[32] = {
			{ID = 480, Cost = 4235, Expansion = 0}, -- Atone
			{ID = 2171, Cost = 4260, Expansion = 0}, -- Renewal
			{ID = 312, Cost = 4298, Expansion = 0}, -- Valor
		},
		[33] = {
			{ID = 53, Cost = 4748, Expansion = 0}, -- Abundant Food
			{ID = 662, Cost = 4737, Expansion = 0}, -- Expel Undead
			{ID = 4260, Cost = 9062, Expansion = 0}, -- Iony's Greater Augury
			{ID = 60, Cost = 779, Expansion = 0}, -- Resist Fire
		},
		[34] = {
			{ID = 1445, Cost = 6602, Expansion = 2}, -- Armor of Protection
			{ID = 134, Cost = 5407, Expansion = 0}, -- Blinding Luminance
			{ID = 4284, Cost = 10142, Expansion = 0}, -- Iony's Greater Cleansing
			{ID = 4272, Cost = 9949, Expansion = 0}, -- Iony's Greater Exorcism
			{ID = 405, Cost = 920, Expansion = 0}, -- Tremor
		},
		[35] = {
			{ID = 19, Cost = 5946, Expansion = 0}, -- Armor of Faith
			{ID = 3576, Cost = 9089, Expansion = 4}, -- Blessing of Faith
		},
		[36] = {
			{ID = 127, Cost = 3334, Expansion = 0}, -- Invoke Fear
			{ID = 45, Cost = 6026, Expansion = 0}, -- Pacify
			{ID = 63, Cost = 3358, Expansion = 0}, -- Resist Disease
		},
		[37] = {
			{ID = 115, Cost = 1259, Expansion = 0}, -- Dismiss Summoned
			{ID = 388, Cost = 7451, Expansion = 0}, -- Resuscitate
			{ID = 1443, Cost = 9093, Expansion = 99}, -- Turning of the Unnatural
		},
		[38] = {
			{ID = 49, Cost = 4197, Expansion = 0}, -- Nullify Magic
			{ID = 2946, Cost = 11026, Expansion = 0}, -- Remove Curse
			{ID = 61, Cost = 1483, Expansion = 0}, -- Resist Cold
		},
		[39] = {
			{ID = 13, Cost = 9136, Expansion = 0}, -- Complete Heal
			{ID = 2504, Cost = 12089, Expansion = 3}, -- Sacred Word
			{ID = 415, Cost = 6616, Expansion = 0}, -- Word of Souls
		},
		[40] = {
			{ID = 4089, Cost = 17441, Expansion = 4}, -- Guard of Vie
			{ID = 675, Cost = 9920, Expansion = 0}, -- Hammer of Requital
			{ID = 3692, Cost = 15994, Expansion = 99}, -- Temperance
		},
		[41] = {
			{ID = 488, Cost = 11077, Expansion = 0}, -- Symbol of Naltron
			{ID = 44, Cost = 10904, Expansion = 0}, -- Yaulp III
		},
		[42] = {
			{ID = 314, Cost = 12326, Expansion = 0}, -- Resolution
			{ID = 2172, Cost = 12177, Expansion = 0}, -- Restoration
		},
		[43] = {
			{ID = 118, Cost = 13252, Expansion = 0}, -- Banish Undead
			{ID = 64, Cost = 7374, Expansion = 0}, -- Resist Magic
		},
		[44] = {
			{ID = 1444, Cost = 17577, Expansion = 99}, -- Celestial Healing
			{ID = 406, Cost = 3754, Expansion = 0}, -- Earthquake
			{ID = 672, Cost = 14759, Expansion = 0}, -- Retribution
		},
		[45] = {
			{ID = 4053, Cost = 27019, Expansion = 0}, -- Blessing of Temperance
			{ID = 20, Cost = 16143, Expansion = 0}, -- Shield of Words
			{ID = 136, Cost = 15950, Expansion = 0}, -- Word of Healing
		},
		[46] = {
			{ID = 132, Cost = 9141, Expansion = 0}, -- Immobilize
			{ID = 125, Cost = 17584, Expansion = 0}, -- Sound of Force
		},
		[47] = {
			{ID = 664, Cost = 2596, Expansion = 0}, -- Expel Summoned
			{ID = 392, Cost = 18936, Expansion = 0}, -- Resurrection
		},
		[48] = {
			{ID = 97, Cost = 20680, Expansion = 0}, -- Abolish Poison
			{ID = 1411, Cost = 24723, Expansion = 4}, -- Improved Invisibility to Undead
		},
		[49] = {
			{ID = 2505, Cost = 28516, Expansion = 3}, -- Armor of the Faithful
			{ID = 416, Cost = 22371, Expansion = 0}, -- Word Divine
		},
		[50] = {
			{ID = 6902, Cost = 33527, Expansion = 4}, -- Ward of the Divine
		},
		[51] = {
			{ID = 1547, Cost = 28888, Expansion = 99}, -- Death Pact
			{ID = 1532, Cost = 28886, Expansion = 1}, -- Dread of Night
			{ID = 3693, Cost = 39787, Expansion = 4}, -- Pure Blood
			{ID = 1518, Cost = 29298, Expansion = 1}, -- Remedy
			{ID = 1726, Cost = 29016, Expansion = 99}, -- Sunskin
		},
		[52] = {
			{ID = 2506, Cost = 36702, Expansion = 99}, -- Epitaph of Life
			{ID = 21398, Cost = 299595, Expansion = 4}, -- Eradicate Poison
			{ID = 1538, Cost = 31263, Expansion = 4}, -- Heroic Bond
			{ID = 1533, Cost = 31029, Expansion = 0}, -- Heroism
			{ID = 1542, Cost = 22781, Expansion = 4}, -- Upheaval
			{ID = 1520, Cost = 31669, Expansion = 99}, -- Word of Vigor
		},
		[53] = {
			{ID = 1526, Cost = 33468, Expansion = 1}, -- Annul Magic
			{ID = 1519, Cost = 33372, Expansion = 1}, -- Divine Light
			{ID = 1534, Cost = 33455, Expansion = 4}, -- Yaulp IV
		},
		[54] = {
			{ID = 21400, Cost = 311127, Expansion = 4}, -- Eradicate Curse
			{ID = 2507, Cost = 42965, Expansion = 99}, -- Mark of Retribution
			{ID = 4090, Cost = 52808, Expansion = 0}, -- Protection of Vie
			{ID = 1543, Cost = 37007, Expansion = 99}, -- Reckoning
			{ID = 2880, Cost = 0, Expansion = 0}, -- Remove Greater Curse
			{ID = 1535, Cost = 36916, Expansion = 0}, -- Symbol of Marzin
			{ID = 1721, Cost = 36641, Expansion = 99}, -- Unswerving Hammer of Faith
		},
		[55] = {
			{ID = 8928, Cost = 78576, Expansion = 99}, -- Aura of the Zealot
			{ID = 1528, Cost = 39600, Expansion = 1}, -- Exile Undead
			{ID = 1539, Cost = 39015, Expansion = 99}, -- Fortitude
			{ID = 1446, Cost = 42539, Expansion = 99}, -- Stun Command
			{ID = 1541, Cost = 28744, Expansion = 4}, -- Wake of Tranquility
		},
		[56] = {
			{ID = 116, Cost = 13200, Expansion = 0}, -- Banish Summoned
			{ID = 6989, Cost = 11000, Expansion = 0}, -- Cower the Dead
			{ID = 2181, Cost = 48890, Expansion = 4}, -- Hammer of Judgment
			{ID = 2508, Cost = 49348, Expansion = 99}, -- Judgment
			{ID = 1548, Cost = 42423, Expansion = 99}, -- Mark of Karn
			{ID = 133, Cost = 16013, Expansion = 4}, -- Paralyzing Earth
			{ID = 1524, Cost = 42529, Expansion = 1}, -- Reviviscence
			{ID = 2326, Cost = 49210, Expansion = 4}, -- Yaulp V
		},
		[57] = {
			{ID = 1540, Cost = 45401, Expansion = 99}, -- Aegis
			{ID = 1537, Cost = 45396, Expansion = 0}, -- Bulwark of Faith
			{ID = 1527, Cost = 42307, Expansion = 1}, -- Trepidation
			{ID = 6903, Cost = 11000, Expansion = 0}, -- Ward of Rebuke
			{ID = 1521, Cost = 46246, Expansion = 99}, -- Word of Restoration
		},
		[58] = {
			{ID = 1525, Cost = 49775, Expansion = 1}, -- Antidote
			{ID = 2509, Cost = 56468, Expansion = 99}, -- Blessed Armor of the Risen
			{ID = 1544, Cost = 49588, Expansion = 99}, -- Enforced Reverence
			{ID = 21399, Cost = 331420, Expansion = 4}, -- Eradicate Disease
			{ID = 2182, Cost = 56663, Expansion = 4}, -- Ethereal Light
			{ID = 3135, Cost = 56108, Expansion = 99}, -- Hammer of Divinity
			{ID = 1774, Cost = 48701, Expansion = 99}, -- Naltron's Mark
		},
		[59] = {
			{ID = 1522, Cost = 52965, Expansion = 1}, -- Celestial Elixir
			{ID = 6977, Cost = 11000, Expansion = 0}, -- Deistic Voice
			{ID = 2462, Cost = 61120, Expansion = 4}, -- Ethereal Remedy
			{ID = 1545, Cost = 52663, Expansion = 99}, -- The Unspoken Word
		},
		[60] = {
			{ID = 1447, Cost = 59914, Expansion = 99}, -- Aegolism
			{ID = 1530, Cost = 55845, Expansion = 4}, -- Banishment of Shadows
			{ID = 2510, Cost = 67914, Expansion = 99}, -- Blessing of Aegolism
			{ID = 1546, Cost = 56031, Expansion = 99}, -- Divine Intervention
			{ID = 2180, Cost = 64949, Expansion = 4}, -- Ethereal Elixir
			{ID = 3136, Cost = 67877, Expansion = 99}, -- Hammer of Souls
			{ID = 2893, Cost = 66493, Expansion = 99}, -- Marzin's Mark
			{ID = 1523, Cost = 57257, Expansion = 99}, -- Word of Redemption
		},
		[61] = {
			{ID = 6990, Cost = 11000, Expansion = 0}, -- Death's Despair
			{ID = 3296, Cost = 71627, Expansion = 99}, -- Faith
			{ID = 1342, Cost = 129407, Expansion = 99}, -- Larger Reviviscence
			{ID = 3465, Cost = 70966, Expansion = 4}, -- Supernal Remedy
			{ID = 3466, Cost = 71222, Expansion = 99}, -- Symbol of Kazad
			{ID = 3481, Cost = 71649, Expansion = 99}, -- Tarnation
			{ID = 3470, Cost = 71373, Expansion = 99}, -- Ward of Gallantry
			{ID = 6730, Cost = 0, Expansion = 0}, -- Ward of Vengeance
		},
		[62] = {
			{ID = 3472, Cost = 75935, Expansion = 99}, -- Blessing of Reverence
			{ID = 4091, Cost = 93046, Expansion = 0}, -- Bulwark of Vie
			{ID = 3476, Cost = 76051, Expansion = 99}, -- Condemnation
			{ID = 3195, Cost = 71159, Expansion = 4}, -- Greater Immobilize
			{ID = 3187, Cost = 76140, Expansion = 99}, -- Sermon of Penitence
			{ID = 3475, Cost = 75475, Expansion = 99}, -- Supernal Elixir
			{ID = 3467, Cost = 76604, Expansion = 99}, -- Virtue
		},
		[63] = {
			{ID = 6978, Cost = 11000, Expansion = 0}, -- Deistic Bellow
			{ID = 3478, Cost = 79785, Expansion = 99}, -- Hammer of Damnation
			{ID = 3047, Cost = 81377, Expansion = 99}, -- Kazad's Mark
			{ID = 3482, Cost = 80272, Expansion = 99}, -- Sound of Might
			{ID = 3480, Cost = 81746, Expansion = 99}, -- Supernal Light
		},
		[64] = {
			{ID = 4108, Cost = 105875, Expansion = 0}, -- Aura of Reverence
			{ID = 3473, Cost = 69933, Expansion = 4}, -- Catastrophe
			{ID = 3468, Cost = 85305, Expansion = 4}, -- Destroy Undead
			{ID = 3592, Cost = 80674, Expansion = 4}, -- Imbue Valor
			{ID = 3469, Cost = 86840, Expansion = 99}, -- Mark of Kings
			{ID = 3196, Cost = 75566, Expansion = 4}, -- Petrifying Earth
			{ID = 3471, Cost = 86342, Expansion = 99}, -- Word of Replenishment
		},
		[65] = {
			{ID = 3474, Cost = 100458, Expansion = 99}, -- Armor of the Zealot
			{ID = 3479, Cost = 98479, Expansion = 99}, -- Hand of Virtue
			{ID = 4882, Cost = 115276, Expansion = 99}, -- Holy Elixir
			{ID = 4880, Cost = 117330, Expansion = 99}, -- Holy Light
			{ID = 3477, Cost = 99390, Expansion = 99}, -- Mark of the Righteous
			{ID = 4881, Cost = 116697, Expansion = 99}, -- Order
			{ID = 3197, Cost = 74654, Expansion = 4}, -- Pacification
			{ID = 3464, Cost = 99294, Expansion = 99}, -- The Silent Command
			{ID = 3186, Cost = 99777, Expansion = 99}, -- Yaulp VI
		},
		[66] = {
			{ID = 5250, Cost = 130148, Expansion = 99}, -- Confidence
			{ID = 1344, Cost = 189685, Expansion = 99}, -- Greater Reviviscence
			{ID = 5251, Cost = 130528, Expansion = 99}, -- Pious Remedy
			{ID = 6991, Cost = 130722, Expansion = 99}, -- Revulsion of Death
			{ID = 5254, Cost = 131008, Expansion = 99}, -- Shock of Wonder
			{ID = 6125, Cost = 130756, Expansion = 99}, -- Sun Cloak
			{ID = 5252, Cost = 131124, Expansion = 99}, -- Symbol of Balikor
			{ID = 5253, Cost = 130758, Expansion = 99}, -- Ward of Valiance
		},
		[67] = {
			{ID = 5258, Cost = 137924, Expansion = 99}, -- Blessing of Devotion
			{ID = 5257, Cost = 141482, Expansion = 99}, -- Conviction
			{ID = 5261, Cost = 139450, Expansion = 99}, -- Panoply of Vie
			{ID = 5259, Cost = 140047, Expansion = 99}, -- Pious Elixir
			{ID = 5260, Cost = 139135, Expansion = 99}, -- Reproach
			{ID = 5255, Cost = 141262, Expansion = 99}, -- Sermon of Reproach
		},
		[68] = {
			{ID = 8004, Cost = 164943, Expansion = 99}, -- Death's Regret
			{ID = 6979, Cost = 146459, Expansion = 99}, -- Deistic Howl
			{ID = 5268, Cost = 148360, Expansion = 99}, -- Desolate Undead
			{ID = 5264, Cost = 146892, Expansion = 99}, -- Hammer of Reproach
			{ID = 5265, Cost = 147611, Expansion = 99}, -- Pious Light
			{ID = 5266, Cost = 149355, Expansion = 99}, -- Sound of Divinity
			{ID = 5256, Cost = 149496, Expansion = 99}, -- Unswerving Hammer of Retribution
		},
		[69] = {
			{ID = 5272, Cost = 155244, Expansion = 99}, -- Aura of Devotion
			{ID = 5271, Cost = 158547, Expansion = 99}, -- Calamity
			{ID = 8006, Cost = 174582, Expansion = 99}, -- Chromastrike
			{ID = 5269, Cost = 158257, Expansion = 99}, -- Mark of the Blameless
			{ID = 6662, Cost = 173617, Expansion = 99}, -- Ward of Retribution
			{ID = 5270, Cost = 156694, Expansion = 99}, -- Word of Vivification
			{ID = 5273, Cost = 158737, Expansion = 99}, -- Yaulp VII
		},
		[70] = {
			{ID = 5276, Cost = 165960, Expansion = 99}, -- Armor of the Pious
			{ID = 8495, Cost = 197383, Expansion = 99}, -- Aura of the Pious
			{ID = 5277, Cost = 164580, Expansion = 99}, -- Balikor's Mark
			{ID = 8007, Cost = 185713, Expansion = 99}, -- Desperate Renewal
			{ID = 8493, Cost = 194944, Expansion = 99}, -- Elixir of Divinity
			{ID = 5278, Cost = 164577, Expansion = 99}, -- Hand of Conviction
			{ID = 5274, Cost = 166333, Expansion = 99}, -- Placate
			{ID = 8494, Cost = 195828, Expansion = 99}, -- Puratus
			{ID = 5275, Cost = 165926, Expansion = 99}, -- Silent Dictation
		},
		[71] = {
			{ID = 9715, Cost = 221851, Expansion = 4}, -- Awestruck
			{ID = 9703, Cost = 218206, Expansion = 4}, -- Blessing of Purpose
			{ID = 9797, Cost = 217940, Expansion = 4}, -- Dulcify
			{ID = 1345, Cost = 250046, Expansion = 99}, -- Eminent Reviviscence
			{ID = 9706, Cost = 221797, Expansion = 4}, -- Sacred Remedy
			{ID = 9709, Cost = 218888, Expansion = 4}, -- Symbol of Elushar
			{ID = 9764, Cost = 220128, Expansion = 4}, -- Vow of Valor
			{ID = 9712, Cost = 222707, Expansion = 4}, -- Ward of the Dauntless
			{ID = 9782, Cost = 221983, Expansion = 4}, -- Yaulp VIII
			{ID = 9783, Cost = 100000, Expansion = 99}, -- Yaulp VIII Rk. II
			{ID = 9784, Cost = 100000, Expansion = 99}, -- Yaulp VIII Rk. III
		},
		[72] = {
			{ID = 9779, Cost = 231408, Expansion = 4}, -- Aura of Purpose
			{ID = 11753, Cost = 247909, Expansion = 4}, -- Divine Custody
			{ID = 11754, Cost = 10000, Expansion = 99}, -- Divine Custody Rk. II
			{ID = 11755, Cost = 10000, Expansion = 99}, -- Divine Custody Rk. III
			{ID = 9739, Cost = 234537, Expansion = 4}, -- Reproval
			{ID = 9736, Cost = 230490, Expansion = 4}, -- Sacred Elixir
			{ID = 9730, Cost = 230981, Expansion = 4}, -- Tenacity
			{ID = 9785, Cost = 234782, Expansion = 4}, -- Ward of Reprisal
		},
		[73] = {
			{ID = 9742, Cost = 248840, Expansion = 4}, -- Aegis of Vie
			{ID = 11756, Cost = 259366, Expansion = 4}, -- Consecrate Ground
			{ID = 11757, Cost = 10000, Expansion = 99}, -- Consecrate Ground Rk. II
			{ID = 11758, Cost = 10000, Expansion = 99}, -- Consecrate Ground Rk. III
			{ID = 9755, Cost = 248173, Expansion = 4}, -- Promised Renewal
			{ID = 9721, Cost = 242268, Expansion = 4}, -- Resist Corruption
			{ID = 9746, Cost = 245594, Expansion = 4}, -- Sacred Light
			{ID = 9749, Cost = 248756, Expansion = 4}, -- Sound of Zeal
		},
		[74] = {
			{ID = 9794, Cost = 261828, Expansion = 4}, -- Expunge Corruption
			{ID = 9773, Cost = 259152, Expansion = 4}, -- Mark of the Martyr
			{ID = 9791, Cost = 257233, Expansion = 4}, -- Shared Purity
			{ID = 9800, Cost = 262628, Expansion = 4}, -- Silent Decree
			{ID = 9776, Cost = 262523, Expansion = 4}, -- Tectonic Quake
			{ID = 11750, Cost = 274382, Expansion = 4}, -- Unflinching Hammer of Zeal
			{ID = 11751, Cost = 10000, Expansion = 99}, -- Unflinching Hammer of Zeal Rk. II
			{ID = 11752, Cost = 10000, Expansion = 99}, -- Unflinching Hammer of Zeal Rk. III
		},
		[75] = {
			{ID = 9803, Cost = 272647, Expansion = 4}, -- Armor of the Sacred
			{ID = 11763, Cost = 287366, Expansion = 4}, -- Blood of the Martyr
			{ID = 11764, Cost = 10000, Expansion = 99}, -- Blood of the Martyr Rk. II
			{ID = 11765, Cost = 10000, Expansion = 99}, -- Blood of the Martyr Rk. III
			{ID = 9812, Cost = 275467, Expansion = 4}, -- Elixir of Redemption
			{ID = 9806, Cost = 270946, Expansion = 4}, -- Elushar's Mark
			{ID = 9809, Cost = 273258, Expansion = 4}, -- Hand of Tenacity
			{ID = 9818, Cost = 273111, Expansion = 4}, -- Rallied Aegis of Vie
		},
		[76] = {
			{ID = 14219, Cost = 321943, Expansion = 4}, -- Aweshock
			{ID = 14207, Cost = 319172, Expansion = 4}, -- Blessing of Resolve
			{ID = 14288, Cost = 322241, Expansion = 4}, -- Mollify
			{ID = 14210, Cost = 316549, Expansion = 4}, -- Solemn Remedy
			{ID = 1346, Cost = 324937, Expansion = 99}, -- Superior Reviviscence
			{ID = 14213, Cost = 319836, Expansion = 4}, -- Symbol of Kaerra
			{ID = 14255, Cost = 318720, Expansion = 99}, -- Vow of Victory
			{ID = 14256, Cost = 380148, Expansion = 99}, -- Vow of Victory Rk. II
			{ID = 14257, Cost = 2468350, Expansion = 99}, -- Vow of Victory Rk. III
			{ID = 14216, Cost = 315717, Expansion = 4}, -- Ward of the Resolute
			{ID = 14273, Cost = 319624, Expansion = 4}, -- Yaulp IX
		},
		[77] = {
			{ID = 14270, Cost = 333093, Expansion = 4}, -- Aura of Resolve
			{ID = 14234, Cost = 335906, Expansion = 4}, -- Divine Censure
			{ID = 14312, Cost = 336743, Expansion = 4}, -- Divine Destiny
			{ID = 14331, Cost = 332265, Expansion = 99}, -- Eleventh-Hour
			{ID = 14332, Cost = 467358, Expansion = 99}, -- Eleventh-Hour Rk. II
			{ID = 14333, Cost = 2419310, Expansion = 99}, -- Eleventh-Hour Rk. III
			{ID = 14346, Cost = 333736, Expansion = 4}, -- Fool the Fallen
			{ID = 14231, Cost = 337336, Expansion = 4}, -- Solemn Elixir
			{ID = 14225, Cost = 338770, Expansion = 4}, -- Temerity
			{ID = 14276, Cost = 334448, Expansion = 4}, -- Ward of Requital
		},
		[78] = {
			{ID = 14222, Cost = 354274, Expansion = 4}, -- Forbear Corruption
			{ID = 14318, Cost = 352685, Expansion = 99}, -- Hallowed Ground
			{ID = 14319, Cost = 418522, Expansion = 99}, -- Hallowed Ground Rk. II
			{ID = 14249, Cost = 355950, Expansion = 99}, -- Promised Restoration
			{ID = 14250, Cost = 377378, Expansion = 99}, -- Promised Restoration Rk. II
			{ID = 14340, Cost = 354401, Expansion = 4}, -- Sermon of Admonition
			{ID = 14237, Cost = 356876, Expansion = 4}, -- Shield of Vie
			{ID = 14240, Cost = 354666, Expansion = 4}, -- Solemn Light
			{ID = 14243, Cost = 358398, Expansion = 4}, -- Sound of Resonance
		},
		[79] = {
			{ID = 14337, Cost = 373041, Expansion = 99}, -- Chromassault
			{ID = 14309, Cost = 377072, Expansion = 4}, -- Indomitable Hammer of Zeal
			{ID = 14264, Cost = 372744, Expansion = 4}, -- Mark of the Devoted
			{ID = 14291, Cost = 366833, Expansion = 4}, -- Silent Dictum
			{ID = 14267, Cost = 369778, Expansion = 4}, -- Tectonic Upheaval
			{ID = 14285, Cost = 367011, Expansion = 4}, -- Vitiate Corruption
		},
		[80] = {
			{ID = 14294, Cost = 394621, Expansion = 4}, -- Armor of the Solemn
			{ID = 14315, Cost = 386225, Expansion = 99}, -- Blood of the Devoted
			{ID = 14316, Cost = 434102, Expansion = 99}, -- Blood of the Devoted Rk. II
			{ID = 14317, Cost = 1953220, Expansion = 99}, -- Blood of the Devoted Rk. III
			{ID = 14325, Cost = 386810, Expansion = 99}, -- Circle of Divinity
			{ID = 14326, Cost = 485372, Expansion = 99}, -- Circle of Divinity Rk. II
			{ID = 14303, Cost = 391750, Expansion = 4}, -- Elixir of Atonement
			{ID = 14343, Cost = 386385, Expansion = 4}, -- Frantic Renewal
			{ID = 14300, Cost = 391250, Expansion = 4}, -- Hand of Temerity
			{ID = 14297, Cost = 388991, Expansion = 4}, -- Kaerra's Mark
			{ID = 14246, Cost = 393862, Expansion = 4}, -- Order of the Resolute
			{ID = 14306, Cost = 391931, Expansion = 4}, -- Rallied Shield of Vie
			{ID = 14349, Cost = 391661, Expansion = 4}, -- Word of Vivacity
		},
		[81] = {
			{ID = 18240, Cost = 436168, Expansion = 99}, -- Aweshake
			{ID = 18228, Cost = 430560, Expansion = 99}, -- Blessing of Loyalty
			{ID = 18231, Cost = 436721, Expansion = 99}, -- Devout Remedy
			{ID = 18309, Cost = 425164, Expansion = 99}, -- Reconcile
			{ID = 18234, Cost = 434748, Expansion = 99}, -- Symbol of Darianna
			{ID = 18237, Cost = 436353, Expansion = 99}, -- Ward of the Devout
			{ID = 18294, Cost = 435874, Expansion = 99}, -- Yaulp X
		},
		[82] = {
			{ID = 18291, Cost = 447490, Expansion = 15}, -- Aura of Loyalty
			{ID = 18252, Cost = 453914, Expansion = 15}, -- Devout Elixir
			{ID = 18367, Cost = 450542, Expansion = 15}, -- Distract the Departed
			{ID = 18333, Cost = 457847, Expansion = 15}, -- Divine Eminence
			{ID = 18246, Cost = 452082, Expansion = 15}, -- Gallantry
			{ID = 18255, Cost = 449249, Expansion = 15}, -- Reprehend
			{ID = 18297, Cost = 454642, Expansion = 15}, -- Ward of Admonishment
		},
		[83] = {
			{ID = 18261, Cost = 474765, Expansion = 99}, -- Devout Light
			{ID = 18258, Cost = 474070, Expansion = 99}, -- Palladium of Vie
			{ID = 18373, Cost = 481178, Expansion = 99}, -- Providence
			{ID = 18243, Cost = 475735, Expansion = 99}, -- Repel Corruption
			{ID = 18361, Cost = 478081, Expansion = 99}, -- Sermon of Castigation
			{ID = 18264, Cost = 471782, Expansion = 99}, -- Sound of Reverberance
		},
		[84] = {
			{ID = 18306, Cost = 500480, Expansion = 99}, -- Abolish Corruption
			{ID = 18359, Cost = 432448, Expansion = 99}, -- Chromassail Rk. II
			{ID = 18285, Cost = 503144, Expansion = 99}, -- Mark of the Unsullied
			{ID = 18389, Cost = 504108, Expansion = 99}, -- Purified Blood
			{ID = 18312, Cost = 496166, Expansion = 99}, -- Silent Edict
			{ID = 18288, Cost = 491834, Expansion = 99}, -- Tectonic Tumult
			{ID = 18330, Cost = 503213, Expansion = 99}, -- Unwavering Hammer of Zeal
		},
		[85] = {
			{ID = 18315, Cost = 521571, Expansion = 99}, -- Armor of the Devout
			{ID = 18318, Cost = 522291, Expansion = 99}, -- Darianna's Mark
			{ID = 18324, Cost = 515661, Expansion = 99}, -- Elixir of Expiation
			{ID = 18364, Cost = 516806, Expansion = 99}, -- Frenetic Renewal
			{ID = 18321, Cost = 522240, Expansion = 99}, -- Hand of Gallantry
			{ID = 18267, Cost = 524185, Expansion = 99}, -- Order of the Devout
			{ID = 18327, Cost = 523114, Expansion = 99}, -- Rallied Palladium of Vie
			{ID = 18370, Cost = 521316, Expansion = 99}, -- Word of Recovery
		},
		[86] = {
			{ID = 25063, Cost = 600972, Expansion = 99}, -- Annihilate the Undead
			{ID = 25095, Cost = 592870, Expansion = 99}, -- Awecrash
			{ID = 25077, Cost = 604301, Expansion = 99}, -- Blessing of Will
			{ID = 25083, Cost = 597182, Expansion = 99}, -- Earnest Remedy
			{ID = 25080, Cost = 595063, Expansion = 99}, -- Exonerate
			{ID = 25089, Cost = 601005, Expansion = 99}, -- Symbol of Ealdun
			{ID = 25092, Cost = 592483, Expansion = 99}, -- Ward of the Earnest
			{ID = 25086, Cost = 603561, Expansion = 99}, -- Word of Awakening
			{ID = 25113, Cost = 599185, Expansion = 99}, -- Yaulp XI
		},
		[87] = {
			{ID = 25119, Cost = 630399, Expansion = 99}, -- Divine Fortitude
			{ID = 25252, Cost = 622504, Expansion = 99}, -- Divine Intercession
			{ID = 25122, Cost = 620778, Expansion = 99}, -- Earnest Elixir
			{ID = 25116, Cost = 625761, Expansion = 99}, -- Hand of Will
			{ID = 25128, Cost = 621672, Expansion = 99}, -- Reliance
			{ID = 25137, Cost = 635296, Expansion = 99}, -- Ward of Retaliation
		},
		[88] = {
			{ID = 25153, Cost = 659226, Expansion = 99}, -- Celestial Intervention
			{ID = 25143, Cost = 666509, Expansion = 99}, -- Earnest Light
			{ID = 25165, Cost = 666031, Expansion = 99}, -- Promised Resurgence
			{ID = 25159, Cost = 655427, Expansion = 99}, -- Rampart of Vie
			{ID = 25068, Cost = 663471, Expansion = 99}, -- Reject Corruption
			{ID = 25146, Cost = 658381, Expansion = 99}, -- Sanctified Ground
			{ID = 25171, Cost = 659815, Expansion = 99}, -- Sermon of Censure
			{ID = 25174, Cost = 657428, Expansion = 99}, -- Sound of Fury
		},
		[89] = {
			{ID = 25177, Cost = 696010, Expansion = 99}, -- Chromarend
			{ID = 25183, Cost = 678581, Expansion = 99}, -- Devout Hammer of Zeal
			{ID = 25186, Cost = 680099, Expansion = 99}, -- Dissolve Corruption
			{ID = 25189, Cost = 688247, Expansion = 99}, -- Glorious Censure
			{ID = 25180, Cost = 690362, Expansion = 99}, -- Mark of the Devout
			{ID = 25071, Cost = 695825, Expansion = 99}, -- Purged Blood
			{ID = 25195, Cost = 686874, Expansion = 99}, -- Shining Rampart
			{ID = 25192, Cost = 687075, Expansion = 99}, -- Silent Proclamation
			{ID = 25074, Cost = 683590, Expansion = 99}, -- Tectonic Shock
		},
		[90] = {
			{ID = 25204, Cost = 714093, Expansion = 99}, -- Armor of the Earnest
			{ID = 25207, Cost = 718155, Expansion = 99}, -- Blood of the Devout
			{ID = 25231, Cost = 713950, Expansion = 99}, -- Celestial Contravention
			{ID = 25210, Cost = 712519, Expansion = 99}, -- Ealdun's Mark
			{ID = 25240, Cost = 720155, Expansion = 99}, -- Elixir of the Ardent
			{ID = 25213, Cost = 719823, Expansion = 99}, -- Fintar's Retort
			{ID = 25225, Cost = 728062, Expansion = 99}, -- Frenzied Renewal
			{ID = 25228, Cost = 717972, Expansion = 99}, -- Hand of Reliance
			{ID = 25222, Cost = 728333, Expansion = 99}, -- Healing Splash
			{ID = 25243, Cost = 726023, Expansion = 99}, -- Order of the Earnest
			{ID = 25246, Cost = 709855, Expansion = 99}, -- Rallied Rampart of Vie
			{ID = 25249, Cost = 729270, Expansion = 99}, -- Word of Resurgence
		},
		[91] = {
			{ID = 28081, Cost = 1182283, Expansion = 99}, -- Abolish the Undead
			{ID = 28106, Cost = 1181782, Expansion = 99}, -- Amnesty
			{ID = 28100, Cost = 1184239, Expansion = 99}, -- Assuage
			{ID = 28094, Cost = 1184263, Expansion = 99}, -- Aweburst
			{ID = 28109, Cost = 1185024, Expansion = 99}, -- Faithful Remedy
			{ID = 28112, Cost = 1182417, Expansion = 99}, -- Infusion of the Faithful
			{ID = 28299, Cost = 1184522, Expansion = 99}, -- Unity of the Triumvirate
			{ID = 28127, Cost = 1180603, Expansion = 99}, -- Vow of Veneration
			{ID = 28121, Cost = 1183626, Expansion = 99}, -- Word of Recuperation
			{ID = 28136, Cost = 1180920, Expansion = 99}, -- Yaulp XII
		},
		[92] = {
			{ID = 28142, Cost = 1193731, Expansion = 99}, -- Divine Guard
			{ID = 28145, Cost = 1195830, Expansion = 99}, -- Divine Invocation
			{ID = 28160, Cost = 1195402, Expansion = 99}, -- Fourteenth Catalyst
			{ID = 28151, Cost = 1196837, Expansion = 99}, -- Mark of Erion
			{ID = 28157, Cost = 1194075, Expansion = 99}, -- Remonstrance
			{ID = 28302, Cost = 1197023, Expansion = 99}, -- Unified Credence
			{ID = 28163, Cost = 1195430, Expansion = 99}, -- Ward of Recrimination
			{ID = 28148, Cost = 1195538, Expansion = 99}, -- Zealous Elixir
		},
		[93] = {
			{ID = 28172, Cost = 1206778, Expansion = 99}, -- Anointed Ground
			{ID = 28191, Cost = 1207399, Expansion = 99}, -- Armor of Vie
			{ID = 28179, Cost = 1211490, Expansion = 99}, -- Elysian Intervention
			{ID = 28185, Cost = 1209394, Expansion = 99}, -- Issuance of Faith
			{ID = 28197, Cost = 1211353, Expansion = 99}, -- Promised Restitution
			{ID = 28085, Cost = 1210353, Expansion = 99}, -- Rescind Corruption
			{ID = 28203, Cost = 1207595, Expansion = 99}, -- Sermon of Condemnation
			{ID = 28206, Cost = 1207678, Expansion = 99}, -- Sound of Fervor
			{ID = 28209, Cost = 1208448, Expansion = 99}, -- Vow of Vitriol
			{ID = 28169, Cost = 1209386, Expansion = 99}, -- Zealous Light
		},
		[94] = {
			{ID = 28218, Cost = 1224151, Expansion = 99}, -- Chromacleave
			{ID = 28233, Cost = 1221843, Expansion = 99}, -- Eradicate Corruption
			{ID = 28236, Cost = 1223671, Expansion = 99}, -- Glorious Admonition
			{ID = 28221, Cost = 1221566, Expansion = 99}, -- Hand of Faithful Infusion
			{ID = 28230, Cost = 1222493, Expansion = 99}, -- Infallible Hammer of Zeal
			{ID = 28227, Cost = 1219610, Expansion = 99}, -- Mark of the Adherent
			{ID = 28088, Cost = 1219930, Expansion = 99}, -- Perfected Blood
			{ID = 28242, Cost = 1220353, Expansion = 99}, -- Shining Armor
			{ID = 28239, Cost = 1221603, Expansion = 99}, -- Silent Mandate
			{ID = 28091, Cost = 1224088, Expansion = 99}, -- Tectonic Tremor
		},
		[95] = {
			{ID = 28251, Cost = 1236552, Expansion = 99}, -- Armor of the Zealous
			{ID = 28254, Cost = 1236447, Expansion = 99}, -- Blood of the Adherent
			{ID = 28287, Cost = 1232773, Expansion = 99}, -- Elixir of the Beneficent
			{ID = 28278, Cost = 1237421, Expansion = 99}, -- Elysian Contravention
			{ID = 28272, Cost = 1234589, Expansion = 99}, -- Fervent Renewal
			{ID = 28260, Cost = 1234515, Expansion = 99}, -- Galvos' Retort
			{ID = 28293, Cost = 1234217, Expansion = 99}, -- Rallied Armor of Vie
			{ID = 28269, Cost = 1235930, Expansion = 99}, -- Rejuvenating Splash
			{ID = 28275, Cost = 1232939, Expansion = 99}, -- Unified Hand of Credence
			{ID = 28257, Cost = 1234927, Expansion = 99}, -- Unified Hand of the Triumvirate
		},
	},
	[Class.PALADIN] = {
		[1] = {
			{ID = 5011, Cost = 20, Expansion = 0}, -- Salve
		},
		[2] = {
			{ID = 201, Cost = 20, Expansion = 0}, -- Flash of Light
		},
		[3] = {
			{ID = 205, Cost = 20, Expansion = 0}, -- True North
		},
		[4] = {
			{ID = 221, Cost = 20, Expansion = 0}, -- Sense the Dead
		},
		[5] = {
			{ID = 203, Cost = 20, Expansion = 0}, -- Cure Poison
			{ID = 42628, Cost = 20, Expansion = 0}, -- Selfish Cleansing lvl 5
		},
		[6] = {
			{ID = 200, Cost = 20, Expansion = 0}, -- Minor Healing
		},
		[7] = {
			{ID = 2581, Cost = 92, Expansion = 0}, -- Cease
		},
		[8] = {
			{ID = 202, Cost = 20, Expansion = 0}, -- Courage
		},
		[9] = {
			{ID = 209, Cost = 20, Expansion = 0}, -- Spook the Dead
			{ID = 210, Cost = 20, Expansion = 0}, -- Yaulp
		},
		[10] = {
			{ID = 208, Cost = 20, Expansion = 0}, -- Lull
			{ID = 42629, Cost = 150, Expansion = 0}, -- Prideful Cleansing lvl 10
		},
		[11] = {
			{ID = 213, Cost = 20, Expansion = 0}, -- Cure Disease
		},
		[12] = {
			{ID = 17, Cost = 24, Expansion = 0}, -- Light Healing
		},
		[13] = {
			{ID = 2582, Cost = 367, Expansion = 3}, -- Desist
		},
		[14] = {
			{ID = 223, Cost = 43, Expansion = 0}, -- Hammer of Wrath
			{ID = 218, Cost = 24, Expansion = 0}, -- Ward Undead
		},
		[15] = {
			{ID = 11, Cost = 20, Expansion = 0}, -- Holy Armor
			{ID = 42630, Cost = 367, Expansion = 0}, -- Lone Cleansing lvl 15
		},
		[16] = {
			{ID = 234, Cost = 71, Expansion = 0}, -- Halo of Light
		},
		[17] = {
			{ID = 235, Cost = 20, Expansion = 0}, -- Invisibility versus Undead
		},
		[18] = {
			{ID = 215, Cost = 20, Expansion = 0}, -- Reckless Strength
		},
		[19] = {
			{ID = 4056, Cost = 241, Expansion = 0}, -- Remove Minor Curse
			{ID = 230, Cost = 22, Expansion = 0}, -- Root
		},
		[20] = {
			{ID = 219, Cost = 42, Expansion = 0}, -- Center
			{ID = 42631, Cost = 1260, Expansion = 0}, -- Solitary Cleansing lvl 20
		},
		[21] = {
			{ID = 227, Cost = 34, Expansion = 0}, -- Endure Poison
		},
		[22] = {
			{ID = 2168, Cost = 154, Expansion = 0}, -- Reanimation
		},
		[23] = {
			{ID = 37, Cost = 1260, Expansion = 0}, -- Hammer of Striking
		},
		[24] = {
			{ID = 485, Cost = 119, Expansion = 0}, -- Symbol of Transal
		},
		[25] = {
			{ID = 501, Cost = 28, Expansion = 0}, -- Soothe
		},
		[26] = {
			{ID = 2583, Cost = 2938, Expansion = 0}, -- Instrument of Nife
		},
		[27] = {
			{ID = 12, Cost = 92, Expansion = 0}, -- Healing
		},
		[28] = {
			{ID = 216, Cost = 20, Expansion = 0}, -- Stun
		},
		[29] = {
			{ID = 228, Cost = 373, Expansion = 0}, -- Endure Magic
		},
		[30] = {
			{ID = 233, Cost = 195, Expansion = 0}, -- Expulse Undead
			{ID = 2169, Cost = 544, Expansion = 0}, -- Reconstitution
			{ID = 368, Cost = 297, Expansion = 0}, -- Spirit Armor
			{ID = 42632, Cost = 2247, Expansion = 0}, -- Chosen Cleansing lvl 30
		},
		[31] = {
			{ID = 2170, Cost = 1100, Expansion = 0}, -- Reparation
		},
		[32] = {
			{ID = 48, Cost = 43, Expansion = 0}, -- Cancel Magic
		},
		[33] = {
			{ID = 486, Cost = 925, Expansion = 0}, -- Symbol of Ryltan
		},
		[34] = {
			{ID = 95, Cost = 1100, Expansion = 0}, -- Counteract Poison
			{ID = 4057, Cost = 10031, Expansion = 0}, -- Remove Lesser Curse
		},
		[35] = {
			{ID = 2584, Cost = 8209, Expansion = 0}, -- Divine Vigor
		},
		[36] = {
			{ID = 15, Cost = 783, Expansion = 0}, -- Greater Healing
		},
		[37] = {
			{ID = 89, Cost = 452, Expansion = 0}, -- Daring
			{ID = 1453, Cost = 8983, Expansion = 2}, -- Divine Purpose
		},
		[38] = {
			{ID = 226, Cost = 55, Expansion = 0}, -- Endure Disease
			{ID = 43, Cost = 366, Expansion = 0}, -- Yaulp II
		},
		[39] = {
			{ID = 18, Cost = 1718, Expansion = 0}, -- Guard
			{ID = 391, Cost = 2247, Expansion = 0}, -- Revive
			{ID = 3577, Cost = 13399, Expansion = 4}, -- Wave of Life
		},
		[40] = {
			{ID = 42633, Cost = 13399, Expansion = 0}, -- Vain Cleansing lvl 40
		},
		[42] = {
			{ID = 123, Cost = 371, Expansion = 0}, -- Holy Might
		},
		[43] = {
			{ID = 47, Cost = 297, Expansion = 0}, -- Calm
		},
		[44] = {
			{ID = 3683, Cost = 22661, Expansion = 99}, -- Ethereal Cleansing
			{ID = 2585, Cost = 18969, Expansion = 0}, -- Valor of Marr
		},
		[45] = {
			{ID = 693, Cost = 15806, Expansion = 99}, -- Divine Might
			{ID = 2946, Cost = 11026, Expansion = 0}, -- Remove Curse
		},
		[46] = {
			{ID = 117, Cost = 1276, Expansion = 0}, -- Dismiss Undead
			{ID = 487, Cost = 3770, Expansion = 0}, -- Symbol of Pinzarn
		},
		[47] = {
			{ID = 2586, Cost = 24377, Expansion = 4}, -- Thunder of Karana
			{ID = 312, Cost = 4298, Expansion = 0}, -- Valor
		},
		[48] = {
			{ID = 19, Cost = 5946, Expansion = 0}, -- Armor of Faith
			{ID = 207, Cost = 20, Expansion = 0}, -- Divine Aura
		},
		[49] = {
			{ID = 3578, Cost = 31677, Expansion = 0}, -- Brell's Steadfast Aegis
			{ID = 45, Cost = 6026, Expansion = 0}, -- Pacify
			{ID = 2171, Cost = 4260, Expansion = 0}, -- Renewal
		},
		[50] = {
			{ID = 1454, Cost = 28814, Expansion = 99}, -- Flame of Light
			{ID = 63, Cost = 3358, Expansion = 0}, -- Resist Disease
			{ID = 42634, Cost = 28814, Expansion = 0}, -- Personal Cleansing lvl 50
		},
		[51] = {
			{ID = 4585, Cost = 3332, Expansion = 0}, -- Resistant Discipline
		},
		[52] = {
			{ID = 124, Cost = 3810, Expansion = 0}, -- Force
			{ID = 504, Cost = 3723, Expansion = 0}, -- Frenzied Strength
			{ID = 3684, Cost = 41970, Expansion = 99}, -- Light of Life
		},
		[53] = {
			{ID = 1288, Cost = 36788, Expansion = 0}, -- Divine Glory
			{ID = 3975, Cost = 39345, Expansion = 99}, -- Force of Akera
		},
		[54] = {
			{ID = 662, Cost = 4737, Expansion = 0}, -- Expel Undead
			{ID = 4587, Cost = 10043, Expansion = 0}, -- Fearless Discipline
			{ID = 131, Cost = 457, Expansion = 0}, -- Instill
			{ID = 2587, Cost = 42061, Expansion = 0}, -- Quellious' Word of Tranquility
		},
		[55] = {
			{ID = 4064, Cost = 56032, Expansion = 0}, -- Austerity
			{ID = 1743, Cost = 39398, Expansion = 0}, -- Divine Favor
			{ID = 8925, Cost = 80621, Expansion = 99}, -- Holy Aura
			{ID = 4500, Cost = 39297, Expansion = 4}, -- Holyforge Discipline
			{ID = 64, Cost = 7374, Expansion = 0}, -- Resist Magic
			{ID = 2172, Cost = 12177, Expansion = 0}, -- Restoration
			{ID = 1455, Cost = 42566, Expansion = 99}, -- Wave of Healing
			{ID = 42635, Cost = 12177, Expansion = 0}, -- Anointed Cleansing lvl 55
		},
		[56] = {
			{ID = 2588, Cost = 49580, Expansion = 0}, -- Breath of Tunare
			{ID = 96, Cost = 1087, Expansion = 0}, -- Counteract Disease
			{ID = 7004, Cost = 11000, Expansion = 0}, -- Guard of Piety
			{ID = 44, Cost = 10904, Expansion = 0}, -- Yaulp III
		},
		[57] = {
			{ID = 9, Cost = 3346, Expansion = 0}, -- Superior Healing
		},
		[58] = {
			{ID = 4065, Cost = 70544, Expansion = 0}, -- Blessing of Austerity
			{ID = 2589, Cost = 57205, Expansion = 0}, -- Healing Wave of Prexus
			{ID = 49, Cost = 4197, Expansion = 0}, -- Nullify Magic
			{ID = 488, Cost = 11077, Expansion = 0}, -- Symbol of Naltron
		},
		[59] = {
			{ID = 1283, Cost = 57029, Expansion = 0}, -- Celestial Cleansing
			{ID = 4590, Cost = 125504, Expansion = 4}, -- Deflection Discipline
			{ID = 392, Cost = 18936, Expansion = 0}, -- Resurrection
		},
		[60] = {
			{ID = 2590, Cost = 67942, Expansion = 0}, -- Brell's Mountainous Barrier
			{ID = 1456, Cost = 60027, Expansion = 99}, -- Divine Strength
			{ID = 21400, Cost = 311127, Expansion = 4}, -- Eradicate Curse
			{ID = 2880, Cost = 0, Expansion = 0}, -- Remove Greater Curse
			{ID = 314, Cost = 12326, Expansion = 0}, -- Resolution
			{ID = 4518, Cost = 56375, Expansion = 4}, -- Sanctification Discipline
			{ID = 20, Cost = 16143, Expansion = 0}, -- Shield of Words
			{ID = 1534, Cost = 33455, Expansion = 4}, -- Yaulp IV
		},
		[61] = {
			{ID = 3195, Cost = 71159, Expansion = 4}, -- Greater Immobilize
			{ID = 6731, Cost = 0, Expansion = 0}, -- Guard of Humility
			{ID = 1533, Cost = 31029, Expansion = 0}, -- Heroism
			{ID = 62, Cost = 3332, Expansion = 0}, -- Resist Poison
			{ID = 3429, Cost = 71548, Expansion = 99}, -- Touch of Nife
		},
		[62] = {
			{ID = 3190, Cost = 75819, Expansion = 99}, -- Crusader's Touch
			{ID = 3428, Cost = 74791, Expansion = 4}, -- Deny Undead
			{ID = 3245, Cost = 75875, Expansion = 99}, -- Force of Akilae
			{ID = 3422, Cost = 76495, Expansion = 99}, -- Ward of Nife
		},
		[63] = {
			{ID = 1411, Cost = 24723, Expansion = 4}, -- Improved Invisibility to Undead
			{ID = 3430, Cost = 81764, Expansion = 99}, -- Light of Nife
			{ID = 3424, Cost = 80865, Expansion = 99}, -- Pious Might
			{ID = 1535, Cost = 36916, Expansion = 0}, -- Symbol of Marzin
		},
		[64] = {
			{ID = 3247, Cost = 86836, Expansion = 99}, -- Aura of the Crusader
			{ID = 21398, Cost = 299595, Expansion = 4}, -- Eradicate Poison
			{ID = 1538, Cost = 31263, Expansion = 4}, -- Heroic Bond
			{ID = 3426, Cost = 85909, Expansion = 99}, -- Quellious' Word of Serenity
			{ID = 3485, Cost = 86202, Expansion = 99}, -- Supernal Cleansing
		},
		[65] = {
			{ID = 3432, Cost = 99377, Expansion = 99}, -- Brell's Stalwart Shield
			{ID = 1537, Cost = 45396, Expansion = 0}, -- Bulwark of Faith
			{ID = 4109, Cost = 111686, Expansion = 0}, -- Guidance
			{ID = 4895, Cost = 115476, Expansion = 99}, -- Holy Order
			{ID = 4894, Cost = 117478, Expansion = 99}, -- Light of Order
			{ID = 3246, Cost = 100746, Expansion = 99}, -- Shackles of Tunare
			{ID = 3427, Cost = 99831, Expansion = 99}, -- Wave of Marr
			{ID = 4893, Cost = 116244, Expansion = 99}, -- Wave of Trushar
		},
		[66] = {
			{ID = 5280, Cost = 132679, Expansion = 99}, -- Direction
			{ID = 5284, Cost = 131964, Expansion = 99}, -- Force of Piety
			{ID = 5282, Cost = 131826, Expansion = 99}, -- Touch of Piety
		},
		[67] = {
			{ID = 5283, Cost = 140575, Expansion = 99}, -- Crusader's Purity
			{ID = 5285, Cost = 137865, Expansion = 99}, -- Silvered Fury
			{ID = 5286, Cost = 138631, Expansion = 99}, -- Spurn Undead
			{ID = 5287, Cost = 139134, Expansion = 99}, -- Symbol of Jeron
		},
		[68] = {
			{ID = 5295, Cost = 146809, Expansion = 99}, -- Jeron's Mark
			{ID = 8027, Cost = 168466, Expansion = 99}, -- Last Rites
			{ID = 5289, Cost = 149228, Expansion = 99}, -- Light of Piety
			{ID = 5288, Cost = 148923, Expansion = 99}, -- Pious Fury
			{ID = 5292, Cost = 149293, Expansion = 99}, -- Serene Command
		},
		[69] = {
			{ID = 5291, Cost = 157356, Expansion = 99}, -- Armor of the Champion
			{ID = 5294, Cost = 158938, Expansion = 99}, -- Bulwark of Piety
			{ID = 6663, Cost = 170527, Expansion = 99}, -- Guard of Righteousness
			{ID = 5290, Cost = 156950, Expansion = 99}, -- Hand of Direction
			{ID = 5293, Cost = 158127, Expansion = 99}, -- Pious Cleansing
			{ID = 8029, Cost = 177875, Expansion = 99}, -- Silent Piety
		},
		[70] = {
			{ID = 5298, Cost = 166250, Expansion = 99}, -- Affirmation
			{ID = 8481, Cost = 197445, Expansion = 99}, -- Blessed Aura
			{ID = 5297, Cost = 164203, Expansion = 99}, -- Brell's Brawny Bulwark
			{ID = 8479, Cost = 194794, Expansion = 99}, -- Ward of Tunare
			{ID = 5296, Cost = 167107, Expansion = 99}, -- Wave of Piety
		},
		[71] = {
			{ID = 10170, Cost = 220196, Expansion = 4}, -- Absolve
			{ID = 11857, Cost = 231385, Expansion = 4}, -- Burial Rites
			{ID = 11858, Cost = 10000, Expansion = 99}, -- Burial Rites Rk. II
			{ID = 11859, Cost = 10000, Expansion = 99}, -- Burial Rites Rk. III
			{ID = 21399, Cost = 331420, Expansion = 4}, -- Eradicate Disease
			{ID = 10158, Cost = 221745, Expansion = 4}, -- Sacred Force
			{ID = 10155, Cost = 221016, Expansion = 4}, -- Sacred Touch
		},
		[72] = {
			{ID = 10173, Cost = 234525, Expansion = 4}, -- Challenge for Honor
			{ID = 10185, Cost = 231681, Expansion = 4}, -- Gleaming Light
			{ID = 10188, Cost = 233967, Expansion = 4}, -- Lesson of Penitence
		},
		[73] = {
			{ID = 11854, Cost = 256298, Expansion = 99}, -- Armor of Righteousness
			{ID = 11855, Cost = 10000, Expansion = 99}, -- Armor of Righteousness Rk. II
			{ID = 10197, Cost = 245363, Expansion = 4}, -- Armor of Unrelenting Faith
			{ID = 10161, Cost = 243304, Expansion = 4}, -- Burst of Sunlight
			{ID = 10200, Cost = 244814, Expansion = 4}, -- Sacred Cleansing
		},
		[74] = {
			{ID = 10209, Cost = 256452, Expansion = 4}, -- Brell's Stony Guard
			{ID = 10194, Cost = 261318, Expansion = 4}, -- Fenegar's Mark
			{ID = 10206, Cost = 258890, Expansion = 4}, -- Wave of Forgiveness
		},
		[75] = {
			{ID = 9700, Cost = 218250, Expansion = 4}, -- Cure Corruption
			{ID = 11851, Cost = 288030, Expansion = 4}, -- Force of Prexus
			{ID = 11852, Cost = 10000, Expansion = 99}, -- Force of Prexus Rk. II
			{ID = 11853, Cost = 10000, Expansion = 99}, -- Force of Prexus Rk. III
			{ID = 10215, Cost = 270077, Expansion = 4}, -- Remorse for the Fallen
			{ID = 10212, Cost = 270601, Expansion = 4}, -- Sworn Protector
			{ID = 10224, Cost = 273134, Expansion = 99}, -- Wraithguard's Vengeance
		},
		[76] = {
			{ID = 14951, Cost = 322297, Expansion = 4}, -- Atonement
			{ID = 14990, Cost = 322018, Expansion = 4}, -- Benediction
			{ID = 14942, Cost = 320047, Expansion = 4}, -- Solemn Force
			{ID = 14939, Cost = 323322, Expansion = 4}, -- Solemn Touch
		},
		[77] = {
			{ID = 14963, Cost = 338318, Expansion = 4}, -- Lesson of Contrition
			{ID = 14960, Cost = 338632, Expansion = 4}, -- Radiant Light
			{ID = 14948, Cost = 337540, Expansion = 4}, -- Symbol of Bthur
			{ID = 14954, Cost = 332240, Expansion = 99}, -- Trial for Honor
		},
		[78] = {
			{ID = 14987, Cost = 352350, Expansion = 99}, -- Armor of Decorum
			{ID = 14969, Cost = 352795, Expansion = 4}, -- Armor of Inexorable Faith
			{ID = 14945, Cost = 350887, Expansion = 99}, -- Burst of Morrow
			{ID = 14946, Cost = 944346, Expansion = 99}, -- Burst of Morrow Rk. II
			{ID = 14972, Cost = 349249, Expansion = 4}, -- Solemn Cleansing
		},
		[79] = {
			{ID = 14978, Cost = 372740, Expansion = 4}, -- Brell's Earthen Aegis
			{ID = 14966, Cost = 366677, Expansion = 4}, -- Bthur's Mark
			{ID = 15002, Cost = 375445, Expansion = 4}, -- Mark of the Saint
			{ID = 14975, Cost = 372752, Expansion = 4}, -- Wave of Absolution
		},
		[80] = {
			{ID = 15005, Cost = 388690, Expansion = 99}, -- Aurora of Morrow
			{ID = 15006, Cost = 955392, Expansion = 99}, -- Aurora of Morrow Rk. II
			{ID = 15007, Cost = 4278680, Expansion = 99}, -- Aurora of Morrow Rk. III
			{ID = 14984, Cost = 393430, Expansion = 4}, -- Force of Timorous
			{ID = 14981, Cost = 393089, Expansion = 4}, -- Oathbound Protector
			{ID = 15008, Cost = 390636, Expansion = 99}, -- Righteous Fury
			{ID = 15009, Cost = 929402, Expansion = 99}, -- Righteous Fury Rk. II
			{ID = 14996, Cost = 394655, Expansion = 99}, -- Sustenance of Tunare
			{ID = 14997, Cost = 875718, Expansion = 99}, -- Sustenance of Tunare Rk. II
			{ID = 14998, Cost = 4513810, Expansion = 99}, -- Sustenance of Tunare Rk. III
		},
		[81] = {
			{ID = 19128, Cost = 425339, Expansion = 99}, -- Devoted Purity
			{ID = 19056, Cost = 426375, Expansion = 99}, -- Devout Force
			{ID = 19053, Cost = 427003, Expansion = 99}, -- Devout Touch
			{ID = 19104, Cost = 429445, Expansion = 99}, -- Eulogy
			{ID = 19065, Cost = 425885, Expansion = 99}, -- Expiation
			{ID = 19711, Cost = 437146, Expansion = 99}, -- Mark of the Crusader
		},
		[82] = {
			{ID = 19069, Cost = 776629, Expansion = 99}, -- Charge for Honor Rk. II
			{ID = 19140, Cost = 448971, Expansion = 15}, -- Crush of the Crying Seas
			{ID = 19077, Cost = 458547, Expansion = 15}, -- Lesson of Compunction
			{ID = 19074, Cost = 458151, Expansion = 15}, -- Shining Light
			{ID = 19062, Cost = 453021, Expansion = 15}, -- Symbol of Jeneca
		},
		[83] = {
			{ID = 19101, Cost = 478707, Expansion = 99}, -- Armor of Endless Honor
			{ID = 19083, Cost = 470304, Expansion = 99}, -- Armor of Unwavering Faith
			{ID = 19086, Cost = 472727, Expansion = 99}, -- Devout Cleansing
			{ID = 19131, Cost = 473558, Expansion = 99}, -- Withstand
		},
		[84] = {
			{ID = 19092, Cost = 504267, Expansion = 99}, -- Brell's Loamy Ward
			{ID = 19080, Cost = 499951, Expansion = 99}, -- Jeneca's Mark
			{ID = 19116, Cost = 496729, Expansion = 99}, -- Mark of the Pious
			{ID = 19089, Cost = 492979, Expansion = 99}, -- Wave of Remitment
		},
		[85] = {
			{ID = 19143, Cost = 527621, Expansion = 99}, -- Crush of Compunction
			{ID = 19122, Cost = 524563, Expansion = 99}, -- Devout Fury
			{ID = 19098, Cost = 524636, Expansion = 99}, -- Force of the Crying Seas
			{ID = 19095, Cost = 526024, Expansion = 99}, -- Sworn Keeper
		},
		[86] = {
			{ID = 25063, Cost = 600972, Expansion = 99}, -- Annihilate the Undead
			{ID = 25273, Cost = 602560, Expansion = 99}, -- Cleanse
			{ID = 25282, Cost = 597756, Expansion = 99}, -- Earnest Force
			{ID = 25276, Cost = 605713, Expansion = 99}, -- Earnest Purity
			{ID = 25279, Cost = 596075, Expansion = 99}, -- Earnest Touch
			{ID = 25285, Cost = 594486, Expansion = 99}, -- Elegy
			{ID = 25291, Cost = 599683, Expansion = 99}, -- Mark of the Pure
			{ID = 25294, Cost = 608288, Expansion = 99}, -- Propitiate
			{ID = 25000, Cost = 605412, Expansion = 17}, -- Respite
		},
		[87] = {
			{ID = 25297, Cost = 636088, Expansion = 99}, -- Confrontation for Honor
			{ID = 25303, Cost = 627690, Expansion = 99}, -- Crush of Marr
			{ID = 25312, Cost = 634049, Expansion = 99}, -- Joyous Light
			{ID = 25315, Cost = 631397, Expansion = 99}, -- Lesson of Repentance
			{ID = 25318, Cost = 625789, Expansion = 99}, -- Symbol of Jyleel
		},
		[88] = {
			{ID = 25321, Cost = 661245, Expansion = 99}, -- Armor of Courage
			{ID = 25330, Cost = 662795, Expansion = 99}, -- Armor of Implacable Faith
			{ID = 25264, Cost = 656003, Expansion = 99}, -- Defy
			{ID = 25336, Cost = 651988, Expansion = 99}, -- Earnest Cleansing
			{ID = 25345, Cost = 659410, Expansion = 99}, -- Righteous Indignation
		},
		[89] = {
			{ID = 25351, Cost = 686537, Expansion = 99}, -- Brell's Tellurian Rampart
			{ID = 25354, Cost = 680328, Expansion = 99}, -- Mark of the Defender
			{ID = 25357, Cost = 688965, Expansion = 99}, -- Penitence
			{ID = 25270, Cost = 681652, Expansion = 99}, -- Stubborn Stance
			{ID = 25360, Cost = 689693, Expansion = 99}, -- Wave of Penitence
		},
		[90] = {
			{ID = 25363, Cost = 711989, Expansion = 99}, -- Aurora of Daybreak
			{ID = 25366, Cost = 724799, Expansion = 99}, -- Crush of Repentance
			{ID = 25369, Cost = 721271, Expansion = 99}, -- Earnest Fury
			{ID = 25375, Cost = 710301, Expansion = 99}, -- Force of Marr
			{ID = 25378, Cost = 726322, Expansion = 99}, -- Glorious Exoneration
			{ID = 25381, Cost = 718914, Expansion = 99}, -- Oathbound Keeper
			{ID = 25384, Cost = 710134, Expansion = 99}, -- Preservation of Marr
			{ID = 25390, Cost = 719506, Expansion = 99}, -- Protective Devotion
			{ID = 25399, Cost = 722495, Expansion = 99}, -- Pureforge Discipline
		},
		[91] = {
			{ID = 28081, Cost = 1182283, Expansion = 99}, -- Abolish the Undead
			{ID = 28335, Cost = 1182238, Expansion = 99}, -- Mark of Ragan
			{ID = 28338, Cost = 1185181, Expansion = 99}, -- Mollify
			{ID = 28329, Cost = 1180704, Expansion = 99}, -- Paean
			{ID = 28317, Cost = 1184798, Expansion = 99}, -- Purify
			{ID = 28326, Cost = 1185150, Expansion = 99}, -- Zealous Force
			{ID = 28320, Cost = 1182782, Expansion = 99}, -- Zealous Purity
			{ID = 28323, Cost = 1184471, Expansion = 99}, -- Zealous Touch
		},
		[92] = {
			{ID = 28341, Cost = 1194911, Expansion = 99}, -- Avowed Keeper
			{ID = 28362, Cost = 1198265, Expansion = 99}, -- Brilliant Light
			{ID = 28353, Cost = 1193523, Expansion = 99}, -- Crush of Oseka
			{ID = 28365, Cost = 1198457, Expansion = 99}, -- Lesson of Remorse
			{ID = 28347, Cost = 1195742, Expansion = 99}, -- Provocation for Honor
			{ID = 28356, Cost = 1197989, Expansion = 99}, -- Reprimand
			{ID = 28371, Cost = 1194440, Expansion = 99}, -- Righteous Audacity
			{ID = 28368, Cost = 1195319, Expansion = 99}, -- Symbol of Erillion
		},
		[93] = {
			{ID = 28383, Cost = 1209262, Expansion = 99}, -- Armor of Formidable Faith
			{ID = 28374, Cost = 1207074, Expansion = 99}, -- Armor of Zeal
			{ID = 28386, Cost = 1209415, Expansion = 99}, -- Burst of Splendor
			{ID = 28308, Cost = 1211133, Expansion = 99}, -- Renounce
			{ID = 28398, Cost = 1208385, Expansion = 99}, -- Righteous Vexation
			{ID = 28407, Cost = 1210498, Expansion = 99}, -- Splash of Purification
			{ID = 28389, Cost = 1209360, Expansion = 99}, -- Zealous Cleansing
		},
		[94] = {
			{ID = 28410, Cost = 1222893, Expansion = 99}, -- Brell's Adamantine Armor
			{ID = 28419, Cost = 1222530, Expansion = 99}, -- Contrition
			{ID = 28413, Cost = 1222766, Expansion = 99}, -- Mark of the Reverent
			{ID = 28416, Cost = 1222632, Expansion = 99}, -- Rejuvenating Steel
			{ID = 28314, Cost = 1221252, Expansion = 99}, -- Stoic Stance
			{ID = 28431, Cost = 1223989, Expansion = 99}, -- Wave of Contrition
		},
		[95] = {
			{ID = 28434, Cost = 1233345, Expansion = 99}, -- Aurora of Splendor
			{ID = 28437, Cost = 1232693, Expansion = 99}, -- Crush of Tides
			{ID = 28446, Cost = 1234273, Expansion = 99}, -- Force of Oseka
			{ID = 28449, Cost = 1234184, Expansion = 99}, -- Glorious Exculpation
			{ID = 28452, Cost = 1237152, Expansion = 99}, -- Hand of the Avowed Keeper
			{ID = 28455, Cost = 1234076, Expansion = 99}, -- Preservation of Oseka
			{ID = 28461, Cost = 1236535, Expansion = 99}, -- Protective Dedication
		},
	},
	[Class.RANGER] = {
		[1] = {
			{ID = 5011, Cost = 20, Expansion = 0}, -- Salve
		},
		[2] = {
			{ID = 51, Cost = 20, Expansion = 0}, -- Glimpse
		},
		[3] = {
			{ID = 239, Cost = 20, Expansion = 0}, -- Flame Lick
		},
		[4] = {
			{ID = 240, Cost = 20, Expansion = 0}, -- Lull Animal
		},
		[5] = {
			{ID = 2591, Cost = 24, Expansion = 3}, -- Tangling Weeds
		},
		[6] = {
			{ID = 242, Cost = 20, Expansion = 0}, -- Snare
		},
		[7] = {
			{ID = 26, Cost = 20, Expansion = 0}, -- Skin like Wood
		},
		[8] = {
			{ID = 200, Cost = 20, Expansion = 0}, -- Minor Healing
		},
		[9] = {
			{ID = 224, Cost = 20, Expansion = 0}, -- Endure Fire
		},
		[10] = {
			{ID = 237, Cost = 20, Expansion = 0}, -- Dance of the Fireflies
		},
		[11] = {
			{ID = 2592, Cost = 241, Expansion = 3}, -- Hawk Eye
		},
		[12] = {
			{ID = 269, Cost = 22, Expansion = 0}, -- Feet like Cat
		},
		[13] = {
			{ID = 203, Cost = 20, Expansion = 0}, -- Cure Poison
			{ID = 515, Cost = 43, Expansion = 0}, -- Thistlecoat
		},
		[14] = {
			{ID = 92, Cost = 22, Expansion = 0}, -- Burst of Fire
			{ID = 247, Cost = 24, Expansion = 0}, -- Camouflage
		},
		[15] = {
			{ID = 249, Cost = 20, Expansion = 0}, -- Grasping Roots
			{ID = 252, Cost = 24, Expansion = 0}, -- Invoke Lightning
		},
		[16] = {
			{ID = 241, Cost = 20, Expansion = 0}, -- Panic Animal
			{ID = 248, Cost = 20, Expansion = 0}, -- Ward Summoned
		},
		[17] = {
			{ID = 500, Cost = 55, Expansion = 0}, -- Bind Sight
			{ID = 254, Cost = 34, Expansion = 0}, -- Firefist
		},
		[18] = {
			{ID = 225, Cost = 20, Expansion = 0}, -- Endure Cold
		},
		[19] = {
			{ID = 91, Cost = 55, Expansion = 0}, -- Ignite
		},
		[20] = {
			{ID = 86, Cost = 34, Expansion = 0}, -- Enduring Breath
		},
		[21] = {
			{ID = 17, Cost = 24, Expansion = 0}, -- Light Healing
			{ID = 263, Cost = 245, Expansion = 0}, -- Skin like Rock
		},
		[22] = {
			{ID = 213, Cost = 20, Expansion = 0}, -- Cure Disease
			{ID = 250, Cost = 28, Expansion = 0}, -- Harmony
		},
		[24] = {
			{ID = 256, Cost = 43, Expansion = 0}, -- Shield of Thistles
		},
		[25] = {
			{ID = 264, Cost = 93, Expansion = 0}, -- Stinging Swarm
		},
		[26] = {
			{ID = 268, Cost = 42, Expansion = 0}, -- Strength of Earth
		},
		[27] = {
			{ID = 655, Cost = 2236, Expansion = 0}, -- Eyes of the Cat
		},
		[28] = {
			{ID = 278, Cost = 71, Expansion = 0}, -- Spirit of Wolf
		},
		[29] = {
			{ID = 3565, Cost = 4811, Expansion = 4}, -- Flaming Arrow
			{ID = 2593, Cost = 4200, Expansion = 3}, -- Riftwind's Protection
		},
		[30] = {
			{ID = 516, Cost = 450, Expansion = 0}, -- Barbcoat
			{ID = 48, Cost = 43, Expansion = 0}, -- Cancel Magic
		},
		[31] = {
			{ID = 513, Cost = 301, Expansion = 0}, -- Calm Animal
		},
		[32] = {
			{ID = 80, Cost = 24, Expansion = 0}, -- See Invisible
		},
		[33] = {
			{ID = 115, Cost = 1259, Expansion = 0}, -- Dismiss Summoned
		},
		[34] = {
			{ID = 517, Cost = 2233, Expansion = 0}, -- Bramblecoat
		},
		[35] = {
			{ID = 261, Cost = 92, Expansion = 0}, -- Levitate
		},
		[36] = {
			{ID = 1461, Cost = 8172, Expansion = 2}, -- Call of Sky
		},
		[37] = {
			{ID = 419, Cost = 375, Expansion = 0}, -- Careless Lightning
			{ID = 2594, Cost = 9920, Expansion = 3}, -- Nature's Precision
		},
		[38] = {
			{ID = 12, Cost = 92, Expansion = 0}, -- Healing
			{ID = 421, Cost = 1482, Expansion = 0}, -- Skin like Steel
		},
		[39] = {
			{ID = 3564, Cost = 13211, Expansion = 4}, -- Burning Arrow
			{ID = 3601, Cost = 4837, Expansion = 4}, -- Harmony of Nature
		},
		[40] = {
			{ID = 3687, Cost = 15964, Expansion = 4}, -- Swarm of Pain
		},
		[41] = {
			{ID = 4054, Cost = 5901, Expansion = 0}, -- Spirit of the Shrew
		},
		[42] = {
			{ID = 518, Cost = 7446, Expansion = 2}, -- Spikecoat
		},
		[43] = {
			{ID = 129, Cost = 2249, Expansion = 0}, -- Shield of Brambles
		},
		[44] = {
			{ID = 78, Cost = 1699, Expansion = 0}, -- Immolate
		},
		[45] = {
			{ID = 76, Cost = 937, Expansion = 0}, -- Ensnaring Roots
		},
		[46] = {
			{ID = 60, Cost = 779, Expansion = 0}, -- Resist Fire
		},
		[47] = {
			{ID = 34, Cost = 548, Expansion = 0}, -- Superior Camouflage
		},
		[48] = {
			{ID = 2595, Cost = 26603, Expansion = 3}, -- Force of Nature
			{ID = 425, Cost = 777, Expansion = 0}, -- Wolf Form
		},
		[49] = {
			{ID = 691, Cost = 22512, Expansion = 99}, -- Call of Flame
			{ID = 4055, Cost = 36826, Expansion = 0}, -- Pack Shrew
		},
		[50] = {
			{ID = 1462, Cost = 28865, Expansion = 99}, -- Call of Earth
			{ID = 1741, Cost = 26722, Expansion = 4}, -- Jolt
		},
		[51] = {
			{ID = 512, Cost = 1959, Expansion = 1}, -- Ensnare
			{ID = 4585, Cost = 3332, Expansion = 0}, -- Resistant Discipline
			{ID = 1397, Cost = 31380, Expansion = 4}, -- Strength of Nature
		},
		[52] = {
			{ID = 2596, Cost = 36232, Expansion = 4}, -- Falcon Eye
			{ID = 57, Cost = 8223, Expansion = 1}, -- Firestrike
			{ID = 3688, Cost = 42749, Expansion = 99}, -- Icewind
		},
		[53] = {
			{ID = 430, Cost = 14596, Expansion = 1}, -- Storm Strength
		},
		[54] = {
			{ID = 259, Cost = 4226, Expansion = 1}, -- Drones of Doom
			{ID = 4587, Cost = 10043, Expansion = 0}, -- Fearless Discipline
			{ID = 2597, Cost = 42990, Expansion = 4}, -- Jolting Blades
			{ID = 422, Cost = 6579, Expansion = 1}, -- Skin like Diamond
		},
		[55] = {
			{ID = 1463, Cost = 42187, Expansion = 99}, -- Call of Fire
			{ID = 145, Cost = 9068, Expansion = 0}, -- Chloroplast
			{ID = 1296, Cost = 42406, Expansion = 0}, -- Cinder Jolt
			{ID = 4111, Cost = 56711, Expansion = 0}, -- Fire Swarm
			{ID = 61, Cost = 1483, Expansion = 0}, -- Resist Cold
			{ID = 4506, Cost = 39825, Expansion = 4}, -- Trueshot Discipline
		},
		[56] = {
			{ID = 539, Cost = 8202, Expansion = 0}, -- Chill Sight
			{ID = 426, Cost = 3353, Expansion = 0}, -- Greater Wolf Form
			{ID = 2598, Cost = 49218, Expansion = 4}, -- Mark of the Predator
		},
		[57] = {
			{ID = 15, Cost = 783, Expansion = 0}, -- Greater Healing
		},
		[58] = {
			{ID = 4059, Cost = 69957, Expansion = 0}, -- Call of Ice
			{ID = 2599, Cost = 56128, Expansion = 4}, -- Eagle Eye
			{ID = 49, Cost = 4197, Expansion = 0}, -- Nullify Magic
			{ID = 432, Cost = 7331, Expansion = 1}, -- Shield of Spikes
		},
		[59] = {
			{ID = 1740, Cost = 14658, Expansion = 1}, -- Dustdevil
			{ID = 423, Cost = 17634, Expansion = 0}, -- Skin like Nature
		},
		[60] = {
			{ID = 1464, Cost = 60446, Expansion = 99}, -- Call of the Predator
			{ID = 490, Cost = 6677, Expansion = 1}, -- Enveloping Roots
			{ID = 519, Cost = 18889, Expansion = 0}, -- Thorncoat
			{ID = 2600, Cost = 66665, Expansion = 4}, -- Warder's Protection
			{ID = 4519, Cost = 56806, Expansion = 4}, -- Weapon Shield Discipline
		},
		[61] = {
			{ID = 1526, Cost = 33468, Expansion = 1}, -- Annul Magic
			{ID = 1551, Cost = 29026, Expansion = 4}, -- Circle of Winter
			{ID = 96, Cost = 1087, Expansion = 0}, -- Counteract Disease
			{ID = 95, Cost = 1100, Expansion = 0}, -- Counteract Poison
			{ID = 6732, Cost = 0, Expansion = 0}, -- Earthen Embrace
			{ID = 1529, Cost = 39222, Expansion = 1}, -- Exile Summoned
		},
		[62] = {
			{ID = 3419, Cost = 74833, Expansion = 99}, -- Call of the Rathe
			{ID = 1290, Cost = 42273, Expansion = 0}, -- Chloroblast
			{ID = 665, Cost = 10074, Expansion = 2}, -- Drifting Death
			{ID = 356, Cost = 19047, Expansion = 0}, -- Shield of Thorns
			{ID = 3487, Cost = 75618, Expansion = 99}, -- Strength of Tunare
		},
		[63] = {
			{ID = 1558, Cost = 42380, Expansion = 4}, -- Bladecoat
			{ID = 1552, Cost = 31580, Expansion = 4}, -- Circle of Summer
			{ID = 3192, Cost = 70081, Expansion = 4}, -- Earthen Roots
			{ID = 3418, Cost = 79856, Expansion = 99}, -- Frozen Wind
		},
		[64] = {
			{ID = 3431, Cost = 85181, Expansion = 99}, -- Brushfire
			{ID = 4107, Cost = 106890, Expansion = 0}, -- Feral Form
			{ID = 3415, Cost = 86399, Expansion = 99}, -- Nature's Rebuke
			{ID = 1568, Cost = 31130, Expansion = 0}, -- Regrowth
			{ID = 3417, Cost = 86401, Expansion = 99}, -- Spirit of the Predator
		},
		[65] = {
			{ID = 3420, Cost = 98384, Expansion = 99}, -- Cry of Thunder
			{ID = 2887, Cost = 67832, Expansion = 4}, -- Mask of the Stalker
			{ID = 1559, Cost = 46049, Expansion = 4}, -- Natureskin
			{ID = 3039, Cost = 98764, Expansion = 99}, -- Protection of the Wild
			{ID = 2517, Cost = 42576, Expansion = 4}, -- Spirit of Eagle
			{ID = 4897, Cost = 117514, Expansion = 99}, -- Sylvan Burn
			{ID = 4898, Cost = 117550, Expansion = 99}, -- Sylvan Call
			{ID = 4896, Cost = 116802, Expansion = 99}, -- Sylvan Light
		},
		[66] = {
			{ID = 5301, Cost = 131712, Expansion = 99}, -- Displace Summoned
			{ID = 5300, Cost = 131034, Expansion = 99}, -- Nature Veil
			{ID = 5302, Cost = 131819, Expansion = 99}, -- Shield of Briar
		},
		[67] = {
			{ID = 5305, Cost = 137830, Expansion = 99}, -- Guard of the Earth
			{ID = 5303, Cost = 140794, Expansion = 99}, -- Locust Swarm
			{ID = 5306, Cost = 141151, Expansion = 99}, -- Strength of the Hunter
			{ID = 5304, Cost = 138489, Expansion = 99}, -- Sylvan Water
		},
		[68] = {
			{ID = 5307, Cost = 149548, Expansion = 99}, -- Briarcoat
			{ID = 5309, Cost = 146381, Expansion = 99}, -- Frost Wind
			{ID = 8020, Cost = 164191, Expansion = 99}, -- Hail of Arrows
			{ID = 5310, Cost = 149931, Expansion = 99}, -- Hunter's Vigor
			{ID = 5316, Cost = 146414, Expansion = 99}, -- Tranquility of the Glade
		},
		[69] = {
			{ID = 6664, Cost = 170509, Expansion = 99}, -- Earthen Shackles
			{ID = 5313, Cost = 158585, Expansion = 99}, -- Hearth Embers
			{ID = 5312, Cost = 159057, Expansion = 99}, -- Howl of the Predator
			{ID = 5314, Cost = 156304, Expansion = 99}, -- Nature's Balance
			{ID = 5311, Cost = 155571, Expansion = 99}, -- Nature's Denial
			{ID = 8019, Cost = 173877, Expansion = 99}, -- Warder's Wrath
		},
		[70] = {
			{ID = 5318, Cost = 165949, Expansion = 99}, -- Call of Lightning
			{ID = 8491, Cost = 198431, Expansion = 99}, -- Elddar's Grasp
			{ID = 5315, Cost = 167169, Expansion = 99}, -- Onyx Skin
			{ID = 8490, Cost = 199002, Expansion = 99}, -- Scorched Earth
			{ID = 5317, Cost = 166619, Expansion = 99}, -- Ward of the Hunter
		},
		[71] = {
			{ID = 10089, Cost = 221701, Expansion = 99}, -- Cloud of Wasps
			{ID = 10110, Cost = 222095, Expansion = 4}, -- Drifting Fog
			{ID = 11845, Cost = 233411, Expansion = 4}, -- Nature's Entropy
			{ID = 11846, Cost = 10000, Expansion = 99}, -- Nature's Entropy Rk. II
			{ID = 11847, Cost = 10000, Expansion = 99}, -- Nature's Entropy Rk. III
			{ID = 10080, Cost = 218954, Expansion = 99}, -- Shield of Needles
			{ID = 10092, Cost = 221023, Expansion = 99}, -- Sunderock Springwater
		},
		[72] = {
			{ID = 10104, Cost = 234602, Expansion = 99}, -- Icefall Chill
			{ID = 10098, Cost = 233445, Expansion = 99}, -- Strength of the Forest Stalker
		},
		[73] = {
			{ID = 10077, Cost = 248488, Expansion = 99}, -- Potameid Salve
			{ID = 10113, Cost = 244680, Expansion = 99}, -- Snarl of the Predator
			{ID = 9917, Cost = 231958, Expansion = 4}, -- Vinelash Cascade
			{ID = 9918, Cost = 100000, Expansion = 13}, -- Vinelash Cascade Rk. II
			{ID = 9919, Cost = 100000, Expansion = 13}, -- Vinelash Cascade Rk. III
			{ID = 10116, Cost = 244502, Expansion = 99}, -- Volcanic Ash
		},
		[74] = {
			{ID = 10140, Cost = 257175, Expansion = 99}, -- Eyes of the Owl
			{ID = 10128, Cost = 255741, Expansion = 99}, -- Obsidian Skin
			{ID = 10122, Cost = 262762, Expansion = 99}, -- Summer's Dew
		},
		[75] = {
			{ID = 10146, Cost = 277146, Expansion = 99}, -- Consumed by the Hunt
			{ID = 10119, Cost = 276131, Expansion = 99}, -- Heartshot
			{ID = 10131, Cost = 269568, Expansion = 99}, -- Protection of the Minohten
			{ID = 10134, Cost = 276026, Expansion = 4}, -- Thundering Blades
			{ID = 10135, Cost = 100000, Expansion = 99}, -- Thundering Blades Rk. II
			{ID = 10136, Cost = 100000, Expansion = 99}, -- Thundering Blades Rk. III
		},
		[76] = {
			{ID = 15026, Cost = 319245, Expansion = 4}, -- Dragonscale Aquifer
			{ID = 15035, Cost = 320968, Expansion = 4}, -- Drifting Haze
			{ID = 21399, Cost = 331420, Expansion = 4}, -- Eradicate Disease
			{ID = 21398, Cost = 299595, Expansion = 4}, -- Eradicate Poison
			{ID = 15023, Cost = 321689, Expansion = 4}, -- Horde of Hornets
			{ID = 15017, Cost = 321328, Expansion = 4}, -- Shield of Spurs
			{ID = 15079, Cost = 317170, Expansion = 4}, -- Skylight Sagacity
		},
		[77] = {
			{ID = 15076, Cost = 338106, Expansion = 4}, -- Cloak of Scales
			{ID = 15021, Cost = 697782, Expansion = 99}, -- Jolting Snapkicks Rk. II
			{ID = 15022, Cost = 3510840, Expansion = 99}, -- Jolting Snapkicks Rk. III
			{ID = 15085, Cost = 335624, Expansion = 4}, -- Jolting Strikes
			{ID = 15032, Cost = 340693, Expansion = 4}, -- Rimefall Bite
			{ID = 15029, Cost = 338192, Expansion = 4}, -- Strength of the Gladewalker
		},
		[78] = {
			{ID = 15082, Cost = 351461, Expansion = 99}, -- Deadfall
			{ID = 15083, Cost = 771910, Expansion = 99}, -- Deadfall Rk. II
			{ID = 15041, Cost = 349915, Expansion = 4}, -- Galvanic Ash
			{ID = 15038, Cost = 350370, Expansion = 4}, -- Gnarl of the Predator
			{ID = 15014, Cost = 355642, Expansion = 4}, -- Potameid Balm
		},
		[79] = {
			{ID = 15094, Cost = 372993, Expansion = 99}, -- Arc of Arrows
			{ID = 15095, Cost = 696726, Expansion = 99}, -- Arc of Arrows Rk. II
			{ID = 15096, Cost = 4493770, Expansion = 99}, -- Arc of Arrows Rk. III
			{ID = 15068, Cost = 376193, Expansion = 4}, -- Eyes of the Peregrine
			{ID = 15056, Cost = 370839, Expansion = 4}, -- Ravenscale
			{ID = 15047, Cost = 368100, Expansion = 99}, -- Summer's Viridity
		},
		[80] = {
			{ID = 15092, Cost = 725752, Expansion = 99}, -- Aimshot Discipline Rk. II
			{ID = 15093, Cost = 3913740, Expansion = 99}, -- Aimshot Discipline Rk. III
			{ID = 15062, Cost = 386013, Expansion = 4}, -- Deafening Blades
			{ID = 15044, Cost = 386828, Expansion = 4}, -- Heartsting
			{ID = 15059, Cost = 385740, Expansion = 4}, -- Protection of the Kirkoten
		},
		[81] = {
			{ID = 19155, Cost = 431529, Expansion = 99}, -- Beetle Swarm
			{ID = 18540, Cost = 431288, Expansion = 99}, -- Carve Whistle
			{ID = 19167, Cost = 425419, Expansion = 99}, -- Drifting Mist
			{ID = 19158, Cost = 429988, Expansion = 99}, -- Oceangreen Aquifer
			{ID = 19149, Cost = 428434, Expansion = 99}, -- Shield of Dryspines
		},
		[82] = {
			{ID = 19208, Cost = 449403, Expansion = 15}, -- Cloak of Feathers
			{ID = 19218, Cost = 792804, Expansion = 99}, -- Jolting Swings Rk. II
			{ID = 19161, Cost = 455137, Expansion = 15}, -- Strength of the Tracker
			{ID = 19164, Cost = 450681, Expansion = 15}, -- Windwhip Bite
		},
		[83] = {
			{ID = 19146, Cost = 479858, Expansion = 99}, -- Burynai Balm
			{ID = 19173, Cost = 476278, Expansion = 99}, -- Cataclysm Ash
			{ID = 19214, Cost = 481366, Expansion = 99}, -- Heartpierce
			{ID = 19238, Cost = 470376, Expansion = 99}, -- Spinecoat
			{ID = 19170, Cost = 468258, Expansion = 99}, -- Yowl of the Predator
		},
		[84] = {
			{ID = 19226, Cost = 494845, Expansion = 99}, -- Barrage of Arrows
			{ID = 19200, Cost = 495159, Expansion = 99}, -- Eyes of the Nocturnal
			{ID = 19188, Cost = 491805, Expansion = 99}, -- Mottlescale
		},
		[85] = {
			{ID = 19194, Cost = 526866, Expansion = 99}, -- Crackling Blades
			{ID = 19235, Cost = 523769, Expansion = 99}, -- Enraging Shot
			{ID = 21683, Cost = 515863, Expansion = 14}, -- Flusterbolt
			{ID = 19176, Cost = 519459, Expansion = 99}, -- Heartshear
			{ID = 19191, Cost = 520332, Expansion = 99}, -- Protection of the Paw
		},
		[86] = {
			{ID = 25417, Cost = 604568, Expansion = 99}, -- Drifting Cloud
			{ID = 25420, Cost = 592621, Expansion = 99}, -- Purefont
			{ID = 25000, Cost = 605412, Expansion = 17}, -- Respite
			{ID = 25423, Cost = 605358, Expansion = 99}, -- Scarab Swarm
			{ID = 25426, Cost = 606096, Expansion = 99}, -- Shield of Nettlespikes
		},
		[87] = {
			{ID = 25444, Cost = 630567, Expansion = 99}, -- Biting Wind
			{ID = 25429, Cost = 624071, Expansion = 99}, -- Cloak of Quills
			{ID = 25441, Cost = 627779, Expansion = 99}, -- Strength of the Thicket Stalker
		},
		[88] = {
			{ID = 25459, Cost = 660792, Expansion = 99}, -- Burning Ash
			{ID = 25462, Cost = 659798, Expansion = 99}, -- Heartrend
			{ID = 25456, Cost = 661420, Expansion = 99}, -- Lucid Balm
			{ID = 25471, Cost = 659066, Expansion = 99}, -- Quillcoat
			{ID = 25468, Cost = 664642, Expansion = 99}, -- Roar of the Predator
			{ID = 25474, Cost = 652189, Expansion = 99}, -- Stalker's Vigor
		},
		[89] = {
			{ID = 25486, Cost = 692369, Expansion = 99}, -- Eyes of the Wolf
			{ID = 25492, Cost = 691783, Expansion = 17}, -- Mottlecoat
		},
		[90] = {
			{ID = 25513, Cost = 709899, Expansion = 99}, -- Crackling Edges
			{ID = 25540, Cost = 724639, Expansion = 99}, -- Focused Tempest of Arrows
			{ID = 25519, Cost = 713776, Expansion = 99}, -- Heartslice
			{ID = 25528, Cost = 720745, Expansion = 99}, -- Infuriating Shot
			{ID = 25531, Cost = 712410, Expansion = 99}, -- Invigorated by the Hunt
			{ID = 25537, Cost = 713146, Expansion = 99}, -- Tempest of Arrows
		},
		[91] = {
			{ID = 28479, Cost = 1181804, Expansion = 99}, -- Drifting Veil
			{ID = 28482, Cost = 1185480, Expansion = 99}, -- Grasping Nettlecoat
			{ID = 28494, Cost = 1181386, Expansion = 99}, -- Purespring
			{ID = 28500, Cost = 1181923, Expansion = 99}, -- Shield of Bramblespikes
			{ID = 28488, Cost = 1184757, Expansion = 99}, -- Veil of Alaris
			{ID = 28497, Cost = 1181480, Expansion = 99}, -- Vespid Swarm
		},
		[92] = {
			{ID = 28503, Cost = 1195313, Expansion = 99}, -- Cloak of Burrs
			{ID = 28521, Cost = 1195151, Expansion = 99}, -- Rime-laced Wind
			{ID = 28518, Cost = 1194005, Expansion = 99}, -- Strength of the Gladetender
		},
		[93] = {
			{ID = 28536, Cost = 1211182, Expansion = 99}, -- Beastwood Ash
			{ID = 28548, Cost = 1207175, Expansion = 99}, -- Burrcoat
			{ID = 28545, Cost = 1209096, Expansion = 99}, -- Cry of the Predator
			{ID = 28551, Cost = 1211161, Expansion = 99}, -- Gladewalker's Vigor
			{ID = 28539, Cost = 1210091, Expansion = 99}, -- Heartrip
		},
	},
	[Class.SHADOWKNIGHT] = {
		[1] = {
			{ID = 5012, Cost = 20, Expansion = 4}, -- Spike of Disease
		},
		[2] = {
			{ID = 221, Cost = 20, Expansion = 0}, -- Sense the Dead
			{ID = 42640, Cost = 20, Expansion = 0}, -- Dire Slander lvl 2
			{ID = 221, Cost = 20, Expansion = 0}, -- Sense the Dead lvl 2
		},
		[3] = {
			{ID = 342, Cost = 20, Expansion = 0}, -- Locate Corpse
		},
		[4] = {
			{ID = 235, Cost = 20, Expansion = 0}, -- Invisibility versus Undead
		},
		[5] = {
			{ID = 340, Cost = 20, Expansion = 0}, -- Disease Cloud
			{ID = 42641, Cost = 151, Expansion = 0}, -- Dire Condemnation lvl 5
		},
		[6] = {
			{ID = 343, Cost = 20, Expansion = 0}, -- Siphon Strength
		},
		[7] = {
			{ID = 491, Cost = 24, Expansion = 0}, -- Leering Corpse
		},
		[8] = {
			{ID = 341, Cost = 20, Expansion = 0}, -- Lifetap
		},
		[9] = {
			{ID = 2571, Cost = 151, Expansion = 0}, -- Despair
			{ID = 347, Cost = 20, Expansion = 0}, -- Numb the Dead
		},
		[10] = {
			{ID = 225, Cost = 20, Expansion = 0}, -- Endure Cold
			{ID = 42642, Cost = 150, Expansion = 0}, -- Dire Verdict lvl 10
		},
		[11] = {
			{ID = 344, Cost = 24, Expansion = 0}, -- Clinging Darkness
			{ID = 2213, Cost = 154, Expansion = 0}, -- Lesser Summon Corpse lvl 12
		},
		[12] = {
			{ID = 229, Cost = 20, Expansion = 0}, -- Fear
			{ID = 2213, Cost = 154, Expansion = 0}, -- Lesser Summon Corpse
		},
		[13] = {
			{ID = 354, Cost = 28, Expansion = 0}, -- Shadow Step
		},
		[14] = {
			{ID = 351, Cost = 55, Expansion = 0}, -- Bone Walk
		},
		[15] = {
			{ID = 502, Cost = 22, Expansion = 0}, -- Lifespike
			{ID = 2572, Cost = 541, Expansion = 3}, -- Scream of Hate
			{ID = 42643, Cost = 367, Expansion = 0}, -- Dire Proclamation lvl 15
		},
		[16] = {
			{ID = 346, Cost = 22, Expansion = 0}, -- Grim Aura
		},
		[17] = {
			{ID = 352, Cost = 28, Expansion = 0}, -- Deadeye
		},
		[18] = {
			{ID = 218, Cost = 24, Expansion = 0}, -- Ward Undead
		},
		[19] = {
			{ID = 213, Cost = 20, Expansion = 0}, -- Cure Disease
			{ID = 3583, Cost = 373, Expansion = 0}, -- Tiny Companion
		},
		[20] = {
			{ID = 355, Cost = 118, Expansion = 0}, -- Engulfing Darkness
			{ID = 209, Cost = 20, Expansion = 0}, -- Spook the Dead
			{ID = 42644, Cost = 1260, Expansion = 0}, -- Dire Malediction lvl 20
		},
		[21] = {
			{ID = 357, Cost = 34, Expansion = 0}, -- Dark Empathy
		},
		[22] = {
			{ID = 362, Cost = 152, Expansion = 0}, -- Convoke Shadow
			{ID = 359, Cost = 43, Expansion = 0}, -- Vampiric Embrace
		},
		[23] = {
			{ID = 2573, Cost = 1968, Expansion = 3}, -- Scream of Pain
		},
		[24] = {
			{ID = 366, Cost = 369, Expansion = 0}, -- Feign Death
		},
		[25] = {
			{ID = 42645, Cost = 2247, Expansion = 0}, -- Dire Pronouncement lvl 25
		},
 		[26] = {
			{ID = 226, Cost = 55, Expansion = 0}, -- Endure Disease
		},
		[27] = {
			{ID = 363, Cost = 72, Expansion = 0}, -- Wave of Enfeeblement
		},
		[28] = {
			{ID = 360, Cost = 92, Expansion = 0}, -- Heat Blood
		},
		[29] = {
			{ID = 445, Cost = 154, Expansion = 0}, -- Lifedraw
			{ID = 1289, Cost = 5342, Expansion = 0}, -- Strengthen Death
		},
		[30] = {
			{ID = 522, Cost = 43, Expansion = 0}, -- Gather Shadows
			{ID = 492, Cost = 373, Expansion = 0}, -- Restless Bones
			{ID = 42646, Cost = 5342, Expansion = 0}, -- Dire Inquisition lvl 30
		},
		[31] = {
			{ID = 236, Cost = 192, Expansion = 0}, -- Shieldskin
		},
		[32] = {
			{ID = 4062, Cost = 8236, Expansion = 0}, -- Dark Temptation
		},
		[33] = {
			{ID = 1221, Cost = 6023, Expansion = 3}, -- Terror of Darkness
		},
		[34] = {
			{ID = 3561, Cost = 8220, Expansion = 4}, -- Spear of Disease
		},
		[35] = {
			{ID = 61, Cost = 1483, Expansion = 0}, -- Resist Cold
			{ID = 1457, Cost = 7365, Expansion = 2}, -- Shroud of Hate
			{ID = 3, Cost = 6013, Expansion = 4}, -- Summon Corpse
			{ID = 42647, Cost = 10000, Expansion = 0}, -- Dire Persecution lvl 35
		},
		[36] = {
			{ID = 48, Cost = 43, Expansion = 0}, -- Cancel Magic
			{ID = 367, Cost = 192, Expansion = 0}, -- Heart Flutter
		},
		[37] = {
			{ID = 2574, Cost = 9942, Expansion = 3}, -- Scream of Death
			{ID = 370, Cost = 650, Expansion = 0}, -- Shadow Vortex
		},
		[38] = {
			{ID = 440, Cost = 776, Expansion = 0}, -- Animate Dead
		},
		[39] = {
			{ID = 233, Cost = 195, Expansion = 0}, -- Expulse Undead
			{ID = 1225, Cost = 11127, Expansion = 4}, -- Voice of Darkness
		},
		[40] = {
			{ID = 90, Cost = 1081, Expansion = 0}, -- Shadow Sight
			{ID = 42648, Cost = 17683, Expansion = 0}, -- Dire Decree lvl 40
		},
		[41] = {
			{ID = 3686, Cost = 17683, Expansion = 99}, -- Blood of Pain
		},
		[42] = {
			{ID = 1222, Cost = 14797, Expansion = 3}, -- Terror of Shadows
		},
		[43] = {
			{ID = 127, Cost = 3334, Expansion = 0}, -- Invoke Fear
		},
		[44] = {
			{ID = 452, Cost = 2258, Expansion = 0}, -- Dooming Darkness
		},
		[45] = {
			{ID = 478, Cost = 927, Expansion = 0}, -- Breath of the Dead
			{ID = 414, Cost = 1976, Expansion = 0}, -- Word of Spirit
			{ID = 42649, Cost = 20000, Expansion = 0}, -- Dire Conviction lvl 45
		},
		[46] = {
			{ID = 441, Cost = 2928, Expansion = 0}, -- Summon Dead
			{ID = 1226, Cost = 21035, Expansion = 4}, -- Voice of Shadows
		},
		[47] = {
			{ID = 692, Cost = 18933, Expansion = 99}, -- Life Leech
			{ID = 4102, Cost = 31608, Expansion = 0}, -- Scythe of Darkness
		},
		[48] = {
			{ID = 3560, Cost = 28777, Expansion = 4}, -- Spear of Pain
		},
		[49] = {
			{ID = 117, Cost = 1276, Expansion = 0}, -- Dismiss Undead
		},
		[50] = {
			{ID = 199, Cost = 780, Expansion = 4}, -- Harmshield
			{ID = 1458, Cost = 28872, Expansion = 99}, -- Shroud of Pain
			{ID = 42650, Cost = 25000, Expansion = 0}, -- Dire Betrayal lvl 50
		},
		[51] = {
			{ID = 4585, Cost = 3332, Expansion = 0}, -- Resistant Discipline
			{ID = 446, Cost = 783, Expansion = 0}, -- Siphon Life
		},
		[52] = {
			{ID = 2575, Cost = 36595, Expansion = 4}, -- Abduction of Strength
			{ID = 3685, Cost = 43029, Expansion = 4}, -- Comatose
			{ID = 442, Cost = 8973, Expansion = 4}, -- Malignant Dead
			{ID = 2576, Cost = 36154, Expansion = 4}, -- Mental Corruption
			{ID = 448, Cost = 1256, Expansion = 0}, -- Rest the Dead
			{ID = 1285, Cost = 3719, Expansion = 4}, -- Summon Companion
		},
		[53] = {
			{ID = 451, Cost = 2595, Expansion = 0}, -- Boil Blood
			{ID = 1223, Cost = 36136, Expansion = 3}, -- Terror of Death
		},
		[54] = {
			{ID = 364, Cost = 299, Expansion = 4}, -- Banshee Aura
			{ID = 4063, Cost = 52720, Expansion = 4}, -- Call of Darkness
			{ID = 4587, Cost = 10043, Expansion = 0}, -- Fearless Discipline
			{ID = 59, Cost = 1695, Expansion = 0}, -- Panic the Dead
			{ID = 4103, Cost = 52912, Expansion = 0}, -- Scythe of Death
			{ID = 3562, Cost = 45931, Expansion = 4}, -- Spear of Plague
			{ID = 2577, Cost = 42380, Expansion = 4}, -- Torrent of Hate
		},
		[55] = {
			{ID = 1742, Cost = 39341, Expansion = 4}, -- Bobbing Corpse
			{ID = 662, Cost = 4737, Expansion = 0}, -- Expel Undead
			{ID = 1459, Cost = 42574, Expansion = 99}, -- Shroud of Death
			{ID = 1376, Cost = 39920, Expansion = 99}, -- Shroud of Undeath
			{ID = 524, Cost = 1950, Expansion = 0}, -- Spirit Tap
			{ID = 4520, Cost = 39239, Expansion = 4}, -- Unholy Aura Discipline
			{ID = 1227, Cost = 42998, Expansion = 4}, -- Voice of Death
			{ID = 42651, Cost = 42000, Expansion = 0}, -- Dire Reproach lvl 55
		},
		[56] = {
			{ID = 7005, Cost = 11000, Expansion = 0}, -- Ichor Guard
			{ID = 6995, Cost = 11000, Expansion = 0}, -- Soulless Fear
			{ID = 393, Cost = 3377, Expansion = 0}, -- Steelskin
			{ID = 2578, Cost = 49140, Expansion = 4}, -- Torrent of Pain
		},
		[57] = {
			{ID = 1773, Cost = 45179, Expansion = 4}, -- Conjure Corpse
			{ID = 525, Cost = 9173, Expansion = 0}, -- Drain Spirit
			{ID = 6986, Cost = 11000, Expansion = 0}, -- Shadow Voice
			{ID = 454, Cost = 2957, Expansion = 4}, -- Vampiric Curse
		},
		[58] = {
			{ID = 495, Cost = 14736, Expansion = 4}, -- Cackling Bones
			{ID = 2892, Cost = 56363, Expansion = 99}, -- Deathly Temptation
			{ID = 49, Cost = 4197, Expansion = 0}, -- Nullify Magic
			{ID = 2579, Cost = 56226, Expansion = 4}, -- Torrent of Fatigue
		},
		[59] = {
			{ID = 453, Cost = 19012, Expansion = 0}, -- Cascading Darkness
			{ID = 4590, Cost = 125504, Expansion = 4}, -- Deflection Discipline
			{ID = 394, Cost = 10162, Expansion = 0}, -- Diamondskin
			{ID = 1224, Cost = 57335, Expansion = 99}, -- Terror of Terris
		},
		[60] = {
			{ID = 1508, Cost = 10924, Expansion = 0}, -- Asystole
			{ID = 661, Cost = 5898, Expansion = 0}, -- Augment Death
			{ID = 2580, Cost = 66546, Expansion = 4}, -- Cloak of the Akheva
			{ID = 1460, Cost = 60938, Expansion = 4}, -- Death Peace
			{ID = 447, Cost = 20881, Expansion = 0}, -- Drain Soul
			{ID = 4504, Cost = 56818, Expansion = 4}, -- Leechcurse Discipline
			{ID = 1228, Cost = 59914, Expansion = 9}, -- Voice of Terris
			{ID = 42652, Cost = 59000, Expansion = 0}, -- Dire Sentence lvl 60
		},
		[61] = {
			{ID = 3406, Cost = 71320, Expansion = 99}, -- Aura of Darkness
			{ID = 3400, Cost = 70245, Expansion = 99}, -- Festering Darkness
			{ID = 6, Cost = 18944, Expansion = 0}, -- Ignite Blood
			{ID = 1411, Cost = 24723, Expansion = 4}, -- Improved Invisibility to Undead
			{ID = 6741, Cost = 0, Expansion = 0}, -- Soul Guard
			{ID = 6996, Cost = 11000, Expansion = 0}, -- Soulless Panic
		},
		[62] = {
			{ID = 456, Cost = 22655, Expansion = 4}, -- Bond of Death
			{ID = 3428, Cost = 74791, Expansion = 4}, -- Deny Undead
			{ID = 6987, Cost = 11000, Expansion = 0}, -- Shadow Bellow
			{ID = 3401, Cost = 76733, Expansion = 99}, -- Touch of Volatis
			{ID = 3408, Cost = 76219, Expansion = 99}, -- Zevfeer's Bite
		},
		[63] = {
			{ID = 3403, Cost = 80003, Expansion = 99}, -- Aura of Pain
			{ID = 3489, Cost = 81874, Expansion = 99}, -- Blood of Hate
			{ID = 3227, Cost = 80159, Expansion = 99}, -- Shroud of Chaos
			{ID = 3405, Cost = 81297, Expansion = 99}, -- Terror of Thule
		},
		[64] = {
			{ID = 1414, Cost = 42835, Expansion = 4}, -- Augmentation of Death
			{ID = 443, Cost = 20905, Expansion = 4}, -- Invoke Death
			{ID = 3488, Cost = 87462, Expansion = 99}, -- Pact of Hate
			{ID = 4101, Cost = 105628, Expansion = 0}, -- Scythe of Innoruuk
			{ID = 3491, Cost = 86222, Expansion = 99}, -- Spear of Decay
		},
		[65] = {
			{ID = 3411, Cost = 99730, Expansion = 99}, -- Aura of Hate
			{ID = 4903, Cost = 115110, Expansion = 99}, -- Black Shroud
			{ID = 3490, Cost = 98361, Expansion = 99}, -- Cloak of Luclin
			{ID = 4902, Cost = 117467, Expansion = 99}, -- Mental Horror
			{ID = 4904, Cost = 115765, Expansion = 99}, -- Miasmic Spear
			{ID = 3413, Cost = 99739, Expansion = 99}, -- Touch of Innoruuk
			{ID = 3410, Cost = 99941, Expansion = 99}, -- Voice of Thule
			{ID = 42653, Cost = 99000, Expansion = 0}, -- Dire Subjugation lvl 65
		},
		[66] = {
			{ID = 5320, Cost = 130232, Expansion = 99}, -- Blood of Discord
			{ID = 5323, Cost = 132077, Expansion = 99}, -- Bond of Inruku
			{ID = 5322, Cost = 132425, Expansion = 99}, -- Dark Constriction
			{ID = 6997, Cost = 130755, Expansion = 99}, -- Soulless Terror
		},
		[67] = {
			{ID = 5325, Cost = 138814, Expansion = 99}, -- Inruku's Bite
			{ID = 6988, Cost = 139156, Expansion = 99}, -- Shadow Howl
			{ID = 5327, Cost = 138159, Expansion = 99}, -- Shroud of Discord
			{ID = 5329, Cost = 139239, Expansion = 99}, -- Terror of Discord
			{ID = 5324, Cost = 139045, Expansion = 99}, -- Touch of Inruku
		},
		[68] = {
			{ID = 5330, Cost = 149763, Expansion = 99}, -- Blood of Inruku
			{ID = 8022, Cost = 165252, Expansion = 99}, -- Fickle Shadows
			{ID = 5335, Cost = 147732, Expansion = 99}, -- Scythe of Inruku
			{ID = 5331, Cost = 148713, Expansion = 99}, -- Son of Decay
			{ID = 5328, Cost = 146931, Expansion = 99}, -- Theft of Pain
		},
		[69] = {
			{ID = 5336, Cost = 159248, Expansion = 99}, -- Dread Gaze
			{ID = 5333, Cost = 157506, Expansion = 99}, -- Pact of Decay
			{ID = 5332, Cost = 156152, Expansion = 99}, -- Rune of Decay
			{ID = 6673, Cost = 170472, Expansion = 99}, -- Soul Shield
			{ID = 5334, Cost = 158406, Expansion = 99}, -- Spear of Muram
			{ID = 8025, Cost = 177107, Expansion = 99}, -- Touch of Draygun
		},
		[70] = {
			{ID = 5339, Cost = 168052, Expansion = 99}, -- Cloak of Discord
			{ID = 8484, Cost = 196714, Expansion = 99}, -- Decrepit Skin
			{ID = 8483, Cost = 199475, Expansion = 99}, -- Theft of Agony
			{ID = 5337, Cost = 167783, Expansion = 99}, -- Theft of Hate
			{ID = 5338, Cost = 165726, Expansion = 99}, -- Touch of the Devourer
			{ID = 42654, Cost = 270000, Expansion = 0}, -- Dire Edict lvl 70
		},
		[71] = {
			{ID = 10245, Cost = 221016, Expansion = 4}, -- Blacktalon Bite
			{ID = 10233, Cost = 222705, Expansion = 4}, -- Bond of the Blacktalon
			{ID = 10042, Cost = 218034, Expansion = 4}, -- Exhumer's Call
			{ID = 11863, Cost = 230310, Expansion = 4}, -- Marrowthirst Horror
			{ID = 11864, Cost = 10000, Expansion = 99}, -- Marrowthirst Horror Rk. II
			{ID = 11865, Cost = 10000, Expansion = 99}, -- Marrowthirst Horror Rk. III
			{ID = 10257, Cost = 222516, Expansion = 4}, -- Terror of Vergalid
		},
		[72] = {
			{ID = 10272, Cost = 231165, Expansion = 4}, -- Blood of the Blacktalon
			{ID = 10260, Cost = 233007, Expansion = 4}, -- Challenge for Power
			{ID = 10251, Cost = 232815, Expansion = 4}, -- Shroud of the Nightborn
		},
		[73] = {
			{ID = 10282, Cost = 243355, Expansion = 4}, -- Amplify Death
			{ID = 10285, Cost = 244776, Expansion = 4}, -- Dark Bargain
			{ID = 10276, Cost = 246416, Expansion = 99}, -- Drink of Decomposition
			{ID = 10275, Cost = 245515, Expansion = 4}, -- Shambling Minion
			{ID = 11866, Cost = 262330, Expansion = 99}, -- Soul Carapace
			{ID = 11867, Cost = 10000, Expansion = 99}, -- Soul Carapace Rk. II
			{ID = 11868, Cost = 10000, Expansion = 99}, -- Soul Carapace Rk. III
		},
		[74] = {
			{ID = 10300, Cost = 260558, Expansion = 4}, -- Cloak of Corruption
			{ID = 10288, Cost = 260811, Expansion = 4}, -- Rotroot Spear
			{ID = 10291, Cost = 257369, Expansion = 4}, -- Vilify
		},
		[75] = {
			{ID = 10306, Cost = 272847, Expansion = 99}, -- Last Breath
			{ID = 10315, Cost = 271680, Expansion = 4}, -- Remorseless Demeanor
			{ID = 10327, Cost = 270992, Expansion = 4}, -- Touch of Severan
			{ID = 10227, Cost = 272930, Expansion = 4}, -- Touch of the Wailing Three
			{ID = 10228, Cost = 100000, Expansion = 99}, -- Touch of the Wailing Three Rk. II
			{ID = 10229, Cost = 100000, Expansion = 99}, -- Touch of the Wailing Three Rk. III
			{ID = 42655, Cost = 272000, Expansion = 0}, -- Dire Mandate lvl 75
		},
		[76] = {
			{ID = 15148, Cost = 323597, Expansion = 4}, -- Blackwater Bite
			{ID = 15142, Cost = 322757, Expansion = 4}, -- Bond of the Blackwater
			{ID = 14823, Cost = 320201, Expansion = 4}, -- Procure Corpse
			{ID = 15202, Cost = 320926, Expansion = 99}, -- Soulthirst Horror
			{ID = 15203, Cost = 921300, Expansion = 99}, -- Soulthirst Horror Rk. II
			{ID = 15204, Cost = 4398650, Expansion = 99}, -- Soulthirst Horror Rk. III
			{ID = 15160, Cost = 315132, Expansion = 4}, -- Terror of the Soulbleeder
		},
		[77] = {
			{ID = 15220, Cost = 334821, Expansion = 99}, -- Assiduous Impurity
			{ID = 15221, Cost = 779098, Expansion = 99}, -- Assiduous Impurity Rk. II
			{ID = 15222, Cost = 4503810, Expansion = 99}, -- Assiduous Impurity Rk. III
			{ID = 15169, Cost = 335622, Expansion = 4}, -- Blood of the Blackwater
			{ID = 15154, Cost = 336608, Expansion = 4}, -- Shroud of the Gloomborn
			{ID = 15163, Cost = 337891, Expansion = 99}, -- Trial for Power
			{ID = 15164, Cost = 919178, Expansion = 99}, -- Trial for Power Rk. II
			{ID = 15165, Cost = 4118500, Expansion = 99}, -- Trial for Power Rk. III
		},
		[78] = {
			{ID = 15175, Cost = 354101, Expansion = 4}, -- Expatiate Death
			{ID = 15178, Cost = 358582, Expansion = 4}, -- Grim Covenant
			{ID = 15172, Cost = 355045, Expansion = 4}, -- Maladroit Minion
			{ID = 15223, Cost = 350837, Expansion = 99}, -- Rigor Mortis
			{ID = 15211, Cost = 352458, Expansion = 99}, -- Umbral Carapace
		},
		[79] = {
			{ID = 15187, Cost = 369132, Expansion = 4}, -- Drape of Corruption
			{ID = 15184, Cost = 372057, Expansion = 4}, -- Revile
			{ID = 15181, Cost = 368870, Expansion = 4}, -- Rotmarrow Spear
		},
		[80] = {
			{ID = 15191, Cost = 843338, Expansion = 99}, -- Last Gasp Rk. II
			{ID = 15192, Cost = 4180720, Expansion = 99}, -- Last Gasp Rk. III
			{ID = 15199, Cost = 386839, Expansion = 4}, -- Touch of Kildrukaun
			{ID = 15136, Cost = 386585, Expansion = 4}, -- Touch of the Soulbleeder
			{ID = 15214, Cost = 388018, Expansion = 99}, -- Umbral Skin
			{ID = 15215, Cost = 879942, Expansion = 99}, -- Umbral Skin Rk. II
			{ID = 42656, Cost = 386000, Expansion = 0}, -- Dire Impeachment lvl 80
		},
		[81] = {
			{ID = 19295, Cost = 427582, Expansion = 99}, -- Bond of Laarthik
			{ID = 19301, Cost = 429438, Expansion = 99}, -- Laarthik's Bite
			{ID = 18928, Cost = 429338, Expansion = 99}, -- Reaper's Call
			{ID = 19313, Cost = 429764, Expansion = 99}, -- Terror of Jelvalak
		},
		[82] = {
			{ID = 19322, Cost = 455483, Expansion = 15}, -- Blood of Laarthik
			{ID = 19373, Cost = 456439, Expansion = 15}, -- Plague of the Karanas
			{ID = 19307, Cost = 451684, Expansion = 15}, -- Shroud of the Blightborn
		},
		[83] = {
			{ID = 19328, Cost = 480121, Expansion = 99}, -- Gift of Sathir
			{ID = 19364, Cost = 476255, Expansion = 99}, -- Malarian Carapace
			{ID = 19325, Cost = 473653, Expansion = 99}, -- Minion of Sebilis
			{ID = 19331, Cost = 470195, Expansion = 99}, -- Venril's Covenant
			{ID = 19131, Cost = 473558, Expansion = 99}, -- Withstand
		},
		[84] = {
			{ID = 19337, Cost = 502800, Expansion = 99}, -- Burst of Spite
			{ID = 19340, Cost = 501798, Expansion = 99}, -- Drape of Korafax
			{ID = 19334, Cost = 499796, Expansion = 99}, -- Malarian Spear
		},
		[85] = {
			{ID = 19382, Cost = 527736, Expansion = 99}, -- Curse of Frailty
			{ID = 19344, Cost = 925832, Expansion = 99}, -- Final Breath Rk. II
			{ID = 19289, Cost = 518448, Expansion = 99}, -- Touch of Lanys
			{ID = 19352, Cost = 522347, Expansion = 99}, -- Touch of Tharoff
		},
		[86] = {
			{ID = 25556, Cost = 605612, Expansion = 99}, -- Amygdalan Horror
			{ID = 25565, Cost = 604627, Expansion = 99}, -- Banshee Skin
			{ID = 25568, Cost = 593522, Expansion = 99}, -- Bond of Malthiasiss
			{ID = 25574, Cost = 598221, Expansion = 99}, -- Malthiasiss's Bite
			{ID = 25555, Cost = 600455, Expansion = 99}, -- Reaper's Beckon
			{ID = 25000, Cost = 605412, Expansion = 17}, -- Respite
			{ID = 25580, Cost = 608406, Expansion = 99}, -- Terror of Rerekalen
		},
		[87] = {
			{ID = 25583, Cost = 619494, Expansion = 99}, -- Blood of Malthiasiss
			{ID = 25586, Cost = 635199, Expansion = 99}, -- Confrontation for Power
			{ID = 25595, Cost = 633500, Expansion = 99}, -- Plague of Iglum
			{ID = 25598, Cost = 620158, Expansion = 99}, -- Shroud of the Plagueborne
		},
		[88] = {
			{ID = 25264, Cost = 656003, Expansion = 99}, -- Defy
			{ID = 25604, Cost = 656054, Expansion = 99}, -- Gift of Dyalgem
			{ID = 25607, Cost = 663886, Expansion = 99}, -- Gixblat's Covenant
			{ID = 25611, Cost = 655394, Expansion = 99}, -- Gorgon Carapace
			{ID = 25614, Cost = 664105, Expansion = 99}, -- Gorgon Mantle
			{ID = 25617, Cost = 655127, Expansion = 99}, -- Minion of Fear
			{ID = 25620, Cost = 663430, Expansion = 99}, -- Repulsive Sacrifice
		},
		[89] = {
			{ID = 25629, Cost = 689921, Expansion = 99}, -- Call of Dusk
			{ID = 25635, Cost = 687921, Expansion = 99}, -- Drape of Fear
			{ID = 25638, Cost = 694665, Expansion = 99}, -- Gorgon Spear
			{ID = 25659, Cost = 691778, Expansion = 99}, -- Insidious Blight
			{ID = 25641, Cost = 692990, Expansion = 99}, -- Loathing
			{ID = 25270, Cost = 681652, Expansion = 99}, -- Stubborn Stance
		},
		[90] = {
			{ID = 25644, Cost = 710571, Expansion = 99}, -- Curse of Enfeeblement
			{ID = 25647, Cost = 719425, Expansion = 99}, -- Dire Accusation
			{ID = 25650, Cost = 720189, Expansion = 99}, -- Dire Restriction
			{ID = 25653, Cost = 721057, Expansion = 99}, -- Gorgon Skin
			{ID = 25662, Cost = 719702, Expansion = 99}, -- Last Breath
			{ID = 25671, Cost = 727294, Expansion = 99}, -- Touch of Dyalgem
			{ID = 25674, Cost = 714845, Expansion = 99}, -- Touch of Iglum
		},
		[91] = {
			{ID = 28645, Cost = 1184571, Expansion = 99}, -- Bond of Korum
			{ID = 28642, Cost = 1184996, Expansion = 99}, -- Ghoul Skin
			{ID = 28651, Cost = 1183721, Expansion = 99}, -- Korum's Bite
			{ID = 28632, Cost = 1181871, Expansion = 99}, -- Reaper's Decree
			{ID = 28657, Cost = 1184617, Expansion = 99}, -- Terror of Desalin
		},
		[92] = {
			{ID = 28675, Cost = 1195569, Expansion = 99}, -- Insidious Audacity
			{ID = 28678, Cost = 1196939, Expansion = 99}, -- Plague of Piqiorn
			{ID = 28663, Cost = 1197586, Expansion = 99}, -- Provocation for Power
			{ID = 28681, Cost = 1197026, Expansion = 99}, -- Shroud of the Shadeborne
		},
		[93] = {
			{ID = 28690, Cost = 1210510, Expansion = 99}, -- Gift of Urash
			{ID = 28709, Cost = 1208023, Expansion = 99}, -- Minion of Sholoth
			{ID = 28308, Cost = 1211133, Expansion = 99}, -- Renounce
			{ID = 28697, Cost = 1206756, Expansion = 99}, -- Sholothian Carapace
			{ID = 28693, Cost = 1210056, Expansion = 99}, -- Worag's Covenant
		},
	},
	[Class.DRUID] = {
		[1] = {
			{ID = 93, Cost = 20, Expansion = 0}, -- Burst of Flame
			{ID = 237, Cost = 20, Expansion = 0}, -- Dance of the Fireflies
			{ID = 224, Cost = 20, Expansion = 0}, -- Endure Fire
			{ID = 239, Cost = 20, Expansion = 0}, -- Flame Lick
			{ID = 240, Cost = 20, Expansion = 0}, -- Lull Animal
			{ID = 200, Cost = 20, Expansion = 0}, -- Minor Healing
			{ID = 241, Cost = 20, Expansion = 0}, -- Panic Animal
			{ID = 238, Cost = 20, Expansion = 0}, -- Sense Animals
			{ID = 26, Cost = 20, Expansion = 0}, -- Skin like Wood
			{ID = 242, Cost = 20, Expansion = 0}, -- Snare
			{ID = 2591, Cost = 24, Expansion = 3}, -- Tangling Weeds
		},
		[2] = {
			{ID = 249, Cost = 20, Expansion = 0}, -- Grasping Roots
			{ID = 248, Cost = 20, Expansion = 0}, -- Ward Summoned
		},
		[3] = {
			{ID = 92, Cost = 22, Expansion = 0}, -- Burst of Fire
			{ID = 253, Cost = 22, Expansion = 0}, -- Whirling Wind
		},
		[4] = {
			{ID = 247, Cost = 24, Expansion = 0}, -- Camouflage
			{ID = 213, Cost = 20, Expansion = 0}, -- Cure Disease
			{ID = 252, Cost = 24, Expansion = 0}, -- Invoke Lightning
		},
		[5] = {
			{ID = 203, Cost = 20, Expansion = 0}, -- Cure Poison
			{ID = 36, Cost = 24, Expansion = 0}, -- Gate
			{ID = 250, Cost = 28, Expansion = 0}, -- Harmony
		},
		[6] = {
			{ID = 86, Cost = 34, Expansion = 0}, -- Enduring Breath
			{ID = 254, Cost = 34, Expansion = 0}, -- Firefist
			{ID = 258, Cost = 34, Expansion = 0}, -- Treeform
		},
		[7] = {
			{ID = 256, Cost = 43, Expansion = 0}, -- Shield of Thistles
			{ID = 268, Cost = 42, Expansion = 0}, -- Strength of Earth
			{ID = 515, Cost = 43, Expansion = 0}, -- Thistlecoat
		},
		[8] = {
			{ID = 91, Cost = 55, Expansion = 0}, -- Ignite
			{ID = 255, Cost = 55, Expansion = 0}, -- Invisibility versus Animals
			{ID = 4056, Cost = 241, Expansion = 0}, -- Remove Minor Curse
		},
		[9] = {
			{ID = 225, Cost = 20, Expansion = 0}, -- Endure Cold
			{ID = 17, Cost = 24, Expansion = 0}, -- Light Healing
			{ID = 2511, Cost = 153, Expansion = 3}, -- Protection of Wood
			{ID = 257, Cost = 72, Expansion = 0}, -- Starshine
		},
		[10] = {
			{ID = 278, Cost = 71, Expansion = 0}, -- Spirit of Wolf
			{ID = 264, Cost = 93, Expansion = 0}, -- Stinging Swarm
			{ID = 211, Cost = 20, Expansion = 0}, -- Summon Drink
		},
		[11] = {
			{ID = 234, Cost = 71, Expansion = 0}, -- Halo of Light
			{ID = 4261, Cost = 447, Expansion = 0}, -- Reebo's Lesser Augury
			{ID = 50, Cost = 20, Expansion = 0}, -- Summon Food
		},
		[12] = {
			{ID = 35, Cost = 93, Expansion = 0}, -- Bind Affinity
			{ID = 262, Cost = 154, Expansion = 0}, -- Cascade of Hail
		},
		[13] = {
			{ID = 245, Cost = 192, Expansion = 0}, -- Befriend Animal
			{ID = 663, Cost = 193, Expansion = 0}, -- Expulse Summoned
			{ID = 80, Cost = 24, Expansion = 0}, -- See Invisible
		},
		[14] = {
			{ID = 261, Cost = 92, Expansion = 0}, -- Levitate
			{ID = 4285, Cost = 782, Expansion = 0}, -- Reebo's Lesser Cleansing
			{ID = 4273, Cost = 663, Expansion = 0}, -- Reebo's Lesser Exorcism
			{ID = 263, Cost = 245, Expansion = 0}, -- Skin like Rock
		},
		[15] = {
			{ID = 513, Cost = 301, Expansion = 0}, -- Calm Animal
			{ID = 530, Cost = 298, Expansion = 4}, -- Ring of Karana
			{ID = 2021, Cost = 300, Expansion = 0}, -- Ring of Surefall Glade
			{ID = 514, Cost = 304, Expansion = 0}, -- Terrorize Animal
		},
		[16] = {
			{ID = 419, Cost = 375, Expansion = 0}, -- Careless Lightning
			{ID = 520, Cost = 371, Expansion = 3}, -- Dizzying Wind
			{ID = 532, Cost = 371, Expansion = 4}, -- Ring of Butcher
		},
		[17] = {
			{ID = 516, Cost = 450, Expansion = 0}, -- Barbcoat
			{ID = 531, Cost = 448, Expansion = 4}, -- Ring of Commons
			{ID = 533, Cost = 451, Expansion = 4}, -- Ring of Toxxulia
			{ID = 273, Cost = 449, Expansion = 3}, -- Shield of Barbs
			{ID = 3583, Cost = 373, Expansion = 0}, -- Tiny Companion
		},
		[18] = {
			{ID = 48, Cost = 43, Expansion = 0}, -- Cancel Magic
			{ID = 139, Cost = 548, Expansion = 0}, -- Feral Spirit
			{ID = 2183, Cost = 546, Expansion = 0}, -- Lesser Succor
			{ID = 2417, Cost = 913, Expansion = 4}, -- Ring of Grimling
			{ID = 34, Cost = 548, Expansion = 0}, -- Superior Camouflage
		},
		[19] = {
			{ID = 226, Cost = 55, Expansion = 0}, -- Endure Disease
			{ID = 227, Cost = 34, Expansion = 0}, -- Endure Poison
			{ID = 12, Cost = 92, Expansion = 0}, -- Healing
			{ID = 2512, Cost = 1076, Expansion = 4}, -- Protection of Rock
			{ID = 2433, Cost = 1074, Expansion = 4}, -- Ring of the Nexus
		},
		[20] = {
			{ID = 9957, Cost = 4235, Expansion = 4}, -- Circle of Blightfire Moors
			{ID = 60, Cost = 779, Expansion = 0}, -- Resist Fire
			{ID = 9958, Cost = 4289, Expansion = 4}, -- Ring of Blightfire Moors
			{ID = 535, Cost = 780, Expansion = 4}, -- Ring of Ro
			{ID = 3794, Cost = 1267, Expansion = 4}, -- Ring of Stonebrunt
			{ID = 425, Cost = 777, Expansion = 0}, -- Wolf Form
			{ID = 9956, Cost = 4235, Expansion = 4}, -- Zephyr: Blightfire Moors
		},
		[21] = {
			{ID = 76, Cost = 937, Expansion = 0}, -- Ensnaring Roots
			{ID = 4262, Cost = 2260, Expansion = 0}, -- Reebo's Augury
			{ID = 537, Cost = 918, Expansion = 4}, -- Ring of Steamfont
			{ID = 220, Cost = 926, Expansion = 0}, -- Spirit of Cheetah
			{ID = 405, Cost = 920, Expansion = 0}, -- Tremor
		},
		[22] = {
			{ID = 27, Cost = 1079, Expansion = 3}, -- Pogonip
			{ID = 536, Cost = 1084, Expansion = 4}, -- Ring of Feerrott
			{ID = 534, Cost = 1076, Expansion = 4}, -- Ring of Lavastorm
			{ID = 143, Cost = 1100, Expansion = 3}, -- Sunbeam
		},
		[23] = {
			{ID = 260, Cost = 1278, Expansion = 0}, -- Charm Animals
			{ID = 115, Cost = 1259, Expansion = 0}, -- Dismiss Summoned
			{ID = 4057, Cost = 10031, Expansion = 0}, -- Remove Lesser Curse
			{ID = 2422, Cost = 1951, Expansion = 4}, -- Ring of Twilight
		},
		[24] = {
			{ID = 99, Cost = 1466, Expansion = 3}, -- Creeping Crud
			{ID = 4286, Cost = 3342, Expansion = 0}, -- Reebo's Cleansing
			{ID = 4274, Cost = 2916, Expansion = 0}, -- Reebo's Exorcism
			{ID = 1326, Cost = 1460, Expansion = 4}, -- Ring of the Combines
			{ID = 421, Cost = 1482, Expansion = 0}, -- Skin like Steel
		},
		[25] = {
			{ID = 553, Cost = 1710, Expansion = 4}, -- Circle of Butcher
			{ID = 550, Cost = 1712, Expansion = 4}, -- Circle of Karana
			{ID = 552, Cost = 1693, Expansion = 4}, -- Circle of Toxxulia
			{ID = 78, Cost = 1699, Expansion = 0}, -- Immolate
			{ID = 3182, Cost = 2939, Expansion = 4}, -- Ring of Knowledge
			{ID = 538, Cost = 1728, Expansion = 4}, -- Ring of Misty
		},
		[26] = {
			{ID = 2020, Cost = 1999, Expansion = 0}, -- Circle of Surefall Glade
			{ID = 2432, Cost = 2912, Expansion = 4}, -- Circle of the Nexus
			{ID = 512, Cost = 1959, Expansion = 1}, -- Ensnare
			{ID = 424, Cost = 1274, Expansion = 0}, -- Scale of Wolf
			{ID = 607, Cost = 1986, Expansion = 4}, -- Succor: East
		},
		[27] = {
			{ID = 517, Cost = 2233, Expansion = 0}, -- Bramblecoat
			{ID = 551, Cost = 2238, Expansion = 4}, -- Circle of Commons
			{ID = 2513, Cost = 3327, Expansion = 4}, -- Protection of Steel
			{ID = 129, Cost = 2249, Expansion = 0}, -- Shield of Brambles
		},
		[28] = {
			{ID = 753, Cost = 2616, Expansion = 4}, -- Beguile Plants
			{ID = 3792, Cost = 3740, Expansion = 4}, -- Circle of Stonebrunt
			{ID = 217, Cost = 2556, Expansion = 1}, -- Combust
			{ID = 96, Cost = 1087, Expansion = 0}, -- Counteract Disease
			{ID = 95, Cost = 1100, Expansion = 0}, -- Counteract Poison
		},
		[29] = {
			{ID = 2419, Cost = 4228, Expansion = 4}, -- Circle of Grimling
			{ID = 15, Cost = 783, Expansion = 0}, -- Greater Healing
			{ID = 3601, Cost = 4837, Expansion = 4}, -- Harmony of Nature
			{ID = 1888, Cost = 2921, Expansion = 4}, -- Imbue Emerald
			{ID = 1800, Cost = 2972, Expansion = 3}, -- Imbue Plains Pebble
			{ID = 3998, Cost = 2944, Expansion = 4}, -- Mass Imbue Emerald
			{ID = 4004, Cost = 2907, Expansion = 4}, -- Mass Imbue Plains Pebble
			{ID = 2427, Cost = 4203, Expansion = 4}, -- Ring of Dawnshroud
		},
		[30] = {
			{ID = 554, Cost = 3375, Expansion = 4}, -- Circle of Lavastorm
			{ID = 1439, Cost = 4255, Expansion = 2}, -- Fury of Air
			{ID = 426, Cost = 3353, Expansion = 0}, -- Greater Wolf Form
			{ID = 61, Cost = 1483, Expansion = 0}, -- Resist Cold
			{ID = 4054, Cost = 5901, Expansion = 0}, -- Spirit of the Shrew
		},
		[31] = {
			{ID = 557, Cost = 3754, Expansion = 4}, -- Circle of Steamfont
			{ID = 406, Cost = 3754, Expansion = 0}, -- Earthquake
			{ID = 418, Cost = 3718, Expansion = 4}, -- Lightning Strike
			{ID = 4263, Cost = 7371, Expansion = 0}, -- Reebo's Greater Augury
			{ID = 1433, Cost = 4812, Expansion = 0}, -- Ring of Iceclad
		},
		[32] = {
			{ID = 556, Cost = 4286, Expansion = 4}, -- Circle of Feerrott
			{ID = 1434, Cost = 5273, Expansion = 0}, -- Circle of Iceclad
			{ID = 555, Cost = 4262, Expansion = 4}, -- Circle of Ro
			{ID = 259, Cost = 4226, Expansion = 1}, -- Drones of Doom
			{ID = 608, Cost = 4239, Expansion = 4}, -- Succor: Butcher
			{ID = 25898, Cost = 5913, Expansion = 99}, -- Zephyr: Nexus
			{ID = 25904, Cost = 4295, Expansion = 99}, -- Zephyr: Toxxulia
		},
		[33] = {
			{ID = 141, Cost = 4764, Expansion = 0}, -- Beguile Animals
			{ID = 1517, Cost = 4814, Expansion = 0}, -- Circle of the Combines
			{ID = 2424, Cost = 6724, Expansion = 4}, -- Circle of Twilight
			{ID = 664, Cost = 2596, Expansion = 0}, -- Expel Summoned
			{ID = 2029, Cost = 5996, Expansion = 4}, -- Ring of Great Divide
			{ID = 25698, Cost = 5995, Expansion = 99}, -- Zephyr: Iceclad
		},
		[34] = {
			{ID = 228, Cost = 373, Expansion = 0}, -- Endure Magic
			{ID = 4287, Cost = 9981, Expansion = 0}, -- Reebo's Greater Cleansing
			{ID = 4275, Cost = 9036, Expansion = 0}, -- Reebo's Greater Exorcism
			{ID = 144, Cost = 1265, Expansion = 0}, -- Regeneration
			{ID = 429, Cost = 5321, Expansion = 4}, -- Strength of Stone
			{ID = 25899, Cost = 5356, Expansion = 99}, -- Zephyr: Karana
		},
		[35] = {
			{ID = 4055, Cost = 36826, Expansion = 0}, -- Pack Shrew
			{ID = 169, Cost = 5896, Expansion = 0}, -- Pack Spirit
			{ID = 428, Cost = 5968, Expansion = 0}, -- Share Wolf Form
			{ID = 25903, Cost = 6740, Expansion = 99}, -- Zephyr: Stonebrunt
			{ID = 25900, Cost = 5927, Expansion = 99}, -- Zephyr: Surefall Glade
		},
		[36] = {
			{ID = 558, Cost = 6721, Expansion = 0}, -- Circle of Misty
			{ID = 490, Cost = 6677, Expansion = 1}, -- Enveloping Roots
			{ID = 2030, Cost = 8195, Expansion = 4}, -- Ring of Wakening Lands
			{ID = 422, Cost = 6579, Expansion = 1}, -- Skin like Diamond
			{ID = 3580, Cost = 9970, Expansion = 4}, -- Spirit of Ash
		},
		[37] = {
			{ID = 28, Cost = 7417, Expansion = 0}, -- Avalanche
			{ID = 2429, Cost = 9952, Expansion = 4}, -- Circle of Dawnshroud
			{ID = 1437, Cost = 9020, Expansion = 99}, -- Ro's Fiery Sundering
			{ID = 432, Cost = 7331, Expansion = 1}, -- Shield of Spikes
			{ID = 518, Cost = 7446, Expansion = 2}, -- Spikecoat
			{ID = 1737, Cost = 8092, Expansion = 4}, -- Wind of the South
		},
		[38] = {
			{ID = 1438, Cost = 9941, Expansion = 4}, -- Circle of Great Divide
			{ID = 3184, Cost = 12033, Expansion = 4}, -- Circle of Knowledge
			{ID = 57, Cost = 8223, Expansion = 1}, -- Firestrike
			{ID = 2946, Cost = 11026, Expansion = 0}, -- Remove Curse
			{ID = 609, Cost = 8254, Expansion = 4}, -- Succor: Ro
			{ID = 25697, Cost = 11123, Expansion = 99}, -- Zephyr: Grimling
		},
		[39] = {
			{ID = 137, Cost = 9066, Expansion = 2}, -- Pack Regeneration
			{ID = 2514, Cost = 12075, Expansion = 4}, -- Protection of Diamond
			{ID = 2031, Cost = 10936, Expansion = 4}, -- Ring of Cobalt Scar
			{ID = 1736, Cost = 10031, Expansion = 4}, -- Wind of the North
			{ID = 25695, Cost = 9131, Expansion = 99}, -- Zephyr: Feerrott
			{ID = 25902, Cost = 9015, Expansion = 99}, -- Zephyr: Steamfont
		},
		[40] = {
			{ID = 1398, Cost = 12308, Expansion = 4}, -- Circle of Wakening Lands
			{ID = 665, Cost = 10074, Expansion = 2}, -- Drifting Death
			{ID = 427, Cost = 10108, Expansion = 0}, -- Form of the Great Wolf
			{ID = 25694, Cost = 10921, Expansion = 99}, -- Zephyr: Combines
			{ID = 25901, Cost = 10097, Expansion = 99}, -- Zephyr: Ro
		},
		[41] = {
			{ID = 140, Cost = 11183, Expansion = 0}, -- Savage Spirit
			{ID = 610, Cost = 11097, Expansion = 4}, -- Succor: Lavastorm
			{ID = 1285, Cost = 3719, Expansion = 4}, -- Summon Companion
			{ID = 25905, Cost = 14776, Expansion = 99}, -- Zephyr: Twilight
		},
		[42] = {
			{ID = 145, Cost = 9068, Expansion = 0}, -- Chloroplast
			{ID = 1440, Cost = 14807, Expansion = 4}, -- Circle of Cobalt Scar
			{ID = 1436, Cost = 14741, Expansion = 99}, -- Fixation of Ro
			{ID = 25696, Cost = 14697, Expansion = 99}, -- Zephyr: Great Divide
		},
		[43] = {
			{ID = 142, Cost = 13532, Expansion = 0}, -- Allure of the Wild
			{ID = 116, Cost = 13200, Expansion = 0}, -- Banish Summoned
			{ID = 1740, Cost = 14658, Expansion = 1}, -- Dustdevil
			{ID = 49, Cost = 4197, Expansion = 0}, -- Nullify Magic
			{ID = 25906, Cost = 16244, Expansion = 99}, -- Zephyr: Wakening Lands
		},
		[44] = {
			{ID = 3834, Cost = 22889, Expansion = 4}, -- Healing Water
			{ID = 63, Cost = 3358, Expansion = 0}, -- Resist Disease
			{ID = 62, Cost = 3332, Expansion = 0}, -- Resist Poison
			{ID = 430, Cost = 14596, Expansion = 1}, -- Storm Strength
			{ID = 25693, Cost = 17487, Expansion = 99}, -- Zephyr: Cobalt Scar
		},
		[45] = {
			{ID = 77, Cost = 15945, Expansion = 0}, -- Engulfing Roots
			{ID = 138, Cost = 15860, Expansion = 0}, -- Pack Chloroplast
			{ID = 3579, Cost = 22600, Expansion = 4}, -- Share Form of the Great Wolf
			{ID = 25699, Cost = 15803, Expansion = 99}, -- Zephyr: Misty
		},
		[46] = {
			{ID = 420, Cost = 17451, Expansion = 0}, -- Lightning Blast
			{ID = 423, Cost = 17634, Expansion = 0}, -- Skin like Nature
			{ID = 611, Cost = 17425, Expansion = 4}, -- Succor: North
			{ID = 24773, Cost = 24620, Expansion = 99}, -- Zephyr: Knowledge
		},
		[47] = {
			{ID = 29, Cost = 19088, Expansion = 0}, -- Ice
			{ID = 356, Cost = 19047, Expansion = 0}, -- Shield of Thorns
			{ID = 519, Cost = 18889, Expansion = 0}, -- Thorncoat
		},
		[48] = {
			{ID = 433, Cost = 20637, Expansion = 0}, -- Fire
			{ID = 1435, Cost = 24700, Expansion = 99}, -- Improved Superior Camouflage
			{ID = 671, Cost = 21087, Expansion = 0}, -- Starfire
			{ID = 1542, Cost = 22781, Expansion = 4}, -- Upheaval
		},
		[49] = {
			{ID = 1727, Cost = 24516, Expansion = 4}, -- Legacy of Spike
			{ID = 2515, Cost = 28940, Expansion = 4}, -- Protection of Nature
			{ID = 64, Cost = 7374, Expansion = 0}, -- Resist Magic
			{ID = 4104, Cost = 36975, Expansion = 0}, -- Vengeance of the Wild
		},
		[50] = {
			{ID = 2881, Cost = 30946, Expansion = 4}, -- Everlasting Breath
			{ID = 2894, Cost = 31257, Expansion = 4}, -- Levitation
		},
		[51] = {
			{ID = 1551, Cost = 29026, Expansion = 4}, -- Circle of Winter
			{ID = 1550, Cost = 29265, Expansion = 4}, -- Repulse Animal
			{ID = 9, Cost = 3346, Expansion = 0}, -- Superior Healing
		},
		[52] = {
			{ID = 1600, Cost = 31709, Expansion = 4}, -- Breath of Ro
			{ID = 1553, Cost = 31040, Expansion = 99}, -- Call of Karana
			{ID = 8965, Cost = 64447, Expansion = 11}, -- Circle of Arcstone
			{ID = 1552, Cost = 31580, Expansion = 4}, -- Circle of Summer
			{ID = 8235, Cost = 60851, Expansion = 10}, -- Circle of Undershore
			{ID = 1566, Cost = 31088, Expansion = 99}, -- Egress
			{ID = 4058, Cost = 46292, Expansion = 0}, -- Feral Pack
			{ID = 2516, Cost = 36616, Expansion = 99}, -- Foliage Shield
			{ID = 3693, Cost = 39787, Expansion = 4}, -- Pure Blood
			{ID = 8967, Cost = 64845, Expansion = 11}, -- Ring of Arcstone
			{ID = 5733, Cost = 49531, Expansion = 7}, -- Ring of Barindu
			{ID = 4967, Cost = 48583, Expansion = 0}, -- Ring of Natimbi
			{ID = 8237, Cost = 60131, Expansion = 10}, -- Ring of Undershore
			{ID = 24771, Cost = 31270, Expansion = 99}, -- Zephyr: Lavastorm
			{ID = 24775, Cost = 60312, Expansion = 99}, -- Zephyr: Undershore
		},
		[53] = {
			{ID = 1555, Cost = 34020, Expansion = 99}, -- Glamour of Tunare
			{ID = 6185, Cost = 57426, Expansion = 99}, -- Ring of Bloodfields
			{ID = 1554, Cost = 31505, Expansion = 4}, -- Spirit of Scale
			{ID = 1601, Cost = 33852, Expansion = 4}, -- Winged Death
		},
		[54] = {
			{ID = 1602, Cost = 36585, Expansion = 99}, -- Blizzard
			{ID = 4966, Cost = 56077, Expansion = 0}, -- Circle of Natimbi
			{ID = 21400, Cost = 311127, Expansion = 4}, -- Eradicate Curse
			{ID = 1562, Cost = 36489, Expansion = 99}, -- Form of the Howler
			{ID = 1568, Cost = 31130, Expansion = 0}, -- Regrowth
			{ID = 2880, Cost = 0, Expansion = 0}, -- Remove Greater Curse
			{ID = 11982, Cost = 85535, Expansion = 13}, -- Ring of Buried Sea
			{ID = 1603, Cost = 36211, Expansion = 4}, -- Scoriae
			{ID = 2517, Cost = 42576, Expansion = 4}, -- Spirit of Eagle
		},
		[55] = {
			{ID = 1526, Cost = 33468, Expansion = 1}, -- Annul Magic
			{ID = 8929, Cost = 79685, Expansion = 99}, -- Aura of the Grove
			{ID = 1290, Cost = 42273, Expansion = 0}, -- Chloroblast
			{ID = 5731, Cost = 59985, Expansion = 7}, -- Circle of Barindu
			{ID = 6184, Cost = 64543, Expansion = 99}, -- Circle of Bloodfields
			{ID = 1529, Cost = 39222, Expansion = 1}, -- Exile Summoned
			{ID = 1605, Cost = 39591, Expansion = 99}, -- Frost
			{ID = 1557, Cost = 39875, Expansion = 99}, -- Girdle of Karana
			{ID = 1475, Cost = 42455, Expansion = 99}, -- Nature Walker's Behest
			{ID = 1556, Cost = 38891, Expansion = 99}, -- Tunare's Request
			{ID = 4105, Cost = 56078, Expansion = 4}, -- Vengeance of Nature
		},
		[56] = {
			{ID = 1558, Cost = 42380, Expansion = 4}, -- Bladecoat
			{ID = 1604, Cost = 42671, Expansion = 99}, -- Breath of Karana
			{ID = 1719, Cost = 41935, Expansion = 4}, -- Engorging Roots
			{ID = 2518, Cost = 49479, Expansion = 99}, -- Ro's Smoldering Disjunction
			{ID = 1725, Cost = 42196, Expansion = 99}, -- Wake of Karana
			{ID = 24776, Cost = 84205, Expansion = 99}, -- Zephyr: Arcstone
			{ID = 25700, Cost = 64970, Expansion = 99}, -- Zephyr: Natimbi
		},
		[57] = {
			{ID = 1767, Cost = 46028, Expansion = 99}, -- Bonds of Tunare
			{ID = 6998, Cost = 11000, Expansion = 0}, -- Instinctual Fear
			{ID = 1559, Cost = 46049, Expansion = 4}, -- Natureskin
			{ID = 1567, Cost = 45191, Expansion = 99}, -- Succor
			{ID = 25691, Cost = 69525, Expansion = 99}, -- Zephyr: Barindu
			{ID = 25692, Cost = 73496, Expansion = 99}, -- Zephyr: Bloodfields
			{ID = 24772, Cost = 53053, Expansion = 99}, -- Zephyr: Dawnshroud
		},
		[58] = {
			{ID = 2519, Cost = 56687, Expansion = 99}, -- Circle of Seasons
			{ID = 21399, Cost = 331420, Expansion = 4}, -- Eradicate Disease
			{ID = 21398, Cost = 299595, Expansion = 4}, -- Eradicate Poison
			{ID = 1606, Cost = 49287, Expansion = 99}, -- Fist of Karana
			{ID = 1569, Cost = 48732, Expansion = 99}, -- Regrowth of the Grove
			{ID = 1560, Cost = 49802, Expansion = 4}, -- Shield of Blades
			{ID = 2179, Cost = 56526, Expansion = 4}, -- Tunare's Renewal
		},
		[59] = {
			{ID = 11981, Cost = 116437, Expansion = 13}, -- Circle of Buried Sea
			{ID = 4589, Cost = 64266, Expansion = 4}, -- Incarnate Anew
			{ID = 1561, Cost = 52471, Expansion = 99}, -- Legacy of Thorn
			{ID = 2188, Cost = 60773, Expansion = 99}, -- Protection of the Cabbage
			{ID = 1564, Cost = 52811, Expansion = 99}, -- Spirit of Oak
			{ID = 1607, Cost = 52254, Expansion = 4}, -- Wildfire
		},
		[60] = {
			{ID = 1531, Cost = 56502, Expansion = 4}, -- Banishment
			{ID = 9954, Cost = 116497, Expansion = 12}, -- Circle of The Steppes
			{ID = 1608, Cost = 56488, Expansion = 99}, -- Entrapping Roots
			{ID = 1563, Cost = 57049, Expansion = 99}, -- Form of the Hunter
			{ID = 1565, Cost = 56696, Expansion = 99}, -- Mask of the Hunter
			{ID = 2887, Cost = 67832, Expansion = 4}, -- Mask of the Stalker
			{ID = 2877, Cost = 67609, Expansion = 99}, -- Moonfire
			{ID = 2520, Cost = 68169, Expansion = 99}, -- Nature's Recovery
			{ID = 1291, Cost = 60283, Expansion = 0}, -- Nature's Touch
			{ID = 1442, Cost = 60517, Expansion = 99}, -- Protection of the Glades
			{ID = 9955, Cost = 117359, Expansion = 12}, -- Ring of The Steppes
			{ID = 9953, Cost = 117107, Expansion = 12}, -- Zephyr: The Steppes
		},
		[61] = {
			{ID = 3473, Cost = 69933, Expansion = 4}, -- Catastrophe
			{ID = 3192, Cost = 70081, Expansion = 4}, -- Earthen Roots
			{ID = 3435, Cost = 70425, Expansion = 99}, -- Hand of Ro
			{ID = 6999, Cost = 11000, Expansion = 0}, -- Instinctual Panic
			{ID = 6733, Cost = 0, Expansion = 0}, -- Mire Thorns
			{ID = 3433, Cost = 70077, Expansion = 4}, -- Replenishment
			{ID = 3434, Cost = 71782, Expansion = 99}, -- Storm's Fury
			{ID = 3436, Cost = 71196, Expansion = 99}, -- Winter's Storm
		},
		[62] = {
			{ID = 3185, Cost = 75476, Expansion = 99}, -- Flight of Eagles
			{ID = 3346, Cost = 75554, Expansion = 4}, -- Imbue Storm
			{ID = 3437, Cost = 76607, Expansion = 99}, -- Immolation of Ro
			{ID = 3438, Cost = 76060, Expansion = 99}, -- Karana's Rage
			{ID = 3439, Cost = 76151, Expansion = 99}, -- Nature's Might
			{ID = 6180, Cost = 102528, Expansion = 99}, -- Ring of Slaughter
			{ID = 3440, Cost = 74674, Expansion = 99}, -- Ro's Illumination
		},
		[63] = {
			{ID = 3441, Cost = 80685, Expansion = 4}, -- Blessing of Replenishment
			{ID = 3445, Cost = 81507, Expansion = 99}, -- Command of Tunare
			{ID = 3442, Cost = 81507, Expansion = 99}, -- E`ci's Frosty Breath
			{ID = 3443, Cost = 80211, Expansion = 99}, -- Nature's Infusion
			{ID = 3234, Cost = 81812, Expansion = 99}, -- Protection of the Nine
			{ID = 3448, Cost = 81119, Expansion = 99}, -- Shield of Bracken
			{ID = 3446, Cost = 81713, Expansion = 99}, -- Swarming Death
		},
		[64] = {
			{ID = 3450, Cost = 86248, Expansion = 99}, -- Brackencoat
			{ID = 6179, Cost = 115948, Expansion = 99}, -- Circle of Slaughter
			{ID = 3232, Cost = 87079, Expansion = 99}, -- Karana's Renewal
			{ID = 3444, Cost = 86511, Expansion = 99}, -- Protection of Seasons
			{ID = 3447, Cost = 85134, Expansion = 99}, -- Savage Roots
			{ID = 3449, Cost = 85804, Expansion = 99}, -- Summer's Flame
			{ID = 4106, Cost = 107640, Expansion = 0}, -- Vengeance of Tunare
			{ID = 11980, Cost = 156404, Expansion = 13}, -- Zephyr: Buried Sea
		},
		[65] = {
			{ID = 3451, Cost = 100144, Expansion = 99}, -- Blessing of the Nine
			{ID = 3238, Cost = 86916, Expansion = 4}, -- Destroy Summoned
			{ID = 3295, Cost = 98663, Expansion = 99}, -- Legacy of Bracken
			{ID = 3453, Cost = 99202, Expansion = 99}, -- Mask of the Forest
			{ID = 4885, Cost = 116901, Expansion = 99}, -- Sylvan Embers
			{ID = 4884, Cost = 117547, Expansion = 99}, -- Sylvan Fire
			{ID = 4883, Cost = 117770, Expansion = 99}, -- Sylvan Infusion
			{ID = 3452, Cost = 100322, Expansion = 99}, -- Winter's Frost
		},
		[66] = {
			{ID = 5346, Cost = 130616, Expansion = 99}, -- Earth Shiver
			{ID = 7000, Cost = 132511, Expansion = 99}, -- Instinctual Terror
			{ID = 5342, Cost = 130674, Expansion = 99}, -- Oaken Vigor
			{ID = 5343, Cost = 131303, Expansion = 99}, -- Stormwatch
			{ID = 5345, Cost = 130092, Expansion = 99}, -- Tempest Wind
		},
		[67] = {
			{ID = 5354, Cost = 139999, Expansion = 99}, -- Glacier Breath
			{ID = 5348, Cost = 138009, Expansion = 99}, -- Immolation of the Sun
			{ID = 5350, Cost = 138511, Expansion = 99}, -- Lion's Strength
			{ID = 5347, Cost = 140237, Expansion = 99}, -- Nature's Serenity
			{ID = 5358, Cost = 139118, Expansion = 99}, -- Nettle Shield
			{ID = 5351, Cost = 137720, Expansion = 99}, -- Sun's Corona
			{ID = 24774, Cost = 146611, Expansion = 99}, -- Zephyr: Slaughter
		},
		[68] = {
			{ID = 5355, Cost = 149234, Expansion = 99}, -- Chlorotrope
			{ID = 6123, Cost = 147636, Expansion = 99}, -- Cloak of Nature
			{ID = 5364, Cost = 146918, Expansion = 99}, -- Desolate Summoned
			{ID = 5362, Cost = 150059, Expansion = 99}, -- Nettlecoat
			{ID = 8008, Cost = 164793, Expansion = 99}, -- Skin of the Reptile
			{ID = 5352, Cost = 150191, Expansion = 99}, -- Steeloak Skin
			{ID = 5357, Cost = 149046, Expansion = 99}, -- Wasp Swarm
		},
		[69] = {
			{ID = 5353, Cost = 156632, Expansion = 99}, -- Blessing of Oak
			{ID = 5356, Cost = 155131, Expansion = 99}, -- Oaken Guard
			{ID = 6665, Cost = 169163, Expansion = 99}, -- Serpent Vines
			{ID = 5361, Cost = 158817, Expansion = 99}, -- Solstice Strike
			{ID = 8010, Cost = 174572, Expansion = 99}, -- Spore Spiral
			{ID = 5363, Cost = 157345, Expansion = 99}, -- Vengeance of the Sun
		},
		[70] = {
			{ID = 8499, Cost = 196933, Expansion = 99}, -- Aura of Life
			{ID = 8497, Cost = 197818, Expansion = 99}, -- Barkspur
			{ID = 5366, Cost = 166570, Expansion = 99}, -- Blessing of Steeloak
			{ID = 9951, Cost = 211071, Expansion = 12}, -- Circle of Direwind
			{ID = 8011, Cost = 184957, Expansion = 99}, -- Dawnstrike
			{ID = 5367, Cost = 164822, Expansion = 99}, -- Glitterfrost
			{ID = 5349, Cost = 165072, Expansion = 99}, -- Hungry Vines
			{ID = 5365, Cost = 166068, Expansion = 99}, -- Legacy of Nettles
			{ID = 5368, Cost = 166407, Expansion = 99}, -- Mask of the Wild
			{ID = 8498, Cost = 199234, Expansion = 99}, -- Moonshadow
			{ID = 5359, Cost = 167301, Expansion = 99}, -- Nature's Beckon
			{ID = 9952, Cost = 206328, Expansion = 12}, -- Ring of Direwind
			{ID = 9950, Cost = 210576, Expansion = 12}, -- Zephyr: Direwind
		},
		[71] = {
			{ID = 9923, Cost = 218579, Expansion = 4}, -- Beast's Beckoning
			{ID = 9824, Cost = 218794, Expansion = 4}, -- Blistering Sunray
			{ID = 9833, Cost = 221028, Expansion = 4}, -- Cloudburst Hail
			{ID = 9700, Cost = 218250, Expansion = 4}, -- Cure Corruption
			{ID = 11766, Cost = 236016, Expansion = 4}, -- Fernspur
			{ID = 11767, Cost = 10000, Expansion = 99}, -- Fernspur Rk. II
			{ID = 11768, Cost = 10000, Expansion = 99}, -- Fernspur Rk. III
			{ID = 9827, Cost = 219359, Expansion = 4}, -- Gale of the Stormborn
			{ID = 9857, Cost = 222138, Expansion = 4}, -- Mammoth's Strength
			{ID = 9851, Cost = 223124, Expansion = 4}, -- Nature's Placidity
		},
		[72] = {
			{ID = 9872, Cost = 231401, Expansion = 4}, -- Direwild Skin
			{ID = 9863, Cost = 234063, Expansion = 4}, -- Icefall Breath
			{ID = 9875, Cost = 230291, Expansion = 4}, -- Pure Life
			{ID = 9917, Cost = 231958, Expansion = 4}, -- Vinelash Cascade
			{ID = 9918, Cost = 100000, Expansion = 13}, -- Vinelash Cascade Rk. II
			{ID = 9919, Cost = 100000, Expansion = 13}, -- Vinelash Cascade Rk. III
			{ID = 9866, Cost = 231603, Expansion = 4}, -- Viridifloral Shield
		},
		[73] = {
			{ID = 10735, Cost = 244549, Expansion = 4}, -- Annihilate the Unnatural
			{ID = 10736, Cost = 100000, Expansion = 99}, -- Annihilate the Unnatural Rk. II
			{ID = 10737, Cost = 100000, Expansion = 13}, -- Annihilate the Unnatural Rk. III
			{ID = 9721, Cost = 242268, Expansion = 4}, -- Resist Corruption
			{ID = 9869, Cost = 243222, Expansion = 4}, -- Skin to Vines
			{ID = 9878, Cost = 243691, Expansion = 4}, -- Swarm of Fireants
			{ID = 9881, Cost = 248778, Expansion = 4}, -- Viridicoat
			{ID = 9887, Cost = 248061, Expansion = 4}, -- Winter's Flame
		},
		[74] = {
			{ID = 9920, Cost = 262315, Expansion = 4}, -- Chant of the Napaea
			{ID = 9905, Cost = 261715, Expansion = 4}, -- Direwood Guard
			{ID = 9911, Cost = 256003, Expansion = 4}, -- Equinox Burn
			{ID = 9845, Cost = 272918, Expansion = 4}, -- Hoar Frost
			{ID = 9846, Cost = 100000, Expansion = 99}, -- Hoar Frost Rk. II
			{ID = 9847, Cost = 100000, Expansion = 99}, -- Hoar Frost Rk. III
			{ID = 9902, Cost = 259721, Expansion = 4}, -- Sunscorch
			{ID = 9776, Cost = 262523, Expansion = 4}, -- Tectonic Quake
		},
		[75] = {
			{ID = 9941, Cost = 275020, Expansion = 4}, -- Adrenaline Surge
			{ID = 9929, Cost = 276471, Expansion = 4}, -- Blessing of the Direwild
			{ID = 15887, Cost = 276480, Expansion = 4}, -- Circle of Loping Plains
			{ID = 9926, Cost = 272481, Expansion = 4}, -- Legacy of Viridiflora
			{ID = 11770, Cost = 291427, Expansion = 4}, -- Lunarlight
			{ID = 11771, Cost = 10000, Expansion = 99}, -- Lunarlight Rk. II
			{ID = 11772, Cost = 10000, Expansion = 99}, -- Lunarlight Rk. III
			{ID = 9830, Cost = 273946, Expansion = 4}, -- Nature's Blazing Wrath
			{ID = 9932, Cost = 272002, Expansion = 4}, -- Rime Crystals
			{ID = 15888, Cost = 276987, Expansion = 4}, -- Ring of Loping Plains
			{ID = 9947, Cost = 273664, Expansion = 4}, -- Second Life
			{ID = 15886, Cost = 271545, Expansion = 4}, -- Zephyr: Loping Plains
		},
		[76] = {
			{ID = 14430, Cost = 317761, Expansion = 4}, -- Beast's Bewitching
			{ID = 14460, Cost = 317849, Expansion = 99}, -- Fernspike
			{ID = 14461, Cost = 434618, Expansion = 99}, -- Fernspike Rk. II
			{ID = 14462, Cost = 2188790, Expansion = 99}, -- Fernspike Rk. III
			{ID = 14367, Cost = 321310, Expansion = 4}, -- Nature's Calm
			{ID = 15235, Cost = 320809, Expansion = 4}, -- Spirit of the Stalwart
			{ID = 14355, Cost = 317544, Expansion = 4}, -- Tempest of the Stormborn
			{ID = 14361, Cost = 321643, Expansion = 4}, -- Torrential Hail
			{ID = 14352, Cost = 321025, Expansion = 4}, -- Torrid Sunray
		},
		[77] = {
			{ID = 14379, Cost = 333809, Expansion = 4}, -- Chillvapor Breath
			{ID = 14388, Cost = 336725, Expansion = 4}, -- Ironwood Skin
			{ID = 14391, Cost = 339588, Expansion = 4}, -- Puravida
			{ID = 14479, Cost = 332680, Expansion = 4}, -- Reaping Inferno
			{ID = 14476, Cost = 333655, Expansion = 4}, -- Sharp Eyes
			{ID = 14382, Cost = 333623, Expansion = 4}, -- Viridifloral Bulwark
		},
		[78] = {
			{ID = 14454, Cost = 352375, Expansion = 4}, -- Annihilate the Aberrant
			{ID = 14222, Cost = 354274, Expansion = 4}, -- Forbear Corruption
			{ID = 14394, Cost = 350735, Expansion = 4}, -- Horde of Fireants
			{ID = 14385, Cost = 353460, Expansion = 4}, -- Skin to Mulch
			{ID = 14485, Cost = 357456, Expansion = 99}, -- Solarsliver
			{ID = 14486, Cost = 424488, Expansion = 99}, -- Solarsliver Rk. II
			{ID = 14491, Cost = 350080, Expansion = 99}, -- Survival of the Fittest
			{ID = 14492, Cost = 511480, Expansion = 99}, -- Survival of the Fittest Rk. II
			{ID = 14493, Cost = 2323920, Expansion = 99}, -- Survival of the Fittest Rk. III
			{ID = 14397, Cost = 354978, Expansion = 4}, -- Viridithorn Coat
			{ID = 14400, Cost = 353904, Expansion = 99}, -- Winter's Blaze
			{ID = 14401, Cost = 475096, Expansion = 99}, -- Winter's Blaze Rk. II
		},
		[79] = {
			{ID = 14427, Cost = 366872, Expansion = 4}, -- Chant of the Darkvine
			{ID = 14418, Cost = 373015, Expansion = 4}, -- Equinox Brand
			{ID = 14364, Cost = 373824, Expansion = 4}, -- Gelid Frost
			{ID = 14467, Cost = 369698, Expansion = 99}, -- Scales of the Reptile
			{ID = 14468, Cost = 540410, Expansion = 99}, -- Scales of the Reptile Rk. II
			{ID = 14469, Cost = 2199970, Expansion = 99}, -- Scales of the Reptile Rk. III
			{ID = 14409, Cost = 372125, Expansion = 4}, -- Sunsear
			{ID = 15280, Cost = 374114, Expansion = 4}, -- Talisman of the Stalwart
			{ID = 14267, Cost = 369778, Expansion = 4}, -- Tectonic Upheaval
		},
		[80] = {
			{ID = 14445, Cost = 393453, Expansion = 4}, -- Adrenaline Swell
			{ID = 14436, Cost = 389656, Expansion = 4}, -- Blessing of the Ironwood
			{ID = 21984, Cost = 431047, Expansion = 4}, -- Circle of Brell's Rest
			{ID = 20539, Cost = 407011, Expansion = 99}, -- Circle of Plane of Time
			{ID = 14464, Cost = 394440, Expansion = 4}, -- Crescentbloom
			{ID = 14439, Cost = 394336, Expansion = 4}, -- Hoar Crystals
			{ID = 14433, Cost = 394736, Expansion = 4}, -- Legacy of Viridithorns
			{ID = 14442, Cost = 385535, Expansion = 4}, -- Mask of the Shadowcat
			{ID = 14358, Cost = 392568, Expansion = 99}, -- Nature's Burning Wrath
			{ID = 14359, Cost = 531830, Expansion = 99}, -- Nature's Burning Wrath Rk. II
			{ID = 14360, Cost = 2343600, Expansion = 99}, -- Nature's Burning Wrath Rk. III
			{ID = 14451, Cost = 386072, Expansion = 4}, -- Preincarnation
			{ID = 21986, Cost = 434694, Expansion = 4}, -- Ring of Brell's Rest
			{ID = 20540, Cost = 415811, Expansion = 99}, -- Ring of Plane of Time
			{ID = 21989, Cost = 428301, Expansion = 4}, -- Zephyr: Brell's Rest
			{ID = 20538, Cost = 413051, Expansion = 99}, -- Zephyr: Plane of Time
		},
		[81] = {
			{ID = 18470, Cost = 425226, Expansion = 99}, -- Beast's Befriending
			{ID = 18540, Cost = 431288, Expansion = 99}, -- Carve Whistle
			{ID = 18401, Cost = 435969, Expansion = 99}, -- Cascading Hail
			{ID = 18407, Cost = 430278, Expansion = 99}, -- Nature's Peace
			{ID = 19397, Cost = 426803, Expansion = 99}, -- Spirit of the Resolute
			{ID = 18395, Cost = 431555, Expansion = 99}, -- Squall of the Stormborn
			{ID = 18392, Cost = 432793, Expansion = 99}, -- Withering Sunray
		},
		[82] = {
			{ID = 18422, Cost = 448257, Expansion = 15}, -- Brierbloom Bulwark
			{ID = 18419, Cost = 448352, Expansion = 15}, -- Coldwhisper Breath
			{ID = 18431, Cost = 447513, Expansion = 15}, -- Granvida
			{ID = 18519, Cost = 455947, Expansion = 15}, -- Harvesting Inferno
			{ID = 18428, Cost = 456456, Expansion = 15}, -- Heartwood Skin
			{ID = 18534, Cost = 451923, Expansion = 15}, -- Promised Reknit
			{ID = 18549, Cost = 432372, Expansion = 99}, -- Wild Growth
		},
		[83] = {
			{ID = 18437, Cost = 473872, Expansion = 99}, -- Brierbloom Coat
			{ID = 18434, Cost = 471475, Expansion = 99}, -- Horde of the Hive
			{ID = 18525, Cost = 480529, Expansion = 99}, -- Morning's Glory
			{ID = 18243, Cost = 475735, Expansion = 99}, -- Repel Corruption
			{ID = 18425, Cost = 470547, Expansion = 99}, -- Skin to Flora
		},
		[84] = {
			{ID = 18404, Cost = 504396, Expansion = 99}, -- Blanched Frost
			{ID = 18508, Cost = 497427, Expansion = 99}, -- Carapace of the Reptile Rk. II
			{ID = 18467, Cost = 495321, Expansion = 99}, -- Chant of the Burynai
			{ID = 18389, Cost = 504108, Expansion = 99}, -- Purified Blood
			{ID = 18458, Cost = 498825, Expansion = 99}, -- Summer Solstice
			{ID = 18449, Cost = 497364, Expansion = 99}, -- Sunsinge
			{ID = 19442, Cost = 503382, Expansion = 99}, -- Talisman of the Resolute
			{ID = 18288, Cost = 491834, Expansion = 99}, -- Tectonic Tumult
		},
		[85] = {
			{ID = 18485, Cost = 517238, Expansion = 99}, -- Adrenaline Burst
			{ID = 18476, Cost = 522457, Expansion = 99}, -- Blessing of the Heartwood
			{ID = 17883, Cost = 565243, Expansion = 99}, -- Circle of the Grounds
			{ID = 18479, Cost = 524061, Expansion = 99}, -- Glaciating Crystals
			{ID = 18473, Cost = 518769, Expansion = 99}, -- Legacy of Brierbloom
			{ID = 18504, Cost = 517284, Expansion = 99}, -- Lunulation
			{ID = 18482, Cost = 528839, Expansion = 99}, -- Mask of the Raptor
			{ID = 17882, Cost = 578454, Expansion = 99}, -- Ring of the Grounds
			{ID = 17884, Cost = 579856, Expansion = 99}, -- Zephyr: the Grounds
		},
		[86] = {
			{ID = 25719, Cost = 592616, Expansion = 99}, -- Beast's Beguiling
			{ID = 25722, Cost = 600372, Expansion = 99}, -- Cyclonic Hail
			{ID = 25725, Cost = 599608, Expansion = 99}, -- Grasp of Ro
			{ID = 25731, Cost = 595802, Expansion = 99}, -- Mammoth's Force
			{ID = 25734, Cost = 604618, Expansion = 99}, -- Nature's Harmony
			{ID = 25741, Cost = 604773, Expansion = 99}, -- Scorching Sunray
			{ID = 25744, Cost = 603748, Expansion = 99}, -- Shear of the Stormborn
			{ID = 25701, Cost = 598729, Expansion = 99}, -- Spirit of the Relentless
			{ID = 25737, Cost = 599414, Expansion = 99}, -- Thornspur
		},
		[87] = {
			{ID = 25759, Cost = 630730, Expansion = 99}, -- Benevida
			{ID = 25753, Cost = 637110, Expansion = 99}, -- Bonebriar Bulwark
			{ID = 25747, Cost = 629651, Expansion = 99}, -- Bracing Breath
			{ID = 25768, Cost = 622148, Expansion = 99}, -- Eyes of the Winter Hawk
			{ID = 25762, Cost = 627953, Expansion = 99}, -- Promised Replenishment
			{ID = 25756, Cost = 628797, Expansion = 99}, -- Timbercore Skin
			{ID = 25704, Cost = 593650, Expansion = 99}, -- Untamed Growth
			{ID = 25771, Cost = 620173, Expansion = 99}, -- Wildfire Aura
		},
		[88] = {
			{ID = 25707, Cost = 665413, Expansion = 99}, -- Annihilate the Divergent
			{ID = 25783, Cost = 654792, Expansion = 99}, -- Bonebriar Coat
			{ID = 25786, Cost = 658469, Expansion = 99}, -- Daybreak
			{ID = 25792, Cost = 659570, Expansion = 99}, -- Frostfell Aura
			{ID = 25780, Cost = 654218, Expansion = 99}, -- Horde of Scoriae
			{ID = 25068, Cost = 663471, Expansion = 99}, -- Reject Corruption
			{ID = 25801, Cost = 663563, Expansion = 99}, -- Remote Sunflare
			{ID = 25807, Cost = 657420, Expansion = 99}, -- Skin to Leaves
			{ID = 25810, Cost = 660593, Expansion = 99}, -- Survival of the Propitious
			{ID = 25813, Cost = 652033, Expansion = 99}, -- Winter's Pyre
		},
		[89] = {
			{ID = 25822, Cost = 691730, Expansion = 99}, -- Argent Frost
			{ID = 25710, Cost = 679162, Expansion = 99}, -- Chant of the Tae Ew
			{ID = 25828, Cost = 684617, Expansion = 99}, -- Gelid Moonbeam
			{ID = 25831, Cost = 687062, Expansion = 99}, -- Polyporous Assault
			{ID = 25071, Cost = 695825, Expansion = 99}, -- Purged Blood
			{ID = 25837, Cost = 682488, Expansion = 99}, -- Shell of the Reptile
			{ID = 25852, Cost = 683435, Expansion = 99}, -- Summer Prominence
			{ID = 25849, Cost = 688959, Expansion = 99}, -- Sunbrand
			{ID = 25846, Cost = 682784, Expansion = 99}, -- Sunrise Blessing
			{ID = 25713, Cost = 692055, Expansion = 99}, -- Talisman of the Relentless
			{ID = 25074, Cost = 683590, Expansion = 99}, -- Tectonic Shock
		},
		[90] = {
			{ID = 25874, Cost = 715672, Expansion = 99}, -- Adrenaline Blast
			{ID = 25855, Cost = 715881, Expansion = 99}, -- Arboreal Absolution
			{ID = 25868, Cost = 711981, Expansion = 99}, -- Argent Crystals
			{ID = 25865, Cost = 710901, Expansion = 99}, -- Blessing of the Timbercore
			{ID = 25862, Cost = 720834, Expansion = 99}, -- Legacy of Bonebriar
			{ID = 25880, Cost = 711802, Expansion = 99}, -- Lunamelioration
			{ID = 25871, Cost = 714416, Expansion = 99}, -- Mask of the Arboreal
			{ID = 25892, Cost = 723402, Expansion = 99}, -- Nature's Incinerating Wrath
			{ID = 25883, Cost = 728387, Expansion = 99}, -- Rejuvilation
			{ID = 25886, Cost = 728614, Expansion = 99}, -- Surge of Bonebriars
		},
		[91] = {
			{ID = 28812, Cost = 1184534, Expansion = 99}, -- Beast's Behest
			{ID = 28837, Cost = 1180761, Expansion = 99}, -- Blazing Sunray
			{ID = 28815, Cost = 1183070, Expansion = 99}, -- Crashing Hail
			{ID = 28840, Cost = 1184508, Expansion = 99}, -- Cyclone of the Stormborn
			{ID = 28827, Cost = 1185432, Expansion = 99}, -- Fawnwalker's Breeze
			{ID = 28824, Cost = 1183277, Expansion = 99}, -- Heliacal Flare
			{ID = 28830, Cost = 1183866, Expansion = 99}, -- Nature's Tranquility
			{ID = 28796, Cost = 1184227, Expansion = 18}, -- Spirit of the Indomitable
		},
		[92] = {
			{ID = 28843, Cost = 1197879, Expansion = 99}, -- Encompassing Breath
			{ID = 28858, Cost = 1193505, Expansion = 99}, -- Lunar Chill
			{ID = 28864, Cost = 1197089, Expansion = 99}, -- Promised Revitalization
			{ID = 28855, Cost = 1198354, Expansion = 99}, -- Sanavida
			{ID = 28849, Cost = 1194554, Expansion = 99}, -- Spineburr Bulwark
			{ID = 28852, Cost = 1193952, Expansion = 99}, -- Stonebark Skin
			{ID = 28799, Cost = 1182856, Expansion = 99}, -- Unfettered Growth
			{ID = 28870, Cost = 1194783, Expansion = 99}, -- Wildblaze Aura
		},
		[93] = {
			{ID = 28888, Cost = 1210665, Expansion = 99}, -- Frostcloak Aura
			{ID = 28879, Cost = 1210189, Expansion = 99}, -- Horde of Vespids
			{ID = 28085, Cost = 1210353, Expansion = 99}, -- Rescind Corruption
			{ID = 28903, Cost = 1209635, Expansion = 99}, -- Skin to Foliage
			{ID = 28882, Cost = 1210007, Expansion = 99}, -- Spineburr Coat
		},
		[94] = {
			{ID = 28806, Cost = 1220100, Expansion = 99}, -- Chant of the Izon
			{ID = 28927, Cost = 1224477, Expansion = 99}, -- Myconid Assault
			{ID = 28088, Cost = 1219930, Expansion = 99}, -- Perfected Blood
			{ID = 28809, Cost = 1220645, Expansion = 99}, -- Talisman of the Indomitable
		},
	},
	[Class.MONK] = {
		[1] = {
			{ID = 5225, Cost = 20, Expansion = 0}, -- Throw Stone
		},
		[5] = {
			{ID = 25060, Cost = 28, Expansion = 4}, -- Elbow Strike
		},
		[10] = {
			{ID = 4721, Cost = 92, Expansion = 0}, -- Focused Will Discipline
		},
		[30] = {
			{ID = 4585, Cost = 3332, Expansion = 0}, -- Resistant Discipline
		},
		[35] = {
			{ID = 4614, Cost = 8956, Expansion = 4}, -- Phantom Zephyr
		},
		[40] = {
			{ID = 4587, Cost = 10043, Expansion = 0}, -- Fearless Discipline
		},
		[50] = {
			{ID = 4683, Cost = 33996, Expansion = 4}, -- Phantom Wind
		},
		[51] = {
			{ID = 4510, Cost = 28513, Expansion = 4}, -- Stonestance Discipline
		},
		[52] = {
			{ID = 4511, Cost = 30899, Expansion = 4}, -- Thunderkick Discipline
		},
		[53] = {
			{ID = 4509, Cost = 34122, Expansion = 4}, -- Whirlwind Discipline
		},
		[54] = {
			{ID = 4502, Cost = 36238, Expansion = 4}, -- Voiddance Discipline
		},
		[55] = {
			{ID = 8923, Cost = 79702, Expansion = 99}, -- Disciple's Aura
		},
		[56] = {
			{ID = 4512, Cost = 42393, Expansion = 4}, -- Innerflame Discipline
		},
		[57] = {
			{ID = 4513, Cost = 46049, Expansion = 4}, -- Hundred Fists Discipline
			{ID = 4684, Cost = 56608, Expansion = 4}, -- Phantom Echo
		},
		[59] = {
			{ID = 4507, Cost = 52273, Expansion = 4}, -- Silentfist Discipline
		},
		[60] = {
			{ID = 4508, Cost = 56073, Expansion = 4}, -- Ashenhand Discipline
		},
		[61] = {
			{ID = 6752, Cost = 0, Expansion = 0}, -- Leopard Claw
			{ID = 4692, Cost = 71757, Expansion = 4}, -- Planeswalk Discipline
		},
		[63] = {
			{ID = 4687, Cost = 80231, Expansion = 0}, -- Healing Will Discipline
			{ID = 4691, Cost = 81173, Expansion = 4}, -- Speed Focus Discipline
		},
		[64] = {
			{ID = 4698, Cost = 85178, Expansion = 4}, -- Phantom Call
		},
		[65] = {
			{ID = 4690, Cost = 98837, Expansion = 4}, -- Earthwalk Discipline
			{ID = 5019, Cost = 116169, Expansion = 99}, -- Phantom Shadow
		},
		[66] = {
			{ID = 6193, Cost = 132650, Expansion = 99}, -- Dreamwalk Discipline
		},
		[68] = {
			{ID = 6195, Cost = 150184, Expansion = 99}, -- Counterforce Discipline
			{ID = 8002, Cost = 165375, Expansion = 99}, -- Fists of Wu
		},
		[69] = {
			{ID = 6727, Cost = 170776, Expansion = 99}, -- Dragon Fang
			{ID = 6175, Cost = 156808, Expansion = 99}, -- Phantom Cry
		},
		[70] = {
			{ID = 8473, Cost = 199752, Expansion = 99}, -- Heel of Kanji
			{ID = 8474, Cost = 199133, Expansion = 99}, -- Master's Aura
			{ID = 6194, Cost = 166550, Expansion = 99}, -- Rapid Kick Discipline
		},
		[71] = {
			{ID = 10947, Cost = 222590, Expansion = 12}, -- Phantom Silhouette
		},
		[72] = {
			{ID = 10938, Cost = 235706, Expansion = 99}, -- Impenetrable Discipline
			{ID = 11913, Cost = 246051, Expansion = 13}, -- Second Wind
			{ID = 11914, Cost = 10000, Expansion = 99}, -- Second Wind Rk. II
			{ID = 11915, Cost = 10000, Expansion = 99}, -- Second Wind Rk. III
		},
		[73] = {
			{ID = 10932, Cost = 245055, Expansion = 99}, -- Echo of Misdirection
		},
		[74] = {
			{ID = 10944, Cost = 256885, Expansion = 99}, -- Clawstriker's Flurry
			{ID = 11922, Cost = 276005, Expansion = 99}, -- Scaledfist Discipline
			{ID = 11923, Cost = 10000, Expansion = 99}, -- Scaledfist Discipline Rk. II
			{ID = 11924, Cost = 10000, Expansion = 99}, -- Scaledfist Discipline Rk. III
		},
		[75] = {
			{ID = 10950, Cost = 273051, Expansion = 99}, -- Moment of Calm
		},
		[76] = {
			{ID = 14799, Cost = 319248, Expansion = 14}, -- Shimmering Silhouette
		},
		[77] = {
			{ID = 14811, Cost = 337517, Expansion = 99}, -- Astral Projection
			{ID = 14192, Cost = 335076, Expansion = 14}, -- Third Wind
		},
		[78] = {
			{ID = 14784, Cost = 357682, Expansion = 99}, -- Echo of Deception
		},
		[79] = {
			{ID = 14820, Cost = 368149, Expansion = 99}, -- Crystalpalm Discipline
		},
		[80] = {
			{ID = 14815, Cost = 2554522, Expansion = 99}, -- Delay Death Rk. II
			{ID = 14816, Cost = 9571540, Expansion = 99}, -- Delay Death Rk. III
			{ID = 14802, Cost = 395922, Expansion = 99}, -- Moment of Tranquility
		},
		[81] = {
			{ID = 18904, Cost = 436992, Expansion = 99}, -- Phantom Apparition
		},
		[82] = {
			{ID = 18916, Cost = 454351, Expansion = 15}, -- Chrono Projection
			{ID = 18213, Cost = 449224, Expansion = 15}, -- Fourth Wind
		},
		[83] = {
			{ID = 18889, Cost = 472122, Expansion = 99}, -- Echo of Distraction
		},
		[84] = {
			{ID = 19552, Cost = 501711, Expansion = 99}, -- Punch Through
		},
		[85] = {
			{ID = 18907, Cost = 528184, Expansion = 99}, -- Moment of Placidity
		},
		[86] = {
			{ID = 25907, Cost = 607486, Expansion = 99}, -- Dreamwalker's Synergy
			{ID = 25911, Cost = 597774, Expansion = 99}, -- Phantasmal Apparition
			{ID = 25000, Cost = 605412, Expansion = 17}, -- Respite
		},
		[87] = {
			{ID = 25914, Cost = 629873, Expansion = 99}, -- Cloud of Fists
			{ID = 25003, Cost = 631864, Expansion = 17}, -- Fifth Wind
		},
		[88] = {
			{ID = 25917, Cost = 662031, Expansion = 99}, -- Echo of Confusion
			{ID = 25923, Cost = 663282, Expansion = 99}, -- Ironfist Discipline
		},
		[89] = {
			{ID = 25009, Cost = 695848, Expansion = 99}, -- Jab Through
			{ID = 25926, Cost = 683126, Expansion = 99}, -- Six-Step Pattern
			{ID = 25929, Cost = 695961, Expansion = 99}, -- Void Body
		},
		[90] = {
			{ID = 25932, Cost = 712994, Expansion = 99}, -- Deny Death
			{ID = 25938, Cost = 724355, Expansion = 99}, -- Five Breaths
			{ID = 25941, Cost = 724380, Expansion = 99}, -- Heel of Kai
			{ID = 25944, Cost = 717787, Expansion = 99}, -- Intercepting Fist
		},
		[91] = {
			{ID = 29006, Cost = 1184512, Expansion = 99}, -- Veiled Apparition
		},
		[92] = {
			{ID = 28003, Cost = 1194317, Expansion = 99}, -- Sixth Wind
			{ID = 29018, Cost = 1195004, Expansion = 99}, -- Void Step
		},
		[93] = {
			{ID = 29027, Cost = 1207283, Expansion = 99}, -- Crane Stance
		},
	},
	[Class.BARD] = {
		[1] = {
			{ID = 700, Cost = 20, Expansion = 0}, -- Chant of Battle
		},
		[2] = {
			{ID = 703, Cost = 20, Expansion = 0}, -- Chords of Dissonance
		},
		[4] = {
			{ID = 720, Cost = 24, Expansion = 0}, -- Lyssa's Locating Lyric
		},
		[5] = {
			{ID = 717, Cost = 28, Expansion = 0}, -- Selo's Accelerando
		},
		[6] = {
			{ID = 7, Cost = 34, Expansion = 0}, -- Hymn of Restoration
		},
		[7] = {
			{ID = 734, Cost = 43, Expansion = 0}, -- Jonthan's Whistling Warsong
		},
		[8] = {
			{ID = 728, Cost = 55, Expansion = 0}, -- Kelin's Lugubrious Lament
		},
		[9] = {
			{ID = 710, Cost = 71, Expansion = 0}, -- Elemental Rhythms
			{ID = 2601, Cost = 151, Expansion = 0}, -- Magical Monologue
		},
		[10] = {
			{ID = 701, Cost = 93, Expansion = 0}, -- Anthem de Arms
		},
		[11] = {
			{ID = 708, Cost = 120, Expansion = 0}, -- Cinda's Charismatic Carillon
		},
		[12] = {
			{ID = 704, Cost = 151, Expansion = 0}, -- Brusco's Boastful Bellow
		},
		[13] = {
			{ID = 711, Cost = 192, Expansion = 0}, -- Purifying Rhythms
		},
		[14] = {
			{ID = 737, Cost = 244, Expansion = 3}, -- Lyssa's Cataloging Libretto
		},
		[15] = {
			{ID = 724, Cost = 299, Expansion = 3}, -- Kelin's Lucid Lullaby
			{ID = 2602, Cost = 543, Expansion = 4}, -- Song of Sustenance
		},
		[16] = {
			{ID = 729, Cost = 375, Expansion = 3}, -- Tarew's Aquatic Ayre
		},
		[17] = {
			{ID = 709, Cost = 455, Expansion = 0}, -- Guardian Rhythms
		},
		[18] = {
			{ID = 730, Cost = 551, Expansion = 0}, -- Denon's Disruptive Discord
		},
		[19] = {
			{ID = 719, Cost = 648, Expansion = 3}, -- Shauri's Sonorous Clouding
		},
		[20] = {
			{ID = 1287, Cost = 1093, Expansion = 4}, -- Cassindra's Chant of Clarity
			{ID = 705, Cost = 790, Expansion = 0}, -- Largo's Melodic Binding
		},
		[21] = {
			{ID = 739, Cost = 935, Expansion = 3}, -- Melanie's Mellifluous Motion
		},
		[22] = {
			{ID = 727, Cost = 1082, Expansion = 0}, -- Alenia's Disenchanting Melody
		},
		[23] = {
			{ID = 738, Cost = 1278, Expansion = 3}, -- Selo's Consonant Chain
		},
		[24] = {
			{ID = 735, Cost = 1470, Expansion = 3}, -- Lyssa's Veracious Concord
		},
		[25] = {
			{ID = 712, Cost = 1734, Expansion = 0}, -- Psalm of Warmth
			{ID = 4395, Cost = 3798, Expansion = 0}, -- Selo's Rhythm of Speed
		},
		[26] = {
			{ID = 706, Cost = 1990, Expansion = 3}, -- Angstlich's Appalling Screech
		},
		[27] = {
			{ID = 725, Cost = 2292, Expansion = 3}, -- Solon's Song of the Sirens
		},
		[28] = {
			{ID = 741, Cost = 2548, Expansion = 4}, -- Crission's Pixie Strike
		},
		[29] = {
			{ID = 715, Cost = 2953, Expansion = 0}, -- Psalm of Vitality
		},
		[30] = {
			{ID = 2603, Cost = 4761, Expansion = 4}, -- Amplification
			{ID = 707, Cost = 3329, Expansion = 0}, -- Fufil's Curtailing Chant
		},
		[31] = {
			{ID = 718, Cost = 3789, Expansion = 3}, -- Agilmente's Aria of Eagles
		},
		[32] = {
			{ID = 723, Cost = 4213, Expansion = 0}, -- Cassindra's Chorus of Clarity
		},
		[33] = {
			{ID = 713, Cost = 4820, Expansion = 0}, -- Psalm of Cooling
		},
		[34] = {
			{ID = 1448, Cost = 6676, Expansion = 2}, -- Cantata of Soothing
			{ID = 721, Cost = 5382, Expansion = 3}, -- Lyssa's Solidarity of Vision
		},
		[35] = {
			{ID = 736, Cost = 5946, Expansion = 0}, -- Denon's Dissension
		},
		[36] = {
			{ID = 740, Cost = 6594, Expansion = 0}, -- Vilia's Verses of Celerity
		},
		[37] = {
			{ID = 716, Cost = 7452, Expansion = 0}, -- Psalm of Purity
		},
		[38] = {
			{ID = 743, Cost = 8256, Expansion = 0}, -- Tuyen's Chant of Flame
		},
		[39] = {
			{ID = 2604, Cost = 12301, Expansion = 4}, -- Katta's Song of Sword Dancing
			{ID = 750, Cost = 9082, Expansion = 4}, -- Solon's Bewitching Bravura
		},
		[40] = {
			{ID = 868, Cost = 12322, Expansion = 4}, -- Sionachie's Dreams
			{ID = 726, Cost = 9966, Expansion = 3}, -- Syvelian's Anti-Magic Aria
		},
		[41] = {
			{ID = 714, Cost = 11002, Expansion = 0}, -- Psalm of Mystic Shielding
		},
		[42] = {
			{ID = 702, Cost = 12203, Expansion = 0}, -- McVaxius' Berserker Crescendo
			{ID = 3567, Cost = 17338, Expansion = 4}, -- Tuyen's Chant of Disease
		},
		[43] = {
			{ID = 742, Cost = 13201, Expansion = 0}, -- Denon's Desperate Dirge
		},
		[44] = {
			{ID = 745, Cost = 14683, Expansion = 4}, -- Cassindra's Elegy
		},
		[45] = {
			{ID = 3682, Cost = 24871, Expansion = 4}, -- Aria of Asceticism
			{ID = 749, Cost = 15995, Expansion = 0}, -- Jonthan's Provocation
			{ID = 4083, Cost = 26390, Expansion = 0}, -- Rizlona's Embers
		},
		[46] = {
			{ID = 744, Cost = 17578, Expansion = 0}, -- Tuyen's Chant of Frost
		},
		[47] = {
			{ID = 748, Cost = 19023, Expansion = 0}, -- Niv's Melody of Preservation
		},
		[48] = {
			{ID = 746, Cost = 20666, Expansion = 4}, -- Selo's Chords of Cessation
		},
		[49] = {
			{ID = 2605, Cost = 28914, Expansion = 4}, -- Selo's Accelerating Chorus
			{ID = 1450, Cost = 26680, Expansion = 4}, -- Shield of Songs
		},
		[50] = {
			{ID = 1449, Cost = 29321, Expansion = 99}, -- Melody of Ervaj
			{ID = 3566, Cost = 33480, Expansion = 4}, -- Tuyen's Chant of Poison
			{ID = 747, Cost = 24910, Expansion = 0}, -- Verses of Victory
		},
		[51] = {
			{ID = 1751, Cost = 28537, Expansion = 4}, -- Largo's Assonant Binding
			{ID = 4585, Cost = 3332, Expansion = 0}, -- Resistant Discipline
			{ID = 1750, Cost = 28827, Expansion = 4}, -- Selo's Song of Travel
		},
		[52] = {
			{ID = 3681, Cost = 42710, Expansion = 4}, -- Aria of Innocence
			{ID = 2606, Cost = 36859, Expansion = 4}, -- Battlecry of the Vah Shir
			{ID = 1752, Cost = 31395, Expansion = 4}, -- Nillipus' March of the Wee
		},
		[53] = {
			{ID = 4084, Cost = 48508, Expansion = 0}, -- Rizlona's Fire
			{ID = 1754, Cost = 33997, Expansion = 4}, -- Song of Dawn
			{ID = 1753, Cost = 33424, Expansion = 4}, -- Song of Twilight
		},
		[54] = {
			{ID = 2607, Cost = 42590, Expansion = 99}, -- Elemental Chorus
			{ID = 4587, Cost = 10043, Expansion = 0}, -- Fearless Discipline
			{ID = 1758, Cost = 36620, Expansion = 4}, -- Selo's Assonant Strain
			{ID = 1757, Cost = 36919, Expansion = 4}, -- Vilia's Chorus of Celerity
		},
		[55] = {
			{ID = 8926, Cost = 78822, Expansion = 99}, -- Aura of Insight
			{ID = 1747, Cost = 39502, Expansion = 4}, -- Brusco's Bombastic Bellow
			{ID = 1759, Cost = 38956, Expansion = 4}, -- Cantata of Replenishment
			{ID = 4516, Cost = 39263, Expansion = 4}, -- Deftdance Discipline
			{ID = 1451, Cost = 42043, Expansion = 99}, -- Occlusion of Sound
		},
		[56] = {
			{ID = 2608, Cost = 48852, Expansion = 99}, -- Purifying Chorus
			{ID = 1755, Cost = 42013, Expansion = 4}, -- Song of Highsun
			{ID = 1756, Cost = 42357, Expansion = 4}, -- Song of Midnight
		},
		[57] = {
			{ID = 1761, Cost = 45641, Expansion = 4}, -- Cassindra's Insipid Ditty
			{ID = 1760, Cost = 45685, Expansion = 4}, -- McVaxius' Rousing Rondo
		},
		[58] = {
			{ID = 2609, Cost = 57009, Expansion = 99}, -- Chorus of Replenishment
			{ID = 1100, Cost = 53418, Expansion = 99}, -- Dreams of Ayonae
			{ID = 1762, Cost = 49453, Expansion = 4}, -- Jonthan's Inspiration
			{ID = 1763, Cost = 49132, Expansion = 4}, -- Niv's Harmonic
		},
		[59] = {
			{ID = 1764, Cost = 53108, Expansion = 4}, -- Denon's Bereavement
			{ID = 1765, Cost = 53441, Expansion = 4}, -- Solon's Charismatic Concord
		},
		[60] = {
			{ID = 1748, Cost = 55956, Expansion = 4}, -- Angstlich's Assonance
			{ID = 1452, Cost = 59909, Expansion = 99}, -- Composition of Ervaj
			{ID = 2936, Cost = 60229, Expansion = 99}, -- Ervaj's Lost Composition
			{ID = 4210, Cost = 79092, Expansion = 0}, -- Fufil's Diminishing Dirge
			{ID = 1749, Cost = 57009, Expansion = 4}, -- Kazumi's Note of Preservation
			{ID = 4586, Cost = 55949, Expansion = 4}, -- Puretone Discipline
			{ID = 2610, Cost = 67442, Expansion = 99}, -- Warsong of the Vah Shir
		},
		[61] = {
			{ID = 3366, Cost = 70656, Expansion = 4}, -- Saryrn's Scream of Pain
			{ID = 3361, Cost = 70761, Expansion = 99}, -- Silent Song of Quellious
			{ID = 6734, Cost = 0, Expansion = 0}, -- Song of the Storm
			{ID = 3363, Cost = 71040, Expansion = 99}, -- Tuyen's Chant of the Plague
		},
		[62] = {
			{ID = 7001, Cost = 11000, Expansion = 0}, -- Angstlich's Echo of Terror
			{ID = 3030, Cost = 75642, Expansion = 99}, -- Dreams of Thule
			{ID = 3364, Cost = 75729, Expansion = 99}, -- Druzzil's Disillusionment
			{ID = 3365, Cost = 75921, Expansion = 99}, -- Melody of Mischief
			{ID = 3374, Cost = 76346, Expansion = 99}, -- Warsong of Zek
			{ID = 3651, Cost = 76054, Expansion = 99}, -- Wind of Marr
		},
		[63] = {
			{ID = 3368, Cost = 81617, Expansion = 99}, -- Psalm of Veeshan
			{ID = 3373, Cost = 81810, Expansion = 99}, -- Tuyen's Chant of Ice
			{ID = 3370, Cost = 81249, Expansion = 99}, -- Tuyen's Chant of Venom
		},
		[64] = {
			{ID = 3371, Cost = 86579, Expansion = 99}, -- Call of the Banshee
			{ID = 3372, Cost = 87377, Expansion = 99}, -- Chorus of Marr
			{ID = 3369, Cost = 85636, Expansion = 99}, -- Dreams of Terris
			{ID = 3066, Cost = 85751, Expansion = 99}, -- Requiem of Time
			{ID = 3362, Cost = 85836, Expansion = 99}, -- Rizlona's Call of Flame
		},
		[65] = {
			{ID = 4112, Cost = 111688, Expansion = 4}, -- Call of the Muse
			{ID = 4873, Cost = 116399, Expansion = 99}, -- Dark Echo
			{ID = 4872, Cost = 116639, Expansion = 99}, -- Echo of the Trusik
			{ID = 3375, Cost = 99806, Expansion = 99}, -- Harmony of Sound
			{ID = 3376, Cost = 98763, Expansion = 99}, -- Lullaby of Morell
			{ID = 3367, Cost = 99043, Expansion = 99}, -- Tuyen's Chant of Fire
			{ID = 4871, Cost = 115777, Expansion = 99}, -- War March of the Mastruq
		},
		[66] = {
			{ID = 5372, Cost = 131034, Expansion = 99}, -- Bellow of Chaos
			{ID = 5370, Cost = 132112, Expansion = 99}, -- Luvwen's Aria of Serenity
			{ID = 5371, Cost = 130622, Expansion = 99}, -- Vulka's Chant of Disease
		},
		[67] = {
			{ID = 7002, Cost = 141546, Expansion = 99}, -- Angstlich's Wail of Panic
			{ID = 5377, Cost = 139231, Expansion = 99}, -- Cantata of Life
			{ID = 5373, Cost = 140006, Expansion = 99}, -- Luvwen's Lullaby
			{ID = 5379, Cost = 140524, Expansion = 99}, -- Vulka's Chant of Frost
			{ID = 5375, Cost = 138414, Expansion = 99}, -- Zuriki's Song of Shenanigans
		},
		[68] = {
			{ID = 8031, Cost = 164237, Expansion = 99}, -- Creeping Dreams
			{ID = 5381, Cost = 149021, Expansion = 99}, -- Dirge of Metala
			{ID = 5378, Cost = 147085, Expansion = 99}, -- Vulka's Chant of Poison
			{ID = 5376, Cost = 149539, Expansion = 99}, -- War March of Muram
			{ID = 5380, Cost = 149328, Expansion = 99}, -- Yelhun's Mystic Call
		},
		[69] = {
			{ID = 5384, Cost = 159292, Expansion = 99}, -- Chorus of Life
			{ID = 5382, Cost = 159234, Expansion = 99}, -- Eriki's Psalm of Power
			{ID = 6666, Cost = 172276, Expansion = 99}, -- Storm Blade
			{ID = 8030, Cost = 178626, Expansion = 99}, -- Thousand Blades
			{ID = 5374, Cost = 157509, Expansion = 99}, -- Verse of Vesagran
		},
		[70] = {
			{ID = 8486, Cost = 199366, Expansion = 99}, -- Arcane Aria
			{ID = 8488, Cost = 196217, Expansion = 99}, -- Aura of the Muse
			{ID = 5383, Cost = 167801, Expansion = 99}, -- Voice of the Vampire
			{ID = 5385, Cost = 164444, Expansion = 99}, -- Vulka's Chant of Flame
			{ID = 5387, Cost = 164976, Expansion = 99}, -- Vulka's Lullaby
		},
		[71] = {
			{ID = 10413, Cost = 223415, Expansion = 4}, -- Aelfric's Last Lullaby
			{ID = 10419, Cost = 218405, Expansion = 4}, -- Erollisi's Cantata
			{ID = 11873, Cost = 230963, Expansion = 4}, -- Jonthan's Mightful Caretaker
			{ID = 11874, Cost = 10000, Expansion = 99}, -- Jonthan's Mightful Caretaker Rk. II
			{ID = 11875, Cost = 10000, Expansion = 99}, -- Jonthan's Mightful Caretaker Rk. III
			{ID = 10401, Cost = 218293, Expansion = 4}, -- Whispersong of Veshma
		},
		[72] = {
			{ID = 10425, Cost = 235179, Expansion = 4}, -- Ervaj's Defensive Refrain
			{ID = 10437, Cost = 234484, Expansion = 4}, -- Song of the Dryads
			{ID = 10431, Cost = 234854, Expansion = 4}, -- Weshlu's Chillsong Aria
		},
		[73] = {
			{ID = 11879, Cost = 259731, Expansion = 4}, -- Aviak's Wondrous Warble
			{ID = 11880, Cost = 10000, Expansion = 99}, -- Aviak's Wondrous Warble Rk. II
			{ID = 11881, Cost = 10000, Expansion = 99}, -- Aviak's Wondrous Warble Rk. III
			{ID = 10443, Cost = 248756, Expansion = 4}, -- Erollisi's Chorus
			{ID = 10434, Cost = 242893, Expansion = 4}, -- Fermata of Preservation
			{ID = 10440, Cost = 247053, Expansion = 4}, -- Performer's Psalm of Pyrotechnics
		},
		[74] = {
			{ID = 10449, Cost = 256626, Expansion = 4}, -- Beckon of the Tuffein
			{ID = 10446, Cost = 258558, Expansion = 4}, -- Minohten's Purifying Panpipes
			{ID = 10455, Cost = 260322, Expansion = 4}, -- Queen Eletyl's Screech
		},
		[75] = {
			{ID = 10467, Cost = 270357, Expansion = 4}, -- Denon's Dirge of Destruction
			{ID = 11876, Cost = 291488, Expansion = 4}, -- Staccato Cadence
			{ID = 11877, Cost = 10000, Expansion = 99}, -- Staccato Cadence Rk. II
			{ID = 11878, Cost = 10000, Expansion = 99}, -- Staccato Cadence Rk. III
			{ID = 10458, Cost = 274459, Expansion = 4}, -- Staccato Rhythms
			{ID = 10461, Cost = 274020, Expansion = 4}, -- Veshma's Lively Crescendo
		},
		[76] = {
			{ID = 14003, Cost = 315743, Expansion = 4}, -- Amber's Last Lullaby
			{ID = 14060, Cost = 315960, Expansion = 4}, -- Aria of the Artist
			{ID = 14006, Cost = 320389, Expansion = 4}, -- Cantata of Restoration
			{ID = 14000, Cost = 315260, Expansion = 4}, -- Elddar's Dawnsong
			{ID = 14063, Cost = 315808, Expansion = 4}, -- Vyskudra's Chant of Disease
		},
		[77] = {
			{ID = 14018, Cost = 334748, Expansion = 4}, -- Dirge of the Darkvine
			{ID = 14012, Cost = 332534, Expansion = 4}, -- Garadell's Fatesong
			{ID = 14075, Cost = 340808, Expansion = 4}, -- Rhythm of Restoration
			{ID = 14066, Cost = 340384, Expansion = 4}, -- Zeixshi-Kar's Chant of Frost
		},
		[78] = {
			{ID = 14024, Cost = 352066, Expansion = 4}, -- Chorus of Restoration
			{ID = 14054, Cost = 349705, Expansion = 4}, -- Coldcrow's Spry Sonata
			{ID = 14057, Cost = 355827, Expansion = 99}, -- Erradien's Psalm of Potency
			{ID = 14058, Cost = 657548, Expansion = 99}, -- Erradien's Psalm of Potency Rk. II
			{ID = 14059, Cost = 3993790, Expansion = 99}, -- Erradien's Psalm of Potency Rk. III
			{ID = 14069, Cost = 357561, Expansion = 4}, -- Kildrukaun's Chant of Poison
			{ID = 14021, Cost = 358090, Expansion = 4}, -- Performer's Explosive Aria
		},
		[79] = {
			{ID = 14033, Cost = 377006, Expansion = 4}, -- Command of Queen Veneneu
			{ID = 14027, Cost = 366909, Expansion = 4}, -- Kirathas' Cleansing Clarinet
			{ID = 14078, Cost = 370148, Expansion = 99}, -- War March of Meldrath
			{ID = 14079, Cost = 752206, Expansion = 99}, -- War March of Meldrath Rk. II
			{ID = 14080, Cost = 3249580, Expansion = 99}, -- War March of Meldrath Rk. III
			{ID = 14030, Cost = 371008, Expansion = 4}, -- Yowl of the Bloodmoon
		},
		[80] = {
			{ID = 14081, Cost = 395507, Expansion = 99}, -- Arcane Anthem
			{ID = 14087, Cost = 390830, Expansion = 99}, -- Aura of the Artist
			{ID = 14088, Cost = 723376, Expansion = 99}, -- Aura of the Artist Rk. II
			{ID = 14045, Cost = 394572, Expansion = 4}, -- Denon's Dirge of Devastation
			{ID = 14039, Cost = 394672, Expansion = 99}, -- Kaerra's Spirited Crescendo
			{ID = 14040, Cost = 757762, Expansion = 99}, -- Kaerra's Spirited Crescendo Rk. II
			{ID = 14041, Cost = 3863220, Expansion = 99}, -- Kaerra's Spirited Crescendo Rk. III
			{ID = 14072, Cost = 395012, Expansion = 4}, -- Tjudawos' Chant of Flame
		},
		[81] = {
			{ID = 18045, Cost = 432145, Expansion = 99}, -- Aria of the Poet
			{ID = 18006, Cost = 426446, Expansion = 99}, -- Cantata of Rodcet
			{ID = 18084, Cost = 426376, Expansion = 99}, -- Requiem for the Lost
			{ID = 18003, Cost = 429899, Expansion = 99}, -- Serenity of Oceangreen
			{ID = 18000, Cost = 431694, Expansion = 99}, -- Silence of the Void
			{ID = 18048, Cost = 425442, Expansion = 99}, -- Trakanon's Chant of Disease
		},
		[82] = {
			{ID = 18012, Cost = 457930, Expansion = 15}, -- Dirge of the Fallen Rathe
			{ID = 18009, Cost = 458449, Expansion = 15}, -- Fatesong of the Gelidran
			{ID = 18051, Cost = 447953, Expansion = 15}, -- Gorenaire's Chant of Frost
			{ID = 18060, Cost = 457447, Expansion = 15}, -- Pulse of Rodcet
		},
		[83] = {
			{ID = 18018, Cost = 473139, Expansion = 99}, -- Chorus of Rodcet
			{ID = 18039, Cost = 469617, Expansion = 99}, -- Dance of the Dragorn
			{ID = 18042, Cost = 474334, Expansion = 99}, -- Druzzil's Psalm of Potency
			{ID = 18054, Cost = 477137, Expansion = 99}, -- Severilous' Chant of Poison
			{ID = 18015, Cost = 475644, Expansion = 99}, -- Talendor's Aria
		},
		[84] = {
			{ID = 18021, Cost = 497013, Expansion = 99}, -- Firiona's Blessed Clarinet
			{ID = 18090, Cost = 493772, Expansion = 99}, -- Mirror Melody
			{ID = 18027, Cost = 500539, Expansion = 99}, -- Slumber of the Mindshear
			{ID = 18024, Cost = 493598, Expansion = 99}, -- Voice of the Mindshear
			{ID = 18063, Cost = 494781, Expansion = 99}, -- War March of Brekt
		},
		[85] = {
			{ID = 18072, Cost = 518422, Expansion = 99}, -- Aura of the Poet
			{ID = 18036, Cost = 525114, Expansion = 99}, -- Denon's Dirge of Discord
			{ID = 18057, Cost = 521986, Expansion = 99}, -- Talendor's Chant of Flame
		},
		[86] = {
			{ID = 25956, Cost = 606421, Expansion = 99}, -- Aria of Amelioration
			{ID = 25962, Cost = 593990, Expansion = 99}, -- Lullaby of the Lost
			{ID = 25965, Cost = 591845, Expansion = 99}, -- Pulse of Renewal
			{ID = 25968, Cost = 606056, Expansion = 99}, -- Rumbling Barrier
			{ID = 25974, Cost = 598230, Expansion = 99}, -- Shiverback's Chant of Disease
			{ID = 25977, Cost = 596774, Expansion = 99}, -- Silence of the Dreamer
			{ID = 25980, Cost = 602922, Expansion = 99}, -- Song of Recalcitrance
		},
		[87] = {
			{ID = 25983, Cost = 632206, Expansion = 99}, -- Aura of Renewal
			{ID = 25989, Cost = 637031, Expansion = 99}, -- Dirge of Dreams
			{ID = 25992, Cost = 619566, Expansion = 99}, -- Echo of Renewal
			{ID = 25998, Cost = 626939, Expansion = 99}, -- Fatesong of Fergar
			{ID = 26001, Cost = 634612, Expansion = 99}, -- Fergar's Chant of Frost
			{ID = 26004, Cost = 630503, Expansion = 99}, -- Sionachie's Sympathetic Psalm
		},
		[88] = {
			{ID = 26010, Cost = 654861, Expansion = 99}, -- Alleviating Accelerando
			{ID = 26013, Cost = 665096, Expansion = 99}, -- Chorus of Renewal
			{ID = 26016, Cost = 651537, Expansion = 99}, -- Lyrin's Psalm of Potency
			{ID = 26025, Cost = 660548, Expansion = 99}, -- Sionachie's Spry Sonata
			{ID = 26028, Cost = 663948, Expansion = 99}, -- Sotor's Aria
			{ID = 26031, Cost = 661937, Expansion = 99}, -- Spinechiller's Chant of Poison
		},
		[89] = {
			{ID = 26019, Cost = 695172, Expansion = 99}, -- Noira's Song of Suffering
			{ID = 26034, Cost = 692596, Expansion = 99}, -- Slumber of Sionachie
			{ID = 26037, Cost = 683556, Expansion = 99}, -- Voice of Sionachie
			{ID = 26040, Cost = 689627, Expansion = 99}, -- War March of Dagda
		},
		[90] = {
			{ID = 26043, Cost = 710602, Expansion = 99}, -- Arcane Chorus
			{ID = 26052, Cost = 712293, Expansion = 99}, -- Aura of the Composer
			{ID = 26058, Cost = 716665, Expansion = 99}, -- Denon's Dirge of Disruption
			{ID = 26061, Cost = 717268, Expansion = 99}, -- Echo of the Composer
			{ID = 26067, Cost = 728422, Expansion = 99}, -- Lyrin's Insult
			{ID = 26070, Cost = 726260, Expansion = 99}, -- Lyrin's Spiteful Lyric
			{ID = 26076, Cost = 720340, Expansion = 99}, -- Lyssa's Lively Crescendo
			{ID = 26082, Cost = 723060, Expansion = 99}, -- Sotor's Chant of Flame
			{ID = 26085, Cost = 717473, Expansion = 99}, -- Wave of Dreams
		},
		[91] = {
			{ID = 29057, Cost = 1185168, Expansion = 99}, -- Aria of Impeccability
			{ID = 29060, Cost = 1182885, Expansion = 99}, -- Aria of the Orator
			{ID = 29063, Cost = 1182956, Expansion = 99}, -- Lullaby of the Forlorn
			{ID = 29066, Cost = 1180621, Expansion = 99}, -- Pulse of Lunanyn
			{ID = 29078, Cost = 1184786, Expansion = 99}, -- Silence of the Windsong
			{ID = 29069, Cost = 1184848, Expansion = 99}, -- Thunderous Barrier
			{ID = 29075, Cost = 1184529, Expansion = 99}, -- Wasinai's Chant of Disease
		},
		[92] = {
			{ID = 29081, Cost = 1195476, Expansion = 99}, -- Aura of Lunanyn
			{ID = 29087, Cost = 1195190, Expansion = 99}, -- Echo of Lunanyn
			{ID = 29096, Cost = 1193770, Expansion = 99}, -- Fatesong of Illdaera
			{ID = 29099, Cost = 1194162, Expansion = 99}, -- Kalbrok's Chant of Frost
			{ID = 29093, Cost = 1195197, Expansion = 99}, -- Lapsing Lullaby
		},
		[93] = {
			{ID = 29102, Cost = 1207166, Expansion = 99}, -- Assuaging Accelerando
			{ID = 29105, Cost = 1209532, Expansion = 99}, -- Chorus of Lunanyn
			{ID = 29123, Cost = 1209718, Expansion = 99}, -- Daevan's Aria
			{ID = 29126, Cost = 1209502, Expansion = 99}, -- Hiqork's Chant of Poison
			{ID = 29111, Cost = 1211074, Expansion = 99}, -- Ryken's Reckless Renewal
			{ID = 29120, Cost = 1208422, Expansion = 99}, -- Terasal's Spry Sonata
			{ID = 29108, Cost = 1207255, Expansion = 99}, -- Wasinai's Psalm of Potency
		},
		[94] = {
			{ID = 29114, Cost = 1219553, Expansion = 99}, -- Hykast's Song of Suffering
			{ID = 29132, Cost = 1221063, Expansion = 99}, -- Oratory of Invitation
			{ID = 29129, Cost = 1220999, Expansion = 99}, -- Oratory of Opposition
			{ID = 29135, Cost = 1220257, Expansion = 99}, -- Slumber of Kolain
			{ID = 29138, Cost = 1223678, Expansion = 99}, -- Voice of Kolain
			{ID = 29141, Cost = 1222338, Expansion = 99}, -- War March of Illdaera
		},
		[95] = {
			{ID = 29144, Cost = 1233777, Expansion = 99}, -- Arcane Address
			{ID = 29153, Cost = 1233443, Expansion = 99}, -- Aura of the Orator
			{ID = 29180, Cost = 1236491, Expansion = 99}, -- Daevan's Chant of Flame
			{ID = 29159, Cost = 1235935, Expansion = 99}, -- Echo of the Orator
			{ID = 29165, Cost = 1236144, Expansion = 99}, -- Hykast's Insult
			{ID = 29168, Cost = 1235378, Expansion = 99}, -- Hykast's Spiteful Lyric
			{ID = 29174, Cost = 1236081, Expansion = 99}, -- Kolain's Lively Crescendo
		},
	},
	[Class.ROGUE] = {
		[1] = {
			{ID = 5225, Cost = 20, Expansion = 0}, -- Throw Stone
		},
		[5] = {
			{ID = 25060, Cost = 28, Expansion = 4}, -- Elbow Strike
		},
		[10] = {
			{ID = 4721, Cost = 92, Expansion = 0}, -- Focused Will Discipline
		},
		[20] = {
			{ID = 4659, Cost = 777, Expansion = 0}, -- Sneak Attack
		},
		[30] = {
			{ID = 4585, Cost = 3332, Expansion = 0}, -- Resistant Discipline
		},
		[40] = {
			{ID = 4587, Cost = 10043, Expansion = 0}, -- Fearless Discipline
		},
		[52] = {
			{ID = 4685, Cost = 31463, Expansion = 0}, -- Thief's Vengeance
		},
		[53] = {
			{ID = 4673, Cost = 33651, Expansion = 0}, -- Counterattack Discipline
		},
		[54] = {
			{ID = 4505, Cost = 36858, Expansion = 0}, -- Deadeye Discipline
		},
		[55] = {
			{ID = 4515, Cost = 39677, Expansion = 0}, -- Nimble Discipline
			{ID = 8922, Cost = 80068, Expansion = 99}, -- Poison Spurs Trap
		},
		[57] = {
			{ID = 4517, Cost = 45747, Expansion = 0}, -- Kinesthetics Discipline
		},
		[58] = {
			{ID = 4677, Cost = 48957, Expansion = 0}, -- Blinding Speed Discipline
		},
		[59] = {
			{ID = 4676, Cost = 53142, Expansion = 0}, -- Duelist Discipline
		},
		[61] = {
			{ID = 6751, Cost = 0, Expansion = 0}, -- Rogue's Ploy
		},
		[63] = {
			{ID = 4686, Cost = 80577, Expansion = 0}, -- Assassin's Strike
			{ID = 4694, Cost = 80394, Expansion = 0}, -- Deadly Precision Discipline
			{ID = 4687, Cost = 80231, Expansion = 0}, -- Healing Will Discipline
		},
		[65] = {
			{ID = 5017, Cost = 116407, Expansion = 99}, -- Kyv Strike
			{ID = 4695, Cost = 99852, Expansion = 0}, -- Twisted Chance Discipline
		},
		[66] = {
			{ID = 6198, Cost = 129852, Expansion = 99}, -- Imperceptible Discipline
		},
		[68] = {
			{ID = 6196, Cost = 150241, Expansion = 99}, -- Deadly Aim Discipline
			{ID = 8001, Cost = 165336, Expansion = 99}, -- Thief's Eyes
		},
		[69] = {
			{ID = 6726, Cost = 171333, Expansion = 99}, -- Assassin's Feint
			{ID = 6174, Cost = 154913, Expansion = 99}, -- Daggerfall
		},
		[70] = {
			{ID = 6197, Cost = 166984, Expansion = 99}, -- Frenzied Stabbing Discipline
			{ID = 8471, Cost = 196218, Expansion = 99}, -- Poison Spikes Trap
			{ID = 8470, Cost = 199085, Expansion = 99}, -- Razorarc
		},
		[71] = {
			{ID = 10883, Cost = 218679, Expansion = 99}, -- Blinding Flash
		},
		[72] = {
			{ID = 11913, Cost = 246051, Expansion = 13}, -- Second Wind
			{ID = 11914, Cost = 10000, Expansion = 99}, -- Second Wind Rk. II
			{ID = 11915, Cost = 10000, Expansion = 99}, -- Second Wind Rk. III
			{ID = 10889, Cost = 232920, Expansion = 99}, -- Spelldodge Discipline
		},
		[73] = {
			{ID = 10892, Cost = 243234, Expansion = 99}, -- Guide of Toxicity
		},
		[74] = {
			{ID = 10895, Cost = 256251, Expansion = 99}, -- Lithe Discipline
			{ID = 11925, Cost = 275197, Expansion = 99}, -- Pinpoint Vulnerability
			{ID = 11926, Cost = 10000, Expansion = 99}, -- Pinpoint Vulnerability Rk. II
		},
		[75] = {
			{ID = 10898, Cost = 276409, Expansion = 99}, -- Assassin Discipline
		},
		[76] = {
			{ID = 15097, Cost = 317153, Expansion = 14}, -- Blinding Flare
			{ID = 15118, Cost = 318858, Expansion = 14}, -- Waylay
		},
		[77] = {
			{ID = 15121, Cost = 336191, Expansion = 99}, -- Jugular Slash
			{ID = 14192, Cost = 335076, Expansion = 14}, -- Third Wind
		},
		[78] = {
			{ID = 15103, Cost = 357126, Expansion = 99}, -- Docent of Toxicity
		},
		[79] = {
			{ID = 15115, Cost = 372484, Expansion = 99}, -- Pinpoint Weaknesses
		},
		[80] = {
			{ID = 15128, Cost = 2329626, Expansion = 99}, -- Fadelure Rk. II
			{ID = 15129, Cost = 9997770, Expansion = 99}, -- Fadelure Rk. III
			{ID = 15134, Cost = 2014028, Expansion = 99}, -- Swiftblade Rk. II
		},
		[81] = {
			{ID = 19265, Cost = 429858, Expansion = 99}, -- Ambush
			{ID = 19244, Cost = 433898, Expansion = 99}, -- Blinding Spark
		},
		[82] = {
			{ID = 18213, Cost = 449224, Expansion = 15}, -- Fourth Wind
			{ID = 19268, Cost = 452158, Expansion = 15}, -- Jugular Slice
		},
		[83] = {
			{ID = 19247, Cost = 478844, Expansion = 99}, -- Bleed
			{ID = 19250, Cost = 472322, Expansion = 99}, -- Lesson in Toxicity
		},
		[84] = {
			{ID = 19262, Cost = 498161, Expansion = 99}, -- Pinpoint Vitals
		},
		[85] = {
			{ID = 19274, Cost = 528113, Expansion = 99}, -- Smokescreen
		},
		[86] = {
			{ID = 26097, Cost = 593183, Expansion = 99}, -- Assail
			{ID = 26100, Cost = 608539, Expansion = 99}, -- Blinding Glare
			{ID = 26103, Cost = 598266, Expansion = 99}, -- Easy Mark
			{ID = 25000, Cost = 605412, Expansion = 17}, -- Respite
		},
		[87] = {
			{ID = 25003, Cost = 631864, Expansion = 17}, -- Fifth Wind
			{ID = 26115, Cost = 632143, Expansion = 99}, -- Jugular Sever
			{ID = 25006, Cost = 622942, Expansion = 99}, -- Weapon Affiliation
		},
		[88] = {
			{ID = 26118, Cost = 659658, Expansion = 99}, -- Instruction in Toxicity
			{ID = 26124, Cost = 656582, Expansion = 99}, -- Vigorous Dagger-Strike
			{ID = 26127, Cost = 655444, Expansion = 99}, -- Wound
		},
		[89] = {
			{ID = 26130, Cost = 689444, Expansion = 99}, -- Fleet-Footed Discipline
			{ID = 26133, Cost = 692386, Expansion = 99}, -- Misdirection
			{ID = 26139, Cost = 692960, Expansion = 99}, -- Pinpoint Flaws
		},
		[90] = {
			{ID = 26142, Cost = 711117, Expansion = 99}, -- Battery
			{ID = 26148, Cost = 719359, Expansion = 99}, -- Daggerswipe
			{ID = 26151, Cost = 716712, Expansion = 99}, -- Reckless Escape
			{ID = 26158, Cost = 709474, Expansion = 99}, -- Smokeshroud
		},
		[91] = {
			{ID = 29195, Cost = 1181557, Expansion = 99}, -- Accost
			{ID = 29198, Cost = 1183491, Expansion = 99}, -- Blinding Gleam
		},
		[92] = {
			{ID = 29207, Cost = 1197418, Expansion = 99}, -- Distraction
			{ID = 29210, Cost = 1196024, Expansion = 99}, -- Jugular Gash
			{ID = 28003, Cost = 1194317, Expansion = 99}, -- Sixth Wind
		},
	},
	[Class.SHAMAN] = {
		[1] = {
			{ID = 93, Cost = 20, Expansion = 0}, -- Burst of Flame
			{ID = 213, Cost = 20, Expansion = 0}, -- Cure Disease
			{ID = 266, Cost = 20, Expansion = 0}, -- Dexterous Aura
			{ID = 225, Cost = 20, Expansion = 0}, -- Endure Cold
			{ID = 201, Cost = 20, Expansion = 0}, -- Flash of Light
			{ID = 267, Cost = 20, Expansion = 0}, -- Inner Fire
			{ID = 200, Cost = 20, Expansion = 0}, -- Minor Healing
			{ID = 40, Cost = 20, Expansion = 0}, -- Strengthen
			{ID = 205, Cost = 20, Expansion = 0}, -- True North
		},
		[2] = {
			{ID = 203, Cost = 20, Expansion = 0}, -- Cure Poison
			{ID = 272, Cost = 20, Expansion = 0}, -- Spirit Pouch
			{ID = 211, Cost = 20, Expansion = 0}, -- Summon Drink
		},
		[3] = {
			{ID = 269, Cost = 22, Expansion = 0}, -- Feet like Cat
			{ID = 274, Cost = 22, Expansion = 0}, -- Scale Skin
		},
		[4] = {
			{ID = 271, Cost = 24, Expansion = 0}, -- Fleeting Fury
			{ID = 275, Cost = 24, Expansion = 0}, -- Frost Rift
			{ID = 75, Cost = 24, Expansion = 0}, -- Sicken
		},
		[5] = {
			{ID = 270, Cost = 28, Expansion = 0}, -- Drowsy
			{ID = 224, Cost = 20, Expansion = 0}, -- Endure Fire
			{ID = 36, Cost = 24, Expansion = 0}, -- Gate
		},
		[6] = {
			{ID = 276, Cost = 34, Expansion = 0}, -- Serpent Sight
			{ID = 279, Cost = 34, Expansion = 0}, -- Spirit of Bear
			{ID = 50, Cost = 20, Expansion = 0}, -- Summon Food
		},
		[7] = {
			{ID = 212, Cost = 22, Expansion = 0}, -- Cure Blindness
			{ID = 238, Cost = 20, Expansion = 0}, -- Sense Animals
			{ID = 79, Cost = 42, Expansion = 0}, -- Spirit Sight
		},
		[8] = {
			{ID = 226, Cost = 55, Expansion = 0}, -- Endure Disease
			{ID = 277, Cost = 55, Expansion = 0}, -- Tainted Breath
			{ID = 2521, Cost = 118, Expansion = 0}, -- Talisman of the Beast
		},
		[9] = {
			{ID = 17, Cost = 24, Expansion = 0}, -- Light Healing
			{ID = 4056, Cost = 241, Expansion = 0}, -- Remove Minor Curse
			{ID = 278, Cost = 71, Expansion = 0}, -- Spirit of Wolf
		},
		[10] = {
			{ID = 255, Cost = 55, Expansion = 0}, -- Invisibility versus Animals
			{ID = 261, Cost = 92, Expansion = 0}, -- Levitate
			{ID = 284, Cost = 93, Expansion = 0}, -- Spirit of Snake
		},
		[11] = {
			{ID = 280, Cost = 118, Expansion = 0}, -- Burst of Strength
			{ID = 227, Cost = 34, Expansion = 0}, -- Endure Poison
			{ID = 283, Cost = 120, Expansion = 0}, -- Turtle Skin
		},
		[12] = {
			{ID = 281, Cost = 152, Expansion = 0}, -- Disempower
			{ID = 86, Cost = 34, Expansion = 0}, -- Enduring Breath
			{ID = 230, Cost = 22, Expansion = 0}, -- Root
		},
		[13] = {
			{ID = 4261, Cost = 447, Expansion = 0}, -- Reebo's Lesser Augury
			{ID = 505, Cost = 194, Expansion = 0}, -- Walking Sleep
		},
		[14] = {
			{ID = 35, Cost = 93, Expansion = 0}, -- Bind Affinity
			{ID = 4285, Cost = 782, Expansion = 0}, -- Reebo's Lesser Cleansing
			{ID = 4273, Cost = 663, Expansion = 0}, -- Reebo's Lesser Exorcism
			{ID = 282, Cost = 243, Expansion = 0}, -- Spirit Strike
		},
		[15] = {
			{ID = 365, Cost = 305, Expansion = 0}, -- Infectious Cloud
			{ID = 345, Cost = 300, Expansion = 0}, -- Shrink
		},
		[16] = {
			{ID = 308, Cost = 375, Expansion = 0}, -- Frenzy
			{ID = 2522, Cost = 650, Expansion = 0}, -- Grow
			{ID = 3583, Cost = 373, Expansion = 0}, -- Tiny Companion
		},
		[17] = {
			{ID = 526, Cost = 455, Expansion = 0}, -- Insidious Fever
			{ID = 580, Cost = 451, Expansion = 0}, -- Vision
		},
		[18] = {
			{ID = 110, Cost = 553, Expansion = 0}, -- Malaise
			{ID = 148, Cost = 543, Expansion = 0}, -- Spirit of Cat
			{ID = 147, Cost = 541, Expansion = 0}, -- Spirit Strength
		},
		[19] = {
			{ID = 511, Cost = 654, Expansion = 0}, -- Affliction
			{ID = 48, Cost = 43, Expansion = 0}, -- Cancel Magic
			{ID = 228, Cost = 373, Expansion = 0}, -- Endure Magic
			{ID = 12, Cost = 92, Expansion = 0}, -- Healing
		},
		[20] = {
			{ID = 640, Cost = 773, Expansion = 0}, -- Creeping Vision
			{ID = 649, Cost = 773, Expansion = 0}, -- Protect
		},
		[21] = {
			{ID = 220, Cost = 926, Expansion = 0}, -- Spirit of Cheetah
			{ID = 146, Cost = 916, Expansion = 0}, -- Spirit of Monkey
			{ID = 149, Cost = 929, Expansion = 0}, -- Spirit of Ox
		},
		[22] = {
			{ID = 96, Cost = 1087, Expansion = 0}, -- Counteract Disease
			{ID = 437, Cost = 1100, Expansion = 0}, -- Poison Storm
			{ID = 424, Cost = 1274, Expansion = 0}, -- Scale of Wolf
		},
		[23] = {
			{ID = 265, Cost = 1288, Expansion = 0}, -- Cannibalize
			{ID = 508, Cost = 1269, Expansion = 0}, -- Frost Strike
			{ID = 4262, Cost = 2260, Expansion = 0}, -- Reebo's Augury
			{ID = 144, Cost = 1265, Expansion = 0}, -- Regeneration
		},
		[24] = {
			{ID = 434, Cost = 1488, Expansion = 0}, -- Envenomed Breath
			{ID = 4286, Cost = 3342, Expansion = 0}, -- Reebo's Cleansing
			{ID = 4274, Cost = 2916, Expansion = 0}, -- Reebo's Exorcism
			{ID = 4057, Cost = 10031, Expansion = 0}, -- Remove Lesser Curse
			{ID = 61, Cost = 1483, Expansion = 0}, -- Resist Cold
		},
		[25] = {
			{ID = 245, Cost = 192, Expansion = 0}, -- Befriend Animal
			{ID = 2523, Cost = 2596, Expansion = 0}, -- Form of the Bear
			{ID = 349, Cost = 1731, Expansion = 0}, -- Rising Dexterity
		},
		[26] = {
			{ID = 95, Cost = 1100, Expansion = 0}, -- Counteract Poison
			{ID = 39, Cost = 300, Expansion = 0}, -- Quickness
			{ID = 46, Cost = 1951, Expansion = 0}, -- Ultravision
		},
		[27] = {
			{ID = 42, Cost = 24, Expansion = 0}, -- Invisibility
			{ID = 60, Cost = 779, Expansion = 0}, -- Resist Fire
			{ID = 506, Cost = 2271, Expansion = 0}, -- Tagar's Insects
		},
		[28] = {
			{ID = 150, Cost = 2599, Expansion = 0}, -- Alluring Aura
			{ID = 151, Cost = 2583, Expansion = 0}, -- Raging Strength
		},
		[29] = {
			{ID = 15, Cost = 783, Expansion = 0}, -- Greater Healing
			{ID = 1885, Cost = 2972, Expansion = 0}, -- Imbue Amber
			{ID = 1895, Cost = 2933, Expansion = 0}, -- Imbue Diamond
			{ID = 1884, Cost = 2910, Expansion = 0}, -- Imbue Ivory
			{ID = 1891, Cost = 2937, Expansion = 0}, -- Imbue Jade
			{ID = 1886, Cost = 2981, Expansion = 0}, -- Imbue Sapphire
			{ID = 162, Cost = 1689, Expansion = 0}, -- Listless Power
			{ID = 3994, Cost = 2936, Expansion = 0}, -- Mass Imbue Amber
			{ID = 3997, Cost = 2970, Expansion = 4}, -- Mass Imbue Diamond
			{ID = 4000, Cost = 2973, Expansion = 4}, -- Mass Imbue Ivory
			{ID = 4001, Cost = 2965, Expansion = 4}, -- Mass Imbue Jade
			{ID = 4007, Cost = 2919, Expansion = 4}, -- Mass Imbue Sapphire
			{ID = 4054, Cost = 5901, Expansion = 0}, -- Spirit of the Shrew
		},
		[30] = {
			{ID = 326, Cost = 3323, Expansion = 0}, -- Fury
			{ID = 161, Cost = 3342, Expansion = 0}, -- Health
			{ID = 63, Cost = 3358, Expansion = 0}, -- Resist Disease
		},
		[31] = {
			{ID = 160, Cost = 3808, Expansion = 0}, -- Nimble
			{ID = 31, Cost = 3811, Expansion = 0}, -- Scourge
			{ID = 431, Cost = 3814, Expansion = 0}, -- Shifting Shield
		},
		[32] = {
			{ID = 260, Cost = 1278, Expansion = 0}, -- Charm Animals
			{ID = 164, Cost = 4207, Expansion = 0}, -- Companion Spirit
			{ID = 111, Cost = 4257, Expansion = 0}, -- Malaisement
			{ID = 167, Cost = 5999, Expansion = 0}, -- Talisman of Tnarg
		},
		[33] = {
			{ID = 131, Cost = 457, Expansion = 0}, -- Instill
			{ID = 4263, Cost = 7371, Expansion = 0}, -- Reebo's Greater Augury
			{ID = 509, Cost = 4803, Expansion = 0}, -- Winter's Roar
		},
		[34] = {
			{ID = 4092, Cost = 9915, Expansion = 0}, -- Curse
			{ID = 4055, Cost = 36826, Expansion = 0}, -- Pack Shrew
			{ID = 4287, Cost = 9981, Expansion = 0}, -- Reebo's Greater Cleansing
			{ID = 4275, Cost = 9036, Expansion = 0}, -- Reebo's Greater Exorcism
			{ID = 1427, Cost = 6654, Expansion = 0}, -- Shock of the Tainted
		},
		[35] = {
			{ID = 62, Cost = 3332, Expansion = 0}, -- Resist Poison
			{ID = 1428, Cost = 7316, Expansion = 0}, -- Tumultuous Strength
		},
		[36] = {
			{ID = 384, Cost = 6641, Expansion = 0}, -- Assiduous Vision
			{ID = 438, Cost = 8112, Expansion = 0}, -- Gale of Poison
			{ID = 2524, Cost = 9090, Expansion = 0}, -- Spirit of Bih`Li
		},
		[37] = {
			{ID = 155, Cost = 7393, Expansion = 0}, -- Glamour
			{ID = 435, Cost = 5275, Expansion = 0}, -- Venom of the Snake
			{ID = 577, Cost = 7308, Expansion = 0}, -- Vigilant Spirit
		},
		[38] = {
			{ID = 754, Cost = 8283, Expansion = 0}, -- Cannibalize II
			{ID = 527, Cost = 8229, Expansion = 0}, -- Insidious Malady
			{ID = 2946, Cost = 11026, Expansion = 0}, -- Remove Curse
			{ID = 507, Cost = 8167, Expansion = 0}, -- Togor's Insects
		},
		[39] = {
			{ID = 134, Cost = 5407, Expansion = 0}, -- Blinding Luminance
			{ID = 145, Cost = 9068, Expansion = 0}, -- Chloroplast
			{ID = 152, Cost = 9061, Expansion = 0}, -- Deftness
			{ID = 153, Cost = 9127, Expansion = 0}, -- Furious Strength
		},
		[40] = {
			{ID = 1285, Cost = 3719, Expansion = 0}, -- Summon Companion
			{ID = 168, Cost = 10090, Expansion = 0}, -- Talisman of Altuna
		},
		[41] = {
			{ID = 154, Cost = 11082, Expansion = 0}, -- Agility
			{ID = 165, Cost = 11151, Expansion = 0}, -- Guardian Spirit
			{ID = 163, Cost = 10091, Expansion = 0}, -- Incapacitate
		},
		[42] = {
			{ID = 170, Cost = 930, Expansion = 0}, -- Alacrity
			{ID = 1429, Cost = 14637, Expansion = 0}, -- Blast of Poison
			{ID = 389, Cost = 12043, Expansion = 0}, -- Guardian
		},
		[43] = {
			{ID = 4093, Cost = 22544, Expansion = 0}, -- Odium
			{ID = 64, Cost = 7374, Expansion = 0}, -- Resist Magic
			{ID = 158, Cost = 13250, Expansion = 0}, -- Stamina
		},
		[44] = {
			{ID = 510, Cost = 14559, Expansion = 0}, -- Blizzard Blast
			{ID = 49, Cost = 4197, Expansion = 0}, -- Nullify Magic
			{ID = 3694, Cost = 22667, Expansion = 0}, -- Stoicism
		},
		[45] = {
			{ID = 166, Cost = 15799, Expansion = 0}, -- Frenzied Spirit
			{ID = 337, Cost = 15993, Expansion = 0}, -- Rage
		},
		[46] = {
			{ID = 2525, Cost = 22688, Expansion = 0}, -- Harnessing of Spirit
			{ID = 159, Cost = 17619, Expansion = 0}, -- Strength
		},
		[47] = {
			{ID = 156, Cost = 19192, Expansion = 0}, -- Charisma
			{ID = 3573, Cost = 26805, Expansion = 0}, -- Shock of Venom
		},
		[48] = {
			{ID = 98, Cost = 20869, Expansion = 0}, -- Abolish Disease
			{ID = 157, Cost = 20830, Expansion = 0}, -- Dexterity
			{ID = 112, Cost = 20764, Expansion = 0}, -- Malosi
		},
		[49] = {
			{ID = 436, Cost = 22534, Expansion = 0}, -- Envenomed Bolt
			{ID = 3454, Cost = 31144, Expansion = 0}, -- Infusion of Spirit
			{ID = 32, Cost = 22801, Expansion = 0}, -- Plague
		},
		[50] = {
			{ID = 6906, Cost = 48639, Expansion = 0}, -- Spirit of the Puma
			{ID = 1430, Cost = 29158, Expansion = 0}, -- Spirit Quickening
			{ID = 1570, Cost = 26639, Expansion = 4}, -- Talisman of Jasinth
			{ID = 6877, Cost = 12297, Expansion = 1}, -- Kragg's Salve
		},
		[51] = {
			{ID = 2881, Cost = 30946, Expansion = 0}, -- Everlasting Breath
			{ID = 132, Cost = 9141, Expansion = 0}, -- Immobilize
			{ID = 2894, Cost = 31257, Expansion = 0}, -- Levitation
			{ID = 9, Cost = 3346, Expansion = 0}, -- Superior Healing
			{ID = 1588, Cost = 28637, Expansion = 0}, -- Turgur's Insects
		},
		[52] = {
			{ID = 3842, Cost = 42751, Expansion = 99}, -- Blood of Nadox
			{ID = 2526, Cost = 36329, Expansion = 99}, -- Disinfecting Aura
			{ID = 21399, Cost = 331420, Expansion = 4}, -- Eradicate Disease
			{ID = 1573, Cost = 31046, Expansion = 99}, -- Insidious Decay
			{ID = 1819, Cost = 36603, Expansion = 99}, -- Primal Essence
			{ID = 1568, Cost = 31130, Expansion = 0}, -- Regrowth
			{ID = 1554, Cost = 31505, Expansion = 4}, -- Spirit of Scale
		},
		[53] = {
			{ID = 1592, Cost = 34039, Expansion = 4}, -- Cripple
			{ID = 1594, Cost = 33883, Expansion = 0}, -- Deliriously Nimble
			{ID = 1571, Cost = 34046, Expansion = 4}, -- Talisman of Shadoo
		},
		[54] = {
			{ID = 4094, Cost = 52266, Expansion = 0}, -- Anathema
			{ID = 3574, Cost = 45875, Expansion = 4}, -- Blast of Venom
			{ID = 1572, Cost = 36070, Expansion = 0}, -- Cannibalize III
			{ID = 21400, Cost = 311127, Expansion = 4}, -- Eradicate Curse
			{ID = 1586, Cost = 36953, Expansion = 0}, -- Ice Strike
			{ID = 2527, Cost = 42556, Expansion = 0}, -- Plague of Insects
			{ID = 2880, Cost = 0, Expansion = 0}, -- Remove Greater Curse
			{ID = 1595, Cost = 36698, Expansion = 0}, -- Riotous Health
			{ID = 1584, Cost = 36537, Expansion = 99}, -- Shroud of the Spirits
		},
		[55] = {
			{ID = 1526, Cost = 33468, Expansion = 1}, -- Annul Magic
			{ID = 1290, Cost = 42273, Expansion = 0}, -- Chloroblast
			{ID = 1431, Cost = 42367, Expansion = 99}, -- Form of the Great Bear
			{ID = 8930, Cost = 79638, Expansion = 99}, -- Idol of Malo
			{ID = 1574, Cost = 39023, Expansion = 99}, -- Spirit of the Howler
			{ID = 1585, Cost = 65432, Expansion = 0}, -- Talisman of Kragg
			{ID = 1587, Cost = 39766, Expansion = 99}, -- Torrent of Poison
		},
		[56] = {
			{ID = 1575, Cost = 42235, Expansion = 4}, -- Acumen
			{ID = 1590, Cost = 41877, Expansion = 99}, -- Bane of Nife
			{ID = 171, Cost = 9010, Expansion = 0}, -- Celerity
			{ID = 21398, Cost = 299595, Expansion = 4}, -- Eradicate Poison
			{ID = 133, Cost = 16013, Expansion = 4}, -- Paralyzing Earth
			{ID = 2528, Cost = 49325, Expansion = 99}, -- Regrowth of Dar Khura
		},
		[57] = {
			{ID = 1577, Cost = 45718, Expansion = 1}, -- Malosini
			{ID = 1593, Cost = 45651, Expansion = 0}, -- Maniacal Strength
			{ID = 6907, Cost = 11000, Expansion = 0}, -- Spirit of the Jaguar
			{ID = 1580, Cost = 45100, Expansion = 99}, -- Talisman of the Brute
			{ID = 1579, Cost = 45177, Expansion = 99}, -- Talisman of the Cat
		},
		[58] = {
			{ID = 2886, Cost = 57317, Expansion = 99}, -- Acumen of Dar Khura
			{ID = 1332, Cost = 48577, Expansion = 99}, -- Cannibalize IV
			{ID = 2435, Cost = 56944, Expansion = 0}, -- Kragg's Mending
			{ID = 1596, Cost = 48438, Expansion = 0}, -- Mortal Deftness
			{ID = 2529, Cost = 56323, Expansion = 99}, -- Talisman of Epuration
			{ID = 1581, Cost = 49248, Expansion = 99}, -- Talisman of the Rhino
			{ID = 1582, Cost = 48751, Expansion = 99}, -- Talisman of the Serpent
			{ID = 1589, Cost = 48465, Expansion = 99}, -- Tigir's Insects
		},
		[59] = {
			{ID = 4589, Cost = 64266, Expansion = 4}, -- Incarnate Anew
			{ID = 1591, Cost = 52251, Expansion = 99}, -- Pox of Bertoxxulous
			{ID = 1583, Cost = 52320, Expansion = 99}, -- Talisman of the Raptor
			{ID = 1597, Cost = 53426, Expansion = 0}, -- Unfailing Reverence
			{ID = 1599, Cost = 52737, Expansion = 99}, -- Voice of the Berserker
		},
		[60] = {
			{ID = 1598, Cost = 57160, Expansion = 99}, -- Avatar
			{ID = 1432, Cost = 60780, Expansion = 99}, -- Focus of Spirit
			{ID = 2530, Cost = 66449, Expansion = 99}, -- Khura's Focusing
			{ID = 1578, Cost = 56768, Expansion = 99}, -- Malo
			{ID = 1377, Cost = 56948, Expansion = 99}, -- Primal Avatar
			{ID = 1576, Cost = 57078, Expansion = 99}, -- Torpor
		},
		[61] = {
			{ID = 3378, Cost = 70735, Expansion = 99}, -- Agility of the Wrulan
			{ID = 3380, Cost = 70326, Expansion = 99}, -- Cloud of Grummus
			{ID = 3433, Cost = 70077, Expansion = 4}, -- Replenishment
			{ID = 3379, Cost = 70083, Expansion = 99}, -- Spear of Torment
			{ID = 6735, Cost = 0, Expansion = 0}, -- Spirit of the Leopard
			{ID = 3377, Cost = 70336, Expansion = 99}, -- True Spirit
		},
		[62] = {
			{ID = 3381, Cost = 75803, Expansion = 99}, -- Ancestral Guard
			{ID = 3382, Cost = 74868, Expansion = 99}, -- Endurance of the Boar
			{ID = 3235, Cost = 76152, Expansion = 99}, -- Focus of Soul
			{ID = 3195, Cost = 71159, Expansion = 4}, -- Greater Immobilize
			{ID = 3595, Cost = 69844, Expansion = 4}, -- Imbue Justice
			{ID = 3384, Cost = 74881, Expansion = 99}, -- Talisman of the Tribunal
			{ID = 3383, Cost = 75536, Expansion = 99}, -- Talisman of the Wrulan
			{ID = 3233, Cost = 76515, Expansion = 99}, -- Tnarg's Mending
		},
		[63] = {
			{ID = 3441, Cost = 80685, Expansion = 4}, -- Blessing of Replenishment
			{ID = 3591, Cost = 71145, Expansion = 4}, -- Imbue Disease
			{ID = 3386, Cost = 80826, Expansion = 99}, -- Malicious Decay
			{ID = 3387, Cost = 81224, Expansion = 4}, -- Malosinia
			{ID = 3388, Cost = 81798, Expansion = 99}, -- Strength of the Diaku
			{ID = 172, Cost = 19083, Expansion = 0}, -- Swift Like the Wind
			{ID = 3389, Cost = 80183, Expansion = 99}, -- Talisman of the Boar
			{ID = 3385, Cost = 81374, Expansion = 99}, -- Tears of Saryrn
		},
		[64] = {
			{ID = 4095, Cost = 105198, Expansion = 0}, -- Bane
			{ID = 3394, Cost = 87213, Expansion = 99}, -- Breath of Ultor
			{ID = 3593, Cost = 80800, Expansion = 4}, -- Imbue War
			{ID = 3196, Cost = 75566, Expansion = 4}, -- Petrifying Earth
			{ID = 3391, Cost = 86012, Expansion = 99}, -- Talisman of Celerity
			{ID = 3392, Cost = 86923, Expansion = 99}, -- Talisman of the Diaku
			{ID = 3393, Cost = 87471, Expansion = 99}, -- Tiny Terror
			{ID = 3390, Cost = 85650, Expansion = 99}, -- Velium Strike
		},
		[65] = {
			{ID = 4900, Cost = 117468, Expansion = 99}, -- Balance of the Nihil
			{ID = 3396, Cost = 99693, Expansion = 99}, -- Blood of Saryrn
			{ID = 4899, Cost = 115918, Expansion = 99}, -- Breath of Trushar
			{ID = 4901, Cost = 115508, Expansion = 99}, -- Daluda's Mending
			{ID = 3399, Cost = 100591, Expansion = 99}, -- Ferine Avatar
			{ID = 3397, Cost = 101026, Expansion = 99}, -- Focus of the Seventh
			{ID = 3395, Cost = 100483, Expansion = 99}, -- Malos
			{ID = 3398, Cost = 99481, Expansion = 99}, -- Quiescence
		},
		[66] = {
			{ID = 5394, Cost = 132147, Expansion = 99}, -- Crippling Spasm
			{ID = 5392, Cost = 131876, Expansion = 99}, -- Putrid Decay
			{ID = 5393, Cost = 132556, Expansion = 99}, -- Spirit of Perseverance
			{ID = 5390, Cost = 133230, Expansion = 99}, -- Spirit of Sense
			{ID = 5391, Cost = 130304, Expansion = 99}, -- Yoppa's Spear of Venom
		},
		[67] = {
			{ID = 5397, Cost = 138519, Expansion = 99}, -- Ancestral Bulwark
			{ID = 5411, Cost = 139038, Expansion = 99}, -- Breath of Wunshi
			{ID = 5389, Cost = 138206, Expansion = 99}, -- Farrel's Companion
			{ID = 5404, Cost = 140796, Expansion = 99}, -- Spirit of Might
			{ID = 5402, Cost = 140787, Expansion = 99}, -- Spirit Veil
		},
		[68] = {
			{ID = 8015, Cost = 164498, Expansion = 99}, -- Lingering Sloth
			{ID = 5403, Cost = 148531, Expansion = 99}, -- Pained Memory
			{ID = 5398, Cost = 147521, Expansion = 99}, -- Spirit of Fortitude
			{ID = 5399, Cost = 146640, Expansion = 99}, -- Talisman of Sense
			{ID = 5396, Cost = 146098, Expansion = 99}, -- Wunshi's Focusing
			{ID = 5395, Cost = 148188, Expansion = 99}, -- Yoppa's Mending
			{ID = 5401, Cost = 147130, Expansion = 99}, -- Yoppa's Rain of Venom
		},
		[69] = {
			{ID = 6827, Cost = 156159, Expansion = 99}, -- Balance of Discord
			{ID = 8018, Cost = 174732, Expansion = 99}, -- Breath of Antraygus
			{ID = 5412, Cost = 157101, Expansion = 99}, -- Curse of Sisslak
			{ID = 5408, Cost = 155830, Expansion = 99}, -- Ice Age
			{ID = 5410, Cost = 154995, Expansion = 99}, -- Pure Spirit
			{ID = 6667, Cost = 171487, Expansion = 99}, -- Spirit of the Panther
			{ID = 5405, Cost = 155773, Expansion = 99}, -- Talisman of Fortitude
			{ID = 5406, Cost = 158887, Expansion = 99}, -- Talisman of Perseverance
		},
		[70] = {
			{ID = 5414, Cost = 165015, Expansion = 99}, -- Blood of Yoppa
			{ID = 5417, Cost = 166933, Expansion = 99}, -- Champion
			{ID = 8503, Cost = 195175, Expansion = 99}, -- Ghost of Renewal
			{ID = 8017, Cost = 184451, Expansion = 99}, -- Hungry Plague
			{ID = 8504, Cost = 198727, Expansion = 99}, -- Idol of Malos
			{ID = 8501, Cost = 196099, Expansion = 99}, -- Nectar of Pain
			{ID = 5416, Cost = 166708, Expansion = 99}, -- Spiritual Serenity
			{ID = 5409, Cost = 164360, Expansion = 99}, -- Talisman of Might
			{ID = 5415, Cost = 167554, Expansion = 99}, -- Talisman of Wunshi
			{ID = 5400, Cost = 166986, Expansion = 99}, -- Vindictive Spirit
		},
		[71] = {
			{ID = 9962, Cost = 221893, Expansion = 4}, -- Ahnkaul's Spear of Venom
			{ID = 9993, Cost = 223160, Expansion = 4}, -- Breath of Ternsmochin
			{ID = 9959, Cost = 223348, Expansion = 4}, -- Preternatural Foresight
			{ID = 9968, Cost = 218992, Expansion = 4}, -- Spirit of the Stoic One
			{ID = 10026, Cost = 219067, Expansion = 4}, -- Talisman of Persistence
			{ID = 10027, Cost = 100000, Expansion = 99}, -- Talisman of Persistence Rk. II
			{ID = 10028, Cost = 100000, Expansion = 99}, -- Talisman of Persistence Rk. III
			{ID = 9974, Cost = 218308, Expansion = 4}, -- Talisman of the Panther
		},
		[72] = {
			{ID = 9700, Cost = 218250, Expansion = 4}, -- Cure Corruption
			{ID = 9999, Cost = 231316, Expansion = 4}, -- Feralize
			{ID = 9983, Cost = 233188, Expansion = 4}, -- Kyrah's Faithful
			{ID = 11782, Cost = 243041, Expansion = 4}, -- Lassitude
			{ID = 11783, Cost = 10000, Expansion = 99}, -- Lassitude Rk. II
			{ID = 11784, Cost = 10000, Expansion = 99}, -- Lassitude Rk. III
			{ID = 9980, Cost = 222658, Expansion = 4}, -- Malosinise
			{ID = 10047, Cost = 235026, Expansion = 4}, -- Tortugone's Drowse
		},
		[73] = {
			{ID = 10002, Cost = 243757, Expansion = 4}, -- Ahnkaul's Mending
			{ID = 10014, Cost = 246123, Expansion = 4}, -- Ancestral Bargain
			{ID = 10005, Cost = 247691, Expansion = 4}, -- Dire Focusing
			{ID = 11773, Cost = 259972, Expansion = 4}, -- Fulkitcher Weave
			{ID = 11774, Cost = 10000, Expansion = 99}, -- Fulkitcher Weave Rk. II
			{ID = 11775, Cost = 10000, Expansion = 99}, -- Fulkitcher Weave Rk. III
			{ID = 10059, Cost = 248305, Expansion = 4}, -- Halcyon Breeze
			{ID = 10017, Cost = 242495, Expansion = 4}, -- Sting of the Queen
		},
		[74] = {
			{ID = 9920, Cost = 262315, Expansion = 4}, -- Chant of the Napaea
			{ID = 10032, Cost = 260716, Expansion = 4}, -- Glacial Avalanche
			{ID = 10038, Cost = 261941, Expansion = 4}, -- Juju
			{ID = 11776, Cost = 269747, Expansion = 4}, -- Nectar of Agony
			{ID = 11777, Cost = 10000, Expansion = 99}, -- Nectar of Agony Rk. II
			{ID = 11778, Cost = 10000, Expansion = 99}, -- Nectar of Agony Rk. III
			{ID = 10011, Cost = 260617, Expansion = 4}, -- Talisman of Foresight
			{ID = 10029, Cost = 257034, Expansion = 4}, -- Talisman of the Stoic One
		},
		[75] = {
			{ID = 10068, Cost = 270925, Expansion = 4}, -- Malis
			{ID = 9947, Cost = 273664, Expansion = 4}, -- Second Life
			{ID = 11779, Cost = 286462, Expansion = 4}, -- Specter of Renewal
			{ID = 11780, Cost = 10000, Expansion = 99}, -- Specter of Renewal Rk. II
			{ID = 11781, Cost = 10000, Expansion = 99}, -- Specter of Renewal Rk. III
			{ID = 10056, Cost = 276448, Expansion = 4}, -- Talisman of the Dire
			{ID = 10053, Cost = 276831, Expansion = 4}, -- Vengeance of Ahnkaul
			{ID = 10044, Cost = 274437, Expansion = 4}, -- Wishka's Favor
		},
		[76] = {
			{ID = 15253, Cost = 320280, Expansion = 4}, -- Breath of Big Bynn
			{ID = 15235, Cost = 320809, Expansion = 4}, -- Spirit of the Stalwart
			{ID = 15265, Cost = 321875, Expansion = 4}, -- Spirit of Vehemence
			{ID = 15238, Cost = 320013, Expansion = 99}, -- Talisman of the Cougar
			{ID = 15239, Cost = 613768, Expansion = 99}, -- Talisman of the Cougar Rk. II
			{ID = 15240, Cost = 2758110, Expansion = 99}, -- Talisman of the Cougar Rk. III
			{ID = 15277, Cost = 320673, Expansion = 4}, -- Talisman of Vehemence
			{ID = 15232, Cost = 316924, Expansion = 4}, -- Vestax's Spear of Venom
		},
		[77] = {
			{ID = 15256, Cost = 332505, Expansion = 4}, -- Feralisis
			{ID = 15323, Cost = 338745, Expansion = 99}, -- Languor
			{ID = 15324, Cost = 551168, Expansion = 99}, -- Languor Rk. II
			{ID = 14659, Cost = 322862, Expansion = 4}, -- Malosinatia
			{ID = 15295, Cost = 335627, Expansion = 99}, -- Rolist's Drowse
			{ID = 15296, Cost = 555312, Expansion = 99}, -- Rolist's Drowse Rk. II
			{ID = 15297, Cost = 3174410, Expansion = 99}, -- Rolist's Drowse Rk. III
			{ID = 15250, Cost = 339048, Expansion = 4}, -- Vegu's Faithful
		},
		[78] = {
			{ID = 15271, Cost = 354525, Expansion = 4}, -- Ancestral Hearkening
			{ID = 15342, Cost = 357398, Expansion = 99}, -- Ancestral Intervention
			{ID = 15343, Cost = 515234, Expansion = 99}, -- Ancestral Intervention Rk. II
			{ID = 15274, Cost = 351744, Expansion = 99}, -- Bite of the Brownie
			{ID = 15275, Cost = 571012, Expansion = 99}, -- Bite of the Brownie Rk. II
			{ID = 15276, Cost = 2824170, Expansion = 99}, -- Bite of the Brownie Rk. III
			{ID = 15262, Cost = 350141, Expansion = 4}, -- Bloodworg Focusing
			{ID = 15259, Cost = 349494, Expansion = 4}, -- Gemmi's Mending
			{ID = 15307, Cost = 357005, Expansion = 4}, -- Halcyon Zephyr
		},
		[79] = {
			{ID = 14427, Cost = 366872, Expansion = 4}, -- Chant of the Darkvine
			{ID = 15317, Cost = 367983, Expansion = 4}, -- Nectar of Rancor
			{ID = 15286, Cost = 376829, Expansion = 4}, -- Pocus
			{ID = 15280, Cost = 374114, Expansion = 4}, -- Talisman of the Stalwart
			{ID = 15283, Cost = 374096, Expansion = 4}, -- Tundra Crumble
		},
		[80] = {
			{ID = 15301, Cost = 389792, Expansion = 4}, -- Blood of Kerafyrm
			{ID = 14451, Cost = 386072, Expansion = 4}, -- Preincarnation
			{ID = 15320, Cost = 394577, Expansion = 4}, -- Shade of Renewal
			{ID = 15304, Cost = 389618, Expansion = 4}, -- Talisman of the Bloodworg
			{ID = 15333, Cost = 387310, Expansion = 4}, -- Thorn Wilting
			{ID = 15336, Cost = 393445, Expansion = 99}, -- Ward of Resurgence
		},
		[81] = {
			{ID = 19415, Cost = 432318, Expansion = 99}, -- Breath of Queen Malarian
			{ID = 19394, Cost = 432961, Expansion = 99}, -- Severilous' Spear of Venom
			{ID = 19397, Cost = 426803, Expansion = 99}, -- Spirit of the Resolute
			{ID = 19472, Cost = 425156, Expansion = 99}, -- Unity of the Spirits
			{ID = 18549, Cost = 432372, Expansion = 99}, -- Wild Growth
		},
		[82] = {
			{ID = 19412, Cost = 450075, Expansion = 15}, -- Aina's Faithful
			{ID = 19418, Cost = 456644, Expansion = 15}, -- Feralization
			{ID = 19486, Cost = 655591, Expansion = 99}, -- Listlessness Rk. II
			{ID = 18726, Cost = 436667, Expansion = 99}, -- Malosenea
		},
		[83] = {
			{ID = 19433, Cost = 473266, Expansion = 99}, -- Ancestral Obligation
			{ID = 19421, Cost = 474133, Expansion = 99}, -- Dannal's Mending
			{ID = 19469, Cost = 476419, Expansion = 99}, -- Halcyon Whisper
		},
		[84] = {
			{ID = 18467, Cost = 495321, Expansion = 99}, -- Chant of the Burynai
			{ID = 19445, Cost = 501023, Expansion = 99}, -- Ice Sheet
			{ID = 19448, Cost = 494843, Expansion = 99}, -- Mojo
			{ID = 19479, Cost = 495944, Expansion = 99}, -- Nectar of the Slitheren
			{ID = 19442, Cost = 503382, Expansion = 99}, -- Talisman of the Resolute
		},
		[85] = {
			{ID = 19513, Cost = 517358, Expansion = 99}, -- Blood of Avoling
			{ID = 19463, Cost = 517319, Expansion = 99}, -- Blood of Jaled'Dar
			{ID = 19482, Cost = 525885, Expansion = 99}, -- Shadow of Renewal
			{ID = 19475, Cost = 528610, Expansion = 99}, -- Talisman of Unity
		},
		[86] = {
			{ID = 26176, Cost = 594263, Expansion = 99}, -- Breath of the Shiverback
			{ID = 25731, Cost = 595802, Expansion = 99}, -- Mammoth's Force
			{ID = 26179, Cost = 592167, Expansion = 99}, -- Spinechiller's Spear of Venom
			{ID = 25701, Cost = 598729, Expansion = 99}, -- Spirit of the Relentless
			{ID = 26182, Cost = 605020, Expansion = 99}, -- Talisman of the Tiger
			{ID = 26188, Cost = 596697, Expansion = 99}, -- Unity of the Soul
			{ID = 25704, Cost = 593650, Expansion = 99}, -- Untamed Growth
		},
		[87] = {
			{ID = 26200, Cost = 624546, Expansion = 99}, -- Feralescense
			{ID = 26203, Cost = 624978, Expansion = 99}, -- Lethargy
			{ID = 26173, Cost = 597985, Expansion = 99}, -- Malosene
			{ID = 26213, Cost = 624300, Expansion = 99}, -- Nargul's Malady
			{ID = 26228, Cost = 620446, Expansion = 99}, -- Shakare's Drowse
			{ID = 26234, Cost = 635213, Expansion = 99}, -- Wurt's Faithful
		},
		[88] = {
			{ID = 26237, Cost = 665459, Expansion = 99}, -- Ancestral Covenant
			{ID = 26240, Cost = 665800, Expansion = 99}, -- Ascendant's Intervention
			{ID = 26243, Cost = 660763, Expansion = 99}, -- Bite of the Blightwolf
			{ID = 26246, Cost = 666053, Expansion = 99}, -- Halcyon Gust
			{ID = 26249, Cost = 658834, Expansion = 99}, -- Kralbor's Pandemic
			{ID = 26252, Cost = 651262, Expansion = 99}, -- Mending Counterbias
			{ID = 26261, Cost = 666612, Expansion = 99}, -- Qirik's Mending
		},
		[89] = {
			{ID = 25710, Cost = 679162, Expansion = 99}, -- Chant of the Tae Ew
			{ID = 26264, Cost = 678736, Expansion = 99}, -- Hex
			{ID = 26267, Cost = 685152, Expansion = 99}, -- Ice Floe
			{ID = 26270, Cost = 689710, Expansion = 99}, -- Nectar of Torment
			{ID = 25713, Cost = 692055, Expansion = 99}, -- Talisman of the Relentless
			{ID = 26273, Cost = 684944, Expansion = 99}, -- Undaleen's Venom
		},
		[90] = {
			{ID = 26279, Cost = 727109, Expansion = 99}, -- Blood of Corbeth
			{ID = 26282, Cost = 712204, Expansion = 99}, -- Frozen Gift
			{ID = 26285, Cost = 725975, Expansion = 99}, -- Pack of Wurt
			{ID = 26291, Cost = 721884, Expansion = 99}, -- Penumbra of Renewal
			{ID = 26294, Cost = 723671, Expansion = 99}, -- Reckless Mending
			{ID = 26300, Cost = 722585, Expansion = 99}, -- Spinechiller Blood
			{ID = 26303, Cost = 714172, Expansion = 99}, -- Splash of Glyphdust
			{ID = 26315, Cost = 712598, Expansion = 99}, -- Talisman of Soul's Unity
			{ID = 26318, Cost = 722646, Expansion = 99}, -- Ward of Recovery
		},
		[91] = {
			{ID = 29279, Cost = 1183389, Expansion = 99}, -- Breath of Silbar
			{ID = 29282, Cost = 1181445, Expansion = 99}, -- Hiqork's Spear of Venom
			{ID = 28796, Cost = 1184227, Expansion = 18}, -- Spirit of the Indomitable
			{ID = 29285, Cost = 1181420, Expansion = 99}, -- Talisman of the Lion
			{ID = 28799, Cost = 1182856, Expansion = 99}, -- Unfettered Growth
			{ID = 29291, Cost = 1180893, Expansion = 99}, -- Unity of Kolos
		},
		[92] = {
			{ID = 29306, Cost = 1197504, Expansion = 99}, -- Apathy
			{ID = 29303, Cost = 1195240, Expansion = 99}, -- Feralisera
			{ID = 29316, Cost = 1195756, Expansion = 99}, -- Giaborn's Malady
			{ID = 29325, Cost = 1197015, Expansion = 99}, -- Gotikan's Recourse
			{ID = 29346, Cost = 1196459, Expansion = 99}, -- Hilnaah's Faithful
			{ID = 29276, Cost = 1181097, Expansion = 99}, -- Maloseneta
			{ID = 29340, Cost = 1195940, Expansion = 99}, -- Matip's Drowse
			{ID = 29319, Cost = 1194068, Expansion = 99}, -- Yubai's Affliction
		},
		[93] = {
			{ID = 29349, Cost = 1211088, Expansion = 99}, -- Ancestral Arrangement
			{ID = 29355, Cost = 1207093, Expansion = 99}, -- Bite of the Grendlaen
			{ID = 29373, Cost = 1208090, Expansion = 99}, -- Gotikan's Mending
			{ID = 29358, Cost = 1209389, Expansion = 99}, -- Halcyon Breath
			{ID = 29361, Cost = 1207966, Expansion = 99}, -- Poanag's Pandemic
			{ID = 29352, Cost = 1209212, Expansion = 99}, -- Progenitor's Intervention
			{ID = 29364, Cost = 1207040, Expansion = 99}, -- Renewing Counterbias
		},
		[94] = {
			{ID = 28806, Cost = 1220100, Expansion = 99}, -- Chant of the Izon
			{ID = 29379, Cost = 1222157, Expansion = 99}, -- Hoodoo
			{ID = 29382, Cost = 1220910, Expansion = 99}, -- Ice Mass
			{ID = 29385, Cost = 1222633, Expansion = 99}, -- Nectar of Sholoth
			{ID = 29391, Cost = 1222606, Expansion = 99}, -- Stranglefang's Venom
			{ID = 28809, Cost = 1220645, Expansion = 99}, -- Talisman of the Indomitable
			{ID = 29376, Cost = 1224496, Expansion = 99}, -- Yubai's Rain of Venom
		},
		[95] = {
			{ID = 29394, Cost = 1235038, Expansion = 99}, -- Blood of Klar
			{ID = 29397, Cost = 1232624, Expansion = 99}, -- Freezing Gift
			{ID = 29418, Cost = 1236923, Expansion = 99}, -- Issuance of Malos
			{ID = 29415, Cost = 1237455, Expansion = 99}, -- Naeya Blood
			{ID = 29400, Cost = 1233896, Expansion = 99}, -- Pack of Hilnaah
			{ID = 29406, Cost = 1232910, Expansion = 99}, -- Phantom of Renewal
			{ID = 29409, Cost = 1235061, Expansion = 99}, -- Reckless Remedy
			{ID = 29424, Cost = 1234089, Expansion = 99}, -- Talisman of Kolos' Unity
		},
	},
	[Class.NECROMANCER] = {
		[1] = {
			{ID = 338, Cost = 20, Expansion = 0}, -- Cavorting Bones
			{ID = 339, Cost = 20, Expansion = 0}, -- Coldlight
			{ID = 340, Cost = 20, Expansion = 0}, -- Disease Cloud
			{ID = 235, Cost = 20, Expansion = 0}, -- Invisibility versus Undead
			{ID = 341, Cost = 20, Expansion = 0}, -- Lifetap
			{ID = 342, Cost = 20, Expansion = 0}, -- Locate Corpse
			{ID = 288, Cost = 20, Expansion = 0}, -- Minor Shielding
			{ID = 331, Cost = 20, Expansion = 0}, -- Reclaim Energy
			{ID = 221, Cost = 20, Expansion = 0}, -- Sense the Dead
			{ID = 343, Cost = 20, Expansion = 0}, -- Siphon Strength
		},
		[2] = {
			{ID = 229, Cost = 20, Expansion = 0}, -- Fear
			{ID = 347, Cost = 20, Expansion = 0}, -- Numb the Dead
			{ID = 205, Cost = 20, Expansion = 0}, -- True North
		},
		[3] = {
			{ID = 225, Cost = 20, Expansion = 0}, -- Endure Cold
			{ID = 346, Cost = 22, Expansion = 0}, -- Grim Aura
			{ID = 502, Cost = 22, Expansion = 0}, -- Lifespike
		},
		[4] = {
			{ID = 344, Cost = 24, Expansion = 0}, -- Clinging Darkness
			{ID = 36, Cost = 24, Expansion = 0}, -- Gate
			{ID = 491, Cost = 24, Expansion = 0}, -- Leering Corpse
			{ID = 348, Cost = 24, Expansion = 0}, -- Poison Bolt
		},
		[5] = {
			{ID = 352, Cost = 28, Expansion = 0}, -- Deadeye
			{ID = 354, Cost = 28, Expansion = 0}, -- Shadow Step
		},
		[6] = {
			{ID = 357, Cost = 34, Expansion = 0}, -- Dark Empathy
			{ID = 641, Cost = 34, Expansion = 0}, -- Dark Pact
			{ID = 218, Cost = 24, Expansion = 0}, -- Ward Undead
		},
		[7] = {
			{ID = 522, Cost = 43, Expansion = 0}, -- Gather Shadows
			{ID = 353, Cost = 43, Expansion = 0}, -- Mend Bones
			{ID = 359, Cost = 43, Expansion = 0}, -- Vampiric Embrace
		},
		[8] = {
			{ID = 351, Cost = 55, Expansion = 0}, -- Bone Walk
			{ID = 358, Cost = 55, Expansion = 0}, -- Impart Strength
			{ID = 246, Cost = 28, Expansion = 0}, -- Lesser Shielding
		},
		[9] = {
			{ID = 1509, Cost = 92, Expansion = 0}, -- Leech
			{ID = 361, Cost = 72, Expansion = 0}, -- Sight Graft
			{ID = 363, Cost = 72, Expansion = 0}, -- Wave of Enfeeblement
		},
		[10] = {
			{ID = 360, Cost = 92, Expansion = 0}, -- Heat Blood
			{ID = 1511, Cost = 119, Expansion = 0}, -- Scent of Dusk
			{ID = 209, Cost = 20, Expansion = 0}, -- Spook the Dead
		},
		[11] = {
			{ID = 226, Cost = 55, Expansion = 0}, -- Endure Disease
			{ID = 355, Cost = 118, Expansion = 0}, -- Engulfing Darkness
			{ID = 2541, Cost = 241, Expansion = 4}, -- Focus Death
		},
		[12] = {
			{ID = 35, Cost = 93, Expansion = 0}, -- Bind Affinity
			{ID = 362, Cost = 152, Expansion = 0}, -- Convoke Shadow
			{ID = 2213, Cost = 154, Expansion = 0}, -- Lesser Summon Corpse
			{ID = 445, Cost = 154, Expansion = 0}, -- Lifedraw
		},
		[13] = {
			{ID = 213, Cost = 20, Expansion = 0}, -- Cure Disease
			{ID = 367, Cost = 192, Expansion = 0}, -- Heart Flutter
			{ID = 4273, Cost = 663, Expansion = 0}, -- Reebo's Lesser Exorcism
			{ID = 4255, Cost = 658, Expansion = 0}, -- Wuggan's Lesser Appraisal
		},
		[14] = {
			{ID = 4261, Cost = 447, Expansion = 0}, -- Reebo's Lesser Augury
			{ID = 4285, Cost = 782, Expansion = 0}, -- Reebo's Lesser Cleansing
			{ID = 236, Cost = 192, Expansion = 0}, -- Shieldskin
			{ID = 4267, Cost = 786, Expansion = 0}, -- Wuggan's Lesser Discombobulation
			{ID = 4279, Cost = 783, Expansion = 0}, -- Wuggan's Lesser Extrication
		},
		[15] = {
			{ID = 364, Cost = 299, Expansion = 4}, -- Banshee Aura
			{ID = 48, Cost = 43, Expansion = 0}, -- Cancel Magic
			{ID = 365, Cost = 305, Expansion = 0}, -- Infectious Cloud
			{ID = 371, Cost = 304, Expansion = 99}, -- Voice Graft
		},
		[16] = {
			{ID = 366, Cost = 369, Expansion = 0}, -- Feign Death
			{ID = 7676, Cost = 369, Expansion = 4}, -- Focus Crude Spellcaster's Empowering Essence
			{ID = 7674, Cost = 369, Expansion = 4}, -- Focus Primitive Spellcaster's Empowering Essence
			{ID = 7675, Cost = 371, Expansion = 4}, -- Focus Rudimentary Spellcaster's Empowering Essence
			{ID = 9987, Cost = 1500, Expansion = 99}, -- Form of Chilled Bone
			{ID = 369, Cost = 370, Expansion = 99}, -- Hungry Earth
			{ID = 492, Cost = 373, Expansion = 0}, -- Restless Bones
			{ID = 309, Cost = 301, Expansion = 0}, -- Shielding
			{ID = 368, Cost = 297, Expansion = 0}, -- Spirit Armor
		},
		[17] = {
			{ID = 305, Cost = 191, Expansion = 0}, -- Identify
			{ID = 2542, Cost = 785, Expansion = 4}, -- Shackle of Bone
			{ID = 1510, Cost = 930, Expansion = 0}, -- Shadow Compact
		},
		[18] = {
			{ID = 642, Cost = 543, Expansion = 0}, -- Allure of Death
			{ID = 196, Cost = 539, Expansion = 0}, -- Dominate Undead
			{ID = 698, Cost = 542, Expansion = 1}, -- Track Corpse
		},
		[19] = {
			{ID = 233, Cost = 195, Expansion = 0}, -- Expulse Undead
			{ID = 370, Cost = 650, Expansion = 0}, -- Shadow Vortex
			{ID = 3583, Cost = 373, Expansion = 0}, -- Tiny Companion
		},
		[20] = {
			{ID = 440, Cost = 776, Expansion = 0}, -- Animate Dead
			{ID = 7677, Cost = 369, Expansion = 4}, -- Focus Makeshift Spellcaster's Empowering Essence
			{ID = 7689, Cost = 778, Expansion = 4}, -- Focus Mass Crude Spellcaster's Empowering Essence
			{ID = 7687, Cost = 787, Expansion = 4}, -- Focus Mass Primitive Spellcaster's Empowering Essence
			{ID = 7688, Cost = 779, Expansion = 4}, -- Focus Mass Rudimentary Spellcaster's Empowering Essence
			{ID = 199, Cost = 780, Expansion = 4}, -- Harmshield
			{ID = 446, Cost = 783, Expansion = 0}, -- Siphon Life
			{ID = 413, Cost = 660, Expansion = 0}, -- Word of Shadow
		},
		[21] = {
			{ID = 478, Cost = 927, Expansion = 0}, -- Breath of the Dead
			{ID = 1514, Cost = 1992, Expansion = 0}, -- Rapacious Subvention
			{ID = 1512, Cost = 1718, Expansion = 0}, -- Scent of Shadow
			{ID = 204, Cost = 922, Expansion = 0}, -- Shock of Poison
		},
		[22] = {
			{ID = 387, Cost = 930, Expansion = 0}, -- Leatherskin
			{ID = 549, Cost = 1093, Expansion = 0}, -- Screaming Terror
			{ID = 90, Cost = 1081, Expansion = 0}, -- Shadow Sight
		},
		[23] = {
			{ID = 449, Cost = 1284, Expansion = 99}, -- Intensify Death
			{ID = 4274, Cost = 2916, Expansion = 0}, -- Reebo's Exorcism
			{ID = 448, Cost = 1256, Expansion = 0}, -- Rest the Dead
			{ID = 4256, Cost = 2922, Expansion = 0}, -- Wuggan's Appraisal
		},
		[24] = {
			{ID = 7690, Cost = 776, Expansion = 4}, -- Focus Mass Makeshift Spellcaster's Empowering Essence
			{ID = 493, Cost = 1478, Expansion = 99}, -- Haunting Corpse
			{ID = 65, Cost = 1267, Expansion = 0}, -- Major Shielding
			{ID = 4262, Cost = 2260, Expansion = 0}, -- Reebo's Augury
			{ID = 4286, Cost = 3342, Expansion = 0}, -- Reebo's Cleansing
			{ID = 61, Cost = 1483, Expansion = 0}, -- Resist Cold
			{ID = 4268, Cost = 3355, Expansion = 0}, -- Wuggan's Discombobulation
			{ID = 4280, Cost = 3360, Expansion = 0}, -- Wuggan's Extrication
		},
		[25] = {
			{ID = 59, Cost = 1695, Expansion = 0}, -- Panic the Dead
		},
		[26] = {
			{ID = 444, Cost = 1965, Expansion = 99}, -- Renew Bones
			{ID = 524, Cost = 1950, Expansion = 0}, -- Spirit Tap
		},
		[27] = {
			{ID = 452, Cost = 2258, Expansion = 0}, -- Dooming Darkness
			{ID = 2543, Cost = 3374, Expansion = 4}, -- Eternities Torment
			{ID = 414, Cost = 1976, Expansion = 0}, -- Word of Spirit
		},
		[28] = {
			{ID = 451, Cost = 2595, Expansion = 0}, -- Boil Blood
			{ID = 117, Cost = 1276, Expansion = 0}, -- Dismiss Undead
		},
		[29] = {
			{ID = 441, Cost = 2928, Expansion = 0}, -- Summon Dead
			{ID = 454, Cost = 2957, Expansion = 4}, -- Vampiric Curse
		},
		[30] = {
			{ID = 7678, Cost = 1000, Expansion = 4}, -- Focus Elementary Spellcaster's Empowering Essence
			{ID = 127, Cost = 3334, Expansion = 0}, -- Invoke Fear
		},
		[31] = {
			{ID = 197, Cost = 3742, Expansion = 0}, -- Beguile Undead
			{ID = 643, Cost = 3817, Expansion = 7}, -- Call of Bones
			{ID = 63, Cost = 3358, Expansion = 0}, -- Resist Disease
		},
		[32] = {
			{ID = 393, Cost = 3377, Expansion = 0}, -- Steelskin
			{ID = 455, Cost = 4195, Expansion = 99}, -- Surge of Enfeeblement
			{ID = 1415, Cost = 5291, Expansion = 2}, -- Torbas' Acid Blast
		},
		[33] = {
			{ID = 66, Cost = 3792, Expansion = 0}, -- Greater Shielding
			{ID = 494, Cost = 4741, Expansion = 99}, -- Invoke Shadow
			{ID = 4275, Cost = 9036, Expansion = 0}, -- Reebo's Greater Exorcism
			{ID = 4257, Cost = 9128, Expansion = 0}, -- Wuggan's Greater Appraisal
		},
		[34] = {
			{ID = 7691, Cost = 1000, Expansion = 4}, -- Focus Mass Elementary Spellcaster's Empowering Essence
			{ID = 4263, Cost = 7371, Expansion = 0}, -- Reebo's Greater Augury
			{ID = 4287, Cost = 9981, Expansion = 0}, -- Reebo's Greater Cleansing
			{ID = 230, Cost = 22, Expansion = 0}, -- Root
			{ID = 435, Cost = 5275, Expansion = 0}, -- Venom of the Snake
			{ID = 4269, Cost = 9894, Expansion = 0}, -- Wuggan's Greater Discombobulation
			{ID = 4281, Cost = 10058, Expansion = 0}, -- Wuggan's Greater Extrication
		},
		[35] = {
			{ID = 661, Cost = 5898, Expansion = 0}, -- Augment Death
			{ID = 31, Cost = 3811, Expansion = 0}, -- Scourge
			{ID = 3, Cost = 6013, Expansion = 4}, -- Summon Corpse
		},
		[36] = {
			{ID = 1412, Cost = 8291, Expansion = 7}, -- Chilling Embrace
			{ID = 96, Cost = 1087, Expansion = 0}, -- Counteract Disease
			{ID = 415, Cost = 6616, Expansion = 0}, -- Word of Souls
		},
		[37] = {
			{ID = 49, Cost = 4197, Expansion = 0}, -- Nullify Magic
			{ID = 1513, Cost = 11032, Expansion = 0}, -- Scent of Darkness
		},
		[38] = {
			{ID = 662, Cost = 4737, Expansion = 0}, -- Expel Undead
			{ID = 2544, Cost = 10952, Expansion = 4}, -- Shackle of Spirit
		},
		[39] = {
			{ID = 4096, Cost = 16120, Expansion = 0}, -- Dark Soul
			{ID = 525, Cost = 9173, Expansion = 0}, -- Drain Spirit
			{ID = 442, Cost = 8973, Expansion = 4}, -- Malignant Dead
		},
		[40] = {
			{ID = 1508, Cost = 10924, Expansion = 0}, -- Asystole
			{ID = 7679, Cost = 1000, Expansion = 4}, -- Focus Modest Spellcaster's Empowering Essence
			{ID = 1285, Cost = 3719, Expansion = 4}, -- Summon Companion
		},
		[41] = {
			{ID = 67, Cost = 9999, Expansion = 0}, -- Arch Shielding
			{ID = 457, Cost = 10904, Expansion = 7}, -- Dead Man Floating
		},
		[42] = {
			{ID = 559, Cost = 12256, Expansion = 0}, -- Ignite Bones
			{ID = 2014, Cost = 13214, Expansion = 99}, -- Incinerate Bones
		},
		[43] = {
			{ID = 1413, Cost = 16177, Expansion = 99}, -- Corporeal Empathy
			{ID = 1515, Cost = 20611, Expansion = 0}, -- Covetous Subversion
			{ID = 394, Cost = 10162, Expansion = 0}, -- Diamondskin
		},
		[44] = {
			{ID = 4099, Cost = 22758, Expansion = 0}, -- Bounce
			{ID = 495, Cost = 14736, Expansion = 4}, -- Cackling Bones
			{ID = 7692, Cost = 1000, Expansion = 4}, -- Focus Mass Modest Spellcaster's Empowering Essence
			{ID = 9988, Cost = 39622, Expansion = 12}, -- Form of Bleached Bone
			{ID = 694, Cost = 14593, Expansion = 0}, -- Pact of Shadow
		},
		[45] = {
			{ID = 3702, Cost = 24819, Expansion = 99}, -- Auspice
			{ID = 1391, Cost = 17342, Expansion = 99}, -- Dead Men Floating
		},
		[46] = {
			{ID = 118, Cost = 13252, Expansion = 0}, -- Banish Undead
			{ID = 2545, Cost = 22443, Expansion = 4}, -- Insidious Retrogression
			{ID = 133, Cost = 16013, Expansion = 4}, -- Paralyzing Earth
		},
		[47] = {
			{ID = 198, Cost = 18834, Expansion = 0}, -- Cajole Undead
			{ID = 453, Cost = 19012, Expansion = 0}, -- Cascading Darkness
			{ID = 6, Cost = 18944, Expansion = 0}, -- Ignite Blood
		},
		[48] = {
			{ID = 447, Cost = 20881, Expansion = 0}, -- Drain Soul
			{ID = 443, Cost = 20905, Expansion = 4}, -- Invoke Death
			{ID = 644, Cost = 20712, Expansion = 99}, -- Lich
		},
		[49] = {
			{ID = 456, Cost = 22655, Expansion = 4}, -- Bond of Death
			{ID = 3571, Cost = 31549, Expansion = 4}, -- Torbas' Poison Blast
			{ID = 4079, Cost = 36199, Expansion = 0}, -- Ward of Calliav
		},
		[50] = {
			{ID = 436, Cost = 22534, Expansion = 0}, -- Envenomed Bolt
			{ID = 7680, Cost = 1000, Expansion = 4}, -- Focus Simple Spellcaster's Empowering Essence
			{ID = 1411, Cost = 24723, Expansion = 4}, -- Improved Invisibility to Undead
		},
		[51] = {
			{ID = 1532, Cost = 28886, Expansion = 1}, -- Dread of Night
			{ID = 1768, Cost = 29182, Expansion = 99}, -- Sacrifice
			{ID = 1620, Cost = 29253, Expansion = 99}, -- Splurt
		},
		[52] = {
			{ID = 3685, Cost = 43029, Expansion = 4}, -- Comatose
			{ID = 1630, Cost = 30917, Expansion = 99}, -- Defoliation
			{ID = 2546, Cost = 36767, Expansion = 99}, -- Degeneration
			{ID = 1609, Cost = 31450, Expansion = 0}, -- Manaskin
			{ID = 32, Cost = 22801, Expansion = 0}, -- Plague
			{ID = 1716, Cost = 31479, Expansion = 99}, -- Scent of Terris
		},
		[53] = {
			{ID = 1526, Cost = 33468, Expansion = 1}, -- Annul Magic
			{ID = 1733, Cost = 33424, Expansion = 9}, -- Convergence
			{ID = 131, Cost = 457, Expansion = 0}, -- Instill
			{ID = 1621, Cost = 34270, Expansion = 99}, -- Minion of Shadows
		},
		[54] = {
			{ID = 1613, Cost = 36937, Expansion = 1}, -- Deflux
			{ID = 7693, Cost = 1000, Expansion = 4}, -- Focus Mass Simple Spellcaster's Empowering Essence
			{ID = 4097, Cost = 53324, Expansion = 0}, -- Imprecation
			{ID = 1717, Cost = 36782, Expansion = 99}, -- Shadowbond
			{ID = 1610, Cost = 36574, Expansion = 1}, -- Shield of the Magi
			{ID = 2547, Cost = 42307, Expansion = 99}, -- Succussion of Shadows
			{ID = 1624, Cost = 36201, Expansion = 99}, -- Thrall of Bones
			{ID = 3572, Cost = 46020, Expansion = 4}, -- Torbas' Venom Blast
		},
		[55] = {
			{ID = 1414, Cost = 42835, Expansion = 4}, -- Augmentation of Death
			{ID = 1614, Cost = 39233, Expansion = 99}, -- Chill Bones
			{ID = 2015, Cost = 39754, Expansion = 99}, -- Conglaciation of Bone
			{ID = 8934, Cost = 79016, Expansion = 99}, -- Dark Rune
			{ID = 7681, Cost = 1000, Expansion = 4}, -- Focus Spellcaster's Empowering Essence
			{ID = 1734, Cost = 39288, Expansion = 99}, -- Infusion
			{ID = 1626, Cost = 38859, Expansion = 99}, -- Levant
			{ID = 1625, Cost = 39913, Expansion = 1}, -- Skin of the Shadow
		},
		[56] = {
			{ID = 1615, Cost = 42463, Expansion = 1}, -- Cessation of Cor
			{ID = 2548, Cost = 48707, Expansion = 99}, -- Crippling Claudication
			{ID = 1611, Cost = 42083, Expansion = 99}, -- Demi Lich
			{ID = 6992, Cost = 11000, Expansion = 0}, -- Eidolon Voice
			{ID = 9989, Cost = 89501, Expansion = 12}, -- Form of Mottled Bone
			{ID = 1718, Cost = 42475, Expansion = 99}, -- Sedulous Subversion
			{ID = 1622, Cost = 41997, Expansion = 99}, -- Servant of Bones
			{ID = 1527, Cost = 42307, Expansion = 1}, -- Trepidation
		},
		[57] = {
			{ID = 1773, Cost = 45179, Expansion = 4}, -- Conjure Corpse
			{ID = 1528, Cost = 39600, Expansion = 1}, -- Exile Undead
			{ID = 6980, Cost = 11000, Expansion = 0}, -- Unholy Voice
			{ID = 1616, Cost = 45927, Expansion = 1}, -- Vexing Replenishment
		},
		[58] = {
			{ID = 4080, Cost = 70319, Expansion = 0}, -- Guard of Calliav
			{ID = 132, Cost = 9141, Expansion = 0}, -- Immobilize
			{ID = 2549, Cost = 57152, Expansion = 99}, -- Mind Wrack
			{ID = 1617, Cost = 49199, Expansion = 1}, -- Pyrocruor
			{ID = 1612, Cost = 48731, Expansion = 99}, -- Quivering Veil of Xarn
			{ID = 4100, Cost = 69702, Expansion = 0}, -- Reflect
		},
		[59] = {
			{ID = 1619, Cost = 53468, Expansion = 99}, -- Devouring Darkness
			{ID = 1623, Cost = 52807, Expansion = 99}, -- Emissary of Thule
			{ID = 7694, Cost = 1000, Expansion = 4}, -- Focus Mass Spellcaster's Empowering Essence
			{ID = 1618, Cost = 53475, Expansion = 1}, -- Touch of Night
		},
		[60] = {
			{ID = 1416, Cost = 61441, Expansion = 99}, -- Arch Lich
			{ID = 1530, Cost = 55845, Expansion = 4}, -- Banishment of Shadows
			{ID = 1460, Cost = 60938, Expansion = 4}, -- Death Peace
			{ID = 1629, Cost = 56287, Expansion = 99}, -- Enslave Death
			{ID = 7682, Cost = 1000, Expansion = 4}, -- Focus Refined Spellcaster's Empowering Essence
			{ID = 2885, Cost = 68247, Expansion = 99}, -- Funeral Pyre of Kelador
			{ID = 1393, Cost = 56882, Expansion = 99}, -- Gangrenous Touch of Zum`uul
			{ID = 1735, Cost = 56614, Expansion = 99}, -- Trucidation
			{ID = 2550, Cost = 68091, Expansion = 99}, -- Zevfeer's Theft of Vitae
		},
		[61] = {
			{ID = 3315, Cost = 71553, Expansion = 4}, -- Dark Plague
			{ID = 6993, Cost = 11000, Expansion = 0}, -- Eidolon Bellow
			{ID = 3304, Cost = 70918, Expansion = 99}, -- Legacy of Zek
			{ID = 3035, Cost = 71745, Expansion = 99}, -- Neurotoxin
			{ID = 3300, Cost = 71391, Expansion = 4}, -- Shield of the Arcane
			{ID = 6736, Cost = 0, Expansion = 0}, -- Soul Orb
			{ID = 3032, Cost = 71085, Expansion = 99}, -- Touch of Mujaki
		},
		[62] = {
			{ID = 3344, Cost = 75709, Expansion = 4}, -- Imbue Nightmare
			{ID = 3196, Cost = 75566, Expansion = 4}, -- Petrifying Earth
			{ID = 3305, Cost = 76049, Expansion = 99}, -- Rune of Death
			{ID = 3306, Cost = 74949, Expansion = 99}, -- Saryrn's Kiss
			{ID = 6981, Cost = 11000, Expansion = 0}, -- Unholy Bellow
		},
		[63] = {
			{ID = 3308, Cost = 81431, Expansion = 99}, -- Death's Silence
			{ID = 3309, Cost = 80648, Expansion = 99}, -- Embracing Darkness
			{ID = 3301, Cost = 80247, Expansion = 4}, -- Force Shield
			{ID = 3195, Cost = 71159, Expansion = 4}, -- Greater Immobilize
			{ID = 4098, Cost = 98884, Expansion = 4}, -- Horror
			{ID = 3591, Cost = 71145, Expansion = 4}, -- Imbue Disease
			{ID = 3594, Cost = 75338, Expansion = 4}, -- Imbue Torment
			{ID = 3310, Cost = 81748, Expansion = 99}, -- Saryrn's Companion
		},
		[64] = {
			{ID = 7695, Cost = 1000, Expansion = 4}, -- Focus Mass Refined Spellcaster's Empowering Essence
			{ID = 4081, Cost = 106619, Expansion = 0}, -- Protection of Calliav
			{ID = 3311, Cost = 87469, Expansion = 99}, -- Seduction of Saryrn
			{ID = 3302, Cost = 85591, Expansion = 4}, -- Shield of Maelin
			{ID = 3312, Cost = 86164, Expansion = 99}, -- Touch of Death
		},
		[65] = {
			{ID = 3303, Cost = 98573, Expansion = 99}, -- Blood of Thule
			{ID = 3314, Cost = 98310, Expansion = 99}, -- Child of Bertoxxulous
			{ID = 3468, Cost = 85305, Expansion = 4}, -- Destroy Undead
			{ID = 7683, Cost = 1000, Expansion = 4}, -- Focus Intricate Spellcaster's Empowering Essence
			{ID = 4890, Cost = 116359, Expansion = 99}, -- Night Fire
			{ID = 4889, Cost = 117085, Expansion = 99}, -- Night Stalker
			{ID = 4891, Cost = 117689, Expansion = 99}, -- Night's Beckon
			{ID = 3316, Cost = 100599, Expansion = 99}, -- Word of Terris
		},
		[66] = {
			{ID = 5420, Cost = 133088, Expansion = 99}, -- Acikin
			{ID = 5423, Cost = 132067, Expansion = 99}, -- Chaos Plague
			{ID = 6994, Cost = 130682, Expansion = 99}, -- Eidolon Howl
			{ID = 21399, Cost = 331420, Expansion = 4}, -- Eradicate Disease
			{ID = 5421, Cost = 131363, Expansion = 99}, -- Shadow Guard
		},
		[67] = {
			{ID = 5432, Cost = 139765, Expansion = 99}, -- Dark Nightmare
			{ID = 5425, Cost = 139421, Expansion = 99}, -- Glyph of Darkness
			{ID = 5424, Cost = 140647, Expansion = 99}, -- Grip of Mori
			{ID = 5431, Cost = 139601, Expansion = 99}, -- Lost Soul
			{ID = 5419, Cost = 138166, Expansion = 99}, -- Soulspike
			{ID = 6982, Cost = 139600, Expansion = 99}, -- Unholy Howl
		},
		[68] = {
			{ID = 7995, Cost = 166274, Expansion = 99}, -- Call for Blood
			{ID = 5430, Cost = 147185, Expansion = 99}, -- Desecrating Darkness
			{ID = 5426, Cost = 147142, Expansion = 99}, -- Fang of Death
			{ID = 5427, Cost = 146190, Expansion = 99}, -- Scent of Midnight
			{ID = 6124, Cost = 146263, Expansion = 99}, -- Shadow of Death
		},
		[69] = {
			{ID = 5436, Cost = 155925, Expansion = 99}, -- Bulwark of Calliav
			{ID = 7999, Cost = 178266, Expansion = 99}, -- Corath Venom
			{ID = 5429, Cost = 155326, Expansion = 99}, -- Dark Hold
			{ID = 5435, Cost = 156953, Expansion = 99}, -- Dark Salve
			{ID = 5428, Cost = 158127, Expansion = 99}, -- Dull Pain
			{ID = 7696, Cost = 1000, Expansion = 4}, -- Focus Mass Intricate Spellcaster's Empowering Essence
			{ID = 5437, Cost = 157391, Expansion = 99}, -- Pyre of Mori
			{ID = 6668, Cost = 171024, Expansion = 99}, -- Shadow Orb
		},
		[70] = {
			{ID = 5433, Cost = 168335, Expansion = 99}, -- Chaos Venom
			{ID = 5438, Cost = 164815, Expansion = 99}, -- Dark Assassin
			{ID = 5434, Cost = 164130, Expansion = 99}, -- Dark Possession
			{ID = 8523, Cost = 195507, Expansion = 99}, -- Death Rune
			{ID = 5440, Cost = 165363, Expansion = 99}, -- Desolate Undead
			{ID = 7994, Cost = 189031, Expansion = 99}, -- Dread Pyre
			{ID = 7684, Cost = 1000, Expansion = 4}, -- Focus Elaborate Spellcaster's Empowering Essence
			{ID = 8520, Cost = 197246, Expansion = 99}, -- Grave Pact
			{ID = 8522, Cost = 196495, Expansion = 99}, -- Mind Flay
			{ID = 5439, Cost = 164270, Expansion = 99}, -- Word of Chaos
		},
		[71] = {
			{ID = 10494, Cost = 219384, Expansion = 4}, -- Drain Life
			{ID = 10488, Cost = 219267, Expansion = 4}, -- Drink of Vitae
			{ID = 10042, Cost = 218034, Expansion = 4}, -- Exhumer's Call
			{ID = 10479, Cost = 221763, Expansion = 4}, -- Severan's Rot
			{ID = 10476, Cost = 217540, Expansion = 4}, -- Shield of Darkness
			{ID = 11792, Cost = 235452, Expansion = 4}, -- Umbra Orb
			{ID = 10470, Cost = 218292, Expansion = 4}, -- Venin
		},
		[72] = {
			{ID = 11798, Cost = 248932, Expansion = 4}, -- Bonestitch Fetish
			{ID = 11800, Cost = 10000, Expansion = 99}, -- Bonestitch Fetish Rk. III
			{ID = 10507, Cost = 234536, Expansion = 4}, -- Curse of Mortality
			{ID = 10510, Cost = 236024, Expansion = 4}, -- Dyn`leth's Grasp
			{ID = 9990, Cost = 233808, Expansion = 4}, -- Form of Restless Spirits
			{ID = 10506, Cost = 229811, Expansion = 4}, -- Riza`farr's Shadow
			{ID = 10516, Cost = 230203, Expansion = 4}, -- Scent of Twilight
			{ID = 10503, Cost = 229639, Expansion = 4}, -- Sigil of the Unnatural
		},
		[73] = {
			{ID = 10522, Cost = 243229, Expansion = 4}, -- Bloodcurdling Shriek
			{ID = 10537, Cost = 243336, Expansion = 4}, -- Chilling Renewal
			{ID = 11810, Cost = 262751, Expansion = 4}, -- Pyre of the Fallen
			{ID = 11812, Cost = 10000, Expansion = 99}, -- Pyre of the Fallen Rk. III
			{ID = 10534, Cost = 247262, Expansion = 4}, -- Rimebone Shackles
			{ID = 10528, Cost = 242356, Expansion = 4}, -- Spectral Guard
			{ID = 10531, Cost = 249000, Expansion = 4}, -- Wraithskin
		},
		[74] = {
			{ID = 10741, Cost = 257473, Expansion = 4}, -- Aegis of Calliav
			{ID = 10543, Cost = 260700, Expansion = 4}, -- Ashengate Pyre
			{ID = 10519, Cost = 262696, Expansion = 4}, -- Coruscating Darkness
			{ID = 7697, Cost = 1000, Expansion = 4}, -- Focus Mass Elaborate Spellcaster's Empowering Essence
			{ID = 11804, Cost = 271630, Expansion = 4}, -- Mind Dissection
			{ID = 10558, Cost = 261091, Expansion = 4}, -- Otherside
			{ID = 10555, Cost = 261782, Expansion = 4}, -- Vakk`dra's Sickly Mists
			{ID = 10546, Cost = 261801, Expansion = 4}, -- Wilting Foliage
		},
		[75] = {
			{ID = 10565, Cost = 269594, Expansion = 4}, -- Annihilate Undead
			{ID = 10482, Cost = 276780, Expansion = 4}, -- Demand for Blood
			{ID = 7685, Cost = 1000, Expansion = 4}, -- Focus Ornate Spellcaster's Empowering Essence
			{ID = 9991, Cost = 275989, Expansion = 99}, -- Form of Rotting Flesh
			{ID = 11789, Cost = 287986, Expansion = 4}, -- Kedgefish Venom
			{ID = 11791, Cost = 10000, Expansion = 99}, -- Kedgefish Venom Rk. III
			{ID = 10561, Cost = 273817, Expansion = 4}, -- Putrescent Servant
			{ID = 10562, Cost = 270011, Expansion = 4}, -- Vakk`dra's Command
		},
		[76] = {
			{ID = 14830, Cost = 321017, Expansion = 4}, -- Bulwark of Shadows
			{ID = 14833, Cost = 318854, Expansion = 4}, -- Eranon's Decay
			{ID = 14910, Cost = 322236, Expansion = 99}, -- Phantasmal Orb
			{ID = 14823, Cost = 320201, Expansion = 4}, -- Procure Corpse
			{ID = 14824, Cost = 317252, Expansion = 4}, -- Ruinous Venin
			{ID = 14846, Cost = 320442, Expansion = 4}, -- Siphon Essence
		},
		[77] = {
			{ID = 14856, Cost = 337729, Expansion = 4}, -- Anathema of Life
			{ID = 14915, Cost = 336567, Expansion = 99}, -- Bonestitch Charm
			{ID = 14916, Cost = 488088, Expansion = 99}, -- Bonestitch Charm Rk. II
			{ID = 14917, Cost = 3157770, Expansion = 99}, -- Bonestitch Charm Rk. III
			{ID = 14933, Cost = 340030, Expansion = 99}, -- Putrefaction
			{ID = 14934, Cost = 495562, Expansion = 99}, -- Putrefaction Rk. II
			{ID = 14855, Cost = 332668, Expansion = 4}, -- Relamar's Shade
			{ID = 14865, Cost = 335060, Expansion = 4}, -- Scent of Afterlight
			{ID = 14852, Cost = 335606, Expansion = 4}, -- Sigil of the Aberrant
			{ID = 14859, Cost = 333646, Expansion = 4}, -- Visziaj's Grasp
		},
		[78] = {
			{ID = 14886, Cost = 350361, Expansion = 99}, -- Pyre of the Lifeless
			{ID = 14887, Cost = 624866, Expansion = 99}, -- Pyre of the Lifeless Rk. II
			{ID = 14888, Cost = 2594150, Expansion = 99}, -- Pyre of the Lifeless Rk. III
			{ID = 14880, Cost = 348709, Expansion = 4}, -- Riftbone Manacles
			{ID = 14877, Cost = 357020, Expansion = 4}, -- Shadowskin
			{ID = 14874, Cost = 350531, Expansion = 4}, -- Spectral Ward
			{ID = 14871, Cost = 358237, Expansion = 4}, -- Spine-Chilling Shriek
			{ID = 14883, Cost = 351318, Expansion = 4}, -- Wintry Revival
		},
		[79] = {
			{ID = 14904, Cost = 373678, Expansion = 4}, -- Aegis of Kildrukaun
			{ID = 14868, Cost = 374363, Expansion = 4}, -- Auroral Darkness
			{ID = 7698, Cost = 1000, Expansion = 4}, -- Focus Mass Ornate Spellcaster's Empowering Essence
			{ID = 14921, Cost = 372512, Expansion = 4}, -- Mental Vivisection
			{ID = 14927, Cost = 376954, Expansion = 99}, -- Reaver's Pyre
			{ID = 14928, Cost = 637766, Expansion = 99}, -- Reaver's Pyre Rk. II
			{ID = 14894, Cost = 372805, Expansion = 4}, -- Spectralside
			{ID = 14891, Cost = 372988, Expansion = 4}, -- Visziaj's Pallid Haze
		},
		[80] = {
			{ID = 7686, Cost = 1000, Expansion = 4}, -- Focus Runed Spellcaster's Empowering Essence
			{ID = 14897, Cost = 394995, Expansion = 4}, -- Noxious Servant
			{ID = 14936, Cost = 387337, Expansion = 4}, -- Searing Shadow
			{ID = 14930, Cost = 395100, Expansion = 99}, -- Splort
			{ID = 14932, Cost = 2640080, Expansion = 99}, -- Splort Rk. III
			{ID = 14836, Cost = 395761, Expansion = 4}, -- Supplication of Blood
			{ID = 14907, Cost = 390969, Expansion = 99}, -- Venonscale Venom
			{ID = 14908, Cost = 502044, Expansion = 99}, -- Venonscale Venom Rk. II
			{ID = 14909, Cost = 2938330, Expansion = 99}, -- Venonscale Venom Rk. III
			{ID = 14898, Cost = 391847, Expansion = 4}, -- Visziaj's Command
		},
		[81] = {
			{ID = 18951, Cost = 432049, Expansion = 99}, -- Drain Essence
			{ID = 19016, Cost = 665099, Expansion = 99}, -- Finsternacht Orb Rk. II
			{ID = 18938, Cost = 434645, Expansion = 99}, -- Megrima's Decay
			{ID = 18928, Cost = 429338, Expansion = 99}, -- Reaper's Call
			{ID = 18558, Cost = 432620, Expansion = 99}, -- Shield of the Void
			{ID = 18929, Cost = 433086, Expansion = 99}, -- Withering Venin
		},
		[82] = {
			{ID = 18960, Cost = 447027, Expansion = 15}, -- Bloodreaper's Shade
			{ID = 18964, Cost = 446691, Expansion = 15}, -- Fellid's Grasp
			{ID = 18961, Cost = 458559, Expansion = 15}, -- Mortal Coil
			{ID = 19038, Cost = 446844, Expansion = 15}, -- Putrescence
			{ID = 18970, Cost = 456413, Expansion = 15}, -- Scent of Gloom
		},
		[83] = {
			{ID = 18976, Cost = 472872, Expansion = 99}, -- Bone-Rattling Shriek
			{ID = 18982, Cost = 476490, Expansion = 99}, -- Corpseskin
			{ID = 18988, Cost = 476407, Expansion = 99}, -- Icy Stitches
			{ID = 18985, Cost = 479634, Expansion = 99}, -- Voidwhisper Manacles
		},
		[84] = {
			{ID = 18973, Cost = 498934, Expansion = 99}, -- Clawing Darkness
			{ID = 18996, Cost = 504245, Expansion = 99}, -- Fellid's Pallid Haze
			{ID = 19044, Cost = 501386, Expansion = 99}, -- Ignite Energy
			{ID = 19026, Cost = 496070, Expansion = 99}, -- Mind Decomposition
			{ID = 18999, Cost = 499209, Expansion = 99}, -- Netherside
		},
		[85] = {
			{ID = 18941, Cost = 523818, Expansion = 99}, -- Exigency for Blood
			{ID = 19003, Cost = 515481, Expansion = 99}, -- Fellid's Command
			{ID = 19035, Cost = 520368, Expansion = 99}, -- Splart
			{ID = 19002, Cost = 528754, Expansion = 99}, -- Unliving Murderer
		},
		[86] = {
			{ID = 26336, Cost = 592278, Expansion = 99}, -- Blighted Venin
			{ID = 26350, Cost = 595390, Expansion = 99}, -- Burlabis' Swift Venom
			{ID = 26339, Cost = 598579, Expansion = 99}, -- Divert Essence
			{ID = 26347, Cost = 601240, Expansion = 99}, -- Folasar's Decay
			{ID = 25555, Cost = 600455, Expansion = 99}, -- Reaper's Beckon
			{ID = 26333, Cost = 606975, Expansion = 99}, -- Shield of Dreams
		},
		[87] = {
			{ID = 26353, Cost = 622469, Expansion = 99}, -- Arachne's Grasp
			{ID = 26359, Cost = 633592, Expansion = 99}, -- Aziad's Shade
			{ID = 26360, Cost = 628393, Expansion = 99}, -- Bonestitch Manikin
			{ID = 26366, Cost = 637076, Expansion = 99}, -- Cascading Deathshield
			{ID = 26381, Cost = 635360, Expansion = 99}, -- Demise
			{ID = 26384, Cost = 620815, Expansion = 99}, -- Fetidity
			{ID = 26387, Cost = 626359, Expansion = 99}, -- Ninavero's Swift Deconstruction
			{ID = 26390, Cost = 632959, Expansion = 99}, -- Scent of Doom
			{ID = 26393, Cost = 637095, Expansion = 99}, -- Sigil of the Moribund
		},
		[88] = {
			{ID = 26396, Cost = 652187, Expansion = 99}, -- Bestow Unlife
			{ID = 26402, Cost = 661244, Expansion = 99}, -- Dismay
			{ID = 26405, Cost = 650907, Expansion = 99}, -- Gelid Mending
			{ID = 26408, Cost = 662516, Expansion = 99}, -- Grimskin
			{ID = 26417, Cost = 658216, Expansion = 99}, -- Pyre of the Bereft
			{ID = 26411, Cost = 662533, Expansion = 99}, -- Soulbound Manacles
			{ID = 26420, Cost = 658430, Expansion = 99}, -- Sphere of Blight
			{ID = 26414, Cost = 663538, Expansion = 99}, -- Tenak's Flashblaze
		},
		[89] = {
			{ID = 26426, Cost = 684129, Expansion = 99}, -- Arachne's Pallid Haze
			{ID = 26429, Cost = 690619, Expansion = 99}, -- Darkside
			{ID = 26432, Cost = 683017, Expansion = 99}, -- Necrotic Boils
			{ID = 26438, Cost = 682969, Expansion = 99}, -- Pyre of Nos
			{ID = 26441, Cost = 678610, Expansion = 99}, -- Rilfed's Swift Sickness
			{ID = 26444, Cost = 690491, Expansion = 99}, -- Scapegoat
			{ID = 26456, Cost = 688626, Expansion = 99}, -- Tenuous Darkness
			{ID = 26462, Cost = 679413, Expansion = 99}, -- Thought Flay
			{ID = 26459, Cost = 692099, Expansion = 99}, -- Thoughtburn
		},
		[90] = {
			{ID = 26468, Cost = 712642, Expansion = 99}, -- Arachne's Command
			{ID = 26471, Cost = 712401, Expansion = 99}, -- Argendev's Venom
			{ID = 26474, Cost = 723904, Expansion = 99}, -- Blistering Shadow
			{ID = 26477, Cost = 728943, Expansion = 99}, -- Call Skeleton Crush
			{ID = 26480, Cost = 719137, Expansion = 99}, -- Compel for Blood
			{ID = 26486, Cost = 728576, Expansion = 99}, -- Energize Ally
			{ID = 26492, Cost = 722262, Expansion = 99}, -- Ninavero's Swift Lifedraw
			{ID = 26498, Cost = 728174, Expansion = 99}, -- Raised Assassin
			{ID = 26499, Cost = 712608, Expansion = 99}, -- Scorch Bones
			{ID = 26505, Cost = 720774, Expansion = 99}, -- Splirt
		},
		[91] = {
			{ID = 29451, Cost = 1180963, Expansion = 99}, -- Bleed Essence
			{ID = 29448, Cost = 1182994, Expansion = 99}, -- Decaying Venin
			{ID = 29462, Cost = 1185058, Expansion = 99}, -- Grip of Zargo
			{ID = 29465, Cost = 1182541, Expansion = 99}, -- Hyboram's Swift Venom
			{ID = 28632, Cost = 1181871, Expansion = 99}, -- Reaper's Decree
			{ID = 29445, Cost = 1182546, Expansion = 18}, -- Shield of Bronze
			{ID = 29459, Cost = 1183878, Expansion = 99}, -- Ulork's Decay
		},
		[92] = {
			{ID = 29478, Cost = 1196771, Expansion = 99}, -- Bonemeld Fetish
			{ID = 29499, Cost = 1195680, Expansion = 99}, -- Doom
			{ID = 29505, Cost = 1197103, Expansion = 99}, -- Hral's Swift Deconstruction
			{ID = 29471, Cost = 1194964, Expansion = 99}, -- Ivrikdal's Grasp
			{ID = 29502, Cost = 1198245, Expansion = 99}, -- Mortification
			{ID = 29508, Cost = 1197259, Expansion = 99}, -- Scent of Nightfall
			{ID = 29477, Cost = 1195312, Expansion = 99}, -- Vak`Ridel's Shade
		},
		[93] = {
			{ID = 29541, Cost = 1207868, Expansion = 99}, -- Brimtav's Flashblaze
			{ID = 29532, Cost = 1208502, Expansion = 99}, -- Chilled Mending
			{ID = 29529, Cost = 1209156, Expansion = 99}, -- Dread
			{ID = 29535, Cost = 1208809, Expansion = 99}, -- Ghoulskin
			{ID = 29538, Cost = 1209037, Expansion = 99}, -- Shadeslither Manacles
			{ID = 29547, Cost = 1211025, Expansion = 99}, -- Sphere of Withering
		},
		[95] = {
			{ID = 29604, Cost = 1233162, Expansion = 99}, -- Call Skeleton Host
		},
	},
	[Class.WIZARD] = {
		[1] = {
			{ID = 372, Cost = 20, Expansion = 0}, -- Blast of Cold
			{ID = 54, Cost = 20, Expansion = 0}, -- Frost Bolt
			{ID = 288, Cost = 20, Expansion = 0}, -- Minor Shielding
			{ID = 374, Cost = 20, Expansion = 0}, -- Numbing Cold
			{ID = 373, Cost = 20, Expansion = 0}, -- Sphere of Light
			{ID = 205, Cost = 20, Expansion = 0}, -- True North
		},
		[2] = {
			{ID = 51, Cost = 20, Expansion = 0}, -- Glimpse
			{ID = 378, Cost = 20, Expansion = 0}, -- O`Keil's Radiation
		},
		[3] = {
			{ID = 375, Cost = 22, Expansion = 0}, -- Fade
			{ID = 230, Cost = 22, Expansion = 0}, -- Root
		},
		[4] = {
			{ID = 36, Cost = 24, Expansion = 0}, -- Gate
			{ID = 80, Cost = 24, Expansion = 0}, -- See Invisible
			{ID = 376, Cost = 24, Expansion = 0}, -- Shock of Fire
		},
		[5] = {
			{ID = 379, Cost = 28, Expansion = 0}, -- Fingers of Fire
			{ID = 477, Cost = 28, Expansion = 0}, -- Fire Bolt
		},
		[6] = {
			{ID = 377, Cost = 34, Expansion = 0}, -- Icestrike
			{ID = 246, Cost = 28, Expansion = 0}, -- Lesser Shielding
		},
		[7] = {
			{ID = 232, Cost = 22, Expansion = 0}, -- Sense Summoned
			{ID = 354, Cost = 28, Expansion = 0}, -- Shadow Step
		},
		[8] = {
			{ID = 380, Cost = 55, Expansion = 0}, -- Column of Frost
			{ID = 323, Cost = 34, Expansion = 0}, -- Eye of Zomm
			{ID = 656, Cost = 55, Expansion = 0}, -- Shock of Ice
		},
		[9] = {
			{ID = 234, Cost = 71, Expansion = 0}, -- Halo of Light
			{ID = 381, Cost = 71, Expansion = 0}, -- Resistant Skin
		},
		[10] = {
			{ID = 2551, Cost = 195, Expansion = 0}, -- O`Keil's Embers
			{ID = 383, Cost = 93, Expansion = 0}, -- Shock of Lightning
		},
		[11] = {
			{ID = 48, Cost = 43, Expansion = 0}, -- Cancel Magic
			{ID = 529, Cost = 120, Expansion = 0}, -- Gaze
		},
		[12] = {
			{ID = 35, Cost = 93, Expansion = 0}, -- Bind Affinity
			{ID = 85, Cost = 154, Expansion = 0}, -- Firestorm
			{ID = 382, Cost = 151, Expansion = 0}, -- Frost Spiral of Al'Kabor
		},
		[13] = {
			{ID = 236, Cost = 192, Expansion = 0}, -- Shieldskin
			{ID = 4252, Cost = 662, Expansion = 0}, -- Xalirilan's Lesser Appraisal
		},
		[14] = {
			{ID = 305, Cost = 191, Expansion = 0}, -- Identify
			{ID = 385, Cost = 242, Expansion = 99}, -- Project Lightning
			{ID = 4264, Cost = 773, Expansion = 0}, -- Xalirilan's Lesser Discombobulation
			{ID = 4276, Cost = 784, Expansion = 0}, -- Xalirilan's Lesser Extrication
		},
		[15] = {
			{ID = 657, Cost = 301, Expansion = 0}, -- Flame Shock
			{ID = 386, Cost = 298, Expansion = 99}, -- Pillar of Fire
			{ID = 309, Cost = 301, Expansion = 0}, -- Shielding
		},
		[16] = {
			{ID = 500, Cost = 55, Expansion = 0}, -- Bind Sight
			{ID = 7676, Cost = 369, Expansion = 4}, -- Focus Crude Spellcaster's Empowering Essence
			{ID = 7674, Cost = 369, Expansion = 4}, -- Focus Primitive Spellcaster's Empowering Essence
			{ID = 7675, Cost = 371, Expansion = 4}, -- Focus Rudimentary Spellcaster's Empowering Essence
			{ID = 679, Cost = 369, Expansion = 0}, -- Heat Sight
			{ID = 42, Cost = 24, Expansion = 0}, -- Invisibility
			{ID = 38, Cost = 369, Expansion = 0}, -- Lightning Bolt
		},
		[17] = {
			{ID = 22, Cost = 455, Expansion = 0}, -- Force Snap
			{ID = 131, Cost = 457, Expansion = 0}, -- Instill
			{ID = 2945, Cost = 788, Expansion = 3}, -- Nexus Gate
		},
		[18] = {
			{ID = 458, Cost = 551, Expansion = 99}, -- Fire Spiral of Al'Kabor
			{ID = 2552, Cost = 930, Expansion = 3}, -- Garrison's Mighty Mana Shock
			{ID = 2184, Cost = 545, Expansion = 0}, -- Lesser Evacuate
			{ID = 542, Cost = 543, Expansion = 0}, -- North Gate
		},
		[19] = {
			{ID = 578, Cost = 656, Expansion = 0}, -- Sight
			{ID = 503, Cost = 652, Expansion = 0}, -- Tishan's Clash
			{ID = 541, Cost = 658, Expansion = 0}, -- Tox Gate
		},
		[20] = {
			{ID = 10882, Cost = 4280, Expansion = 4}, -- Blightfire Moors Gate
			{ID = 10881, Cost = 4238, Expansion = 12}, -- Blightfire Moors Portal
			{ID = 108, Cost = 661, Expansion = 0}, -- Elemental Shield
			{ID = 543, Cost = 790, Expansion = 0}, -- Fay Gate
			{ID = 7677, Cost = 369, Expansion = 4}, -- Focus Makeshift Spellcaster's Empowering Essence
			{ID = 7689, Cost = 778, Expansion = 4}, -- Focus Mass Crude Spellcaster's Empowering Essence
			{ID = 7687, Cost = 787, Expansion = 4}, -- Focus Mass Primitive Spellcaster's Empowering Essence
			{ID = 7688, Cost = 779, Expansion = 4}, -- Focus Mass Rudimentary Spellcaster's Empowering Essence
			{ID = 2418, Cost = 1272, Expansion = 4}, -- Grimling Gate
			{ID = 10880, Cost = 4216, Expansion = 12}, -- Translocate: Blightfire Moors
		},
		[21] = {
			{ID = 544, Cost = 919, Expansion = 0}, -- Common Gate
			{ID = 387, Cost = 930, Expansion = 0}, -- Leatherskin
			{ID = 3795, Cost = 1497, Expansion = 0}, -- Stonebrunt Gate
		},
		[22] = {
			{ID = 261, Cost = 92, Expansion = 0}, -- Levitate
			{ID = 545, Cost = 1084, Expansion = 0}, -- Nek Gate
			{ID = 547, Cost = 1086, Expansion = 0}, -- Ro Gate
			{ID = 2423, Cost = 1708, Expansion = 0}, -- Twilight Gate
		},
		[23] = {
			{ID = 546, Cost = 1257, Expansion = 0}, -- Cazic Gate
			{ID = 467, Cost = 1288, Expansion = 99}, -- Lightning Storm
			{ID = 65, Cost = 1267, Expansion = 0}, -- Major Shielding
			{ID = 548, Cost = 1257, Expansion = 0}, -- West Gate
			{ID = 4253, Cost = 2952, Expansion = 0}, -- Xalirilan's Appraisal
		},
		[24] = {
			{ID = 461, Cost = 1494, Expansion = 0}, -- Cast Force
			{ID = 462, Cost = 1473, Expansion = 0}, -- Column of Lightning
			{ID = 1325, Cost = 1482, Expansion = 0}, -- Combine Gate
			{ID = 7690, Cost = 776, Expansion = 4}, -- Focus Mass Makeshift Spellcaster's Empowering Essence
			{ID = 464, Cost = 1459, Expansion = 0}, -- Frost Shock
			{ID = 4265, Cost = 3294, Expansion = 0}, -- Xalirilan's Discombobulation
			{ID = 4277, Cost = 3302, Expansion = 0}, -- Xalirilan's Extrication
		},
		[25] = {
			{ID = 2553, Cost = 2605, Expansion = 0}, -- Minor Familiar
			{ID = 562, Cost = 1712, Expansion = 0}, -- North Portal
			{ID = 3581, Cost = 2900, Expansion = 0}, -- O`Keil's Levity
			{ID = 528, Cost = 1728, Expansion = 0}, -- Yonder
		},
		[26] = {
			{ID = 468, Cost = 1992, Expansion = 0}, -- Energy Storm
			{ID = 602, Cost = 1964, Expansion = 0}, -- Evacuate: North
			{ID = 1899, Cost = 1954, Expansion = 4}, -- Imbue Fire Opal
			{ID = 465, Cost = 1989, Expansion = 0}, -- Inferno Shock
		},
		[27] = {
			{ID = 636, Cost = 2252, Expansion = 0}, -- Bonds of Force
			{ID = 563, Cost = 2241, Expansion = 0}, -- Fay Portal
			{ID = 3183, Cost = 3780, Expansion = 0}, -- Knowledge Gate
			{ID = 3793, Cost = 3290, Expansion = 4}, -- Stonebrunt Portal
		},
		[28] = {
			{ID = 3999, Cost = 2549, Expansion = 4}, -- Mass Imbue Fire Opal
			{ID = 459, Cost = 2557, Expansion = 99}, -- Shock Spiral of Al'Kabor
			{ID = 470, Cost = 2617, Expansion = 0}, -- Thunder Strike
			{ID = 561, Cost = 2600, Expansion = 0}, -- Tox Portal
		},
		[29] = {
			{ID = 2428, Cost = 4204, Expansion = 0}, -- Dawnshroud Gate
			{ID = 2420, Cost = 4257, Expansion = 4}, -- Grimling Portal
			{ID = 579, Cost = 2942, Expansion = 0}, -- Magnify
			{ID = 2944, Cost = 4217, Expansion = 3}, -- Nexus Portal
		},
		[30] = {
			{ID = 7678, Cost = 1000, Expansion = 4}, -- Focus Elementary Spellcaster's Empowering Essence
			{ID = 393, Cost = 3377, Expansion = 0}, -- Steelskin
			{ID = 471, Cost = 3345, Expansion = 0}, -- Thunderclap
		},
		[31] = {
			{ID = 463, Cost = 3796, Expansion = 0}, -- Circle of Force
			{ID = 1419, Cost = 4822, Expansion = 2}, -- O`Keil's Flickering Flame
		},
		[32] = {
			{ID = 603, Cost = 4214, Expansion = 0}, -- Evacuate: Fay
			{ID = 1744, Cost = 4759, Expansion = 0}, -- Harvest
			{ID = 1417, Cost = 5283, Expansion = 0}, -- Iceclad Gate
			{ID = 469, Cost = 4244, Expansion = 99}, -- Lava Storm
			{ID = 564, Cost = 4296, Expansion = 0}, -- Nek Portal
		},
		[33] = {
			{ID = 565, Cost = 4753, Expansion = 0}, -- Cazic Portal
			{ID = 66, Cost = 3792, Expansion = 0}, -- Greater Shielding
			{ID = 1418, Cost = 5966, Expansion = 0}, -- Iceclad Portal
			{ID = 2425, Cost = 6601, Expansion = 4}, -- Twilight Portal
			{ID = 4254, Cost = 9086, Expansion = 0}, -- Xalirilan's Greater Appraisal
		},
		[34] = {
			{ID = 1516, Cost = 5305, Expansion = 0}, -- Combine Portal
			{ID = 7691, Cost = 1000, Expansion = 4}, -- Focus Mass Elementary Spellcaster's Empowering Essence
			{ID = 2026, Cost = 6731, Expansion = 0}, -- Great Divide Gate
			{ID = 658, Cost = 5415, Expansion = 0}, -- Ice Shock
			{ID = 49, Cost = 4197, Expansion = 0}, -- Nullify Magic
			{ID = 4266, Cost = 10034, Expansion = 0}, -- Xalirilan's Greater Discombobulation
			{ID = 4278, Cost = 10127, Expansion = 0}, -- Xalirilan's Greater Extrication
		},
		[35] = {
			{ID = 566, Cost = 5949, Expansion = 0}, -- Common Portal
			{ID = 2554, Cost = 8256, Expansion = 0}, -- Elnerick's Entombment of Ice
			{ID = 460, Cost = 5900, Expansion = 4}, -- Force Spiral of Al'Kabor
			{ID = 1338, Cost = 7473, Expansion = 4}, -- Translocate: North
			{ID = 3833, Cost = 8304, Expansion = 4}, -- Translocate: Stonebrunt
		},
		[36] = {
			{ID = 1423, Cost = 8120, Expansion = 2}, -- Great Divide Portal
			{ID = 567, Cost = 6636, Expansion = 0}, -- Ro Portal
			{ID = 1738, Cost = 7416, Expansion = 0}, -- Tishan's Relocation
			{ID = 1336, Cost = 8173, Expansion = 4}, -- Translocate: Fay
			{ID = 2943, Cost = 8965, Expansion = 3}, -- Translocate: Nexus
		},
		[37] = {
			{ID = 752, Cost = 7480, Expansion = 4}, -- Concussion
			{ID = 466, Cost = 7331, Expansion = 0}, -- Lightning Shock
			{ID = 1739, Cost = 8183, Expansion = 0}, -- Markar's Relocation
			{ID = 1337, Cost = 9163, Expansion = 4}, -- Translocate: Tox
			{ID = 568, Cost = 7352, Expansion = 0}, -- West Portal
		},
		[38] = {
			{ID = 539, Cost = 8202, Expansion = 0}, -- Chill Sight
			{ID = 604, Cost = 8127, Expansion = 0}, -- Evacuate: Ro
			{ID = 3180, Cost = 12243, Expansion = 4}, -- Knowledge Portal
			{ID = 84, Cost = 777, Expansion = 0}, -- Shifting Sight
			{ID = 1339, Cost = 10136, Expansion = 4}, -- Translocate: Combine
			{ID = 2027, Cost = 9983, Expansion = 0}, -- Wakening Lands Gate
		},
		[39] = {
			{ID = 2028, Cost = 11029, Expansion = 0}, -- Cobalt Scar Gate
			{ID = 2430, Cost = 12192, Expansion = 4}, -- Dawnshroud Portal
			{ID = 132, Cost = 9141, Expansion = 0}, -- Immobilize
			{ID = 1420, Cost = 11097, Expansion = 4}, -- Invisibility to Undead
			{ID = 2421, Cost = 12021, Expansion = 4}, -- Translocate: Grimling
		},
		[40] = {
			{ID = 394, Cost = 10162, Expansion = 0}, -- Diamondskin
			{ID = 7679, Cost = 1000, Expansion = 4}, -- Focus Modest Spellcaster's Empowering Essence
			{ID = 1372, Cost = 10043, Expansion = 4}, -- Translocate: Common
			{ID = 3811, Cost = 16212, Expansion = 99}, -- Vision Shift
		},
		[41] = {
			{ID = 23, Cost = 11135, Expansion = 0}, -- Force Strike
			{ID = 660, Cost = 11043, Expansion = 0}, -- Frost Storm
			{ID = 1371, Cost = 11109, Expansion = 4}, -- Translocate: Nek
			{ID = 2426, Cost = 14477, Expansion = 4}, -- Translocate: Twilight
		},
		[42] = {
			{ID = 109, Cost = 11041, Expansion = 0}, -- Elemental Armor
			{ID = 605, Cost = 12230, Expansion = 0}, -- Evacuate: Nek
			{ID = 1374, Cost = 12046, Expansion = 4}, -- Translocate: West
			{ID = 1399, Cost = 14814, Expansion = 2}, -- Wakening Lands Portal
		},
		[43] = {
			{ID = 1425, Cost = 15805, Expansion = 2}, -- Cobalt Scar Portal
			{ID = 659, Cost = 13424, Expansion = 0}, -- Conflagration
			{ID = 73, Cost = 6657, Expansion = 0}, -- Gravity Flux
			{ID = 1373, Cost = 13390, Expansion = 4}, -- Translocate: Ro
		},
		[44] = {
			{ID = 67, Cost = 9999, Expansion = 0}, -- Arch Shielding
			{ID = 4099, Cost = 22758, Expansion = 0}, -- Bounce
			{ID = 1421, Cost = 17346, Expansion = 0}, -- Enticement of Flame
			{ID = 7692, Cost = 1000, Expansion = 4}, -- Focus Mass Modest Spellcaster's Empowering Essence
			{ID = 1375, Cost = 14476, Expansion = 4}, -- Translocate: Cazic
		},
		[45] = {
			{ID = 2555, Cost = 20607, Expansion = 0}, -- Lesser Familiar
			{ID = 733, Cost = 15799, Expansion = 99}, -- Supernova
			{ID = 2022, Cost = 19005, Expansion = 4}, -- Translocate: Iceclad
			{ID = 3181, Cost = 22889, Expansion = 4}, -- Translocate: Knowledge
		},
		[46] = {
			{ID = 666, Cost = 17266, Expansion = 0}, -- Alter Plane: Hate
			{ID = 674, Cost = 17448, Expansion = 0}, -- Alter Plane: Sky
			{ID = 2023, Cost = 20646, Expansion = 4}, -- Translocate: Great Divide
		},
		[47] = {
			{ID = 606, Cost = 19208, Expansion = 0}, -- Evacuate: West
			{ID = 612, Cost = 18911, Expansion = 0}, -- Markar's Clash
			{ID = 755, Cost = 18862, Expansion = 0}, -- Rend
			{ID = 2024, Cost = 22744, Expansion = 4}, -- Translocate: Wakening Lands
		},
		[48] = {
			{ID = 133, Cost = 16013, Expansion = 4}, -- Paralyzing Earth
			{ID = 2025, Cost = 24437, Expansion = 4}, -- Translocate: Cobalt Scar
			{ID = 731, Cost = 20905, Expansion = 99}, -- Wrath of Al'Kabor
		},
		[49] = {
			{ID = 732, Cost = 22793, Expansion = 99}, -- Ice Comet
			{ID = 2431, Cost = 28570, Expansion = 4}, -- Translocate: Dawnshroud
			{ID = 4067, Cost = 36392, Expansion = 0}, -- Ward of Calrena
		},
		[50] = {
			{ID = 7680, Cost = 1000, Expansion = 4}, -- Focus Simple Spellcaster's Empowering Essence
			{ID = 2894, Cost = 31257, Expansion = 4}, -- Levitation
			{ID = 1422, Cost = 29064, Expansion = 99}, -- Translocate
		},
		[51] = {
			{ID = 8968, Cost = 60357, Expansion = 11}, -- Arcstone Gate
			{ID = 8966, Cost = 59971, Expansion = 11}, -- Arcstone Portal
			{ID = 1631, Cost = 28935, Expansion = 99}, -- Atol's Spectral Shackles
			{ID = 1637, Cost = 28659, Expansion = 0}, -- Draught of Fire
			{ID = 1646, Cost = 29083, Expansion = 99}, -- Pillar of Frost
			{ID = 1634, Cost = 29180, Expansion = 99}, -- Tishan's Discord
			{ID = 8238, Cost = 56291, Expansion = 10}, -- Undershore Gate
			{ID = 8236, Cost = 56532, Expansion = 10}, -- Undershore Portal
		},
		[52] = {
			{ID = 1627, Cost = 31280, Expansion = 99}, -- Abscond
			{ID = 5734, Cost = 49362, Expansion = 7}, -- Barindu Gate
			{ID = 3706, Cost = 42567, Expansion = 99}, -- Frozen Harpoon
			{ID = 1642, Cost = 31727, Expansion = 0}, -- Lure of Frost
			{ID = 1609, Cost = 31450, Expansion = 0}, -- Manaskin
			{ID = 4963, Cost = 49710, Expansion = 0}, -- Natimbi Gate
			{ID = 1649, Cost = 30910, Expansion = 99}, -- Tears of Druzzil
			{ID = 1334, Cost = 34012, Expansion = 99}, -- Translocate: Group
		},
		[53] = {
			{ID = 1526, Cost = 33468, Expansion = 1}, -- Annul Magic
			{ID = 6181, Cost = 56554, Expansion = 99}, -- Bloodfields Gate
			{ID = 1650, Cost = 34097, Expansion = 99}, -- Inferno of Al'Kabor
			{ID = 1653, Cost = 34038, Expansion = 0}, -- Jyll's Static Pulse
		},
		[54] = {
			{ID = 3582, Cost = 45417, Expansion = 0}, -- Elemental Cloak
			{ID = 2557, Cost = 42342, Expansion = 99}, -- Familiar
			{ID = 7693, Cost = 1000, Expansion = 4}, -- Focus Mass Simple Spellcaster's Empowering Essence
			{ID = 4070, Cost = 53192, Expansion = 0}, -- Magi Ward
			{ID = 4965, Cost = 56950, Expansion = 0}, -- Natimbi Portal
			{ID = 1645, Cost = 36299, Expansion = 99}, -- Pillar of Lightning
			{ID = 1610, Cost = 36574, Expansion = 1}, -- Shield of the Magi
			{ID = 1656, Cost = 36517, Expansion = 99}, -- Thunderbolt
			{ID = 1639, Cost = 36978, Expansion = 0}, -- Voltaic Draught
		},
		[55] = {
			{ID = 5732, Cost = 61537, Expansion = 7}, -- Barindu Portal
			{ID = 6183, Cost = 65045, Expansion = 99}, -- Bloodfields Portal
			{ID = 1643, Cost = 39353, Expansion = 99}, -- Draught of Jiva
			{ID = 8932, Cost = 79568, Expansion = 99}, -- Fire Mark
			{ID = 7681, Cost = 1000, Expansion = 4}, -- Focus Spellcaster's Empowering Essence
			{ID = 1406, Cost = 29191, Expansion = 4}, -- Improved Invisibility
			{ID = 1638, Cost = 39329, Expansion = 0}, -- Lure of Flame
			{ID = 1632, Cost = 39564, Expansion = 99}, -- Plainsight
			{ID = 1648, Cost = 39736, Expansion = 99}, -- Tears of Solusek
			{ID = 8969, Cost = 80620, Expansion = 11}, -- Translocate: Arcstone
			{ID = 8239, Cost = 75321, Expansion = 10}, -- Translocate: Undershore
		},
		[56] = {
			{ID = 2558, Cost = 48858, Expansion = 9}, -- Decession
			{ID = 1654, Cost = 42225, Expansion = 0}, -- Jyll's Zephyr of Ice
			{ID = 1635, Cost = 41920, Expansion = 99}, -- Markar's Discord
			{ID = 1651, Cost = 42145, Expansion = 99}, -- Retribution of Al'Kabor
		},
		[57] = {
			{ID = 1641, Cost = 45454, Expansion = 0}, -- Draught of Ice
			{ID = 1628, Cost = 45434, Expansion = 99}, -- Evacuate
			{ID = 1720, Cost = 45942, Expansion = 4}, -- Eye of Tallon
			{ID = 4068, Cost = 65127, Expansion = 4}, -- Guard of Calrena
			{ID = 1644, Cost = 46265, Expansion = 99}, -- Pillar of Flame
			{ID = 4964, Cost = 68646, Expansion = 0}, -- Translocate: Natimbi
		},
		[58] = {
			{ID = 1633, Cost = 11000, Expansion = 0}, -- Fetter
			{ID = 1640, Cost = 49770, Expansion = 0}, -- Lure of Lightning
			{ID = 1728, Cost = 48795, Expansion = 99}, -- Manasink
			{ID = 4100, Cost = 69702, Expansion = 0}, -- Reflect
			{ID = 2559, Cost = 56669, Expansion = 9}, -- Spellshield
			{ID = 1647, Cost = 49329, Expansion = 99}, -- Tears of Prexus
			{ID = 6182, Cost = 79649, Expansion = 99}, -- Translocate: Bloodfields
		},
		[59] = {
			{ID = 1722, Cost = 52321, Expansion = 99}, -- Flaming Sword of Xuzl
			{ID = 7694, Cost = 1000, Expansion = 4}, -- Focus Mass Spellcaster's Empowering Essence
			{ID = 1636, Cost = 52254, Expansion = 99}, -- Invert Gravity
			{ID = 1655, Cost = 52596, Expansion = 0}, -- Jyll's Wave of Heat
			{ID = 1652, Cost = 52732, Expansion = 99}, -- Vengeance of Al'Kabor
		},
		[60] = {
			{ID = 1724, Cost = 56287, Expansion = 99}, -- Disintegrate
			{ID = 2883, Cost = 66796, Expansion = 99}, -- Elnerick's Electrical Rending
			{ID = 7682, Cost = 1000, Expansion = 4}, -- Focus Refined Spellcaster's Empowering Essence
			{ID = 2884, Cost = 66602, Expansion = 99}, -- Garrison's Superior Sundering
			{ID = 2560, Cost = 67453, Expansion = 99}, -- Greater Familiar
			{ID = 1311, Cost = 56200, Expansion = 99}, -- Hsagra's Wrath
			{ID = 1426, Cost = 60194, Expansion = 99}, -- Ice Spear of Solist
			{ID = 1769, Cost = 57164, Expansion = 99}, -- Lure of Ice
			{ID = 1310, Cost = 56022, Expansion = 99}, -- Porlos' Fury
			{ID = 10879, Cost = 115397, Expansion = 12}, -- Sunderock Springs Gate
			{ID = 10878, Cost = 118051, Expansion = 12}, -- Sunderock Springs Portal
			{ID = 1658, Cost = 56625, Expansion = 99}, -- Sunstrike
			{ID = 5735, Cost = 84396, Expansion = 7}, -- Translocate: Barindu
			{ID = 10877, Cost = 117042, Expansion = 12}, -- Translocate: Sunderock Springs
			{ID = 1657, Cost = 56043, Expansion = 99}, -- Winds of Gelid
		},
		[61] = {
			{ID = 6737, Cost = 0, Expansion = 0}, -- Claw of Frost
			{ID = 3194, Cost = 71024, Expansion = 4}, -- Greater Fetter
			{ID = 3328, Cost = 71161, Expansion = 4}, -- Lure of Thunder
			{ID = 3326, Cost = 70838, Expansion = 99}, -- Resistant Armor
			{ID = 3300, Cost = 71391, Expansion = 4}, -- Shield of the Arcane
			{ID = 3327, Cost = 71712, Expansion = 99}, -- Tears of Ro
		},
		[62] = {
			{ID = 3330, Cost = 75528, Expansion = 99}, -- Draught of Ro
			{ID = 3329, Cost = 69895, Expansion = 4}, -- Elemental Barrier
			{ID = 3331, Cost = 76437, Expansion = 99}, -- Lure of Ro
			{ID = 6176, Cost = 101468, Expansion = 99}, -- Slaughter Gate
			{ID = 3243, Cost = 76280, Expansion = 99}, -- Teleport
		},
		[63] = {
			{ID = 3335, Cost = 80472, Expansion = 99}, -- Agnarr's Thunder
			{ID = 3976, Cost = 79779, Expansion = 99}, -- Draught of Lightning
			{ID = 3334, Cost = 81886, Expansion = 99}, -- Draught of Thunder
			{ID = 3301, Cost = 80247, Expansion = 4}, -- Force Shield
			{ID = 3337, Cost = 80078, Expansion = 99}, -- Iceflame of E`ci
			{ID = 4071, Cost = 100260, Expansion = 0}, -- Mana Ward
		},
		[64] = {
			{ID = 3336, Cost = 86214, Expansion = 99}, -- Draught of E`ci
			{ID = 7695, Cost = 1000, Expansion = 4}, -- Focus Mass Refined Spellcaster's Empowering Essence
			{ID = 4066, Cost = 106430, Expansion = 0}, -- Ice Meteor
			{ID = 11985, Cost = 158421, Expansion = 13}, -- Katta Castrum Gate
			{ID = 4069, Cost = 107454, Expansion = 0}, -- Protection of Calrena
			{ID = 3302, Cost = 85591, Expansion = 4}, -- Shield of Maelin
			{ID = 6178, Cost = 117875, Expansion = 99}, -- Slaughter Portal
			{ID = 3189, Cost = 87298, Expansion = 99}, -- Tears of Arlyxir
			{ID = 3333, Cost = 86786, Expansion = 99}, -- Telekin
		},
		[65] = {
			{ID = 4905, Cost = 115821, Expansion = 99}, -- Black Ice
			{ID = 7683, Cost = 1000, Expansion = 4}, -- Focus Intricate Spellcaster's Empowering Essence
			{ID = 3244, Cost = 100131, Expansion = 99}, -- Greater Decession
			{ID = 3191, Cost = 99133, Expansion = 99}, -- Shock of Magic
			{ID = 3339, Cost = 99093, Expansion = 99}, -- Strike of Solusek
			{ID = 3332, Cost = 100771, Expansion = 99}, -- Tears of Marr
			{ID = 4907, Cost = 117818, Expansion = 99}, -- Telaka
			{ID = 4906, Cost = 116107, Expansion = 99}, -- White Fire
		},
		[66] = {
			{ID = 5443, Cost = 130018, Expansion = 99}, -- Ether Shield
			{ID = 5442, Cost = 133325, Expansion = 99}, -- Icebane
			{ID = 5446, Cost = 131549, Expansion = 99}, -- Spark of Fire
			{ID = 5444, Cost = 130156, Expansion = 99}, -- Tears of the Sun
		},
		[67] = {
			{ID = 5455, Cost = 138518, Expansion = 99}, -- Circle of Fire
			{ID = 5445, Cost = 140767, Expansion = 99}, -- Lightningbane
			{ID = 6120, Cost = 138682, Expansion = 99}, -- Phase Walk
			{ID = 6177, Cost = 141617, Expansion = 99}, -- Translocate: Slaughter
		},
		[68] = {
			{ID = 8041, Cost = 166289, Expansion = 99}, -- Clinging Frost
			{ID = 5448, Cost = 148139, Expansion = 99}, -- Ether Skin
			{ID = 5447, Cost = 148086, Expansion = 99}, -- Firebane
			{ID = 5452, Cost = 148621, Expansion = 99}, -- Spark of Lightning
			{ID = 5449, Cost = 147271, Expansion = 99}, -- Spark of Thunder
			{ID = 5450, Cost = 146920, Expansion = 99}, -- Thundaka
		},
		[69] = {
			{ID = 6669, Cost = 171163, Expansion = 99}, -- Claw of Vox
			{ID = 5453, Cost = 157766, Expansion = 99}, -- Ether Ward
			{ID = 7696, Cost = 1000, Expansion = 4}, -- Focus Mass Intricate Spellcaster's Empowering Essence
			{ID = 5458, Cost = 158120, Expansion = 99}, -- Gelidin Comet
			{ID = 11984, Cost = 207001, Expansion = 13}, -- Katta Castrum Portal
			{ID = 8044, Cost = 177770, Expansion = 99}, -- Mana Weave
			{ID = 5454, Cost = 155624, Expansion = 99}, -- Meteor Storm
			{ID = 5460, Cost = 154951, Expansion = 99}, -- Solist's Frozen Sword
			{ID = 5457, Cost = 158752, Expansion = 99}, -- Spark of Ice
		},
		[70] = {
			{ID = 5459, Cost = 166508, Expansion = 99}, -- Bulwark of Calrena
			{ID = 8512, Cost = 196749, Expansion = 99}, -- Chaos Flame
			{ID = 5451, Cost = 165567, Expansion = 99}, -- Circle of Thunder
			{ID = 5462, Cost = 165035, Expansion = 99}, -- Corona Flare
			{ID = 8043, Cost = 185797, Expansion = 99}, -- Ether Flame
			{ID = 8513, Cost = 197947, Expansion = 99}, -- Fire Rune
			{ID = 7684, Cost = 1000, Expansion = 4}, -- Focus Elaborate Spellcaster's Empowering Essence
			{ID = 5461, Cost = 166055, Expansion = 99}, -- Gelid Rains
			{ID = 8511, Cost = 196725, Expansion = 99}, -- Ice Block
			{ID = 10876, Cost = 206084, Expansion = 12}, -- Icefall Glacier Gate
			{ID = 10875, Cost = 208216, Expansion = 12}, -- Icefall Glacier Portal
			{ID = 5456, Cost = 165947, Expansion = 99}, -- Telekara
			{ID = 10874, Cost = 210556, Expansion = 12}, -- Translocate: Icefall Glacier
		},
		[71] = {
			{ID = 10782, Cost = 221645, Expansion = 4}, -- Concussive Blast
			{ID = 10853, Cost = 221903, Expansion = 4}, -- Defense of Calrena
			{ID = 10770, Cost = 222056, Expansion = 4}, -- Rimelure
			{ID = 10773, Cost = 217495, Expansion = 4}, -- Shield of the Crystalwing
			{ID = 10776, Cost = 222204, Expansion = 4}, -- Tears of the Betrayed
			{ID = 11839, Cost = 235469, Expansion = 4}, -- Wildmagic Strike
			{ID = 11841, Cost = 10000, Expansion = 99}, -- Wildmagic Strike Rk. III
		},
		[72] = {
			{ID = 11834, Cost = 248094, Expansion = 4}, -- Beam of Solteris
			{ID = 11836, Cost = 10000, Expansion = 99}, -- Beam of Solteris Rk. III
			{ID = 10798, Cost = 229575, Expansion = 4}, -- Cloudburst Strike
			{ID = 10804, Cost = 232970, Expansion = 4}, -- Impel
			{ID = 10819, Cost = 232375, Expansion = 4}, -- Leap of Sparks
			{ID = 10788, Cost = 229820, Expansion = 4}, -- Magmaraug's Presence
			{ID = 10792, Cost = 235285, Expansion = 4}, -- Patient Harvest
		},
		[73] = {
			{ID = 10816, Cost = 246767, Expansion = 4}, -- Ball Lightning
			{ID = 10822, Cost = 245337, Expansion = 4}, -- Cold Snap
			{ID = 10807, Cost = 242661, Expansion = 4}, -- Lavalure
			{ID = 10813, Cost = 245886, Expansion = 4}, -- Leap of Shocking Bolts
			{ID = 10810, Cost = 242568, Expansion = 4}, -- Scales of the Crystalwing
			{ID = 10862, Cost = 248608, Expansion = 4}, -- Tendrilmist Guard
			{ID = 10864, Cost = 100000, Expansion = 99}, -- Tendrilmist Guard Rk. III
		},
		[74] = {
			{ID = 11831, Cost = 274077, Expansion = 4}, -- Chaos Immolation
			{ID = 10828, Cost = 260010, Expansion = 4}, -- Crystalwing Ward
			{ID = 10840, Cost = 262585, Expansion = 4}, -- Ethantis's Burning Blade
			{ID = 10841, Cost = 258713, Expansion = 4}, -- Flashfires
			{ID = 7697, Cost = 1000, Expansion = 4}, -- Focus Mass Elaborate Spellcaster's Empowering Essence
			{ID = 10837, Cost = 261865, Expansion = 4}, -- Icefall Avalanche
			{ID = 11983, Cost = 276983, Expansion = 4}, -- Translocate: Katta Castrum
			{ID = 10831, Cost = 259492, Expansion = 4}, -- Volcanic Eruption
		},
		[75] = {
			{ID = 10847, Cost = 276563, Expansion = 4}, -- Claw of Selay
			{ID = 15891, Cost = 272342, Expansion = 4}, -- Dragonscale Hills Gate
			{ID = 15890, Cost = 272307, Expansion = 4}, -- Dragonscale Hills Portal
			{ID = 10540, Cost = 272141, Expansion = 4}, -- Ethereal Conflagration
			{ID = 7685, Cost = 1000, Expansion = 4}, -- Focus Ornate Spellcaster's Empowering Essence
			{ID = 10856, Cost = 275595, Expansion = 4}, -- Icicle Deluge
			{ID = 11828, Cost = 287718, Expansion = 4}, -- Intertwining Energy
			{ID = 11830, Cost = 10000, Expansion = 99}, -- Intertwining Energy Rk. III
			{ID = 10859, Cost = 274127, Expansion = 4}, -- Sothgar's Flame
			{ID = 10850, Cost = 272998, Expansion = 4}, -- Telakisz
			{ID = 15889, Cost = 271664, Expansion = 4}, -- Translocate: Dragonscale Hills
		},
		[76] = {
			{ID = 15462, Cost = 323704, Expansion = 4}, -- Bulwark of Caella
			{ID = 15387, Cost = 322576, Expansion = 4}, -- Bulwark of the Crystalwing
			{ID = 15393, Cost = 320008, Expansion = 4}, -- Concussive Burst
			{ID = 15384, Cost = 320662, Expansion = 4}, -- Lure of Isaz
			{ID = 15511, Cost = 316037, Expansion = 4}, -- Phase March
			{ID = 15390, Cost = 316478, Expansion = 4}, -- Tears of the Forsaken
			{ID = 15491, Cost = 315837, Expansion = 99}, -- Wildmagic Burst
			{ID = 15493, Cost = 2576700, Expansion = 99}, -- Wildmagic Burst Rk. III
		},
		[77] = {
			{ID = 15505, Cost = 333793, Expansion = 4}, -- Aspect of Zomm
			{ID = 15411, Cost = 335716, Expansion = 4}, -- Cloudburst Bolts
			{ID = 15431, Cost = 331607, Expansion = 4}, -- Leap of Static Bolts
			{ID = 15405, Cost = 331473, Expansion = 4}, -- Tranquil Harvest
			{ID = 15402, Cost = 335068, Expansion = 4}, -- Vsorug's Presence
		},
		[78] = {
			{ID = 15471, Cost = 351662, Expansion = 4}, -- Etherroot Guard
			{ID = 15500, Cost = 352575, Expansion = 99}, -- Funnel of Frost
			{ID = 15422, Cost = 349030, Expansion = 4}, -- Laminae of the Crystalwing
			{ID = 15425, Cost = 351853, Expansion = 4}, -- Leap of Arclight
			{ID = 15419, Cost = 356599, Expansion = 4}, -- Pyrolure
			{ID = 15434, Cost = 353732, Expansion = 99}, -- Rime Snap
			{ID = 15435, Cost = 460652, Expansion = 99}, -- Rime Snap Rk. II
			{ID = 15428, Cost = 355847, Expansion = 4}, -- Rolling Lightning
		},
		[79] = {
			{ID = 15483, Cost = 370728, Expansion = 99}, -- Chaos Conflagration
			{ID = 15484, Cost = 530698, Expansion = 99}, -- Chaos Conflagration Rk. II
			{ID = 15485, Cost = 2450070, Expansion = 99}, -- Chaos Conflagration Rk. III
			{ID = 15439, Cost = 368976, Expansion = 4}, -- Crystalwing Guard
			{ID = 15508, Cost = 375052, Expansion = 99}, -- Ethereal Rime
			{ID = 15509, Cost = 585170, Expansion = 99}, -- Ethereal Rime Rk. II
			{ID = 15448, Cost = 368895, Expansion = 4}, -- Euthanos' Flameblade
			{ID = 15451, Cost = 371402, Expansion = 99}, -- Flashflames
			{ID = 15452, Cost = 508334, Expansion = 99}, -- Flashflames Rk. II
			{ID = 15453, Cost = 2278720, Expansion = 99}, -- Flashflames Rk. III
			{ID = 7698, Cost = 1000, Expansion = 4}, -- Focus Mass Ornate Spellcaster's Empowering Essence
			{ID = 15445, Cost = 372545, Expansion = 4}, -- Glacial Collapse
			{ID = 15442, Cost = 368149, Expansion = 4}, -- Pyroclastic Eruption
		},
		[80] = {
			{ID = 21987, Cost = 433913, Expansion = 4}, -- Brell's Rest Gate
			{ID = 21985, Cost = 434530, Expansion = 4}, -- Brell's Rest Portal
			{ID = 15456, Cost = 393985, Expansion = 4}, -- Claw of Selig
			{ID = 15381, Cost = 392711, Expansion = 4}, -- Ethereal Incineration
			{ID = 7686, Cost = 1000, Expansion = 4}, -- Focus Runed Spellcaster's Empowering Essence
			{ID = 15465, Cost = 385826, Expansion = 4}, -- Icicle Storm
			{ID = 15468, Cost = 388677, Expansion = 4}, -- Inizen's Fire
			{ID = 15497, Cost = 387085, Expansion = 4}, -- Netherstep
			{ID = 20543, Cost = 395657, Expansion = 99}, -- Plane of Time Gate
			{ID = 20542, Cost = 386881, Expansion = 99}, -- Plane of Time Portal
			{ID = 15477, Cost = 393888, Expansion = 99}, -- Tangleweave Energy
			{ID = 15459, Cost = 387744, Expansion = 4}, -- Telajasz
			{ID = 21988, Cost = 434086, Expansion = 4}, -- Translocate: Brell's Rest
			{ID = 20541, Cost = 387880, Expansion = 99}, -- Translocate: Plane of Time
		},
		[81] = {
			{ID = 19650, Cost = 429642, Expansion = 99}, -- Aegis of Calrena
			{ID = 19573, Cost = 426143, Expansion = 99}, -- Concussive Flash
			{ID = 19699, Cost = 431884, Expansion = 99}, -- Nethervoid March
			{ID = 18558, Cost = 432620, Expansion = 99}, -- Shield of the Void
			{ID = 19570, Cost = 429554, Expansion = 99}, -- Tears of the Pyrilen
			{ID = 19564, Cost = 426964, Expansion = 99}, -- Voidfrost Lure
		},
		[82] = {
			{ID = 19591, Cost = 454877, Expansion = 15}, -- Cloudburst Levin
			{ID = 19611, Cost = 454752, Expansion = 15}, -- Leap of Static Jolts
			{ID = 19585, Cost = 452429, Expansion = 15}, -- Serene Harvest
			{ID = 19582, Cost = 448927, Expansion = 15}, -- Talendor's Presence
		},
		[83] = {
			{ID = 19599, Cost = 470135, Expansion = 99}, -- Flarelure
			{ID = 19615, Cost = 673199, Expansion = 99}, -- Gelid Snap Rk. II
			{ID = 19605, Cost = 478021, Expansion = 99}, -- Leap of Lightning Sprites
			{ID = 19659, Cost = 480800, Expansion = 99}, -- Nethermist Guard
			{ID = 19608, Cost = 469563, Expansion = 99}, -- Ribbon Lightning
			{ID = 19602, Cost = 480342, Expansion = 99}, -- Squamae of the Crystalwing
		},
		[84] = {
			{ID = 19671, Cost = 493088, Expansion = 99}, -- Chaos Combustion
			{ID = 19623, Cost = 503462, Expansion = 99}, -- Crystalwing Shell
			{ID = 19632, Cost = 499220, Expansion = 99}, -- Daveron's Pyroblade
			{ID = 19629, Cost = 496446, Expansion = 99}, -- Icesheet Cascade
			{ID = 19626, Cost = 504081, Expansion = 99}, -- Magmatic Eruption
		},
		[85] = {
			{ID = 19644, Cost = 515694, Expansion = 99}, -- Claw of Gorenaire
			{ID = 19561, Cost = 519971, Expansion = 99}, -- Ethereal Combustion
			{ID = 17885, Cost = 567806, Expansion = 99}, -- Grounds Gate
			{ID = 17886, Cost = 569673, Expansion = 99}, -- Grounds Portal
			{ID = 19653, Cost = 515184, Expansion = 99}, -- Icicle Torrent
			{ID = 19656, Cost = 520065, Expansion = 99}, -- Klixcxyk's Fire
			{ID = 19647, Cost = 519636, Expansion = 99}, -- Telajara
			{ID = 19665, Cost = 522659, Expansion = 99}, -- Thricewoven Energy
			{ID = 17887, Cost = 579627, Expansion = 99}, -- Translocate: the Grounds
		},
		[86] = {
			{ID = 26520, Cost = 600942, Expansion = 99}, -- Aegis of Lithara
			{ID = 26523, Cost = 600394, Expansion = 99}, -- Concussive Burst
			{ID = 26543, Cost = 600567, Expansion = 99}, -- Glacial Lure
			{ID = 26333, Cost = 606975, Expansion = 99}, -- Shield of Dreams
			{ID = 26546, Cost = 594112, Expansion = 99}, -- Tears of Flame
		},
		[87] = {
			{ID = 26561, Cost = 620050, Expansion = 99}, -- Cloudburst Storm
			{ID = 26566, Cost = 625232, Expansion = 99}, -- Glacial Pillar
			{ID = 26569, Cost = 627824, Expansion = 99}, -- Leap of Corposantum
			{ID = 26572, Cost = 620955, Expansion = 99}, -- Ring of Fire
			{ID = 26575, Cost = 629199, Expansion = 99}, -- Soothing Harvest
		},
		[88] = {
			{ID = 26578, Cost = 650585, Expansion = 99}, -- Beam of Permafrost
			{ID = 26583, Cost = 665123, Expansion = 99}, -- Dermis of the Crystalwing
			{ID = 26586, Cost = 657968, Expansion = 99}, -- Flamelure
			{ID = 26589, Cost = 651975, Expansion = 99}, -- Freezing Snap
			{ID = 26598, Cost = 661813, Expansion = 99}, -- Lightning Helix
			{ID = 26604, Cost = 660833, Expansion = 99}, -- Mana Vortex
			{ID = 26610, Cost = 661430, Expansion = 99}, -- Murkmist Guard
		},
		[89] = {
			{ID = 26616, Cost = 696414, Expansion = 99}, -- Blazing Pillar
			{ID = 26619, Cost = 695651, Expansion = 99}, -- Chaos Char
			{ID = 26622, Cost = 681334, Expansion = 99}, -- Crystalwing Carapace
			{ID = 26625, Cost = 690068, Expansion = 99}, -- Denunciation of Havoc
			{ID = 26644, Cost = 683152, Expansion = 99}, -- Ethereal Glaciation
			{ID = 26647, Cost = 694100, Expansion = 99}, -- Flashpyre
			{ID = 26656, Cost = 678212, Expansion = 99}, -- Glacial Cascade
			{ID = 26659, Cost = 684049, Expansion = 99}, -- Lithara's Pyroblade
			{ID = 26662, Cost = 685872, Expansion = 99}, -- Magmatic Downpour
		},
		[90] = {
			{ID = 26665, Cost = 727675, Expansion = 99}, -- Ethereal Inferno
			{ID = 26668, Cost = 725037, Expansion = 99}, -- Glacial Claw
			{ID = 26671, Cost = 717658, Expansion = 99}, -- Hail Torrent
			{ID = 26674, Cost = 716640, Expansion = 99}, -- Ice Vortex
			{ID = 26680, Cost = 720095, Expansion = 99}, -- Lithara's Fire
			{ID = 26683, Cost = 724945, Expansion = 99}, -- Maelstrom of Mana
			{ID = 26698, Cost = 726634, Expansion = 99}, -- Self-Annihilation
			{ID = 26704, Cost = 718435, Expansion = 99}, -- Splash of Rhyolite
			{ID = 26707, Cost = 712528, Expansion = 99}, -- Telakama
			{ID = 26710, Cost = 714840, Expansion = 99}, -- Thricewoven Electricity
		},
		[91] = {
			{ID = 29645, Cost = 1183533, Expansion = 99}, -- Aegis of Alra
			{ID = 29648, Cost = 1184010, Expansion = 99}, -- Concussive Barrage
			{ID = 29666, Cost = 1185104, Expansion = 99}, -- Frigid Lure
			{ID = 29672, Cost = 1183768, Expansion = 99}, -- Katelanama
			{ID = 29445, Cost = 1182546, Expansion = 18}, -- Shield of Bronze
			{ID = 29669, Cost = 1183350, Expansion = 99}, -- Tears of Daevan
		},
		[92] = {
			{ID = 29682, Cost = 1196342, Expansion = 99}, -- Cloudburst Tempest
			{ID = 29690, Cost = 1195515, Expansion = 99}, -- Frozen Pillar
			{ID = 29693, Cost = 1196877, Expansion = 99}, -- Leap of Plasma
			{ID = 29699, Cost = 1196576, Expansion = 99}, -- Placid Harvest
			{ID = 29696, Cost = 1194473, Expansion = 99}, -- Ring of Flame
		},
		[93] = {
			{ID = 29710, Cost = 1208448, Expansion = 99}, -- Armor of the Crystalwing
			{ID = 29707, Cost = 1206660, Expansion = 99}, -- Atol's Concussive Shackles
			{ID = 29702, Cost = 1208424, Expansion = 99}, -- Beam of Rime Crystals
			{ID = 29713, Cost = 1211417, Expansion = 99}, -- Blazelure
			{ID = 29725, Cost = 1209213, Expansion = 99}, -- Lightning Swarm
			{ID = 29735, Cost = 1208187, Expansion = 99}, -- Shademist Guard
		},
	},
	[Class.MAGICIAN] = {
		[1] = {
			{ID = 93, Cost = 20, Expansion = 0}, -- Burst of Flame
			{ID = 313, Cost = 20, Expansion = 0}, -- Fire Flux
			{ID = 310, Cost = 20, Expansion = 0}, -- Flare
			{ID = 288, Cost = 20, Expansion = 0}, -- Minor Shielding
			{ID = 331, Cost = 20, Expansion = 0}, -- Reclaim Energy
			{ID = 311, Cost = 20, Expansion = 0}, -- Summon Dagger
			{ID = 211, Cost = 20, Expansion = 0}, -- Summon Drink
			{ID = 50, Cost = 20, Expansion = 0}, -- Summon Food
			{ID = 205, Cost = 20, Expansion = 0}, -- True North
		},
		[2] = {
			{ID = 315, Cost = 20, Expansion = 0}, -- Elementalkin: Water
			{ID = 318, Cost = 20, Expansion = 0}, -- Summon Bandages
			{ID = 2230, Cost = 28, Expansion = 4}, -- Summon Brass Choker
		},
		[3] = {
			{ID = 316, Cost = 22, Expansion = 0}, -- Elementalkin: Fire
			{ID = 232, Cost = 22, Expansion = 0}, -- Sense Summoned
			{ID = 321, Cost = 22, Expansion = 0}, -- Summon Wisp
		},
		[4] = {
			{ID = 94, Cost = 24, Expansion = 0}, -- Burn
			{ID = 317, Cost = 24, Expansion = 0}, -- Elementalkin: Air
			{ID = 36, Cost = 24, Expansion = 0}, -- Gate
		},
		[5] = {
			{ID = 58, Cost = 28, Expansion = 0}, -- Elementalkin: Earth
			{ID = 322, Cost = 28, Expansion = 0}, -- Flame Bolt
			{ID = 246, Cost = 28, Expansion = 0}, -- Lesser Shielding
		},
		[6] = {
			{ID = 325, Cost = 34, Expansion = 0}, -- Dimensional Pocket
			{ID = 398, Cost = 34, Expansion = 0}, -- Elementaling: Water
			{ID = 323, Cost = 34, Expansion = 0}, -- Eye of Zomm
		},
		[7] = {
			{ID = 399, Cost = 42, Expansion = 0}, -- Elementaling: Fire
			{ID = 1504, Cost = 55, Expansion = 0}, -- Renew Elements
			{ID = 332, Cost = 43, Expansion = 0}, -- Shield of Fire
			{ID = 324, Cost = 43, Expansion = 0}, -- Shock of Blades
		},
		[8] = {
			{ID = 400, Cost = 55, Expansion = 0}, -- Elementaling: Air
			{ID = 42, Cost = 24, Expansion = 0}, -- Invisibility
			{ID = 613, Cost = 55, Expansion = 0}, -- Staff of Tracing
			{ID = 2233, Cost = 118, Expansion = 4}, -- Summon Linen Mantle
		},
		[9] = {
			{ID = 397, Cost = 72, Expansion = 0}, -- Elementaling: Earth
			{ID = 319, Cost = 71, Expansion = 0}, -- Summon Fang
			{ID = 248, Cost = 20, Expansion = 0}, -- Ward Summoned
		},
		[10] = {
			{ID = 48, Cost = 43, Expansion = 0}, -- Cancel Magic
			{ID = 402, Cost = 92, Expansion = 0}, -- Elemental: Water
			{ID = 330, Cost = 93, Expansion = 0}, -- Rain of Blades
			{ID = 2242, Cost = 193, Expansion = 4}, -- Summon Tarnished Bauble
		},
		[11] = {
			{ID = 327, Cost = 120, Expansion = 0}, -- Burnout
			{ID = 403, Cost = 118, Expansion = 0}, -- Elemental: Fire
			{ID = 2531, Cost = 240, Expansion = 3}, -- Summon Elemental Defender
		},
		[12] = {
			{ID = 35, Cost = 93, Expansion = 0}, -- Bind Affinity
			{ID = 328, Cost = 151, Expansion = 0}, -- Column of Fire
			{ID = 404, Cost = 151, Expansion = 0}, -- Elemental: Air
		},
		[13] = {
			{ID = 401, Cost = 195, Expansion = 0}, -- Elemental: Earth
			{ID = 305, Cost = 191, Expansion = 0}, -- Identify
			{ID = 333, Cost = 195, Expansion = 0}, -- Phantom Leather
			{ID = 4255, Cost = 658, Expansion = 0}, -- Wuggan's Lesser Appraisal
		},
		[14] = {
			{ID = 336, Cost = 241, Expansion = 0}, -- Minor Summoning: Water
			{ID = 614, Cost = 241, Expansion = 0}, -- Staff of Warding
			{ID = 4267, Cost = 786, Expansion = 0}, -- Wuggan's Lesser Discombobulation
			{ID = 4279, Cost = 783, Expansion = 0}, -- Wuggan's Lesser Extrication
		},
		[15] = {
			{ID = 395, Cost = 299, Expansion = 4}, -- Minor Summoning: Fire
			{ID = 334, Cost = 301, Expansion = 0}, -- Shock of Flame
			{ID = 320, Cost = 302, Expansion = 0}, -- Summon Heatstone
			{ID = 100, Cost = 299, Expansion = 0}, -- Summon Throwing Dagger
		},
		[16] = {
			{ID = 7676, Cost = 369, Expansion = 4}, -- Focus Crude Spellcaster's Empowering Essence
			{ID = 7674, Cost = 369, Expansion = 4}, -- Focus Primitive Spellcaster's Empowering Essence
			{ID = 7675, Cost = 371, Expansion = 4}, -- Focus Rudimentary Spellcaster's Empowering Essence
			{ID = 396, Cost = 367, Expansion = 4}, -- Minor Summoning: Air
			{ID = 80, Cost = 24, Expansion = 0}, -- See Invisible
			{ID = 309, Cost = 301, Expansion = 0}, -- Shielding
			{ID = 2239, Cost = 651, Expansion = 4}, -- Summon Tiny Ring
		},
		[17] = {
			{ID = 335, Cost = 449, Expansion = 4}, -- Minor Summoning: Earth
			{ID = 83, Cost = 454, Expansion = 0}, -- Rain of Fire
			{ID = 2532, Cost = 778, Expansion = 3}, -- Summon Phantom Leather
			{ID = 4, Cost = 457, Expansion = 0}, -- Summon Waterstone
		},
		[18] = {
			{ID = 68, Cost = 540, Expansion = 0}, -- Bolt of Flame
			{ID = 663, Cost = 193, Expansion = 0}, -- Expulse Summoned
			{ID = 497, Cost = 547, Expansion = 4}, -- Lesser Summoning: Water
			{ID = 1505, Cost = 648, Expansion = 0}, -- Renew Summoning
		},
		[19] = {
			{ID = 108, Cost = 661, Expansion = 0}, -- Elemental Shield
			{ID = 498, Cost = 652, Expansion = 4}, -- Lesser Summoning: Fire
			{ID = 411, Cost = 647, Expansion = 0}, -- Shield of Flame
			{ID = 3583, Cost = 373, Expansion = 0}, -- Tiny Companion
		},
		[20] = {
			{ID = 7677, Cost = 369, Expansion = 4}, -- Focus Makeshift Spellcaster's Empowering Essence
			{ID = 7689, Cost = 778, Expansion = 4}, -- Focus Mass Crude Spellcaster's Empowering Essence
			{ID = 7687, Cost = 787, Expansion = 4}, -- Focus Mass Primitive Spellcaster's Empowering Essence
			{ID = 7688, Cost = 779, Expansion = 4}, -- Focus Mass Rudimentary Spellcaster's Empowering Essence
			{ID = 499, Cost = 775, Expansion = 0}, -- Lesser Summoning: Air
			{ID = 102, Cost = 782, Expansion = 0}, -- Spear of Warding
			{ID = 101, Cost = 786, Expansion = 0}, -- Summon Arrows
			{ID = 2236, Cost = 1257, Expansion = 4}, -- Summon Jade Bracelet
			{ID = 4027, Cost = 782, Expansion = 4}, -- Summon Wooden Bracelet
		},
		[21] = {
			{ID = 55, Cost = 925, Expansion = 0}, -- Cornucopia
			{ID = 496, Cost = 929, Expansion = 4}, -- Lesser Summoning: Earth
			{ID = 2231, Cost = 1479, Expansion = 4}, -- Summon Silver Choker
		},
		[22] = {
			{ID = 56, Cost = 1091, Expansion = 4}, -- Everfount
			{ID = 189, Cost = 1079, Expansion = 0}, -- Flame Flux
			{ID = 110, Cost = 553, Expansion = 0}, -- Malaise
			{ID = 570, Cost = 1091, Expansion = 4}, -- Summoning: Water
		},
		[23] = {
			{ID = 113, Cost = 1262, Expansion = 0}, -- Shock of Spikes
			{ID = 571, Cost = 1259, Expansion = 4}, -- Summoning: Fire
			{ID = 4256, Cost = 2922, Expansion = 0}, -- Wuggan's Appraisal
		},
		[24] = {
			{ID = 7690, Cost = 776, Expansion = 4}, -- Focus Mass Makeshift Spellcaster's Empowering Essence
			{ID = 65, Cost = 1267, Expansion = 0}, -- Major Shielding
			{ID = 615, Cost = 1464, Expansion = 0}, -- Staff of Runes
			{ID = 572, Cost = 1493, Expansion = 4}, -- Summoning: Air
			{ID = 4268, Cost = 3355, Expansion = 0}, -- Wuggan's Discombobulation
			{ID = 4280, Cost = 3360, Expansion = 0}, -- Wuggan's Extrication
		},
		[25] = {
			{ID = 115, Cost = 1259, Expansion = 0}, -- Dismiss Summoned
			{ID = 81, Cost = 2576, Expansion = 0}, -- Phantom Chain
			{ID = 2533, Cost = 2591, Expansion = 3}, -- Summon Phantom Chain
			{ID = 569, Cost = 1711, Expansion = 0}, -- Summoning: Earth
		},
		[26] = {
			{ID = 574, Cost = 1956, Expansion = 0}, -- Greater Summoning: Water
			{ID = 409, Cost = 1945, Expansion = 0}, -- Rain of Spikes
			{ID = 617, Cost = 1966, Expansion = 0}, -- Sword of Runes
		},
		[27] = {
			{ID = 1286, Cost = 2977, Expansion = 4}, -- Expedience
			{ID = 575, Cost = 2253, Expansion = 0}, -- Greater Summoning: Fire
			{ID = 2234, Cost = 3321, Expansion = 4}, -- Summon Leather Mantle
		},
		[28] = {
			{ID = 664, Cost = 2596, Expansion = 0}, -- Expel Summoned
			{ID = 576, Cost = 2561, Expansion = 0}, -- Greater Summoning: Air
			{ID = 479, Cost = 2616, Expansion = 0}, -- Inferno Shield
		},
		[29] = {
			{ID = 106, Cost = 2940, Expansion = 0}, -- Burnout II
			{ID = 573, Cost = 2961, Expansion = 4}, -- Greater Summoning: Earth
			{ID = 103, Cost = 2901, Expansion = 0}, -- Summon Coldstone
		},
		[30] = {
			{ID = 618, Cost = 3300, Expansion = 0}, -- Dimensional Hole
			{ID = 7678, Cost = 1000, Expansion = 4}, -- Focus Elementary Spellcaster's Empowering Essence
			{ID = 1400, Cost = 4286, Expansion = 2}, -- Monster Summoning I
			{ID = 2243, Cost = 4792, Expansion = 4}, -- Summon Shiny Bauble
		},
		[31] = {
			{ID = 120, Cost = 3811, Expansion = 0}, -- Blaze
			{ID = 621, Cost = 3754, Expansion = 0}, -- Minor Conjuration: Water
			{ID = 1401, Cost = 4792, Expansion = 4}, -- Summon Shard of the Core
		},
		[32] = {
			{ID = 66, Cost = 3792, Expansion = 0}, -- Greater Shielding
			{ID = 622, Cost = 4304, Expansion = 0}, -- Minor Conjuration: Fire
			{ID = 49, Cost = 4197, Expansion = 0}, -- Nullify Magic
		},
		[33] = {
			{ID = 69, Cost = 4763, Expansion = 0}, -- Cinder Bolt
			{ID = 623, Cost = 4792, Expansion = 4}, -- Minor Conjuration: Air
			{ID = 616, Cost = 4813, Expansion = 0}, -- Staff of Symbols
			{ID = 4257, Cost = 9128, Expansion = 0}, -- Wuggan's Greater Appraisal
		},
		[34] = {
			{ID = 7691, Cost = 1000, Expansion = 4}, -- Focus Mass Elementary Spellcaster's Empowering Essence
			{ID = 620, Cost = 5417, Expansion = 0}, -- Minor Conjuration: Earth
			{ID = 3584, Cost = 5270, Expansion = 4}, -- Refresh Summoning
			{ID = 4269, Cost = 9894, Expansion = 0}, -- Wuggan's Greater Discombobulation
			{ID = 4281, Cost = 10058, Expansion = 0}, -- Wuggan's Greater Extrication
		},
		[35] = {
			{ID = 104, Cost = 5996, Expansion = 0}, -- Dagger of Symbols
			{ID = 121, Cost = 6054, Expansion = 0}, -- Rain of Lava
		},
		[36] = {
			{ID = 625, Cost = 6711, Expansion = 7}, -- Lesser Conjuration: Water
			{ID = 1285, Cost = 3719, Expansion = 4}, -- Summon Companion
		},
		[37] = {
			{ID = 626, Cost = 7318, Expansion = 0}, -- Lesser Conjuration: Fire
			{ID = 105, Cost = 7403, Expansion = 0}, -- Summon Ring of Flight
			{ID = 2240, Cost = 10136, Expansion = 4}, -- Summon Twisted Ring
		},
		[38] = {
			{ID = 680, Cost = 8259, Expansion = 0}, -- Barrier of Combustion
			{ID = 627, Cost = 8295, Expansion = 0}, -- Lesser Conjuration: Air
			{ID = 2534, Cost = 11046, Expansion = 3}, -- Summon Phantom Plate
		},
		[39] = {
			{ID = 122, Cost = 9166, Expansion = 0}, -- Flame Arc
			{ID = 624, Cost = 8972, Expansion = 4}, -- Lesser Conjuration: Earth
		},
		[40] = {
			{ID = 7679, Cost = 1000, Expansion = 4}, -- Focus Modest Spellcaster's Empowering Essence
		},
		[41] = {
			{ID = 629, Cost = 11033, Expansion = 7}, -- Conjuration: Water
			{ID = 109, Cost = 11041, Expansion = 0}, -- Elemental Armor
			{ID = 82, Cost = 14828, Expansion = 0}, -- Phantom Plate
			{ID = 114, Cost = 10905, Expansion = 0}, -- Shock of Swords
		},
		[42] = {
			{ID = 4099, Cost = 22758, Expansion = 0}, -- Bounce
			{ID = 630, Cost = 12193, Expansion = 0}, -- Conjuration: Fire
			{ID = 2237, Cost = 15830, Expansion = 4}, -- Summon Opal Bracelet
			{ID = 4082, Cost = 21067, Expansion = 4}, -- Summon: Orb of Exploration
		},
		[43] = {
			{ID = 67, Cost = 9999, Expansion = 0}, -- Arch Shielding
			{ID = 631, Cost = 13416, Expansion = 7}, -- Conjuration: Air
			{ID = 1403, Cost = 16000, Expansion = 4}, -- Elemental Maelstrom
		},
		[44] = {
			{ID = 628, Cost = 14832, Expansion = 7}, -- Conjuration: Earth
			{ID = 7692, Cost = 1000, Expansion = 4}, -- Focus Mass Modest Spellcaster's Empowering Essence
			{ID = 111, Cost = 4257, Expansion = 0}, -- Malaisement
			{ID = 1503, Cost = 15969, Expansion = 0}, -- Modulating Rod
			{ID = 3699, Cost = 22512, Expansion = 4}, -- Primal Remedy
			{ID = 4028, Cost = 14495, Expansion = 4}, -- Summon Stone Bracelet
		},
		[45] = {
			{ID = 412, Cost = 16127, Expansion = 0}, -- Shield of Lava
		},
		[46] = {
			{ID = 632, Cost = 17421, Expansion = 0}, -- Greater Conjuration: Earth
			{ID = 4079, Cost = 36199, Expansion = 0}, -- Ward of Calliav
		},
		[47] = {
			{ID = 107, Cost = 19236, Expansion = 0}, -- Burnout III
			{ID = 634, Cost = 19274, Expansion = 4}, -- Greater Conjuration: Fire
			{ID = 70, Cost = 19066, Expansion = 0}, -- Lava Bolt
		},
		[48] = {
			{ID = 116, Cost = 13200, Expansion = 0}, -- Banish Summoned
			{ID = 635, Cost = 20580, Expansion = 4}, -- Greater Conjuration: Air
			{ID = 2535, Cost = 26433, Expansion = 3}, -- Summon Elemental Blanket
		},
		[49] = {
			{ID = 633, Cost = 22836, Expansion = 0}, -- Greater Conjuration: Water
			{ID = 410, Cost = 22914, Expansion = 0}, -- Rain of Swords
		},
		[50] = {
			{ID = 7680, Cost = 1000, Expansion = 4}, -- Focus Simple Spellcaster's Empowering Essence
			{ID = 1402, Cost = 28887, Expansion = 4}, -- Monster Summoning II
			{ID = 2232, Cost = 31118, Expansion = 4}, -- Summon Golden Choker
		},
		[51] = {
			{ID = 1680, Cost = 28605, Expansion = 0}, -- Gift of Xev
			{ID = 112, Cost = 20764, Expansion = 0}, -- Malosi
			{ID = 1659, Cost = 28608, Expansion = 0}, -- Scintillation
			{ID = 2235, Cost = 34258, Expansion = 4}, -- Summon Silken Mantle
			{ID = 1671, Cost = 29014, Expansion = 1}, -- Vocarate: Earth
		},
		[52] = {
			{ID = 1681, Cost = 31554, Expansion = 0}, -- Bristlebane's Bundle
			{ID = 1660, Cost = 31015, Expansion = 1}, -- Char
			{ID = 3700, Cost = 42228, Expansion = 0}, -- Elemental Empathy
			{ID = 1666, Cost = 31175, Expansion = 1}, -- Phantom Armor
			{ID = 2244, Cost = 36983, Expansion = 4}, -- Summon Brilliant Bauble
			{ID = 2536, Cost = 37028, Expansion = 0}, -- Transon's Elemental Infusion
			{ID = 1673, Cost = 31286, Expansion = 0}, -- Vocarate: Fire
		},
		[53] = {
			{ID = 1526, Cost = 33468, Expansion = 1}, -- Annul Magic
			{ID = 1668, Cost = 33550, Expansion = 0}, -- Boon of Immolation
			{ID = 1682, Cost = 33456, Expansion = 0}, -- Quiver of Marr
			{ID = 2241, Cost = 39283, Expansion = 4}, -- Summon Studded Ring
			{ID = 1674, Cost = 33436, Expansion = 0}, -- Vocarate: Air
		},
		[54] = {
			{ID = 1683, Cost = 36885, Expansion = 0}, -- Bandoleer of Luclin
			{ID = 3582, Cost = 45417, Expansion = 0}, -- Elemental Cloak
			{ID = 5133, Cost = 46292, Expansion = 4}, -- Elemental Draw
			{ID = 7693, Cost = 1000, Expansion = 4}, -- Focus Mass Simple Spellcaster's Empowering Essence
			{ID = 4011, Cost = 42015, Expansion = 4}, -- Kindle
			{ID = 2879, Cost = 42550, Expansion = 0}, -- Phantasmal Armor
			{ID = 1661, Cost = 36274, Expansion = 0}, -- Scars of Sigil
			{ID = 1610, Cost = 36574, Expansion = 1}, -- Shield of the Magi
			{ID = 4029, Cost = 36431, Expansion = 4}, -- Summon Iron Bracelet
			{ID = 2238, Cost = 42810, Expansion = 4}, -- Summon Ruby Bracelet
			{ID = 2537, Cost = 42649, Expansion = 0}, -- Veil of Elements
			{ID = 1672, Cost = 36414, Expansion = 0}, -- Vocarate: Water
		},
		[55] = {
			{ID = 1472, Cost = 42202, Expansion = 0}, -- Burnout IV
			{ID = 1771, Cost = 39706, Expansion = 0}, -- Call of the Hero
			{ID = 8933, Cost = 80155, Expansion = 0}, -- Earthen Strength
			{ID = 7681, Cost = 1000, Expansion = 4}, -- Focus Spellcaster's Empowering Essence
			{ID = 1684, Cost = 39705, Expansion = 0}, -- Pouch of Quellious
			{ID = 1770, Cost = 39212, Expansion = 0}, -- Rage of Zomm
			{ID = 1662, Cost = 39260, Expansion = 1}, -- Sirocco
			{ID = 1405, Cost = 43008, Expansion = 0}, -- Wrath of the Elements
		},
		[56] = {
			{ID = 1667, Cost = 42365, Expansion = 1}, -- Cadeau of Flame
			{ID = 1679, Cost = 41867, Expansion = 99}, -- Dyzil's Deafening Decoy
			{ID = 1529, Cost = 39222, Expansion = 1}, -- Exile Summoned
			{ID = 2538, Cost = 49069, Expansion = 99}, -- Mass Mystical Transvergence
			{ID = 1685, Cost = 42519, Expansion = 99}, -- Muzzle of Mardu
			{ID = 3188, Cost = 52735, Expansion = 4}, -- Rod of Mystical Transvergence
		},
		[57] = {
			{ID = 1720, Cost = 45942, Expansion = 4}, -- Eye of Tallon
			{ID = 1675, Cost = 46328, Expansion = 1}, -- Greater Vocaration: Earth
			{ID = 1663, Cost = 45796, Expansion = 1}, -- Shock of Steel
		},
		[58] = {
			{ID = 1677, Cost = 49544, Expansion = 0}, -- Greater Vocaration: Fire
			{ID = 4080, Cost = 70319, Expansion = 0}, -- Guard of Calliav
			{ID = 1577, Cost = 45718, Expansion = 1}, -- Malosini
			{ID = 4100, Cost = 69702, Expansion = 0}, -- Reflect
			{ID = 2539, Cost = 57151, Expansion = 0}, -- Transon's Phantasmal Protection
			{ID = 1670, Cost = 48755, Expansion = 0}, -- Velocity
		},
		[59] = {
			{ID = 7694, Cost = 1000, Expansion = 4}, -- Focus Mass Spellcaster's Empowering Essence
			{ID = 1678, Cost = 53440, Expansion = 0}, -- Greater Vocaration: Air
			{ID = 1665, Cost = 53049, Expansion = 9}, -- Manastorm
			{ID = 1664, Cost = 52955, Expansion = 1}, -- Seeking Flame of Seukor
			{ID = 1284, Cost = 55842, Expansion = 4}, -- Valiant Companion
		},
		[60] = {
			{ID = 1669, Cost = 56247, Expansion = 99}, -- Aegis of Ro
			{ID = 1531, Cost = 56502, Expansion = 4}, -- Banishment
			{ID = 7682, Cost = 1000, Expansion = 4}, -- Focus Refined Spellcaster's Empowering Essence
			{ID = 1676, Cost = 56887, Expansion = 99}, -- Greater Vocaration: Water
			{ID = 1394, Cost = 67412, Expansion = 99}, -- Maelstrom of Electricity
			{ID = 1772, Cost = 57229, Expansion = 9}, -- Mala
			{ID = 1404, Cost = 61246, Expansion = 99}, -- Monster Summoning III
			{ID = 2540, Cost = 67593, Expansion = 99}, -- Shock of Fiery Blades
			{ID = 2896, Cost = 67427, Expansion = 99}, -- Transon's Elemental Renewal
			{ID = 4078, Cost = 82350, Expansion = 0}, -- Wind of the Desert
		},
		[61] = {
			{ID = 3040, Cost = 69959, Expansion = 99}, -- Belt of Magi`Kot
			{ID = 3041, Cost = 71579, Expansion = 99}, -- Blade of Walnan
			{ID = 3329, Cost = 69895, Expansion = 4}, -- Elemental Barrier
			{ID = 3318, Cost = 70796, Expansion = 4}, -- Firebolt of Tallon
			{ID = 3198, Cost = 69760, Expansion = 99}, -- Flameshield of Ro
			{ID = 3300, Cost = 71391, Expansion = 4}, -- Shield of the Arcane
			{ID = 3209, Cost = 71682, Expansion = 99}, -- Summon Glowing Bauble
			{ID = 3205, Cost = 71778, Expansion = 99}, -- Summon Platinum Choker
			{ID = 3206, Cost = 71482, Expansion = 99}, -- Summon Runed Mantle
			{ID = 3207, Cost = 71047, Expansion = 99}, -- Summon Sapphire Bracelet
			{ID = 3208, Cost = 70712, Expansion = 99}, -- Summon Spiked Ring
			{ID = 4030, Cost = 71193, Expansion = 99}, -- Summon Steel Bracelet
			{ID = 6738, Cost = 0, Expansion = 0}, -- Summon: Lava Orb
			{ID = 3317, Cost = 70586, Expansion = 99}, -- Ward of Xegony
		},
		[62] = {
			{ID = 4110, Cost = 93924, Expansion = 0}, -- Burning Sand
			{ID = 3237, Cost = 74680, Expansion = 4}, -- Burnout V
			{ID = 3042, Cost = 74788, Expansion = 99}, -- Fist of Ixiblat
			{ID = 3352, Cost = 75048, Expansion = 4}, -- Imbue Earth
			{ID = 3320, Cost = 75216, Expansion = 4}, -- Servant of Marr
			{ID = 3319, Cost = 74715, Expansion = 4}, -- Sun Storm
			{ID = 3045, Cost = 75738, Expansion = 4}, -- Talisman of Return
			{ID = 3031, Cost = 75996, Expansion = 99}, -- Xegony's Phantasmal Guard
		},
		[63] = {
			{ID = 3321, Cost = 80874, Expansion = 99}, -- Black Steel
			{ID = 3043, Cost = 81737, Expansion = 99}, -- Blade of The Kedge
			{ID = 3322, Cost = 80670, Expansion = 99}, -- Child of Ro
			{ID = 3483, Cost = 81567, Expansion = 4}, -- Elemental Silence
			{ID = 3486, Cost = 81119, Expansion = 99}, -- Maelstrom of Ro
			{ID = 3387, Cost = 81224, Expansion = 4}, -- Malosinia
			{ID = 3210, Cost = 79775, Expansion = 99}, -- Summon Jewelry Bag
		},
		[64] = {
			{ID = 3238, Cost = 86916, Expansion = 4}, -- Destroy Summoned
			{ID = 7695, Cost = 1000, Expansion = 4}, -- Focus Mass Refined Spellcaster's Empowering Essence
			{ID = 3044, Cost = 87265, Expansion = 99}, -- Girdle of Magi`Kot
			{ID = 3353, Cost = 85348, Expansion = 4}, -- Imbue Air
			{ID = 3323, Cost = 86514, Expansion = 99}, -- Maelstrom of Thunder
			{ID = 3239, Cost = 86514, Expansion = 99}, -- Planar Renewal
			{ID = 4081, Cost = 106619, Expansion = 0}, -- Protection of Calliav
			{ID = 3302, Cost = 85591, Expansion = 4}, -- Shield of Maelin
		},
		[65] = {
			{ID = 3484, Cost = 98681, Expansion = 99}, -- Call of the Arch Mage
			{ID = 4886, Cost = 117965, Expansion = 99}, -- Elemental Siphon
			{ID = 7683, Cost = 1000, Expansion = 4}, -- Focus Intricate Spellcaster's Empowering Essence
			{ID = 3356, Cost = 99869, Expansion = 4}, -- Imbue Fire
			{ID = 3357, Cost = 98311, Expansion = 4}, -- Imbue Water
			{ID = 4888, Cost = 116320, Expansion = 99}, -- Monster Summoning IV
			{ID = 3324, Cost = 99254, Expansion = 99}, -- Rathe's Son
			{ID = 4887, Cost = 117681, Expansion = 99}, -- Rock of Taelosia
			{ID = 3325, Cost = 99360, Expansion = 99}, -- Sun Vortex
		},
		[66] = {
			{ID = 5474, Cost = 130172, Expansion = 99}, -- Bolt of Jerikor
			{ID = 5473, Cost = 132335, Expansion = 99}, -- Child of Wind
			{ID = 5472, Cost = 131620, Expansion = 99}, -- Elemental Aura
			{ID = 5466, Cost = 131163, Expansion = 99}, -- Fireskin
			{ID = 5470, Cost = 130880, Expansion = 99}, -- Summon Calliav's Glowing Bauble
			{ID = 5468, Cost = 131480, Expansion = 99}, -- Summon Calliav's Jeweled Bracelet
			{ID = 5475, Cost = 131946, Expansion = 99}, -- Summon Calliav's Platinum Choker
			{ID = 5464, Cost = 131811, Expansion = 99}, -- Summon Calliav's Runed Mantle
			{ID = 5469, Cost = 129752, Expansion = 99}, -- Summon Calliav's Spiked Ring
			{ID = 5471, Cost = 131220, Expansion = 99}, -- Summon Calliav's Steel Bracelet
			{ID = 5467, Cost = 133131, Expansion = 99}, -- Summon Fireblade
		},
		[67] = {
			{ID = 5480, Cost = 138954, Expansion = 99}, -- Child of Water
			{ID = 5479, Cost = 141592, Expansion = 99}, -- Rain of Jerikor
			{ID = 5489, Cost = 140024, Expansion = 99}, -- Summon Crystal Belt
			{ID = 5477, Cost = 138256, Expansion = 99}, -- Summon Dagger of the Deep
			{ID = 5486, Cost = 137808, Expansion = 99}, -- Summon Sphere of Air
			{ID = 5465, Cost = 137979, Expansion = 99}, -- Summon Staff of the North Wind
		},
		[68] = {
			{ID = 5484, Cost = 147930, Expansion = 99}, -- Blade Strike
			{ID = 8038, Cost = 168196, Expansion = 99}, -- Burning Aura
			{ID = 5485, Cost = 147338, Expansion = 99}, -- Child of Fire
			{ID = 5476, Cost = 147561, Expansion = 99}, -- Phantom Shield
			{ID = 5492, Cost = 148046, Expansion = 99}, -- Pyrilen Skin
			{ID = 5483, Cost = 147200, Expansion = 99}, -- Summon Pouch of Jerikor
		},
		[69] = {
			{ID = 5494, Cost = 156698, Expansion = 99}, -- Bulwark of Calliav
			{ID = 5481, Cost = 155816, Expansion = 99}, -- Burning Earth
			{ID = 5490, Cost = 159290, Expansion = 99}, -- Desolate Summoned
			{ID = 5478, Cost = 158190, Expansion = 99}, -- Elemental Fury
			{ID = 8040, Cost = 176638, Expansion = 99}, -- Fickle Fire
			{ID = 7696, Cost = 1000, Expansion = 4}, -- Focus Mass Intricate Spellcaster's Empowering Essence
			{ID = 5491, Cost = 156357, Expansion = 99}, -- Renewal of Jerikor
			{ID = 6670, Cost = 169173, Expansion = 99}, -- Summon: Molten Orb
		},
		[70] = {
			{ID = 5495, Cost = 167369, Expansion = 99}, -- Child of Earth
			{ID = 5488, Cost = 167719, Expansion = 99}, -- Circle of Fireskin
			{ID = 5497, Cost = 167300, Expansion = 99}, -- Elemental Simulacrum
			{ID = 7684, Cost = 1000, Expansion = 4}, -- Focus Elaborate Spellcaster's Empowering Essence
			{ID = 8517, Cost = 195083, Expansion = 99}, -- Iceflame Guard
			{ID = 8037, Cost = 186410, Expansion = 99}, -- Raging Servant
			{ID = 8518, Cost = 195656, Expansion = 99}, -- Rathe's Strength
			{ID = 8515, Cost = 195619, Expansion = 99}, -- Spear of Ro
			{ID = 5493, Cost = 168369, Expansion = 99}, -- Star Scream
			{ID = 5496, Cost = 165599, Expansion = 99}, -- Star Strike
		},
		[71] = {
			{ID = 10696, Cost = 221723, Expansion = 4}, -- Bolt of Molten Slag
			{ID = 10729, Cost = 229919, Expansion = 4}, -- Burnout VI
			{ID = 10731, Cost = 100000, Expansion = 99}, -- Burnout VI Rk. III
			{ID = 10695, Cost = 220563, Expansion = 4}, -- Essence of Air
			{ID = 10684, Cost = 223158, Expansion = 4}, -- Magmaskin
			{ID = 9980, Cost = 222658, Expansion = 4}, -- Malosinise
			{ID = 10692, Cost = 222178, Expansion = 4}, -- Prime Shielding
			{ID = 10715, Cost = 220592, Expansion = 99}, -- Summon Aenda's Trinkets
			{ID = 10710, Cost = 218666, Expansion = 99}, -- Summon Muzzle of Mowcha
			{ID = 10702, Cost = 219891, Expansion = 99}, -- Summon Plate of the Elements
		},
		[72] = {
			{ID = 11816, Cost = 249052, Expansion = 4}, -- Beam of Molten Slag
			{ID = 10708, Cost = 232458, Expansion = 4}, -- Essence of Water
			{ID = 10712, Cost = 233121, Expansion = 4}, -- Phantasmal Warden
			{ID = 10705, Cost = 230039, Expansion = 4}, -- Rain of Molten Slag
			{ID = 10716, Cost = 231224, Expansion = 4}, -- Shock of Silvered Steel
			{ID = 10700, Cost = 234375, Expansion = 4}, -- Wand of Elemental Transvergence
		},
		[73] = {
			{ID = 10735, Cost = 244549, Expansion = 4}, -- Annihilate the Unnatural
			{ID = 10736, Cost = 100000, Expansion = 99}, -- Annihilate the Unnatural Rk. II
			{ID = 10737, Cost = 100000, Expansion = 13}, -- Annihilate the Unnatural Rk. III
			{ID = 10719, Cost = 244339, Expansion = 4}, -- Essence of Fire
			{ID = 10726, Cost = 242458, Expansion = 4}, -- Granite Stance
			{ID = 10738, Cost = 247161, Expansion = 4}, -- Renewal of Aenda
			{ID = 10732, Cost = 243818, Expansion = 4}, -- Scalding Sands
			{ID = 10720, Cost = 248562, Expansion = 4}, -- Scorching Skin
			{ID = 10704, Cost = 242586, Expansion = 99}, -- Summon Elemental Armaments
		},
		[74] = {
			{ID = 10741, Cost = 257473, Expansion = 4}, -- Aegis of Calliav
			{ID = 10747, Cost = 256241, Expansion = 4}, -- Circle of Magmaskin
			{ID = 10753, Cost = 257005, Expansion = 4}, -- Essence of Earth
			{ID = 7697, Cost = 1000, Expansion = 4}, -- Focus Mass Elaborate Spellcaster's Empowering Essence
			{ID = 11819, Cost = 275984, Expansion = 4}, -- Iceflame Body
			{ID = 10750, Cost = 260172, Expansion = 4}, -- Rain of Thunderbolts
			{ID = 10688, Cost = 261606, Expansion = 4}, -- Summon Wintry Paradox
		},
		[75] = {
			{ID = 10766, Cost = 273044, Expansion = 4}, -- Blazing Stance
			{ID = 10757, Cost = 276553, Expansion = 4}, -- Elemental Symbiosis
			{ID = 10754, Cost = 270584, Expansion = 4}, -- Fickle Inferno
			{ID = 7685, Cost = 1000, Expansion = 4}, -- Focus Ornate Spellcaster's Empowering Essence
			{ID = 10763, Cost = 273767, Expansion = 4}, -- Mass Elemental Transvergence
			{ID = 10769, Cost = 272734, Expansion = 4}, -- Monster Summoning V
			{ID = 11825, Cost = 289204, Expansion = 4}, -- Rampaging Servant
			{ID = 11827, Cost = 10000, Expansion = 99}, -- Rampaging Servant Rk. III
		},
		[76] = {
			{ID = 14672, Cost = 315188, Expansion = 4}, -- Bolt of Molten Dross
			{ID = 14700, Cost = 322099, Expansion = 4}, -- Burnout VII
			{ID = 14671, Cost = 323525, Expansion = 4}, -- Core of Air
			{ID = 14662, Cost = 316202, Expansion = 4}, -- Lavaskin
			{ID = 14659, Cost = 322862, Expansion = 4}, -- Malosinatia
			{ID = 14668, Cost = 315039, Expansion = 4}, -- Prime Guard
			{ID = 14689, Cost = 322902, Expansion = 4}, -- Summon Nastel's Heirlooms
			{ID = 14679, Cost = 322107, Expansion = 4}, -- Summon Plate of the Prime
		},
		[77] = {
			{ID = 15505, Cost = 333793, Expansion = 4}, -- Aspect of Zomm
			{ID = 14738, Cost = 334094, Expansion = 4}, -- Beam of Molten Dross
			{ID = 14684, Cost = 340180, Expansion = 4}, -- Core of Water
			{ID = 14686, Cost = 334423, Expansion = 4}, -- Eidolic Guardian
			{ID = 14681, Cost = 333294, Expansion = 4}, -- Rain of Molten Dross
			{ID = 14690, Cost = 334072, Expansion = 4}, -- Shock of Cineral Steel
			{ID = 14772, Cost = 337756, Expansion = 99}, -- Shock of Many
			{ID = 14773, Cost = 513204, Expansion = 99}, -- Shock of Many Rk. II
			{ID = 14774, Cost = 2304490, Expansion = 99}, -- Shock of Many Rk. III
			{ID = 14675, Cost = 339831, Expansion = 4}, -- Wand of Prime Transvergence
		},
		[78] = {
			{ID = 14454, Cost = 352375, Expansion = 4}, -- Annihilate the Aberrant
			{ID = 14693, Cost = 354253, Expansion = 4}, -- Core of Fire
			{ID = 14697, Cost = 354473, Expansion = 4}, -- Grounded Stance
			{ID = 14108, Cost = 353343, Expansion = 4}, -- Promised Recovery
			{ID = 14109, Cost = 849408, Expansion = 99}, -- Promised Recovery Rk. II
			{ID = 14706, Cost = 358244, Expansion = 4}, -- Revival of Aenro
			{ID = 14703, Cost = 355222, Expansion = 4}, -- Scorching Sands
			{ID = 14694, Cost = 351506, Expansion = 4}, -- Searing Skin
			{ID = 14753, Cost = 353646, Expansion = 99}, -- Summon Cauldron of Many Things
			{ID = 14680, Cost = 355213, Expansion = 4}, -- Summon Prime Armaments
		},
		[79] = {
			{ID = 14904, Cost = 373678, Expansion = 4}, -- Aegis of Kildrukaun
			{ID = 14778, Cost = 375707, Expansion = 99}, -- Burning Brimbody
			{ID = 14779, Cost = 480998, Expansion = 99}, -- Burning Brimbody Rk. II
			{ID = 14715, Cost = 367045, Expansion = 4}, -- Circle of Lavaskin
			{ID = 14721, Cost = 371964, Expansion = 4}, -- Core of Earth
			{ID = 7698, Cost = 1000, Expansion = 4}, -- Focus Mass Ornate Spellcaster's Empowering Essence
			{ID = 14741, Cost = 370402, Expansion = 4}, -- Iceflame Tenement
			{ID = 14665, Cost = 367083, Expansion = 4}, -- Summon Gelid Paradox
			{ID = 14718, Cost = 376855, Expansion = 4}, -- Torrent of Thunderbolts
		},
		[80] = {
			{ID = 14722, Cost = 386142, Expansion = 99}, -- Fickle Pyroclasm
			{ID = 14723, Cost = 415744, Expansion = 99}, -- Fickle Pyroclasm Rk. II
			{ID = 14724, Cost = 2168390, Expansion = 99}, -- Fickle Pyroclasm Rk. III
			{ID = 7686, Cost = 1000, Expansion = 4}, -- Focus Runed Spellcaster's Empowering Essence
			{ID = 14734, Cost = 393592, Expansion = 4}, -- Hungry Flames
			{ID = 14731, Cost = 387268, Expansion = 99}, -- Mass Prime Transvergence
			{ID = 14732, Cost = 493166, Expansion = 99}, -- Mass Prime Transvergence Rk. II
			{ID = 14737, Cost = 390515, Expansion = 99}, -- Monster Summoning VI
			{ID = 14725, Cost = 391007, Expansion = 4}, -- Prime Symbiosis
			{ID = 14747, Cost = 389781, Expansion = 99}, -- Rancorous Servant
			{ID = 14748, Cost = 515816, Expansion = 99}, -- Rancorous Servant Rk. II
			{ID = 14749, Cost = 1988350, Expansion = 99}, -- Rancorous Servant Rk. III
		},
		[81] = {
			{ID = 18738, Cost = 432572, Expansion = 99}, -- Aspect of Air
			{ID = 18739, Cost = 426670, Expansion = 99}, -- Bolt of Molten Scoria
			{ID = 18729, Cost = 429878, Expansion = 99}, -- Brimstoneskin
			{ID = 18767, Cost = 426438, Expansion = 99}, -- Burnout VIII
			{ID = 18726, Cost = 436667, Expansion = 99}, -- Malosenea
			{ID = 18558, Cost = 432620, Expansion = 99}, -- Shield of the Void
			{ID = 18756, Cost = 427724, Expansion = 99}, -- Summon Zabella's Heirlooms
		},
		[82] = {
			{ID = 18751, Cost = 451060, Expansion = 15}, -- Aspect of Water
			{ID = 18811, Cost = 446942, Expansion = 15}, -- Beam of Molten Scoria
			{ID = 18753, Cost = 451291, Expansion = 15}, -- Empyrean Guardian
			{ID = 18748, Cost = 456759, Expansion = 15}, -- Rain of Molten Scoria
			{ID = 18757, Cost = 451436, Expansion = 15}, -- Shock of Discordant Steel
			{ID = 18742, Cost = 452727, Expansion = 15}, -- Wand of Ethereal Transvergence
		},
		[83] = {
			{ID = 18760, Cost = 478087, Expansion = 99}, -- Aspect of Fire
			{ID = 18764, Cost = 475575, Expansion = 99}, -- Earthen Stance
			{ID = 18121, Cost = 735073, Expansion = 99}, -- Promised Rejuvenation Rk. II
			{ID = 18773, Cost = 470387, Expansion = 99}, -- Renewal of Cadwin
			{ID = 18747, Cost = 472983, Expansion = 99}, -- Summon Ethereal Armaments
			{ID = 18770, Cost = 469773, Expansion = 99}, -- Torrid Sands
			{ID = 18761, Cost = 474454, Expansion = 99}, -- Torrid Skin
		},
		[84] = {
			{ID = 18788, Cost = 504530, Expansion = 99}, -- Aspect of Earth
			{ID = 18848, Cost = 498821, Expansion = 99}, -- Burning Pyroshroud
			{ID = 18782, Cost = 495389, Expansion = 99}, -- Circle of Brimstoneskin
			{ID = 18785, Cost = 492632, Expansion = 99}, -- Deluge of Thunderbolts
			{ID = 18814, Cost = 502704, Expansion = 99}, -- Iceflame Efflux
			{ID = 18854, Cost = 503150, Expansion = 99}, -- Summon Elemental Ore
			{ID = 18732, Cost = 491703, Expansion = 99}, -- Summon Frigid Paradox
		},
		[85] = {
			{ID = 18792, Cost = 523233, Expansion = 99}, -- Ethereal Symbiosis
			{ID = 18789, Cost = 526086, Expansion = 99}, -- Fickle Blaze
			{ID = 18883, Cost = 523894, Expansion = 99}, -- Hulking Bodyguard
			{ID = 18798, Cost = 523716, Expansion = 99}, -- Mass Ethereal Transvergence
			{ID = 18801, Cost = 523915, Expansion = 99}, -- Ravenous Flames
		},
		[86] = {
			{ID = 26734, Cost = 594878, Expansion = 99}, -- Bolt of Rhyolite
			{ID = 26737, Cost = 607180, Expansion = 99}, -- Burnout IX
			{ID = 26740, Cost = 597605, Expansion = 99}, -- Construct of Air
			{ID = 26741, Cost = 593466, Expansion = 99}, -- Dreamfire Coat
			{ID = 26744, Cost = 603281, Expansion = 99}, -- Gift of Daybreak
			{ID = 26747, Cost = 598315, Expansion = 99}, -- Grant Enibik's Heirlooms
			{ID = 26745, Cost = 603234, Expansion = 99}, -- Grant Spectral Plate
			{ID = 26173, Cost = 597985, Expansion = 99}, -- Malosene
			{ID = 26333, Cost = 606975, Expansion = 99}, -- Shield of Dreams
			{ID = 26749, Cost = 594182, Expansion = 99}, -- Strike of Sand
		},
		[87] = {
			{ID = 26752, Cost = 636774, Expansion = 99}, -- Beam of Rhyolite
			{ID = 26755, Cost = 629511, Expansion = 99}, -- Clash of Many
			{ID = 26758, Cost = 631317, Expansion = 99}, -- Cognitive Guardian
			{ID = 26761, Cost = 636404, Expansion = 99}, -- Construct of Water
			{ID = 26762, Cost = 634740, Expansion = 99}, -- Grant Visor of Vabtik
			{ID = 26763, Cost = 625852, Expansion = 99}, -- Rain of Rhyolite
			{ID = 26766, Cost = 625625, Expansion = 99}, -- Shock of Ethereal Steel
			{ID = 26769, Cost = 631175, Expansion = 99}, -- Splash of Lava
			{ID = 26772, Cost = 634578, Expansion = 99}, -- Wand of Spectral Transvergence
		},
		[88] = {
			{ID = 25707, Cost = 665413, Expansion = 99}, -- Annihilate the Divergent
			{ID = 26776, Cost = 653344, Expansion = 99}, -- Beam of Daggers
			{ID = 26779, Cost = 664041, Expansion = 99}, -- Blazing Sands
			{ID = 26782, Cost = 661102, Expansion = 99}, -- Blazing Skin
			{ID = 26785, Cost = 664059, Expansion = 99}, -- Construct of Fire
			{ID = 26786, Cost = 662057, Expansion = 99}, -- Grant Spectral Armaments
			{ID = 26728, Cost = 652532, Expansion = 99}, -- Promised Wardmending
			{ID = 26793, Cost = 664041, Expansion = 99}, -- Renewal of Volark
			{ID = 26796, Cost = 654336, Expansion = 99}, -- Tellurian Stance
		},
		[89] = {
			{ID = 26800, Cost = 689677, Expansion = 99}, -- Burning Veil
			{ID = 26806, Cost = 696482, Expansion = 99}, -- Chaotic Blessing
			{ID = 26812, Cost = 694631, Expansion = 99}, -- Circle of Dreamfire
			{ID = 26799, Cost = 685387, Expansion = 99}, -- Construct of Earth
			{ID = 26821, Cost = 697012, Expansion = 99}, -- Grant Glacial Paradox
			{ID = 26827, Cost = 679482, Expansion = 99}, -- Grant Ring of Levitation
			{ID = 26815, Cost = 691881, Expansion = 99}, -- Iceflame Ward
			{ID = 26829, Cost = 691296, Expansion = 99}, -- Rain of Daggers
			{ID = 26832, Cost = 691016, Expansion = 99}, -- Scalding Winds
		},
		[90] = {
			{ID = 26835, Cost = 714754, Expansion = 99}, -- Fickle Flare
			{ID = 26838, Cost = 710158, Expansion = 99}, -- Gather Potential
			{ID = 26841, Cost = 709303, Expansion = 99}, -- Mass Spectral Transvergence
			{ID = 26844, Cost = 710301, Expansion = 99}, -- Ruinous Servant
			{ID = 26847, Cost = 721766, Expansion = 99}, -- Spear of Magma
			{ID = 26850, Cost = 719900, Expansion = 99}, -- Spectral Symbiosis
			{ID = 26856, Cost = 712482, Expansion = 99}, -- Surge of Shadowflares
			{ID = 26859, Cost = 716012, Expansion = 99}, -- Tellurian Bodyguard
			{ID = 26865, Cost = 723791, Expansion = 99}, -- Voracious Flames
		},
		[91] = {
			{ID = 29854, Cost = 1182699, Expansion = 99}, -- Bolt of Molten Steel
			{ID = 29857, Cost = 1181883, Expansion = 99}, -- Burnout X
			{ID = 29861, Cost = 1184405, Expansion = 99}, -- Embercoat
			{ID = 29860, Cost = 1185277, Expansion = 99}, -- Facet of Air
			{ID = 29868, Cost = 1184458, Expansion = 99}, -- Grant Atleris' Heirlooms
			{ID = 29866, Cost = 1180959, Expansion = 99}, -- Grant Manaforged Plate
			{ID = 29864, Cost = 1183590, Expansion = 99}, -- Grant Sphere of Air
			{ID = 29276, Cost = 1181097, Expansion = 99}, -- Maloseneta
			{ID = 29445, Cost = 1182546, Expansion = 18}, -- Shield of Bronze
		},
		[92] = {
			{ID = 29873, Cost = 1197310, Expansion = 99}, -- Beam of Molten Steel
			{ID = 29882, Cost = 1197193, Expansion = 99}, -- Facet of Water
			{ID = 29883, Cost = 1195766, Expansion = 99}, -- Grant Quiver of Kalkek
			{ID = 29885, Cost = 1197810, Expansion = 99}, -- Rain of Molten Steel
			{ID = 29888, Cost = 1195085, Expansion = 99}, -- Shock of Argathian Steel
			{ID = 29879, Cost = 1195678, Expansion = 99}, -- Splendrous Guardian
			{ID = 29894, Cost = 1196958, Expansion = 99}, -- Wand of Arcane Transvergence
		},
		[93] = {
			{ID = 29901, Cost = 1206925, Expansion = 99}, -- Burning Sands
			{ID = 29907, Cost = 1209220, Expansion = 99}, -- Facet of Fire
			{ID = 29908, Cost = 1207758, Expansion = 99}, -- Grant Manaforged Armaments
			{ID = 29904, Cost = 1207050, Expansion = 99}, -- Molten Skin
			{ID = 29848, Cost = 1210062, Expansion = 99}, -- Promised Amendment
			{ID = 29915, Cost = 1207164, Expansion = 99}, -- Renewal of Sirqo
			{ID = 29924, Cost = 1207757, Expansion = 99}, -- Steelstance
			{ID = 29918, Cost = 1207538, Expansion = 99}, -- Summon Exigent Servant
		},
		[94] = {
			{ID = 29927, Cost = 1224375, Expansion = 99}, -- Facet of Earth
			{ID = 29949, Cost = 1224354, Expansion = 99}, -- Grant Frostrift Paradox
			{ID = 29961, Cost = 1223822, Expansion = 99}, -- Summon Blazing Orb
		},
		[95] = {
			{ID = 29969, Cost = 1235419, Expansion = 99}, -- Mass Arcane Transvergence
		},
	},
	[Class.ENCHANTER] = {
		[1] = {
			{ID = 208, Cost = 20, Expansion = 0}, -- Lull
			{ID = 287, Cost = 20, Expansion = 0}, -- Minor Illusion
			{ID = 288, Cost = 20, Expansion = 0}, -- Minor Shielding
			{ID = 285, Cost = 20, Expansion = 0}, -- Pendril's Animation
			{ID = 331, Cost = 20, Expansion = 0}, -- Reclaim Energy
			{ID = 286, Cost = 20, Expansion = 0}, -- Shallow Breath
			{ID = 40, Cost = 20, Expansion = 0}, -- Strengthen
			{ID = 289, Cost = 20, Expansion = 0}, -- Taper Enchantment
			{ID = 205, Cost = 20, Expansion = 0}, -- True North
			{ID = 41, Cost = 20, Expansion = 0}, -- Weaken
		},
		[2] = {
			{ID = 582, Cost = 20, Expansion = 0}, -- Illusion: Human
			{ID = 681, Cost = 20, Expansion = 0}, -- Juli's Animation
			{ID = 292, Cost = 20, Expansion = 0}, -- Mesmerize
			{ID = 676, Cost = 20, Expansion = 0}, -- Tashina
		},
		[3] = {
			{ID = 290, Cost = 22, Expansion = 0}, -- Color Flux
			{ID = 229, Cost = 20, Expansion = 0}, -- Fear
			{ID = 293, Cost = 22, Expansion = 0}, -- Haze
			{ID = 583, Cost = 22, Expansion = 0}, -- Illusion: Half-Elf
		},
		[4] = {
			{ID = 291, Cost = 24, Expansion = 0}, -- Enfeeblement
			{ID = 36, Cost = 24, Expansion = 0}, -- Gate
			{ID = 42, Cost = 24, Expansion = 0}, -- Invisibility
			{ID = 294, Cost = 24, Expansion = 0}, -- Suffocating Sphere
		},
		[5] = {
			{ID = 297, Cost = 28, Expansion = 0}, -- Eye of Confusion
			{ID = 588, Cost = 28, Expansion = 0}, -- Illusion: Wood Elf
			{ID = 299, Cost = 28, Expansion = 0}, -- Sentinel
		},
		[6] = {
			{ID = 246, Cost = 28, Expansion = 0}, -- Lesser Shielding
			{ID = 230, Cost = 22, Expansion = 0}, -- Root
			{ID = 80, Cost = 24, Expansion = 0}, -- See Invisible
			{ID = 501, Cost = 28, Expansion = 0}, -- Soothe
		},
		[7] = {
			{ID = 48, Cost = 43, Expansion = 0}, -- Cancel Magic
			{ID = 296, Cost = 43, Expansion = 0}, -- Chaotic Feedback
			{ID = 667, Cost = 43, Expansion = 0}, -- Enchant Silver
			{ID = 3991, Cost = 43, Expansion = 4}, -- Mass Enchant Silver
			{ID = 295, Cost = 43, Expansion = 0}, -- Mircyl's Animation
		},
		[8] = {
			{ID = 298, Cost = 55, Expansion = 0}, -- Alliance
			{ID = 500, Cost = 55, Expansion = 0}, -- Bind Sight
			{ID = 1359, Cost = 55, Expansion = 0}, -- Enchant Clay
			{ID = 595, Cost = 55, Expansion = 0}, -- Illusion: Gnome
			{ID = 3986, Cost = 55, Expansion = 4}, -- Mass Enchant Clay
		},
		[9] = {
			{ID = 645, Cost = 72, Expansion = 0}, -- Ebbing Strength
			{ID = 682, Cost = 71, Expansion = 0}, -- Kilan's Animation
			{ID = 302, Cost = 71, Expansion = 0}, -- Languid Pace
			{ID = 303, Cost = 71, Expansion = 0}, -- Whirl till you hurl
		},
		[10] = {
			{ID = 590, Cost = 92, Expansion = 0}, -- Illusion: Dark Elf
			{ID = 301, Cost = 92, Expansion = 0}, -- Memory Blur
			{ID = 650, Cost = 93, Expansion = 0}, -- Mist
			{ID = 276, Cost = 34, Expansion = 0}, -- Serpent Sight
		},
		[11] = {
			{ID = 300, Cost = 118, Expansion = 0}, -- Charm
			{ID = 521, Cost = 118, Expansion = 0}, -- Choke
			{ID = 7988, Cost = 118, Expansion = 4}, -- Greater Mass Enchant Silver
			{ID = 589, Cost = 118, Expansion = 0}, -- Illusion: High Elf
			{ID = 2561, Cost = 244, Expansion = 3}, -- Intellectual Advancement
			{ID = 4010, Cost = 119, Expansion = 4}, -- Mass Thicken Mana
			{ID = 390, Cost = 120, Expansion = 0}, -- Thicken Mana
		},
		[12] = {
			{ID = 35, Cost = 93, Expansion = 0}, -- Bind Affinity
			{ID = 86, Cost = 34, Expansion = 0}, -- Enduring Breath
			{ID = 587, Cost = 154, Expansion = 0}, -- Illusion: Erudite
			{ID = 594, Cost = 152, Expansion = 4}, -- Illusion: Halfling
		},
		[13] = {
			{ID = 187, Cost = 191, Expansion = 0}, -- Enthrall
			{ID = 591, Cost = 192, Expansion = 0}, -- Illusion: Dwarf
			{ID = 481, Cost = 194, Expansion = 0}, -- Rune I
			{ID = 4255, Cost = 658, Expansion = 0}, -- Wuggan's Lesser Appraisal
		},
		[14] = {
			{ID = 697, Cost = 243, Expansion = 1}, -- Breeze
			{ID = 668, Cost = 243, Expansion = 0}, -- Enchant Electrum
			{ID = 235, Cost = 20, Expansion = 0}, -- Invisibility versus Undead
			{ID = 3987, Cost = 242, Expansion = 4}, -- Mass Enchant Electrum
			{ID = 683, Cost = 245, Expansion = 4}, -- Shalee's Animation
			{ID = 4267, Cost = 786, Expansion = 0}, -- Wuggan's Lesser Discombobulation
			{ID = 4279, Cost = 783, Expansion = 0}, -- Wuggan's Lesser Extrication
		},
		[15] = {
			{ID = 305, Cost = 191, Expansion = 0}, -- Identify
			{ID = 586, Cost = 302, Expansion = 0}, -- Illusion: Barbarian
			{ID = 601, Cost = 298, Expansion = 0}, -- Illusion: Tree
			{ID = 261, Cost = 92, Expansion = 0}, -- Levitate
			{ID = 39, Cost = 300, Expansion = 0}, -- Quickness
		},
		[16] = {
			{ID = 304, Cost = 367, Expansion = 0}, -- Chase the Moon
			{ID = 281, Cost = 152, Expansion = 0}, -- Disempower
			{ID = 7676, Cost = 369, Expansion = 4}, -- Focus Crude Spellcaster's Empowering Essence
			{ID = 7677, Cost = 369, Expansion = 4}, -- Focus Makeshift Spellcaster's Empowering Essence
			{ID = 7674, Cost = 369, Expansion = 4}, -- Focus Primitive Spellcaster's Empowering Essence
			{ID = 7675, Cost = 371, Expansion = 4}, -- Focus Rudimentary Spellcaster's Empowering Essence
			{ID = 307, Cost = 367, Expansion = 4}, -- Mesmerization
			{ID = 306, Cost = 374, Expansion = 0}, -- Sanity Warp
			{ID = 309, Cost = 301, Expansion = 0}, -- Shielding
		},
		[17] = {
			{ID = 651, Cost = 446, Expansion = 0}, -- Cloud
			{ID = 228, Cost = 373, Expansion = 0}, -- Endure Magic
			{ID = 593, Cost = 456, Expansion = 0}, -- Illusion: Ogre
			{ID = 2562, Cost = 789, Expansion = 3}, -- Intellectual Superiority
			{ID = 684, Cost = 457, Expansion = 4}, -- Sisna's Animation
		},
		[18] = {
			{ID = 47, Cost = 297, Expansion = 0}, -- Calm
			{ID = 592, Cost = 551, Expansion = 0}, -- Illusion: Troll
			{ID = 489, Cost = 539, Expansion = 0}, -- Sympathetic Aura
			{ID = 677, Cost = 541, Expansion = 0}, -- Tashani
		},
		[19] = {
			{ID = 21, Cost = 648, Expansion = 4}, -- Berserker Strength
			{ID = 439, Cost = 659, Expansion = 0}, -- Crystallize Mana
			{ID = 179, Cost = 655, Expansion = 0}, -- Feckless Might
			{ID = 7985, Cost = 653, Expansion = 4}, -- Greater Mass Enchant Electrum
			{ID = 3583, Cost = 373, Expansion = 0}, -- Tiny Companion
		},
		[20] = {
			{ID = 173, Cost = 777, Expansion = 0}, -- Benevolence
			{ID = 177, Cost = 790, Expansion = 4}, -- Color Shift
			{ID = 7689, Cost = 778, Expansion = 4}, -- Focus Mass Crude Spellcaster's Empowering Essence
			{ID = 7690, Cost = 776, Expansion = 4}, -- Focus Mass Makeshift Spellcaster's Empowering Essence
			{ID = 7687, Cost = 787, Expansion = 4}, -- Focus Mass Primitive Spellcaster's Empowering Essence
			{ID = 7688, Cost = 779, Expansion = 4}, -- Focus Mass Rudimentary Spellcaster's Empowering Essence
			{ID = 243, Cost = 932, Expansion = 4}, -- Illusion: Iksar
			{ID = 3982, Cost = 788, Expansion = 4}, -- Mass Crystallize Mana
			{ID = 84, Cost = 777, Expansion = 0}, -- Shifting Sight
		},
		[21] = {
			{ID = 170, Cost = 930, Expansion = 0}, -- Alacrity
			{ID = 350, Cost = 922, Expansion = 0}, -- Chaos Flux
			{ID = 584, Cost = 934, Expansion = 0}, -- Illusion: Earth Elemental
		},
		[22] = {
			{ID = 482, Cost = 1082, Expansion = 0}, -- Rune II
			{ID = 685, Cost = 1088, Expansion = 4}, -- Sagar's Animation
			{ID = 24, Cost = 1088, Expansion = 4}, -- Strip Enchantment
		},
		[23] = {
			{ID = 182, Cost = 1257, Expansion = 0}, -- Beguile
			{ID = 65, Cost = 1267, Expansion = 0}, -- Major Shielding
			{ID = 185, Cost = 1271, Expansion = 4}, -- Tepid Deeds
			{ID = 4256, Cost = 2922, Expansion = 0}, -- Wuggan's Appraisal
		},
		[24] = {
			{ID = 669, Cost = 1475, Expansion = 0}, -- Enchant Gold
			{ID = 581, Cost = 1472, Expansion = 0}, -- Illusion: Skeleton
			{ID = 3988, Cost = 1473, Expansion = 4}, -- Mass Enchant Gold
			{ID = 4268, Cost = 3355, Expansion = 0}, -- Wuggan's Discombobulation
			{ID = 4280, Cost = 3360, Expansion = 0}, -- Wuggan's Extrication
		},
		[25] = {
			{ID = 191, Cost = 1727, Expansion = 4}, -- Feedback
			{ID = 7678, Cost = 1000, Expansion = 4}, -- Focus Elementary Spellcaster's Empowering Essence
			{ID = 131, Cost = 457, Expansion = 0}, -- Instill
			{ID = 162, Cost = 1689, Expansion = 0}, -- Listless Power
		},
		[26] = {
			{ID = 174, Cost = 1998, Expansion = 0}, -- Clarity
			{ID = 408, Cost = 1990, Expansion = 0}, -- Curse of the Simple Mind
			{ID = 2563, Cost = 2950, Expansion = 3}, -- Haunting Visage
			{ID = 450, Cost = 1947, Expansion = 0}, -- Suffocate
		},
		[27] = {
			{ID = 540, Cost = 2282, Expansion = 0}, -- Clarify Mana
			{ID = 652, Cost = 2240, Expansion = 0}, -- Obscure
			{ID = 46, Cost = 1951, Expansion = 1}, -- Ultravision
		},
		[28] = {
			{ID = 10, Cost = 2617, Expansion = 0}, -- Augmentation
			{ID = 619, Cost = 2607, Expansion = 0}, -- Dyn's Dizzying Draught
			{ID = 7986, Cost = 2599, Expansion = 99}, -- Greater Mass Enchant Gold
			{ID = 599, Cost = 2610, Expansion = 0}, -- Illusion: Water Elemental
			{ID = 49, Cost = 4197, Expansion = 0}, -- Nullify Magic
		},
		[29] = {
			{ID = 7691, Cost = 1000, Expansion = 4}, -- Focus Mass Elementary Spellcaster's Empowering Essence
			{ID = 597, Cost = 2978, Expansion = 0}, -- Illusion: Air Elemental
			{ID = 3981, Cost = 2975, Expansion = 4}, -- Mass Clarify Mana
			{ID = 686, Cost = 2908, Expansion = 4}, -- Uleen's Animation
			{ID = 4073, Cost = 5922, Expansion = 4}, -- Ward of Alendar
		},
		[30] = {
			{ID = 188, Cost = 3300, Expansion = 0}, -- Entrance
			{ID = 3585, Cost = 5410, Expansion = 4}, -- Entrancing Lights
			{ID = 74, Cost = 3352, Expansion = 4}, -- Mana Sieve
		},
		[31] = {
			{ID = 687, Cost = 3818, Expansion = 4}, -- Boltran's Animation
			{ID = 66, Cost = 3792, Expansion = 0}, -- Greater Shielding
			{ID = 646, Cost = 3818, Expansion = 4}, -- Radiant Visage
		},
		[32] = {
			{ID = 71, Cost = 4190, Expansion = 0}, -- Anarchy
			{ID = 407, Cost = 4304, Expansion = 0}, -- Cast Sight
			{ID = 670, Cost = 4223, Expansion = 0}, -- Enchant Platinum
			{ID = 3990, Cost = 4199, Expansion = 4}, -- Mass Enchant Platinum
		},
		[33] = {
			{ID = 598, Cost = 4781, Expansion = 0}, -- Illusion: Fire Elemental
			{ID = 483, Cost = 4735, Expansion = 0}, -- Rune III
			{ID = 4257, Cost = 9128, Expansion = 0}, -- Wuggan's Greater Appraisal
		},
		[34] = {
			{ID = 1408, Cost = 6585, Expansion = 2}, -- Gift of Magic
			{ID = 180, Cost = 5366, Expansion = 4}, -- Insipid Weakness
			{ID = 4269, Cost = 9894, Expansion = 0}, -- Wuggan's Greater Discombobulation
			{ID = 4281, Cost = 10058, Expansion = 0}, -- Wuggan's Greater Extrication
		},
		[35] = {
			{ID = 7679, Cost = 1000, Expansion = 4}, -- Focus Modest Spellcaster's Empowering Essence
			{ID = 175, Cost = 6045, Expansion = 0}, -- Insight
			{ID = 127, Cost = 3334, Expansion = 0}, -- Invoke Fear
			{ID = 45, Cost = 6026, Expansion = 0}, -- Pacify
		},
		[36] = {
			{ID = 2564, Cost = 9092, Expansion = 3}, -- Calming Visage
			{ID = 73, Cost = 6657, Expansion = 0}, -- Gravity Flux
			{ID = 192, Cost = 6631, Expansion = 4}, -- Mind Wipe
		},
		[37] = {
			{ID = 688, Cost = 7370, Expansion = 4}, -- Aanya's Animation
			{ID = 183, Cost = 7375, Expansion = 0}, -- Cajoling Whispers
			{ID = 596, Cost = 7455, Expansion = 0}, -- Illusion: Dry Bone
			{ID = 64, Cost = 7374, Expansion = 0}, -- Resist Magic
			{ID = 653, Cost = 7347, Expansion = 0}, -- Shade
		},
		[38] = {
			{ID = 695, Cost = 8140, Expansion = 0}, -- Distill Mana
			{ID = 7987, Cost = 8230, Expansion = 99}, -- Greater Mass Enchant Platinum
			{ID = 600, Cost = 8141, Expansion = 0}, -- Illusion: Spirit Wolf
			{ID = 648, Cost = 8273, Expansion = 0}, -- Rampage
			{ID = 1407, Cost = 10095, Expansion = 99}, -- Wandering Mind
		},
		[39] = {
			{ID = 171, Cost = 9010, Expansion = 0}, -- Celerity
			{ID = 7692, Cost = 1000, Expansion = 4}, -- Focus Mass Modest Spellcaster's Empowering Essence
			{ID = 132, Cost = 9141, Expansion = 0}, -- Immobilize
			{ID = 3983, Cost = 9037, Expansion = 4}, -- Mass Distill Mana
		},
		[40] = {
			{ID = 67, Cost = 9999, Expansion = 0}, -- Arch Shielding
			{ID = 1474, Cost = 12157, Expansion = 99}, -- Boon of the Garou
			{ID = 163, Cost = 10091, Expansion = 0}, -- Incapacitate
			{ID = 484, Cost = 10016, Expansion = 0}, -- Rune IV
		},
		[41] = {
			{ID = 33, Cost = 11123, Expansion = 0}, -- Brilliance
			{ID = 186, Cost = 11081, Expansion = 4}, -- Shiftless Deeds
			{ID = 678, Cost = 11206, Expansion = 99}, -- Tashania
			{ID = 689, Cost = 11130, Expansion = 4}, -- Yegoreff's Animation
		},
		[42] = {
			{ID = 1694, Cost = 13412, Expansion = 99}, -- Boon of the Clear Mind
			{ID = 585, Cost = 12263, Expansion = 4}, -- Illusion: Werewolf
			{ID = 25, Cost = 12260, Expansion = 4}, -- Pillage Enchantment
			{ID = 181, Cost = 12040, Expansion = 0}, -- Weakness
		},
		[43] = {
			{ID = 4099, Cost = 22758, Expansion = 0}, -- Bounce
			{ID = 178, Cost = 13326, Expansion = 4}, -- Color Skew
			{ID = 673, Cost = 13355, Expansion = 0}, -- Discordant Mind
			{ID = 1797, Cost = 16089, Expansion = 4}, -- Enchant Velium
			{ID = 1285, Cost = 3719, Expansion = 4}, -- Summon Companion
		},
		[44] = {
			{ID = 7989, Cost = 17471, Expansion = 99}, -- Greater Mass Enchant Velium
			{ID = 4074, Cost = 24701, Expansion = 0}, -- Guard of Alendar
			{ID = 3586, Cost = 20944, Expansion = 4}, -- Illusion: Scaled Wolf
			{ID = 3696, Cost = 22419, Expansion = 99}, -- Leviathan Eyes
			{ID = 3993, Cost = 14779, Expansion = 4}, -- Mass Enchant Velium
		},
		[45] = {
			{ID = 7680, Cost = 1000, Expansion = 4}, -- Focus Simple Spellcaster's Empowering Essence
			{ID = 2565, Cost = 20867, Expansion = 3}, -- Illusion: Imp
			{ID = 133, Cost = 16013, Expansion = 4}, -- Paralyzing Earth
			{ID = 696, Cost = 16032, Expansion = 0}, -- Purify Mana
			{ID = 194, Cost = 5000, Expansion = 4}, -- Reoccurring Amnesia
		},
		[46] = {
			{ID = 647, Cost = 17655, Expansion = 0}, -- Adorning Grace
			{ID = 184, Cost = 17700, Expansion = 7}, -- Allure
			{ID = 193, Cost = 17605, Expansion = 0}, -- Blanket of Forgetfulness
			{ID = 1892, Cost = 17655, Expansion = 0}, -- Enchant Steel
		},
		[47] = {
			{ID = 176, Cost = 18892, Expansion = 0}, -- Berserker Spirit
			{ID = 190, Cost = 18991, Expansion = 0}, -- Dazzle
			{ID = 195, Cost = 19227, Expansion = 0}, -- Gasping Embrace
			{ID = 4009, Cost = 18926, Expansion = 4}, -- Mass Purify Mana
			{ID = 172, Cost = 19083, Expansion = 0}, -- Swift Like the Wind
		},
		[48] = {
			{ID = 1890, Cost = 20770, Expansion = 4}, -- Enchant Adamantite
			{ID = 1889, Cost = 20784, Expansion = 0}, -- Enchant Mithril
			{ID = 72, Cost = 21096, Expansion = 0}, -- Group Resist Magic
			{ID = 690, Cost = 21054, Expansion = 4}, -- Kintaz's Animation
			{ID = 654, Cost = 20756, Expansion = 0}, -- Shadow
		},
		[49] = {
			{ID = 1893, Cost = 22857, Expansion = 0}, -- Enchant Brellium
			{ID = 7693, Cost = 1000, Expansion = 4}, -- Focus Mass Simple Spellcaster's Empowering Essence
			{ID = 3984, Cost = 22454, Expansion = 4}, -- Mass Enchant Adamantite
			{ID = 3985, Cost = 22765, Expansion = 4}, -- Mass Enchant Brellium
			{ID = 3989, Cost = 22547, Expansion = 4}, -- Mass Enchant Mithril
			{ID = 3992, Cost = 22399, Expansion = 4}, -- Mass Enchant Steel
		},
		[50] = {
			{ID = 1687, Cost = 26889, Expansion = 1}, -- Collaboration
			{ID = 7681, Cost = 1000, Expansion = 4}, -- Focus Spellcaster's Empowering Essence
			{ID = 1406, Cost = 29191, Expansion = 4}, -- Improved Invisibility
			{ID = 1686, Cost = 26394, Expansion = 4}, -- Theft of Thought
		},
		[51] = {
			{ID = 2881, Cost = 30946, Expansion = 4}, -- Everlasting Breath
			{ID = 2894, Cost = 31257, Expansion = 4}, -- Levitation
			{ID = 1541, Cost = 28744, Expansion = 4}, -- Wake of Tranquility
		},
		[52] = {
			{ID = 1693, Cost = 31668, Expansion = 99}, -- Clarity II
			{ID = 1696, Cost = 31085, Expansion = 99}, -- Color Slant
			{ID = 1690, Cost = 31020, Expansion = 1}, -- Fascination
			{ID = 4017, Cost = 41956, Expansion = 99}, -- Illusion: Guktan
			{ID = 4077, Cost = 45898, Expansion = 0}, -- Ordinance
			{ID = 1689, Cost = 31499, Expansion = 1}, -- Rune V
			{ID = 3697, Cost = 42945, Expansion = 99}, -- Scryer's Trespass
			{ID = 2566, Cost = 36995, Expansion = 99}, -- Trickster's Augmentation
		},
		[53] = {
			{ID = 1708, Cost = 33928, Expansion = 1}, -- Aanya's Quickening
			{ID = 1705, Cost = 33456, Expansion = 1}, -- Boltran's Agacerie
			{ID = 1592, Cost = 34039, Expansion = 4}, -- Cripple
			{ID = 1697, Cost = 33944, Expansion = 99}, -- Recant Magic
		},
		[54] = {
			{ID = 2567, Cost = 42951, Expansion = 99}, -- Beguiling Visage
			{ID = 1698, Cost = 36182, Expansion = 99}, -- Dementia
			{ID = 7694, Cost = 1000, Expansion = 4}, -- Focus Mass Spellcaster's Empowering Essence
			{ID = 1691, Cost = 36819, Expansion = 1}, -- Glamour of Kintaz
			{ID = 8036, Cost = 69426, Expansion = 10}, -- Illusion: Orc
			{ID = 2826, Cost = 42545, Expansion = 99}, -- Illusion: Vah Shir
			{ID = 1610, Cost = 36574, Expansion = 1}, -- Shield of the Magi
		},
		[55] = {
			{ID = 8931, Cost = 78796, Expansion = 99}, -- Beguiler's Aura
			{ID = 7682, Cost = 1000, Expansion = 4}, -- Focus Refined Spellcaster's Empowering Essence
			{ID = 1409, Cost = 42017, Expansion = 99}, -- Gift of Insight
			{ID = 1715, Cost = 39427, Expansion = 99}, -- Largarn's Lamentation
			{ID = 1714, Cost = 39825, Expansion = 1}, -- Memory Flux
			{ID = 4075, Cost = 56017, Expansion = 0}, -- Protection of Alendar
			{ID = 1699, Cost = 39292, Expansion = 99}, -- Wind of Tashani
			{ID = 1723, Cost = 39599, Expansion = 99}, -- Zumaik's Animation
		},
		[56] = {
			{ID = 1729, Cost = 42042, Expansion = 99}, -- Augment
			{ID = 1695, Cost = 42909, Expansion = 99}, -- Gift of Pure Thought
			{ID = 2568, Cost = 49260, Expansion = 99}, -- Horrifying Visage
			{ID = 1701, Cost = 42080, Expansion = 1}, -- Overwhelming Splendor
			{ID = 1700, Cost = 42535, Expansion = 99}, -- Torment of Argli
			{ID = 1527, Cost = 42307, Expansion = 1}, -- Trepidation
		},
		[57] = {
			{ID = 1688, Cost = 45936, Expansion = 99}, -- Enlightenment
			{ID = 1712, Cost = 46103, Expansion = 99}, -- Forlorn Deeds
			{ID = 6983, Cost = 11000, Expansion = 0}, -- Phobia
			{ID = 1702, Cost = 45798, Expansion = 1}, -- Tashanian
			{ID = 1711, Cost = 45539, Expansion = 99}, -- Umbra
		},
		[58] = {
			{ID = 1713, Cost = 49270, Expansion = 99}, -- Bedlam
			{ID = 2016, Cost = 48794, Expansion = 99}, -- Dementing Visions
			{ID = 1633, Cost = 11000, Expansion = 0}, -- Fetter
			{ID = 2569, Cost = 57035, Expansion = 9}, -- Glamorous Visage
			{ID = 4100, Cost = 69702, Expansion = 0}, -- Reflect
			{ID = 1709, Cost = 49677, Expansion = 1}, -- Wondrous Rapidity
		},
		[59] = {
			{ID = 1703, Cost = 52319, Expansion = 99}, -- Asphyxiate
			{ID = 7695, Cost = 1000, Expansion = 4}, -- Focus Mass Refined Spellcaster's Empowering Essence
			{ID = 1692, Cost = 52854, Expansion = 1}, -- Rapture
		},
		[60] = {
			{ID = 1707, Cost = 57061, Expansion = 9}, -- Dictate
			{ID = 7683, Cost = 1000, Expansion = 4}, -- Focus Intricate Spellcaster's Empowering Essence
			{ID = 1410, Cost = 60017, Expansion = 99}, -- Gift of Brilliance
			{ID = 2570, Cost = 66855, Expansion = 99}, -- Koadic's Endless Intellect
			{ID = 2895, Cost = 67104, Expansion = 99}, -- Speed of the Brood
			{ID = 1710, Cost = 56962, Expansion = 99}, -- Visions of Grandeur
			{ID = 1704, Cost = 55871, Expansion = 99}, -- Wind of Tashanian
		},
		[61] = {
			{ID = 3341, Cost = 71698, Expansion = 4}, -- Apathy
			{ID = 3199, Cost = 70266, Expansion = 99}, -- Arcane Rune
			{ID = 3229, Cost = 71424, Expansion = 99}, -- Boggle
			{ID = 3194, Cost = 71024, Expansion = 4}, -- Greater Fetter
			{ID = 3342, Cost = 70051, Expansion = 99}, -- Howl of Tashan
			{ID = 3591, Cost = 71145, Expansion = 4}, -- Imbue Disease
			{ID = 3595, Cost = 69844, Expansion = 4}, -- Imbue Justice
			{ID = 6739, Cost = 0, Expansion = 0}, -- Rune of the Scale
			{ID = 3343, Cost = 71752, Expansion = 99}, -- Rune of Zebuxoruk
			{ID = 3300, Cost = 71391, Expansion = 4}, -- Shield of the Arcane
		},
		[62] = {
			{ID = 3034, Cost = 74871, Expansion = 99}, -- Aeldorb's Animation
			{ID = 3347, Cost = 76451, Expansion = 99}, -- Beckon
			{ID = 3242, Cost = 75412, Expansion = 99}, -- Guard of Druzzil
			{ID = 3352, Cost = 75048, Expansion = 4}, -- Imbue Earth
			{ID = 3344, Cost = 75709, Expansion = 4}, -- Imbue Nightmare
			{ID = 3346, Cost = 75554, Expansion = 4}, -- Imbue Storm
			{ID = 3594, Cost = 75338, Expansion = 4}, -- Imbue Torment
			{ID = 6984, Cost = 11000, Expansion = 0}, -- Jitterskin
			{ID = 3197, Cost = 74654, Expansion = 4}, -- Pacification
			{ID = 3240, Cost = 75792, Expansion = 99}, -- Speed of Vallon
			{ID = 3345, Cost = 74759, Expansion = 99}, -- Strangle
			{ID = 3359, Cost = 74896, Expansion = 99}, -- Word of Morell
		},
		[63] = {
			{ID = 4076, Cost = 98869, Expansion = 0}, -- Bulwark of Alendar
			{ID = 4408, Cost = 101047, Expansion = 0}, -- Color Cloud
			{ID = 3592, Cost = 80674, Expansion = 4}, -- Imbue Valor
			{ID = 3593, Cost = 80800, Expansion = 4}, -- Imbue War
			{ID = 3241, Cost = 80193, Expansion = 99}, -- Night's Dark Terror
			{ID = 3354, Cost = 80238, Expansion = 99}, -- Sleep
			{ID = 3348, Cost = 81015, Expansion = 99}, -- Torment of Scio
			{ID = 3350, Cost = 80315, Expansion = 99}, -- Tranquility
			{ID = 3351, Cost = 81797, Expansion = 99}, -- Uproar
		},
		[64] = {
			{ID = 3358, Cost = 86903, Expansion = 99}, -- Bliss
			{ID = 3355, Cost = 86199, Expansion = 99}, -- Command of Druzzil
			{ID = 7696, Cost = 1000, Expansion = 4}, -- Focus Mass Intricate Spellcaster's Empowering Essence
			{ID = 3353, Cost = 85348, Expansion = 4}, -- Imbue Air
			{ID = 3349, Cost = 86600, Expansion = 99}, -- Insanity
			{ID = 3302, Cost = 85591, Expansion = 4}, -- Shield of Maelin
		},
		[65] = {
			{ID = 4878, Cost = 115213, Expansion = 99}, -- Bliss of the Nihil
			{ID = 4877, Cost = 117992, Expansion = 99}, -- Dreary Deeds
			{ID = 7684, Cost = 1000, Expansion = 4}, -- Focus Elaborate Spellcaster's Empowering Essence
			{ID = 3063, Cost = 98936, Expansion = 99}, -- Illusion: Froglok
			{ID = 3356, Cost = 99869, Expansion = 4}, -- Imbue Fire
			{ID = 3357, Cost = 98311, Expansion = 4}, -- Imbue Water
			{ID = 4879, Cost = 115281, Expansion = 99}, -- Madness of Ikkibi
			{ID = 3178, Cost = 100832, Expansion = 99}, -- Vallon's Quickening
			{ID = 3360, Cost = 100696, Expansion = 99}, -- Voice of Quellious
		},
		[66] = {
			{ID = 5500, Cost = 133063, Expansion = 99}, -- Ethereal Rune
			{ID = 5502, Cost = 131508, Expansion = 99}, -- Mystic Shield
			{ID = 5505, Cost = 131886, Expansion = 99}, -- Salik's Animation
			{ID = 6122, Cost = 130552, Expansion = 99}, -- Suppression Field
			{ID = 5499, Cost = 132917, Expansion = 99}, -- Synapsis Spasm
		},
		[67] = {
			{ID = 6985, Cost = 139241, Expansion = 99}, -- Anxiety Attack
			{ID = 5503, Cost = 137915, Expansion = 99}, -- Felicity
			{ID = 5506, Cost = 140695, Expansion = 99}, -- Placate
			{ID = 5504, Cost = 138660, Expansion = 99}, -- Rune of Salik
			{ID = 5507, Cost = 138771, Expansion = 99}, -- Speed of Salik
		},
		[68] = {
			{ID = 7003, Cost = 146156, Expansion = 99}, -- Circle of Dreams
			{ID = 5513, Cost = 147507, Expansion = 99}, -- Clairvoyance
			{ID = 5510, Cost = 149511, Expansion = 99}, -- Compel
			{ID = 8035, Cost = 164527, Expansion = 99}, -- Echoing Madness
			{ID = 5518, Cost = 146899, Expansion = 99}, -- Psychosis
			{ID = 5515, Cost = 149520, Expansion = 99}, -- Wall of Alendar
		},
		[69] = {
			{ID = 5509, Cost = 158594, Expansion = 99}, -- Arcane Noose
			{ID = 5516, Cost = 157790, Expansion = 99}, -- Color Snap
			{ID = 8034, Cost = 176338, Expansion = 99}, -- Colored Chaos
			{ID = 6826, Cost = 158610, Expansion = 99}, -- Desolate Deeds
			{ID = 5520, Cost = 158427, Expansion = 99}, -- Euphoria
			{ID = 7697, Cost = 1000, Expansion = 4}, -- Focus Mass Elaborate Spellcaster's Empowering Essence
			{ID = 5514, Cost = 157349, Expansion = 99}, -- Mayhem
			{ID = 6671, Cost = 170155, Expansion = 99}, -- Rune of Rikkukin
			{ID = 5511, Cost = 155736, Expansion = 99}, -- Wake of Felicity
		},
		[70] = {
			{ID = 5517, Cost = 167178, Expansion = 99}, -- Circle of Alendar
			{ID = 7685, Cost = 1000, Expansion = 4}, -- Focus Ornate Spellcaster's Empowering Essence
			{ID = 5521, Cost = 167596, Expansion = 99}, -- Hastening of Salik
			{ID = 8509, Cost = 195296, Expansion = 99}, -- Illusionist's Aura
			{ID = 8032, Cost = 187622, Expansion = 99}, -- Mana Flare
			{ID = 8508, Cost = 199488, Expansion = 99}, -- Mind Shatter
			{ID = 5519, Cost = 168296, Expansion = 99}, -- True Name
			{ID = 5522, Cost = 166879, Expansion = 99}, -- Voice of Clairvoyance
			{ID = 8506, Cost = 199286, Expansion = 99}, -- Ward of Bedazzlement
		},
		[71] = {
			{ID = 10580, Cost = 217599, Expansion = 4}, -- Draconic Rune
			{ID = 10586, Cost = 219496, Expansion = 4}, -- Ellowind's Animation
			{ID = 10577, Cost = 220929, Expansion = 4}, -- Fractured Consciousness
			{ID = 11909, Cost = 235223, Expansion = 4}, -- Perplexing Flash
			{ID = 11911, Cost = 10000, Expansion = 99}, -- Perplexing Flash Rk. III
			{ID = 10596, Cost = 221892, Expansion = 4}, -- Rune of Ellowind
			{ID = 10583, Cost = 223325, Expansion = 4}, -- Sorcerous Shield
		},
		[72] = {
			{ID = 10647, Cost = 234019, Expansion = 4}, -- Bewilderment
			{ID = 10614, Cost = 235657, Expansion = 4}, -- Coax
			{ID = 10608, Cost = 232679, Expansion = 4}, -- Echo of Tashan
			{ID = 11891, Cost = 243181, Expansion = 4}, -- Entrancer's Aura
			{ID = 10599, Cost = 232558, Expansion = 4}, -- Quiet Mind
			{ID = 10602, Cost = 235127, Expansion = 4}, -- Speed of Ellowind
		},
		[73] = {
			{ID = 10620, Cost = 243642, Expansion = 4}, -- Aegis of Alendar
			{ID = 10629, Cost = 243323, Expansion = 4}, -- Dreams of Veldyn
			{ID = 11903, Cost = 257737, Expansion = 4}, -- Mana Recursion
			{ID = 10623, Cost = 247158, Expansion = 4}, -- Polychromatic Assault
			{ID = 10617, Cost = 245424, Expansion = 4}, -- Seer's Intuition
			{ID = 10635, Cost = 246053, Expansion = 4}, -- Thin Air
		},
		[74] = {
			{ID = 10641, Cost = 262240, Expansion = 4}, -- Brimstone Body
			{ID = 10644, Cost = 256831, Expansion = 4}, -- Color Collapse
			{ID = 7698, Cost = 1000, Expansion = 4}, -- Focus Mass Ornate Spellcaster's Empowering Essence
			{ID = 10653, Cost = 262415, Expansion = 4}, -- Legion of Alendar
			{ID = 11885, Cost = 273608, Expansion = 4}, -- Rune of the Kedge
			{ID = 10650, Cost = 257960, Expansion = 4}, -- Spinning into the Void
			{ID = 10638, Cost = 259603, Expansion = 4}, -- Wake of Subdual
		},
		[75] = {
			{ID = 10656, Cost = 274637, Expansion = 4}, -- Dyn`leth's Whispers
			{ID = 7686, Cost = 1000, Expansion = 4}, -- Focus Runed Spellcaster's Empowering Essence
			{ID = 10659, Cost = 269712, Expansion = 4}, -- Hastening of Ellowind
			{ID = 11897, Cost = 290113, Expansion = 4}, -- Mind Phobiate
			{ID = 10674, Cost = 270229, Expansion = 4}, -- Polychromatic Rune
			{ID = 10662, Cost = 270329, Expansion = 4}, -- Voice of Intuition
			{ID = 10666, Cost = 271115, Expansion = 4}, -- Ward of Bewilderment
		},
		[76] = {
			{ID = 14503, Cost = 322159, Expansion = 4}, -- Erradien's Animation
			{ID = 14626, Cost = 315221, Expansion = 4}, -- Learner's Aura
			{ID = 14605, Cost = 318728, Expansion = 4}, -- Mystifying Flash
			{ID = 14497, Cost = 315531, Expansion = 4}, -- Opalescent Rune
			{ID = 14506, Cost = 315781, Expansion = 4}, -- Rune of Erradien
			{ID = 14494, Cost = 318802, Expansion = 4}, -- Shattered Consciousness
			{ID = 14500, Cost = 318345, Expansion = 4}, -- Spellbound Shield
		},
		[77] = {
			{ID = 14518, Cost = 340413, Expansion = 4}, -- Cajole
			{ID = 14515, Cost = 332006, Expansion = 4}, -- Din of Tashan
			{ID = 14587, Cost = 340537, Expansion = 99}, -- Mystifier's Aura
			{ID = 14588, Cost = 344164, Expansion = 99}, -- Mystifier's Aura Rk. II
			{ID = 14589, Cost = 2238730, Expansion = 99}, -- Mystifier's Aura Rk. III
			{ID = 14548, Cost = 337180, Expansion = 4}, -- Mystify
			{ID = 14650, Cost = 335103, Expansion = 99}, -- Runic Swirl Aura
			{ID = 14651, Cost = 405490, Expansion = 99}, -- Runic Swirl Aura Rk. II
			{ID = 14652, Cost = 2092720, Expansion = 99}, -- Runic Swirl Aura Rk. III
			{ID = 14509, Cost = 337500, Expansion = 4}, -- Silent Mind
			{ID = 14512, Cost = 337016, Expansion = 4}, -- Speed of Erradien
		},
		[78] = {
			{ID = 14524, Cost = 354799, Expansion = 4}, -- Aegis of Qandieal
			{ID = 14599, Cost = 355008, Expansion = 99}, -- Mana Resurgence
			{ID = 14600, Cost = 422786, Expansion = 99}, -- Mana Resurgence Rk. II
			{ID = 14527, Cost = 351544, Expansion = 4}, -- Multichromatic Assault
			{ID = 14521, Cost = 350398, Expansion = 4}, -- Seer's Cognizance
			{ID = 14536, Cost = 354964, Expansion = 4}, -- Strangling Air
			{ID = 14530, Cost = 358520, Expansion = 4}, -- Visions of Kirathas
			{ID = 14644, Cost = 351656, Expansion = 99}, -- Wake of Atrophy Aura
			{ID = 14645, Cost = 381610, Expansion = 99}, -- Wake of Atrophy Aura Rk. II
			{ID = 14646, Cost = 2190500, Expansion = 99}, -- Wake of Atrophy Aura Rk. III
		},
		[79] = {
			{ID = 14632, Cost = 370431, Expansion = 99}, -- Aura of Endless Glamour
			{ID = 14633, Cost = 380830, Expansion = 99}, -- Aura of Endless Glamour Rk. II
			{ID = 14638, Cost = 376740, Expansion = 99}, -- Aura of Horror
			{ID = 14639, Cost = 377796, Expansion = 99}, -- Aura of Horror Rk. II
			{ID = 14640, Cost = 2066010, Expansion = 99}, -- Aura of Horror Rk. III
			{ID = 14542, Cost = 372090, Expansion = 4}, -- Brimstone Tenement
			{ID = 14545, Cost = 370436, Expansion = 4}, -- Color Cataclysm
			{ID = 14554, Cost = 372454, Expansion = 4}, -- Legion of Qandieal
			{ID = 14539, Cost = 373684, Expansion = 4}, -- Quelling Wave
			{ID = 14581, Cost = 368593, Expansion = 4}, -- Rune of the Deep
			{ID = 14551, Cost = 368049, Expansion = 4}, -- Whirling into the Hollow
		},
		[80] = {
			{ID = 14560, Cost = 386098, Expansion = 4}, -- Hastening of Erradien
			{ID = 14557, Cost = 396220, Expansion = 4}, -- Haunting Whispers
			{ID = 14620, Cost = 392205, Expansion = 99}, -- Mana Resurgence Aura
			{ID = 14593, Cost = 391135, Expansion = 4}, -- Mind Oscillate
			{ID = 14572, Cost = 389344, Expansion = 4}, -- Multichromatic Rune
			{ID = 14578, Cost = 395654, Expansion = 4}, -- Tears of Qandieal
			{ID = 14563, Cost = 391507, Expansion = 4}, -- Voice of Cognizance
			{ID = 14566, Cost = 393963, Expansion = 4}, -- Ward of Mystifying
		},
		[81] = {
			{ID = 18663, Cost = 426492, Expansion = 99}, -- Befuddling Flash
			{ID = 18552, Cost = 435802, Expansion = 99}, -- Fragmented Consciousness
			{ID = 18555, Cost = 431369, Expansion = 99}, -- Pearlescent Rune
			{ID = 18564, Cost = 428524, Expansion = 99}, -- Rune of Yozan
			{ID = 18558, Cost = 432620, Expansion = 99}, -- Shield of the Void
			{ID = 18561, Cost = 425564, Expansion = 99}, -- Yozan's Animation
		},
		[82] = {
			{ID = 18573, Cost = 447466, Expansion = 15}, -- Bark of Tashan
			{ID = 18606, Cost = 449625, Expansion = 15}, -- Befuddle
			{ID = 18567, Cost = 446296, Expansion = 15}, -- Hushed Mind
			{ID = 18576, Cost = 448564, Expansion = 15}, -- Seduction
		},
		[83] = {
			{ID = 18582, Cost = 474115, Expansion = 99}, -- Aegis of Xadrith
			{ID = 18588, Cost = 468411, Expansion = 99}, -- Docility
			{ID = 18585, Cost = 470477, Expansion = 99}, -- Polychaotic Assault
			{ID = 18579, Cost = 470196, Expansion = 99}, -- Prescience
			{ID = 18594, Cost = 477105, Expansion = 99}, -- Smother
		},
		[84] = {
			{ID = 18603, Cost = 495430, Expansion = 99}, -- Color Conflux
			{ID = 18600, Cost = 494354, Expansion = 99}, -- Dermal Brimstone
			{ID = 18597, Cost = 495776, Expansion = 99}, -- Ensorcelling Wave
			{ID = 18612, Cost = 496800, Expansion = 99}, -- Legion of Xadrith
			{ID = 18639, Cost = 503112, Expansion = 99}, -- Rune of the Void
			{ID = 18609, Cost = 503917, Expansion = 99}, -- The Downward Spiral
			{ID = 18697, Cost = 656401, Expansion = 99}, -- Twincast Aura Rk. II
		},
		[85] = {
			{ID = 18615, Cost = 523919, Expansion = 99}, -- Dominate
			{ID = 18651, Cost = 528022, Expansion = 99}, -- Mind Twist
			{ID = 18630, Cost = 523231, Expansion = 99}, -- Polychaotic Rune
			{ID = 18636, Cost = 520973, Expansion = 99}, -- Tears of Xadrith
			{ID = 18621, Cost = 523307, Expansion = 99}, -- Voice of Prescience
			{ID = 18624, Cost = 517375, Expansion = 99}, -- Ward of Befuddlement
		},
		[86] = {
			{ID = 26889, Cost = 596588, Expansion = 99}, -- Baffling Flash
			{ID = 26896, Cost = 594331, Expansion = 99}, -- Novak's Animation
			{ID = 26899, Cost = 605437, Expansion = 99}, -- Rune of Novak
			{ID = 26333, Cost = 606975, Expansion = 99}, -- Shield of Dreams
			{ID = 26902, Cost = 599479, Expansion = 99}, -- Spectral Rune
			{ID = 26905, Cost = 608537, Expansion = 99}, -- Speed of Novak
			{ID = 26908, Cost = 600991, Expansion = 99}, -- Splintered Consciousness
		},
		[87] = {
			{ID = 26911, Cost = 628471, Expansion = 99}, -- Baffle
			{ID = 26920, Cost = 629858, Expansion = 99}, -- Bucolic Mind
			{ID = 26923, Cost = 622381, Expansion = 99}, -- Chromarcana
			{ID = 26926, Cost = 636612, Expansion = 99}, -- Clamor of Tashan
			{ID = 26929, Cost = 620733, Expansion = 99}, -- Deception
		},
		[88] = {
			{ID = 26944, Cost = 660053, Expansion = 99}, -- Aegis of Zykean
			{ID = 26957, Cost = 654490, Expansion = 99}, -- Constrict
			{ID = 26963, Cost = 665809, Expansion = 99}, -- Forethought
			{ID = 26985, Cost = 658490, Expansion = 99}, -- Serenity
			{ID = 26991, Cost = 664209, Expansion = 99}, -- Spectral Assault
		},
		[89] = {
			{ID = 26994, Cost = 693437, Expansion = 99}, -- Baffling Constriction
			{ID = 26997, Cost = 687887, Expansion = 99}, -- Brimstone Brawn
			{ID = 27000, Cost = 679930, Expansion = 99}, -- Color Clash
			{ID = 27003, Cost = 692431, Expansion = 99}, -- Dizzying Helix
			{ID = 27006, Cost = 693043, Expansion = 99}, -- Echo of Subjugation
			{ID = 27012, Cost = 690994, Expansion = 99}, -- Legion of Zykean
			{ID = 27015, Cost = 697350, Expansion = 99}, -- Manastorm
			{ID = 27021, Cost = 688691, Expansion = 99}, -- Serene Wave
			{ID = 27024, Cost = 680063, Expansion = 99}, -- Twilight Rune
		},
		[90] = {
			{ID = 27030, Cost = 721173, Expansion = 99}, -- Hastening of Novak
			{ID = 27034, Cost = 710572, Expansion = 99}, -- Mana Reiteration Aura
			{ID = 27040, Cost = 710549, Expansion = 99}, -- Mind Helix
			{ID = 27046, Cost = 718994, Expansion = 99}, -- Mindblade
			{ID = 27056, Cost = 724367, Expansion = 99}, -- Polyspectral Rune
			{ID = 27049, Cost = 717870, Expansion = 99}, -- Soporific Stare
			{ID = 27062, Cost = 716894, Expansion = 99}, -- Spectral Unity
			{ID = 27065, Cost = 712925, Expansion = 99}, -- Subjugate
			{ID = 27074, Cost = 725923, Expansion = 99}, -- Tears of Zykean
			{ID = 27077, Cost = 725293, Expansion = 99}, -- Voice of Forethought
			{ID = 27080, Cost = 724307, Expansion = 99}, -- Ward of Bafflement
		},
		[91] = {
			{ID = 30030, Cost = 1180823, Expansion = 99}, -- Arcanaward's Rune
			{ID = 30020, Cost = 1183547, Expansion = 99}, -- Chromatic Flash
			{ID = 30023, Cost = 1180940, Expansion = 99}, -- Illusion: Ripclaw Raptor
			{ID = 30017, Cost = 1183705, Expansion = 99}, -- Misleading Flash
			{ID = 30027, Cost = 1182691, Expansion = 99}, -- Rune of Tonmek
			{ID = 30024, Cost = 1181008, Expansion = 99}, -- Seronvall's Animation
			{ID = 29445, Cost = 1182546, Expansion = 18}, -- Shield of Bronze
			{ID = 30036, Cost = 1184838, Expansion = 99}, -- Slivered Consciousness
			{ID = 30033, Cost = 1183495, Expansion = 99}, -- Speed of Aransir
		},
		[92] = {
			{ID = 30042, Cost = 1195366, Expansion = 99}, -- Arctender's Aura
			{ID = 30048, Cost = 1194616, Expansion = 99}, -- Arctender's Echo
			{ID = 30060, Cost = 1195469, Expansion = 99}, -- Chromaruin
			{ID = 30066, Cost = 1194868, Expansion = 99}, -- Compelling Edict
			{ID = 30063, Cost = 1195783, Expansion = 99}, -- Declaration of Tashan
			{ID = 30069, Cost = 1195945, Expansion = 99}, -- Governing Aura
			{ID = 30054, Cost = 1198493, Expansion = 99}, -- Halcyon Mind
			{ID = 30039, Cost = 1197526, Expansion = 99}, -- Mislead
			{ID = 30057, Cost = 1197219, Expansion = 99}, -- Remote Color Convergence
			{ID = 30075, Cost = 1193754, Expansion = 99}, -- Runic Glow Aura
		},
		[93] = {
			{ID = 30081, Cost = 1206915, Expansion = 99}, -- Aegis of Soliadal
			{ID = 30128, Cost = 1207597, Expansion = 99}, -- Arcane Assault
			{ID = 30097, Cost = 1207216, Expansion = 99}, -- Attenuating Helix
			{ID = 30090, Cost = 1207792, Expansion = 99}, -- Chaotic Confusion
			{ID = 30122, Cost = 1207924, Expansion = 99}, -- Confusion
			{ID = 30131, Cost = 1211041, Expansion = 99}, -- Horrifying Rune
			{ID = 30103, Cost = 1208130, Expansion = 99}, -- Illusion: Deadraiser
			{ID = 30104, Cost = 1208321, Expansion = 99}, -- Mana Repercussion
			{ID = 30084, Cost = 1211219, Expansion = 99}, -- Placid Issuance
			{ID = 30100, Cost = 1206891, Expansion = 99}, -- Premeditation
			{ID = 30094, Cost = 1209109, Expansion = 99}, -- Suffocation
		},
		[94] = {
			{ID = 30140, Cost = 1223688, Expansion = 99}, -- Brimstone Potency
			{ID = 30143, Cost = 1221226, Expansion = 99}, -- Color Convergence
			{ID = 30137, Cost = 1219576, Expansion = 99}, -- Confusing Constriction
			{ID = 30146, Cost = 1220515, Expansion = 99}, -- Dizzying Gyre
			{ID = 30149, Cost = 1220163, Expansion = 99}, -- Echo of Coercion
			{ID = 30155, Cost = 1223495, Expansion = 99}, -- Legion of Tonmek
			{ID = 30164, Cost = 1222310, Expansion = 99}, -- Peaceful Wave
			{ID = 30167, Cost = 1221318, Expansion = 99}, -- Shadowed Rune
		},
		[95] = {
			{ID = 30202, Cost = 1235379, Expansion = 99}, -- Arcane Unity
			{ID = 30205, Cost = 1235669, Expansion = 99}, -- Enforce
			{ID = 30173, Cost = 1234630, Expansion = 99}, -- Hastening of Aransir
			{ID = 30226, Cost = 1234100, Expansion = 99}, -- Issuance of Mana Repercussion
			{ID = 30177, Cost = 1236801, Expansion = 99}, -- Mana Repercussion Aura
			{ID = 30183, Cost = 1235576, Expansion = 99}, -- Mind Spiral
			{ID = 30189, Cost = 1236998, Expansion = 99}, -- Mindscythe
			{ID = 30196, Cost = 1236842, Expansion = 99}, -- Polyarcanic Rune
			{ID = 30192, Cost = 1235744, Expansion = 99}, -- Sedative Stare
			{ID = 30214, Cost = 1236111, Expansion = 99}, -- Tears of Wreliard
			{ID = 30217, Cost = 1234530, Expansion = 99}, -- Voice of Premeditation
		},
	},
	[Class.BEASTLORD] = {
		[1] = {
			{ID = 5011, Cost = 20, Expansion = 0}, -- Salve
		},
		[2] = {
			{ID = 238, Cost = 20, Expansion = 0}, -- Sense Animals
		},
		[3] = {
			{ID = 225, Cost = 20, Expansion = 0}, -- Endure Cold
		},
		[4] = {
			{ID = 213, Cost = 20, Expansion = 0}, -- Cure Disease
		},
		[5] = {
			{ID = 201, Cost = 20, Expansion = 0}, -- Flash of Light
		},
		[6] = {
			{ID = 200, Cost = 20, Expansion = 0}, -- Minor Healing
		},
		[7] = {
			{ID = 267, Cost = 20, Expansion = 0}, -- Inner Fire
		},
		[8] = {
			{ID = 2612, Cost = 55, Expansion = 0}, -- Spirit of Sharik
		},
		[9] = {
			{ID = 224, Cost = 20, Expansion = 0}, -- Endure Fire
			{ID = 2611, Cost = 72, Expansion = 0}, -- Sharik's Replenishing
		},
		[10] = {
			{ID = 274, Cost = 22, Expansion = 0}, -- Scale Skin
		},
		[11] = {
			{ID = 271, Cost = 24, Expansion = 0}, -- Fleeting Fury
		},
		[12] = {
			{ID = 2068, Cost = 366, Expansion = 0}, -- Blast of Frost
		},
		[13] = {
			{ID = 203, Cost = 20, Expansion = 0}, -- Cure Poison
			{ID = 2635, Cost = 369, Expansion = 0}, -- Spirit of Lightning
		},
		[14] = {
			{ID = 75, Cost = 24, Expansion = 0}, -- Sicken
			{ID = 40, Cost = 20, Expansion = 0}, -- Strengthen
		},
		[15] = {
			{ID = 2613, Cost = 302, Expansion = 0}, -- Keshuval's Rejuvenation
			{ID = 2633, Cost = 541, Expansion = 0}, -- Spirit of Khaliz
		},
		[16] = {
			{ID = 276, Cost = 34, Expansion = 0}, -- Serpent Sight
		},
		[17] = {
			{ID = 279, Cost = 34, Expansion = 0}, -- Spirit of Bear
			{ID = 211, Cost = 20, Expansion = 0}, -- Summon Drink
		},
		[18] = {
			{ID = 227, Cost = 34, Expansion = 0}, -- Endure Poison
			{ID = 2636, Cost = 918, Expansion = 0}, -- Spirit of the Blizzard
		},
		[19] = {
			{ID = 277, Cost = 55, Expansion = 0}, -- Tainted Breath
			{ID = 3583, Cost = 373, Expansion = 0}, -- Tiny Companion
		},
		[20] = {
			{ID = 270, Cost = 28, Expansion = 0}, -- Drowsy
			{ID = 17, Cost = 24, Expansion = 0}, -- Light Healing
		},
		[21] = {
			{ID = 2614, Cost = 936, Expansion = 0}, -- Spirit of Keshuval
		},
		[22] = {
			{ID = 226, Cost = 55, Expansion = 0}, -- Endure Disease
		},
		[23] = {
			{ID = 345, Cost = 300, Expansion = 0}, -- Shrink
		},
		[24] = {
			{ID = 278, Cost = 71, Expansion = 0}, -- Spirit of Wolf
		},
		[25] = {
			{ID = 86, Cost = 34, Expansion = 0}, -- Enduring Breath
		},
		[26] = {
			{ID = 282, Cost = 243, Expansion = 0}, -- Spirit Strike
			{ID = 283, Cost = 120, Expansion = 0}, -- Turtle Skin
		},
		[27] = {
			{ID = 2615, Cost = 2245, Expansion = 0}, -- Herikol's Soothing
		},
		[28] = {
			{ID = 2637, Cost = 3820, Expansion = 0}, -- Spirit of Inferno
			{ID = 147, Cost = 541, Expansion = 0}, -- Spirit Strength
		},
		[29] = {
			{ID = 79, Cost = 42, Expansion = 0}, -- Spirit Sight
			{ID = 50, Cost = 20, Expansion = 0}, -- Summon Food
		},
		[30] = {
			{ID = 2616, Cost = 3296, Expansion = 0}, -- Spirit of Herikol
		},
		[31] = {
			{ID = 1285, Cost = 3719, Expansion = 4}, -- Summon Companion
		},
		[32] = {
			{ID = 261, Cost = 92, Expansion = 0}, -- Levitate
		},
		[33] = {
			{ID = 3568, Cost = 7470, Expansion = 4}, -- Ice Spear
		},
		[34] = {
			{ID = 228, Cost = 373, Expansion = 0}, -- Endure Magic
		},
		[35] = {
			{ID = 48, Cost = 43, Expansion = 0}, -- Cancel Magic
			{ID = 434, Cost = 1488, Expansion = 0}, -- Envenomed Breath
		},
		[36] = {
			{ID = 12, Cost = 92, Expansion = 0}, -- Healing
			{ID = 2617, Cost = 6738, Expansion = 0}, -- Yekan's Recovery
		},
		[37] = {
			{ID = 149, Cost = 929, Expansion = 0}, -- Spirit of Ox
			{ID = 2619, Cost = 7333, Expansion = 0}, -- Yekan's Quickening
		},
		[38] = {
			{ID = 146, Cost = 916, Expansion = 0}, -- Spirit of Monkey
			{ID = 2638, Cost = 10942, Expansion = 0}, -- Spirit of the Scorpion
		},
		[39] = {
			{ID = 4054, Cost = 5901, Expansion = 0}, -- Spirit of the Shrew
			{ID = 2618, Cost = 9170, Expansion = 0}, -- Spirit of Yekan
		},
		[40] = {
			{ID = 3689, Cost = 16165, Expansion = 99}, -- Malaria
		},
		[41] = {
			{ID = 151, Cost = 2583, Expansion = 0}, -- Raging Strength
			{ID = 2176, Cost = 14565, Expansion = 4}, -- Spiritual Light
		},
		[42] = {
			{ID = 2178, Cost = 13414, Expansion = 4}, -- Spiritual Brawn
		},
		[43] = {
			{ID = 42, Cost = 24, Expansion = 0}, -- Invisibility
		},
		[44] = {
			{ID = 162, Cost = 1689, Expansion = 0}, -- Listless Power
			{ID = 4055, Cost = 36826, Expansion = 0}, -- Pack Shrew
		},
		[45] = {
			{ID = 96, Cost = 1087, Expansion = 0}, -- Counteract Disease
		},
		[46] = {
			{ID = 2621, Cost = 17537, Expansion = 0}, -- Spirit of Kashek
			{ID = 2639, Cost = 22498, Expansion = 0}, -- Spirit of Vermin
		},
		[47] = {
			{ID = 308, Cost = 375, Expansion = 0}, -- Frenzy
			{ID = 3569, Cost = 26714, Expansion = 4}, -- Frost Shard
		},
		[48] = {
			{ID = 649, Cost = 773, Expansion = 0}, -- Protect
		},
		[49] = {
			{ID = 2620, Cost = 22435, Expansion = 0}, -- Vigor of Zehkes
			{ID = 4079, Cost = 36199, Expansion = 0}, -- Ward of Calliav
		},
		[50] = {
			{ID = 2634, Cost = 31086, Expansion = 0}, -- Sha's Lethargy
		},
		[51] = {
			{ID = 63, Cost = 3358, Expansion = 0}, -- Resist Disease
			{ID = 4585, Cost = 3332, Expansion = 0}, -- Resistant Discipline
			{ID = 2640, Cost = 34089, Expansion = 0}, -- Spirit of Wind
			{ID = 46, Cost = 1951, Expansion = 1}, -- Ultravision
		},
		[52] = {
			{ID = 2622, Cost = 31389, Expansion = 4}, -- Aid of Khurenz
			{ID = 3690, Cost = 42131, Expansion = 99}, -- Bond of the Wild
			{ID = 161, Cost = 3342, Expansion = 0}, -- Health
			{ID = 2177, Cost = 36765, Expansion = 4}, -- Spiritual Radiance
			{ID = 435, Cost = 5275, Expansion = 0}, -- Venom of the Snake
		},
		[53] = {
			{ID = 152, Cost = 9061, Expansion = 0}, -- Deftness
			{ID = 2641, Cost = 39437, Expansion = 0}, -- Spirit of the Storm
			{ID = 167, Cost = 5999, Expansion = 0}, -- Talisman of Tnarg
		},
		[54] = {
			{ID = 4587, Cost = 10043, Expansion = 0}, -- Fearless Discipline
			{ID = 153, Cost = 9127, Expansion = 0}, -- Furious Strength
			{ID = 3570, Cost = 45702, Expansion = 4}, -- Ice Shard
			{ID = 62, Cost = 3332, Expansion = 0}, -- Resist Poison
			{ID = 2623, Cost = 36986, Expansion = 4}, -- Spirit of Omakin
			{ID = 2890, Cost = 42149, Expansion = 99}, -- Spirit of Snow
		},
		[55] = {
			{ID = 145, Cost = 9068, Expansion = 0}, -- Chloroplast
			{ID = 2625, Cost = 39815, Expansion = 4}, -- Omakin's Alacrity
			{ID = 4671, Cost = 39379, Expansion = 4}, -- Protective Spirit Discipline
			{ID = 2624, Cost = 39208, Expansion = 4}, -- Sha's Restoration
		},
		[56] = {
			{ID = 163, Cost = 10091, Expansion = 0}, -- Incapacitate
			{ID = 431, Cost = 3814, Expansion = 0}, -- Shifting Shield
			{ID = 2888, Cost = 48554, Expansion = 99}, -- Spirit of Flame
			{ID = 2626, Cost = 42408, Expansion = 4}, -- Spirit of Zehkes
		},
		[57] = {
			{ID = 157, Cost = 20830, Expansion = 0}, -- Dexterity
			{ID = 15, Cost = 783, Expansion = 0}, -- Greater Healing
			{ID = 158, Cost = 13250, Expansion = 0}, -- Stamina
		},
		[58] = {
			{ID = 4080, Cost = 70319, Expansion = 0}, -- Guard of Calliav
			{ID = 49, Cost = 4197, Expansion = 0}, -- Nullify Magic
			{ID = 2627, Cost = 49484, Expansion = 4}, -- Spirit of Khurenz
			{ID = 168, Cost = 10090, Expansion = 0}, -- Talisman of Altuna
		},
		[59] = {
			{ID = 510, Cost = 14559, Expansion = 0}, -- Blizzard Blast
			{ID = 2628, Cost = 52277, Expansion = 4}, -- Sha's Ferocity
			{ID = 2629, Cost = 52854, Expansion = 4}, -- Spiritual Purity
		},
		[60] = {
			{ID = 170, Cost = 930, Expansion = 0}, -- Alacrity
			{ID = 4678, Cost = 55903, Expansion = 4}, -- Bestial Fury Discipline
			{ID = 2941, Cost = 68029, Expansion = 4}, -- Savagery
			{ID = 2942, Cost = 66849, Expansion = 4}, -- Sha's Advantage
			{ID = 2631, Cost = 56421, Expansion = 4}, -- Spirit of Khati Sha
			{ID = 2630, Cost = 56618, Expansion = 4}, -- Spiritual Strength
		},
		[61] = {
			{ID = 1526, Cost = 33468, Expansion = 1}, -- Annul Magic
			{ID = 95, Cost = 1100, Expansion = 0}, -- Counteract Poison
			{ID = 6740, Cost = 0, Expansion = 0}, -- Growl of the Leopard
			{ID = 3455, Cost = 70975, Expansion = 99}, -- Healing of Sorsha
			{ID = 3454, Cost = 31144, Expansion = 4}, -- Infusion of Spirit
			{ID = 3492, Cost = 71237, Expansion = 99}, -- Scorpion Venom
			{ID = 1571, Cost = 34046, Expansion = 4}, -- Talisman of Shadoo
		},
		[62] = {
			{ID = 1290, Cost = 42273, Expansion = 0}, -- Chloroblast
			{ID = 3457, Cost = 76143, Expansion = 99}, -- Spirit of Arag
			{ID = 3456, Cost = 75735, Expansion = 99}, -- Spiritual Vigor
			{ID = 1585, Cost = 65432, Expansion = 0}, -- Talisman of Kragg
		},
		[63] = {
			{ID = 98, Cost = 20869, Expansion = 0}, -- Abolish Disease
			{ID = 3458, Cost = 81099, Expansion = 99}, -- Arag's Celerity
			{ID = 171, Cost = 9010, Expansion = 0}, -- Celerity
			{ID = 3493, Cost = 81192, Expansion = 99}, -- Frost Spear
			{ID = 3459, Cost = 80599, Expansion = 99}, -- Spirit of Rellic
			{ID = 1570, Cost = 26639, Expansion = 4}, -- Talisman of Jasinth
		},
		[64] = {
			{ID = 4081, Cost = 106619, Expansion = 0}, -- Protection of Calliav
			{ID = 1568, Cost = 31130, Expansion = 0}, -- Regrowth
			{ID = 3461, Cost = 87104, Expansion = 99}, -- Spirit of Sorsha
			{ID = 3460, Cost = 86372, Expansion = 99}, -- Spiritual Dominion
		},
		[65] = {
			{ID = 1575, Cost = 42235, Expansion = 4}, -- Acumen
			{ID = 3463, Cost = 98504, Expansion = 99}, -- Ferocity
			{ID = 32, Cost = 22801, Expansion = 0}, -- Plague
			{ID = 3462, Cost = 99914, Expansion = 99}, -- Sha's Revenge
			{ID = 4876, Cost = 116620, Expansion = 99}, -- Trushar's Frost
			{ID = 4875, Cost = 115432, Expansion = 99}, -- Trushar's Mending
			{ID = 4874, Cost = 117500, Expansion = 99}, -- Turepta Blood
		},
		[66] = {
			{ID = 5527, Cost = 130165, Expansion = 99}, -- Chimera Blood
			{ID = 21399, Cost = 331420, Expansion = 4}, -- Eradicate Disease
			{ID = 5526, Cost = 129893, Expansion = 99}, -- Healing of Mikkily
		},
		[67] = {
			{ID = 5529, Cost = 140680, Expansion = 99}, -- Focus of Alladnu
			{ID = 5528, Cost = 139253, Expansion = 99}, -- Muada's Mending
			{ID = 5530, Cost = 137819, Expansion = 99}, -- Spiritual Vitality
		},
		[68] = {
			{ID = 8021, Cost = 166090, Expansion = 99}, -- Bestial Empathy
			{ID = 5533, Cost = 146990, Expansion = 99}, -- Growl of the Beast
			{ID = 5531, Cost = 149493, Expansion = 99}, -- Spirit of Alladnu
			{ID = 5534, Cost = 148517, Expansion = 99}, -- Spirit of Irionu
		},
		[69] = {
			{ID = 8233, Cost = 176898, Expansion = 99}, -- Empathic Fury
			{ID = 5539, Cost = 158615, Expansion = 99}, -- Feral Guard
			{ID = 5536, Cost = 158091, Expansion = 99}, -- Feral Vigor
			{ID = 5535, Cost = 158552, Expansion = 99}, -- Glacier Spear
			{ID = 6672, Cost = 171716, Expansion = 99}, -- Growl of the Panther
			{ID = 5537, Cost = 156877, Expansion = 99}, -- Spiritual Ascendance
		},
		[70] = {
			{ID = 5542, Cost = 166012, Expansion = 99}, -- Ferocity of Irionu
			{ID = 5540, Cost = 165610, Expansion = 99}, -- Festering Malady
			{ID = 8782, Cost = 197781, Expansion = 99}, -- Rake
			{ID = 6828, Cost = 164593, Expansion = 99}, -- Sha's Legacy
			{ID = 8783, Cost = 200018, Expansion = 99}, -- Spirit of Oroshar
			{ID = 5538, Cost = 165483, Expansion = 99}, -- Spirit of Rashara
		},
		[71] = {
			{ID = 10324, Cost = 222882, Expansion = 4}, -- Diregriffon's Bite
			{ID = 10336, Cost = 219981, Expansion = 4}, -- Focus of Amilan
			{ID = 10321, Cost = 217846, Expansion = 4}, -- Healing of Uluanes
			{ID = 10373, Cost = 223087, Expansion = 4}, -- Mammoth-Hide Guard
			{ID = 10374, Cost = 100000, Expansion = 99}, -- Mammoth-Hide Guard Rk. II
			{ID = 10375, Cost = 100000, Expansion = 99}, -- Mammoth-Hide Guard Rk. III
		},
		[72] = {
			{ID = 10380, Cost = 234273, Expansion = 4}, -- Fever Spike
			{ID = 10333, Cost = 234362, Expansion = 4}, -- Minohten Mending
			{ID = 10339, Cost = 231942, Expansion = 4}, -- Spiritual Vim
		},
		[73] = {
			{ID = 10386, Cost = 243909, Expansion = 4}, -- Bite of the Empress
			{ID = 10387, Cost = 100000, Expansion = 99}, -- Bite of the Empress Rk. II
			{ID = 10388, Cost = 100000, Expansion = 99}, -- Bite of the Empress Rk. III
			{ID = 10342, Cost = 247437, Expansion = 4}, -- Promised Mending
			{ID = 10379, Cost = 248575, Expansion = 4}, -- Spirit of Uluanes
			{ID = 10349, Cost = 248605, Expansion = 4}, -- Unparalleled Voracity
		},
		[74] = {
			{ID = 10364, Cost = 256470, Expansion = 4}, -- Spiked Sleet
			{ID = 10352, Cost = 261874, Expansion = 4}, -- Spirit of Lairn
			{ID = 10370, Cost = 258788, Expansion = 4}, -- Spiritual Enlightenment
		},
		[75] = {
			{ID = 11869, Cost = 290725, Expansion = 4}, -- Bark at the Moon
			{ID = 11870, Cost = 10000, Expansion = 99}, -- Bark at the Moon Rk. II
			{ID = 11871, Cost = 10000, Expansion = 99}, -- Bark at the Moon Rk. III
			{ID = 10383, Cost = 271545, Expansion = 4}, -- Ruthless Ferocity
			{ID = 10392, Cost = 274104, Expansion = 4}, -- Spellbreaker's Guard
			{ID = 10358, Cost = 270197, Expansion = 4}, -- Steeltrap Jaws
		},
		[76] = {
			{ID = 14135, Cost = 317228, Expansion = 4}, -- Dragonscale Guard
			{ID = 21398, Cost = 299595, Expansion = 4}, -- Eradicate Poison
			{ID = 14096, Cost = 320892, Expansion = 4}, -- Falrazim's Gnashing
			{ID = 14102, Cost = 318625, Expansion = 4}, -- Focus of Zott
			{ID = 14093, Cost = 315089, Expansion = 4}, -- Salve of Feldan
		},
		[77] = {
			{ID = 14164, Cost = 339007, Expansion = 4}, -- Bulwark of Tri'Qaras
			{ID = 14099, Cost = 339786, Expansion = 4}, -- Daria's Mending
			{ID = 14139, Cost = 332407, Expansion = 4}, -- Fever Surge
			{ID = 14105, Cost = 332693, Expansion = 4}, -- Spiritual Vivacity
		},
		[78] = {
			{ID = 14145, Cost = 353887, Expansion = 99}, -- Bite of the Borrower
			{ID = 14146, Cost = 812888, Expansion = 99}, -- Bite of the Borrower Rk. II
			{ID = 14147, Cost = 4666650, Expansion = 99}, -- Bite of the Borrower Rk. III
			{ID = 14114, Cost = 356799, Expansion = 4}, -- Peerless Penchant
			{ID = 14108, Cost = 353343, Expansion = 4}, -- Promised Recovery
			{ID = 14109, Cost = 849408, Expansion = 99}, -- Promised Recovery Rk. II
			{ID = 14138, Cost = 355272, Expansion = 4}, -- Spirit of Silverwing
		},
		[79] = {
			{ID = 14170, Cost = 372779, Expansion = 99}, -- Growl of the Puma
			{ID = 14171, Cost = 748046, Expansion = 99}, -- Growl of the Puma Rk. II
			{ID = 14172, Cost = 3849770, Expansion = 99}, -- Growl of the Puma Rk. III
			{ID = 14129, Cost = 372180, Expansion = 4}, -- Jagged Torrent
			{ID = 14117, Cost = 371669, Expansion = 4}, -- Spirit of Jeswin
			{ID = 14132, Cost = 373317, Expansion = 4}, -- Spiritual Epiphany
		},
		[80] = {
			{ID = 14159, Cost = 833284, Expansion = 99}, -- Harrow Rk. II
			{ID = 14160, Cost = 4184710, Expansion = 99}, -- Harrow Rk. III
			{ID = 14151, Cost = 387791, Expansion = 99}, -- Howl at the Moon
			{ID = 14152, Cost = 830160, Expansion = 99}, -- Howl at the Moon Rk. II
			{ID = 14153, Cost = 3876650, Expansion = 99}, -- Howl at the Moon Rk. III
			{ID = 14123, Cost = 390995, Expansion = 4}, -- Lockfang Jaws
			{ID = 14148, Cost = 390653, Expansion = 4}, -- Spellbreaker's Bulwark
			{ID = 14142, Cost = 394266, Expansion = 4}, -- Vicious Ferocity
		},
		[81] = {
			{ID = 18114, Cost = 427692, Expansion = 99}, -- Focus of Yemall
			{ID = 18108, Cost = 431176, Expansion = 99}, -- Ikaav Blood
			{ID = 18105, Cost = 434401, Expansion = 99}, -- Salve of Reshan
		},
		[82] = {
			{ID = 18111, Cost = 454730, Expansion = 15}, -- Cadmael's Mending
			{ID = 18188, Cost = 455730, Expansion = 15}, -- Minax's Mending
			{ID = 18117, Cost = 449979, Expansion = 15}, -- Spiritual Verve
			{ID = 18151, Cost = 450306, Expansion = 15}, -- Tsetsian Endemic
		},
		[83] = {
			{ID = 18121, Cost = 735073, Expansion = 99}, -- Promised Rejuvenation Rk. II
			{ID = 18150, Cost = 468331, Expansion = 99}, -- Spirit of Hoshkar
			{ID = 18126, Cost = 470850, Expansion = 99}, -- Unrivaled Rapidity
		},
		[84] = {
			{ID = 18141, Cost = 497548, Expansion = 99}, -- Frigid Lance
			{ID = 18129, Cost = 501281, Expansion = 99}, -- Spirit of Vaxztn
			{ID = 18144, Cost = 496194, Expansion = 99}, -- Spiritual Edification
		},
		[85] = {
			{ID = 18135, Cost = 518659, Expansion = 99}, -- Fellgrip Jaws
			{ID = 18154, Cost = 521218, Expansion = 99}, -- Savage Ferocity
			{ID = 18160, Cost = 527082, Expansion = 99}, -- Spellbreaker's Aegis
		},
		[86] = {
			{ID = 27104, Cost = 605727, Expansion = 99}, -- Focus of Emiq
			{ID = 27107, Cost = 600883, Expansion = 99}, -- Neivr's Aggression
			{ID = 27110, Cost = 595675, Expansion = 99}, -- Neivr's Protection
			{ID = 25000, Cost = 605412, Expansion = 17}, -- Respite
			{ID = 27113, Cost = 606575, Expansion = 99}, -- Salve of Sevna
			{ID = 27116, Cost = 593013, Expansion = 99}, -- Spinechiller Blood
		},
		[87] = {
			{ID = 27122, Cost = 627322, Expansion = 99}, -- Jorra's Mending
			{ID = 27128, Cost = 620604, Expansion = 99}, -- Shiverback Endemic
			{ID = 27131, Cost = 634942, Expansion = 99}, -- Spiritual Valor
			{ID = 27134, Cost = 627593, Expansion = 99}, -- Wilap's Mending
		},
		[88] = {
			{ID = 27146, Cost = 651945, Expansion = 99}, -- Incomparable Velocity
			{ID = 26728, Cost = 652532, Expansion = 99}, -- Promised Wardmending
			{ID = 27158, Cost = 650852, Expansion = 99}, -- Spectral Rampart
			{ID = 27161, Cost = 662836, Expansion = 99}, -- Spirit of Averc
		},
		[89] = {
			{ID = 27162, Cost = 688569, Expansion = 99}, -- Frozen Venin
			{ID = 27171, Cost = 684989, Expansion = 99}, -- Glacial Lance
			{ID = 27174, Cost = 691670, Expansion = 99}, -- Glacial Roar
			{ID = 27177, Cost = 678883, Expansion = 99}, -- Growl of the Tiger
			{ID = 27183, Cost = 682644, Expansion = 99}, -- Spirit of Kron
			{ID = 27189, Cost = 687485, Expansion = 99}, -- Spiritual Enhancement
		},
		[90] = {
			{ID = 27192, Cost = 709555, Expansion = 99}, -- Callous Ferocity
			{ID = 27195, Cost = 716346, Expansion = 99}, -- Deadlock Jaws
			{ID = 27201, Cost = 712528, Expansion = 99}, -- Kron's Maelstrom
			{ID = 27219, Cost = 717613, Expansion = 99}, -- Rush
			{ID = 27222, Cost = 710039, Expansion = 99}, -- Shout at the Moon
			{ID = 27229, Cost = 723490, Expansion = 99}, -- Spellbreaker's Rampart
			{ID = 27235, Cost = 721839, Expansion = 99}, -- Tuzil's Feralgia
		},
		[91] = {
			{ID = 30265, Cost = 1184918, Expansion = 99}, -- Binaesa Blood
			{ID = 30253, Cost = 1181916, Expansion = 99}, -- Focus of Klar
			{ID = 30256, Cost = 1183886, Expansion = 99}, -- Mea's Aggression
			{ID = 30259, Cost = 1182664, Expansion = 99}, -- Mea's Protection
			{ID = 30247, Cost = 1184078, Expansion = 99}, -- Natural Collaboration
			{ID = 30262, Cost = 1184210, Expansion = 99}, -- Salve of Yubai
		},
		[92] = {
			{ID = 30268, Cost = 1198194, Expansion = 99}, -- Brutal Ferocity
			{ID = 30274, Cost = 1193801, Expansion = 99}, -- Mending of the Izon
			{ID = 30277, Cost = 1197615, Expansion = 99}, -- Silbar's Endemic
			{ID = 30280, Cost = 1196840, Expansion = 99}, -- Spiritual Valiance
			{ID = 30283, Cost = 1195378, Expansion = 99}, -- Yurv's Mending
		},
		[93] = {
			{ID = 30307, Cost = 1210545, Expansion = 99}, -- Beastwood Rampart
			{ID = 30289, Cost = 1210307, Expansion = 99}, -- Empowering Warder
			{ID = 30295, Cost = 1208955, Expansion = 99}, -- Exceptional Velocity
			{ID = 29848, Cost = 1210062, Expansion = 99}, -- Promised Amendment
			{ID = 30304, Cost = 1209327, Expansion = 99}, -- Rotsil's Bite
			{ID = 30310, Cost = 1210390, Expansion = 99}, -- Spirit of Kolos
		},
		[94] = {
			{ID = 30326, Cost = 1219917, Expansion = 99}, -- Frostrift Lance
			{ID = 30329, Cost = 1223517, Expansion = 99}, -- Frostrift Roar
			{ID = 30317, Cost = 1221064, Expansion = 99}, -- Frozen Cyanin
			{ID = 30332, Cost = 1223342, Expansion = 99}, -- Growl of the Lion
			{ID = 30338, Cost = 1224391, Expansion = 99}, -- Spirit of Bale
			{ID = 30344, Cost = 1222039, Expansion = 99}, -- Spiritual Enrichment
		},
		[95] = {
			{ID = 30350, Cost = 1232761, Expansion = 99}, -- Bale's Maelstrom
			{ID = 30371, Cost = 1232777, Expansion = 99}, -- Scream at the Moon
			{ID = 30347, Cost = 1237206, Expansion = 99}, -- Shared Brutal Ferocity
			{ID = 30378, Cost = 1232705, Expansion = 99}, -- Spellbreaker's Armor
		},
	},
	[Class.BERSERKER] = {
		[1] = {
			{ID = 4937, Cost = 20, Expansion = 0}, -- Corroded Axe
			{ID = 5225, Cost = 20, Expansion = 0}, -- Throw Stone
		},
		[5] = {
			{ID = 4938, Cost = 28, Expansion = 0}, -- Blunt Axe
			{ID = 25060, Cost = 28, Expansion = 4}, -- Elbow Strike
		},
		[8] = {
			{ID = 4928, Cost = 55, Expansion = 0}, -- Leg Strike
		},
		[10] = {
			{ID = 4721, Cost = 92, Expansion = 0}, -- Focused Will Discipline
			{ID = 4939, Cost = 92, Expansion = 0}, -- Steel Axe
		},
		[15] = {
			{ID = 4940, Cost = 300, Expansion = 0}, -- Bearded Axe
		},
		[16] = {
			{ID = 4931, Cost = 366, Expansion = 4}, -- Head Strike
		},
		[20] = {
			{ID = 4941, Cost = 778, Expansion = 0}, -- Mithril Axe
		},
		[24] = {
			{ID = 4934, Cost = 1496, Expansion = 4}, -- Divertive Strike
		},
		[25] = {
			{ID = 4942, Cost = 1700, Expansion = 0}, -- Balanced War Axe
		},
		[30] = {
			{ID = 5027, Cost = 3314, Expansion = 4}, -- Battle Cry
			{ID = 4943, Cost = 3334, Expansion = 4}, -- Bonesplicer Axe
			{ID = 4585, Cost = 3332, Expansion = 0}, -- Resistant Discipline
		},
		[32] = {
			{ID = 4929, Cost = 4202, Expansion = 0}, -- Leg Cut
		},
		[35] = {
			{ID = 4944, Cost = 6054, Expansion = 4}, -- Fleshtear Axe
		},
		[40] = {
			{ID = 4945, Cost = 10048, Expansion = 4}, -- Cold Steel Cleaving Axe
			{ID = 4587, Cost = 10043, Expansion = 0}, -- Fearless Discipline
			{ID = 4932, Cost = 10104, Expansion = 4}, -- Head Pummel
		},
		[45] = {
			{ID = 4946, Cost = 15932, Expansion = 4}, -- Mithril Bloodaxe
		},
		[48] = {
			{ID = 4935, Cost = 20694, Expansion = 4}, -- Distracting Strike
		},
		[50] = {
			{ID = 4947, Cost = 24700, Expansion = 99}, -- Rage Axe
			{ID = 5028, Cost = 24530, Expansion = 4}, -- War Cry
		},
		[53] = {
			{ID = 5039, Cost = 34181, Expansion = 4}, -- Inspired Anger Discipline
		},
		[54] = {
			{ID = 5037, Cost = 36582, Expansion = 4}, -- Cleaving Rage Discipline
			{ID = 4930, Cost = 36111, Expansion = 0}, -- Leg Slice
		},
		[55] = {
			{ID = 8924, Cost = 78556, Expansion = 99}, -- Aura of Rage
			{ID = 4948, Cost = 39496, Expansion = 99}, -- Bloodseeker's Axe
		},
		[56] = {
			{ID = 5040, Cost = 42921, Expansion = 4}, -- Reckless Discipline
		},
		[57] = {
			{ID = 5029, Cost = 46210, Expansion = 4}, -- Battle Cry of Dravel
			{ID = 5035, Cost = 46290, Expansion = 4}, -- Focused Fury Discipline
		},
		[58] = {
			{ID = 5041, Cost = 48539, Expansion = 4}, -- Blind Rage Discipline
		},
		[59] = {
			{ID = 5038, Cost = 52319, Expansion = 4}, -- Battle Focus Discipline
		},
		[60] = {
			{ID = 4949, Cost = 57106, Expansion = 99}, -- Battlerage Axe
			{ID = 5034, Cost = 56179, Expansion = 4}, -- Burning Rage Discipline
			{ID = 4933, Cost = 56817, Expansion = 4}, -- Head Crush
		},
		[61] = {
			{ID = 6754, Cost = 0, Expansion = 0}, -- Rage Volley
			{ID = 5044, Cost = 70980, Expansion = 4}, -- Sprint Discipline
		},
		[63] = {
			{ID = 4687, Cost = 80231, Expansion = 0}, -- Healing Will Discipline
			{ID = 5042, Cost = 79788, Expansion = 4}, -- Indomitable Discipline
		},
		[64] = {
			{ID = 5030, Cost = 86609, Expansion = 4}, -- War Cry of Dravel
		},
		[65] = {
			{ID = 5031, Cost = 116594, Expansion = 4}, -- Battle Cry of the Mastruq
			{ID = 5043, Cost = 98605, Expansion = 4}, -- Cleaving Anger Discipline
			{ID = 4936, Cost = 100580, Expansion = 99}, -- Confusing Strike
			{ID = 4950, Cost = 100713, Expansion = 99}, -- Deathfury Axe
			{ID = 5107, Cost = 117268, Expansion = 99}, -- Tainted Axe of Hatred
		},
		[66] = {
			{ID = 6172, Cost = 131571, Expansion = 99}, -- Axe of the Destroyer
			{ID = 6200, Cost = 130501, Expansion = 99}, -- Unpredictable Rage Discipline
		},
		[67] = {
			{ID = 6169, Cost = 141122, Expansion = 99}, -- Crippling Strike
		},
		[68] = {
			{ID = 8003, Cost = 166927, Expansion = 99}, -- Cry Havoc
			{ID = 6170, Cost = 149556, Expansion = 99}, -- Mind Strike
			{ID = 6201, Cost = 148196, Expansion = 99}, -- Unflinching Will Discipline
		},
		[69] = {
			{ID = 6171, Cost = 159028, Expansion = 99}, -- Baffling Strike
			{ID = 6729, Cost = 171813, Expansion = 99}, -- Destroyer's Volley
		},
		[70] = {
			{ID = 8477, Cost = 199275, Expansion = 99}, -- Bloodlust Aura
			{ID = 8476, Cost = 197688, Expansion = 99}, -- Bloodthirst
			{ID = 6199, Cost = 164728, Expansion = 99}, -- Vengeful Flurry Discipline
		},
		[71] = {
			{ID = 10907, Cost = 222056, Expansion = 12}, -- Axe of the Annihilator
			{ID = 10908, Cost = 223000, Expansion = 12}, -- Tendon Cleave
		},
		[72] = {
			{ID = 11913, Cost = 246051, Expansion = 13}, -- Second Wind
			{ID = 11914, Cost = 10000, Expansion = 99}, -- Second Wind Rk. II
			{ID = 11915, Cost = 10000, Expansion = 99}, -- Second Wind Rk. III
			{ID = 10914, Cost = 231894, Expansion = 12}, -- Unsettling Scream
		},
		[73] = {
			{ID = 10917, Cost = 244946, Expansion = 12}, -- Temple Blow
		},
		[74] = {
			{ID = 11928, Cost = 274989, Expansion = 13}, -- Annihilator's Volley
			{ID = 11929, Cost = 10000, Expansion = 99}, -- Annihilator's Volley Rk. II
			{ID = 10920, Cost = 259259, Expansion = 12}, -- Jarring Strike
		},
		[75] = {
			{ID = 10923, Cost = 274545, Expansion = 12}, -- Berserking Discipline
		},
		[76] = {
			{ID = 14176, Cost = 316260, Expansion = 14}, -- Axe of the Decimator
			{ID = 14177, Cost = 315937, Expansion = 14}, -- Tendon Sever
		},
		[77] = {
			{ID = 14180, Cost = 339120, Expansion = 14}, -- Agitating Scream
			{ID = 14192, Cost = 335076, Expansion = 14}, -- Third Wind
		},
		[78] = {
			{ID = 14183, Cost = 353763, Expansion = 14}, -- Temple Strike
		},
		[79] = {
			{ID = 14195, Cost = 367291, Expansion = 99}, -- Decimator's Volley
			{ID = 14196, Cost = 2005376, Expansion = 99}, -- Decimator's Volley Rk. II
			{ID = 14197, Cost = 10135010, Expansion = 99}, -- Decimator's Volley Rk. III
			{ID = 14186, Cost = 374789, Expansion = 14}, -- Jarring Smash
		},
		[80] = {
			{ID = 14198, Cost = 391404, Expansion = 99}, -- Battle Frenzy
			{ID = 14199, Cost = 2028524, Expansion = 99}, -- Battle Frenzy Rk. II
			{ID = 14200, Cost = 12577890, Expansion = 99}, -- Battle Frenzy Rk. III
		},
		[81] = {
			{ID = 18197, Cost = 429576, Expansion = 15}, -- Axe of the Eradicator
			{ID = 16918, Cost = 433328, Expansion = 99}, -- Overpowering Frenzy
			{ID = 18198, Cost = 436249, Expansion = 15}, -- Tendon Shear
		},
		[82] = {
			{ID = 18201, Cost = 451701, Expansion = 15}, -- Distressing Scream
			{ID = 18213, Cost = 449224, Expansion = 15}, -- Fourth Wind
		},
		[83] = {
			{ID = 18210, Cost = 480683, Expansion = 15}, -- Blood Hatchet
			{ID = 18204, Cost = 481131, Expansion = 15}, -- Temple Bash
			{ID = 19753, Cost = 499063, Expansion = 99}, -- Vigorous Axe Throw
		},
		[84] = {
			{ID = 18216, Cost = 496750, Expansion = 99}, -- Eradicator's Volley
			{ID = 18207, Cost = 501487, Expansion = 15}, -- Jarring Clash
		},
		[85] = {
			{ID = 19741, Cost = 543012, Expansion = 99}, -- Axe of Rallos
			{ID = 18219, Cost = 516610, Expansion = 99}, -- Combat Frenzy
			{ID = 18220, Cost = 2016623, Expansion = 99}, -- Combat Frenzy Rk. II
			{ID = 22506, Cost = 553499, Expansion = 99}, -- Shared Bloodlust
		},
		[86] = {
			{ID = 27256, Cost = 600768, Expansion = 17}, -- Axe of the Savage
			{ID = 27257, Cost = 603188, Expansion = 17}, -- Cleaving Acrimony Discipline
			{ID = 27260, Cost = 597254, Expansion = 17}, -- Overwhelming Frenzy
			{ID = 25000, Cost = 605412, Expansion = 17}, -- Respite
			{ID = 27263, Cost = 595832, Expansion = 17}, -- Tendon Lacerate
		},
		[87] = {
			{ID = 27266, Cost = 626565, Expansion = 17}, -- Distracting Scream
			{ID = 25003, Cost = 631864, Expansion = 17}, -- Fifth Wind
			{ID = 27269, Cost = 627560, Expansion = 17}, -- Slap in the Face
		},
		[88] = {
			{ID = 27272, Cost = 664623, Expansion = 17}, -- Blood Axe
			{ID = 27278, Cost = 655896, Expansion = 17}, -- Energetic Axe Throw
			{ID = 27281, Cost = 655909, Expansion = 17}, -- Temple Chop
		},
		[89] = {
			{ID = 27284, Cost = 684639, Expansion = 17}, -- Avenging Flurry Discipline
			{ID = 27290, Cost = 686048, Expansion = 17}, -- Jarring Slam
			{ID = 27287, Cost = 689598, Expansion = 99}, -- Savage Volley
		},
		[90] = {
			{ID = 27293, Cost = 711002, Expansion = 99}, -- Axe of Graster
			{ID = 27308, Cost = 709488, Expansion = 17}, -- Fighting Frenzy
			{ID = 27317, Cost = 710911, Expansion = 17}, -- Shared Brutality
		},
		[91] = {
			{ID = 30402, Cost = 1183792, Expansion = 99}, -- Axe of the Sunderer
			{ID = 30409, Cost = 1181450, Expansion = 99}, -- Conquering Frenzy
			{ID = 30412, Cost = 1183042, Expansion = 99}, -- Tendon Slash
		},
		[92] = {
			{ID = 30415, Cost = 1193667, Expansion = 99}, -- Perturbing Scream
			{ID = 28003, Cost = 1194317, Expansion = 99}, -- Sixth Wind
		},
		[93] = {
			{ID = 30421, Cost = 1208554, Expansion = 99}, -- Blood Blade
			{ID = 30427, Cost = 1208647, Expansion = 99}, -- Spirited Axe Throw
		},
	},
}

return autoscribe_db
