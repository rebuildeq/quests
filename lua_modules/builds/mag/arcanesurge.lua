local skill = {}

local spell_levels = {}
spell_levels[100] = 15
spell_levels[101] = 20
spell_levels[102] = 20
spell_levels[103] = 29
spell_levels[104] = 35
spell_levels[105] = 37
spell_levels[106] = 29
spell_levels[10684] = 71
spell_levels[10688] = 74
spell_levels[10692] = 71
spell_levels[10695] = 71
spell_levels[10696] = 71
spell_levels[107] = 47
spell_levels[10700] = 72
spell_levels[10702] = 71
spell_levels[10704] = 73
spell_levels[10705] = 72
spell_levels[10708] = 72
spell_levels[10710] = 71
spell_levels[10712] = 72
spell_levels[10715] = 71
spell_levels[10716] = 72
spell_levels[10719] = 73
spell_levels[10720] = 73
spell_levels[10726] = 73
spell_levels[10729] = 71
spell_levels[10731] = 71
spell_levels[10732] = 73
spell_levels[10735] = 73
spell_levels[10736] = 73
spell_levels[10737] = 73
spell_levels[10738] = 73
spell_levels[10741] = 74
spell_levels[10747] = 74
spell_levels[10750] = 74
spell_levels[10753] = 74
spell_levels[10754] = 75
spell_levels[10757] = 75
spell_levels[10763] = 75
spell_levels[10766] = 75
spell_levels[10769] = 75
spell_levels[108] = 19
spell_levels[109] = 41
spell_levels[110] = 22
spell_levels[111] = 44
spell_levels[112] = 51
spell_levels[113] = 23
spell_levels[114] = 41
spell_levels[115] = 25
spell_levels[116] = 48
spell_levels[11816] = 72
spell_levels[11825] = 75
spell_levels[11827] = 75
spell_levels[120] = 31
spell_levels[121] = 35
spell_levels[122] = 39
spell_levels[1284] = 59
spell_levels[1285] = 36
spell_levels[1286] = 27
spell_levels[1394] = 60
spell_levels[1400] = 30
spell_levels[1401] = 31
spell_levels[1402] = 50
spell_levels[1403] = 43
spell_levels[1404] = 60
spell_levels[1405] = 55
spell_levels[14108] = 78
spell_levels[14109] = 78
spell_levels[14454] = 78
spell_levels[14659] = 76
spell_levels[14662] = 76
spell_levels[14665] = 79
spell_levels[14668] = 76
spell_levels[14671] = 76
spell_levels[14672] = 76
spell_levels[14675] = 77
spell_levels[14679] = 76
spell_levels[14680] = 78
spell_levels[14681] = 77
spell_levels[14684] = 77
spell_levels[14686] = 77
spell_levels[14689] = 76
spell_levels[14690] = 77
spell_levels[14693] = 78
spell_levels[14694] = 78
spell_levels[14697] = 78
spell_levels[14700] = 76
spell_levels[14703] = 78
spell_levels[14706] = 78
spell_levels[14715] = 79
spell_levels[14718] = 79
spell_levels[1472] = 55
spell_levels[14721] = 79
spell_levels[14722] = 80
spell_levels[14723] = 80
spell_levels[14724] = 80
spell_levels[14725] = 80
spell_levels[14731] = 80
spell_levels[14732] = 80
spell_levels[14734] = 80
spell_levels[14737] = 80
spell_levels[14738] = 77
spell_levels[14741] = 79
spell_levels[14747] = 80
spell_levels[14748] = 80
spell_levels[14749] = 80
spell_levels[14753] = 78
spell_levels[14772] = 77
spell_levels[14773] = 77
spell_levels[14774] = 77
spell_levels[14778] = 79
spell_levels[14779] = 79
spell_levels[14904] = 79
spell_levels[1503] = 44
spell_levels[1504] = 7
spell_levels[1505] = 18
spell_levels[1526] = 53
spell_levels[1529] = 56
spell_levels[1531] = 60
spell_levels[15505] = 77
spell_levels[1577] = 58
spell_levels[1610] = 54
spell_levels[1659] = 51
spell_levels[1660] = 52
spell_levels[1661] = 54
spell_levels[1662] = 55
spell_levels[1663] = 57
spell_levels[1664] = 59
spell_levels[1665] = 59
spell_levels[1666] = 52
spell_levels[1667] = 56
spell_levels[1668] = 53
spell_levels[1669] = 60
spell_levels[1670] = 58
spell_levels[1671] = 51
spell_levels[1672] = 54
spell_levels[1673] = 52
spell_levels[1674] = 53
spell_levels[1675] = 57
spell_levels[1676] = 60
spell_levels[1677] = 58
spell_levels[1678] = 59
spell_levels[1679] = 56
spell_levels[1680] = 51
spell_levels[1681] = 52
spell_levels[1682] = 53
spell_levels[1683] = 54
spell_levels[1684] = 55
spell_levels[1685] = 56
spell_levels[1720] = 57
spell_levels[1770] = 55
spell_levels[1771] = 55
spell_levels[1772] = 60
spell_levels[18121] = 83
spell_levels[18558] = 81
spell_levels[18726] = 81
spell_levels[18729] = 81
spell_levels[18732] = 84
spell_levels[18738] = 81
spell_levels[18739] = 81
spell_levels[18742] = 82
spell_levels[18747] = 83
spell_levels[18748] = 82
spell_levels[18751] = 82
spell_levels[18753] = 82
spell_levels[18756] = 81
spell_levels[18757] = 82
spell_levels[18760] = 83
spell_levels[18761] = 83
spell_levels[18764] = 83
spell_levels[18767] = 81
spell_levels[18770] = 83
spell_levels[18773] = 83
spell_levels[18782] = 84
spell_levels[18785] = 84
spell_levels[18788] = 84
spell_levels[18789] = 85
spell_levels[18792] = 85
spell_levels[18798] = 85
spell_levels[18801] = 85
spell_levels[18811] = 82
spell_levels[18814] = 84
spell_levels[18848] = 84
spell_levels[18854] = 84
spell_levels[18883] = 85
spell_levels[189] = 22
spell_levels[205] = 1
spell_levels[211] = 1
spell_levels[2230] = 2
spell_levels[2231] = 21
spell_levels[2232] = 50
spell_levels[2233] = 8
spell_levels[2234] = 27
spell_levels[2235] = 51
spell_levels[2236] = 20
spell_levels[2237] = 42
spell_levels[2238] = 54
spell_levels[2239] = 16
spell_levels[2240] = 37
spell_levels[2241] = 53
spell_levels[2242] = 10
spell_levels[2243] = 30
spell_levels[2244] = 52
spell_levels[232] = 3
spell_levels[246] = 5
spell_levels[248] = 9
spell_levels[2531] = 11
spell_levels[2532] = 17
spell_levels[2533] = 25
spell_levels[2534] = 38
spell_levels[2535] = 48
spell_levels[2536] = 52
spell_levels[2537] = 54
spell_levels[2538] = 56
spell_levels[2539] = 58
spell_levels[2540] = 60
spell_levels[25707] = 88
spell_levels[26173] = 86
spell_levels[26333] = 86
spell_levels[26728] = 88
spell_levels[26734] = 86
spell_levels[26737] = 86
spell_levels[26740] = 86
spell_levels[26741] = 86
spell_levels[26744] = 86
spell_levels[26745] = 86
spell_levels[26747] = 86
spell_levels[26749] = 86
spell_levels[26752] = 87
spell_levels[26755] = 87
spell_levels[26758] = 87
spell_levels[26761] = 87
spell_levels[26762] = 87
spell_levels[26763] = 87
spell_levels[26766] = 87
spell_levels[26769] = 87
spell_levels[26772] = 87
spell_levels[26776] = 88
spell_levels[26779] = 88
spell_levels[26782] = 88
spell_levels[26785] = 88
spell_levels[26786] = 88
spell_levels[26793] = 88
spell_levels[26796] = 88
spell_levels[26799] = 89
spell_levels[26800] = 89
spell_levels[26806] = 89
spell_levels[26812] = 89
spell_levels[26815] = 89
spell_levels[26821] = 89
spell_levels[26827] = 89
spell_levels[26829] = 89
spell_levels[26832] = 89
spell_levels[26835] = 90
spell_levels[26838] = 90
spell_levels[26841] = 90
spell_levels[26844] = 90
spell_levels[26847] = 90
spell_levels[26850] = 90
spell_levels[26856] = 90
spell_levels[26859] = 90
spell_levels[26865] = 90
spell_levels[2879] = 54
spell_levels[288] = 1
spell_levels[2896] = 60
spell_levels[29276] = 91
spell_levels[29445] = 91
spell_levels[29848] = 93
spell_levels[29854] = 91
spell_levels[29857] = 91
spell_levels[29860] = 91
spell_levels[29861] = 91
spell_levels[29864] = 91
spell_levels[29866] = 91
spell_levels[29868] = 91
spell_levels[29873] = 92
spell_levels[29879] = 92
spell_levels[29882] = 92
spell_levels[29883] = 92
spell_levels[29885] = 92
spell_levels[29888] = 92
spell_levels[29894] = 92
spell_levels[29901] = 93
spell_levels[29904] = 93
spell_levels[29907] = 93
spell_levels[29908] = 93
spell_levels[29915] = 93
spell_levels[29918] = 93
spell_levels[29924] = 93
spell_levels[29927] = 94
spell_levels[29949] = 94
spell_levels[29961] = 94
spell_levels[29969] = 95
spell_levels[3031] = 62
spell_levels[3040] = 61
spell_levels[3041] = 61
spell_levels[3042] = 62
spell_levels[3043] = 63
spell_levels[3044] = 64
spell_levels[3045] = 62
spell_levels[305] = 13
spell_levels[309] = 16
spell_levels[310] = 1
spell_levels[311] = 1
spell_levels[313] = 1
spell_levels[315] = 2
spell_levels[316] = 3
spell_levels[317] = 4
spell_levels[318] = 2
spell_levels[3188] = 56
spell_levels[319] = 9
spell_levels[3198] = 61
spell_levels[320] = 15
spell_levels[3205] = 61
spell_levels[3206] = 61
spell_levels[3207] = 61
spell_levels[3208] = 61
spell_levels[3209] = 61
spell_levels[321] = 3
spell_levels[3210] = 63
spell_levels[322] = 5
spell_levels[323] = 6
spell_levels[3237] = 62
spell_levels[3238] = 64
spell_levels[3239] = 64
spell_levels[324] = 7
spell_levels[325] = 6
spell_levels[327] = 11
spell_levels[328] = 12
spell_levels[330] = 10
spell_levels[3300] = 61
spell_levels[3302] = 64
spell_levels[331] = 1
spell_levels[3317] = 61
spell_levels[3318] = 61
spell_levels[3319] = 62
spell_levels[332] = 7
spell_levels[3320] = 62
spell_levels[3321] = 63
spell_levels[3322] = 63
spell_levels[3323] = 64
spell_levels[3324] = 65
spell_levels[3325] = 65
spell_levels[3329] = 61
spell_levels[333] = 13
spell_levels[334] = 15
spell_levels[335] = 17
spell_levels[3352] = 62
spell_levels[3353] = 64
spell_levels[3356] = 65
spell_levels[3357] = 65
spell_levels[336] = 14
spell_levels[3387] = 63
spell_levels[3483] = 63
spell_levels[3484] = 65
spell_levels[3486] = 63
spell_levels[35] = 12
spell_levels[3582] = 54
spell_levels[3583] = 19
spell_levels[3584] = 34
spell_levels[36] = 4
spell_levels[3699] = 44
spell_levels[3700] = 52
spell_levels[395] = 15
spell_levels[396] = 16
spell_levels[397] = 9
spell_levels[398] = 6
spell_levels[399] = 7
spell_levels[4] = 17
spell_levels[400] = 8
spell_levels[401] = 13
spell_levels[4011] = 54
spell_levels[402] = 10
spell_levels[4027] = 20
spell_levels[4028] = 44
spell_levels[4029] = 54
spell_levels[403] = 11
spell_levels[4030] = 61
spell_levels[404] = 12
spell_levels[4078] = 60
spell_levels[4079] = 46
spell_levels[4080] = 58
spell_levels[4081] = 64
spell_levels[4082] = 42
spell_levels[409] = 26
spell_levels[4099] = 42
spell_levels[410] = 49
spell_levels[4100] = 58
spell_levels[411] = 19
spell_levels[4110] = 62
spell_levels[412] = 45
spell_levels[42] = 8
spell_levels[4255] = 13
spell_levels[4256] = 23
spell_levels[4257] = 33
spell_levels[4267] = 14
spell_levels[4268] = 24
spell_levels[4269] = 34
spell_levels[4279] = 14
spell_levels[4280] = 24
spell_levels[4281] = 34
spell_levels[479] = 28
spell_levels[48] = 10
spell_levels[4886] = 65
spell_levels[4887] = 65
spell_levels[4888] = 65
spell_levels[49] = 32
spell_levels[496] = 21
spell_levels[497] = 18
spell_levels[498] = 19
spell_levels[50] = 1
spell_levels[5133] = 54
spell_levels[5464] = 66
spell_levels[5465] = 67
spell_levels[5466] = 66
spell_levels[5467] = 66
spell_levels[5468] = 66
spell_levels[5469] = 66
spell_levels[5470] = 66
spell_levels[5471] = 66
spell_levels[5472] = 66
spell_levels[5473] = 66
spell_levels[5474] = 66
spell_levels[5475] = 66
spell_levels[5476] = 68
spell_levels[5477] = 67
spell_levels[5478] = 69
spell_levels[5479] = 67
spell_levels[5480] = 67
spell_levels[5481] = 69
spell_levels[5483] = 68
spell_levels[5484] = 68
spell_levels[5485] = 68
spell_levels[5486] = 67
spell_levels[5488] = 70
spell_levels[5489] = 67
spell_levels[5490] = 69
spell_levels[5492] = 68
spell_levels[5493] = 70
spell_levels[5494] = 69
spell_levels[5495] = 70
spell_levels[5496] = 70
spell_levels[5497] = 70
spell_levels[55] = 21
spell_levels[56] = 22
spell_levels[569] = 25
spell_levels[570] = 22
spell_levels[571] = 23
spell_levels[572] = 24
spell_levels[573] = 29
spell_levels[574] = 26
spell_levels[575] = 27
spell_levels[576] = 28
spell_levels[58] = 5
spell_levels[613] = 8
spell_levels[614] = 14
spell_levels[615] = 24
spell_levels[616] = 33
spell_levels[617] = 26
spell_levels[618] = 30
spell_levels[621] = 31
spell_levels[622] = 32
spell_levels[623] = 33
spell_levels[624] = 39
spell_levels[625] = 36
spell_levels[626] = 37
spell_levels[627] = 38
spell_levels[628] = 44
spell_levels[629] = 41
spell_levels[630] = 42
spell_levels[631] = 43
spell_levels[632] = 46
spell_levels[633] = 49
spell_levels[634] = 47
spell_levels[635] = 48
spell_levels[66] = 32
spell_levels[663] = 18
spell_levels[664] = 28
spell_levels[6670] = 69
spell_levels[67] = 43
spell_levels[6738] = 61
spell_levels[68] = 18
spell_levels[680] = 38
spell_levels[69] = 33
spell_levels[70] = 47
spell_levels[7674] = 16
spell_levels[7675] = 16
spell_levels[7676] = 16
spell_levels[7677] = 20
spell_levels[7678] = 30
spell_levels[7679] = 40
spell_levels[7680] = 50
spell_levels[7681] = 55
spell_levels[7682] = 60
spell_levels[7683] = 65
spell_levels[7684] = 70
spell_levels[7685] = 75
spell_levels[7686] = 80
spell_levels[7687] = 7688
spell_levels[7689] = 20
spell_levels[7690] = 65
spell_levels[7691] = 620
spell_levels[7692] = 44
spell_levels[7693] = 54
spell_levels[7694] = 59
spell_levels[7695] = 64
spell_levels[7696] = 5491
spell_levels[7697] = 11819
spell_levels[7698] = 79
spell_levels[80] = 16
spell_levels[8037] = 70
spell_levels[8038] = 68
spell_levels[8040] = 69
spell_levels[81] = 25
spell_levels[82] = 41
spell_levels[83] = 17
spell_levels[8515] = 70
spell_levels[8517] = 70
spell_levels[8518] = 70
spell_levels[8933] = 55
spell_levels[93] = 1
spell_levels[94] = 4
spell_levels[9980] = 71

local rb = require('rb')

---@param e ModCommonDamage
---@param origin Client # Person who owns the build skill triggering this event
---@param attacker Mob # Mob who is instigating/casting/attacking
---@param defender Mob # Mob who is defender/target of spell/receiving
---@param rank integer -- the rank of the skill
function skill.CommonDamage(e, origin, attacker, defender, rank)
	if origin:GetID() ~= attacker:GetID() then
		return e
	end
	if not attacker:IsClient() then
		return e
	end

	local spell = eq.get_spell(e.spell_id)
	if spell == nil then
		-- only spells valid
		return e
	end

	if spell:AoeRange() > 0 then
		-- aoe spells are not supported
		return e
	end

	if spell:Mana() == 0 then
		-- only spells that cost mana
		return e
	end

	if spell:BuffDuration() > 0 then
		-- only instant spells
		return e
	end

	if e.value < 1 then
		-- only spells that deal damage
		return e
	end

	local my_level = e.self:GetLevel()


	local spell_level = 0 -- TODO: Get spell level of spell? May need to get all wiz spells add them manuattacker

	if spell_levels[spell:ID()] == nil then
		-- only spells that are in the list
		return e
	end

	spell_level = spell_levels[spell:ID()]

	if spell_level < (my_level-10) then
		-- only spells within 10 levels of the player
		return e
	end

	local surge_cooldown = tonumber(attacker:GetBucket("surge_cooldown"))
	if surge_cooldown == nil then
		surge_cooldown = 0
	end
	local next_cooldown = os.time() + 10

	if surge_cooldown > os.time() then
		-- still on cooldown
		return e
	end

	attacker:SetBucket("surge_cooldown", string.format("%d", next_cooldown))

	local damage = attacker:GetLevel() * (rank * 3)
	rb.Debug(attacker, string.format("Arcane Surge (%d) dealt %d damage to %s.", rank, damage, defender:GetCleanName()))
	defender:Damage(origin, damage, spell:ID(), 0)
	return e
end

return skill
