local guildmaster = {}

-- Continents for teleporting dialogues
continents = {}
continents["Antonica"] = 0
continents["Faydwer"] = 0
continents["Odus"] = 0
continents["Planar"] = 0
if (eq.is_the_ruins_of_kunark_enabled()) then
    continents["Kunark"] = 0 -- Kunark Only
end
if (eq.is_the_scars_of_velious_enabled()) then
    continents["Velious"] = 0 -- Velious Only
end
if (eq.is_the_shadows_of_luclin_enabled) then
    continents["Luclin"] = 0 -- Luclin Only
end
if (eq.is_gates_of_discord_enabled()) then
    continents["Gates of Discord"] = 0 -- Gates of Discord Only
end
if (eq.is_omens_of_war_enabled()) then
    continents["Omens of War"] = 0 -- Omens of War Only
end
if (eq.is_depths_of_darkhollow_enabled()) then
    continents["Depths of Darkhollow"] = 0 -- Depths of Darkhollow Only
end
if (eq.is_prophecy_of_ro_enabled()) then
    continents["Prophecy of Ro"] = 0 -- Prophecy of Ro Only
end
if (eq.is_the_serpents_spine_enabled()) then
    continents["The Serpent's Spine"] = 0 -- The Serpent's Spine Only
end
if (eq.is_the_buried_sea_enabled()) then
    continents["The Buried Sea"] = 0 -- The Buried Sea Only
end
if (eq.is_secrets_of_faydwer_enabled()) then
    continents["Secrets of Faydwer"] = 0 -- Secrets of Faydwer Only
end
if (eq.is_house_of_thule_enabled()) then
    continents["House of Thule"] = 0 -- House of Thule Only
end
if (eq.is_underfoot_enabled()) then
    continents["Underfoot"] = 0 -- Underfoot Only
end
if (eq.is_veil_of_alaris_enabled()) then
    continents["Veil of Alaris"] = 0 -- Veil of Alaris Only
end

---@param e NPCEventSay
function guildmaster.OnSay(e)
    local mob_class = e.self:GetClass()

    if (mob_class == Class.CLERICGM) then guildmaster.OnSayCleric(e)
    elseif (mob_class == Class.DRUIDGM) then guildmaster.OnSayDruid(e)
    elseif (mob_class == Class.SHAMANGM) then guildmaster.OnSayShaman(e)
    elseif (mob_class == Class.WIZARDGM) then guildmaster.OnSayWizard(e)
    elseif (mob_class == Class.ENCHANTERGM) then guildmaster.OnSayEnchanter(e)
    elseif (e.self:GetNPCTypeID() == 345004) then guildmaster.OnSayWizard(e) -- porter in guildhall
    elseif (eq.get_zone_id() == Zone.guildlobby and e.self:GetCleanName():find("Guardian")) then guildmaster.OnSayWizard(e) -- guards in guildlobby
    end
end

---@param client Client
function guildmaster.BuffCalculateCost(client)
    local level = client:GetLevel()
    -- If the player is less than or equal to level 10, don't charge the player anything
    if level <= 10 then
        return 0
    end

    if level <= 20 then
        return level*5
    end

    if level <= 30 then
        return level*6
    end

    if level <= 40 then
        return level*7
    end

    if level <= 50 then
        return level*8
    end

    if level <= 60 then
        return level*9
    end

    -- Otherwise, charge the player 10pp per level. 11 = 55pp, 60 = 600pp
    return (level*10)
end

---@param client Client
function guildmaster.BuffTakeMoney(client)
    local plat = guildmaster.BuffCalculateCost(client)
    local copper = 1000 * guildmaster.BuffCalculateCost(client)

    local result = client:TakeMoneyFromPP(copper, true)
    if result then
        client:Message(15, plat .. " platinum pieces have been removed from your inventory")
    end

    return result
end


---@param client Client
function guildmaster.PortCalculateCost(client)
    local level = client:GetLevel()
    -- If the player is less than or equal to level 10, don't charge the player anything
    if level <= 10 then
        return 0
    end

    if level <= 20 then
        return level*10
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
function guildmaster.PortTakeMoney(client)
    local plat = guildmaster.PortCalculateCost(client)
    local copper = 1000 * guildmaster.PortCalculateCost(client)

    local result = client:TakeMoneyFromPP(copper, true)
    if result then
        client:Message(15, plat .. " platinum pieces have been removed from your inventory")
    end

    return result
end


---@param e NPCEventSay
function guildmaster.OnSayCleric(e)
    if (e.message:findi("buffs")) then
        if (guildmaster.BuffTakeMoney(e.other) ~= true) then
            e.other:Message(MT.Say, "I'm sorry, I cannot buff you unless you have sufficient money.")
            return
        end
        -- HP
        --  1 - Courage [202]
        --  9 - Center [219]
        --  19 - Daring [89]
        --  24 - Bravery [244]
        --  34 - Valor [312]
        --  44 - Resolution [314]
        --  52 - Heroism [1533]
        --  60 - Aegolism [1447]
        if (eq.is_the_scars_of_velious_enabled() and e.other:GetLevel() >= 60) then -- Velious only
            eq.SelfCast(1447)
        elseif e.other:GetLevel() >= 52 then
            eq.SelfCast(1533)
        elseif e.other:GetLevel() >= 44 then
            eq.SelfCast(314)
        elseif e.other:GetLevel() >= 34 then
            eq.SelfCast(312)
        elseif e.other:GetLevel() >= 24 then
            eq.SelfCast(244)
        elseif e.other:GetLevel() >= 19 then
            eq.SelfCast(89)
        elseif e.other:GetLevel() >= 9 then
            eq.SelfCast(219)
        else
            eq.SelfCast(202)
        end
        -- AC
        --  5 - Holy Armor [11]
        --  19 - Spirit Armor [368]
        --  29 - Guard [18]
        --  39 - Armor of Faith [19]
        --  49 - Shield of Words [20]
        --  57 - Bulwark of Faith [1537]
        if e.other:GetLevel() >= 57 then
            eq.SelfCast(1537)
        elseif e.other:GetLevel() >= 49 then
            eq.SelfCast(20)
        elseif e.other:GetLevel() >= 39 then
            eq.SelfCast(19)
        elseif e.other:GetLevel() >= 29 then
            eq.SelfCast(18)
        elseif e.other:GetLevel() >= 19 then
            eq.SelfCast(368)
        elseif e.other:GetLevel() >= 5 then
            eq.SelfCast(11)
        end
        -- Symbol
        --  14 - Symbol of Transal [485]
        --  24 - Symbol of Ryltan [486]
        --  34 - Symbol of Pinzarn [487]
        --  44 - Symbol of Naltron [488]
        --  54 - Symbol of Marzin [1535]
        if e.other:GetLevel() >= 54 then
            eq.SelfCast(1535)
        elseif e.other:GetLevel() >= 44 then
            eq.SelfCast(488)
        elseif e.other:GetLevel() >= 34 then
            eq.SelfCast(487)
        elseif e.other:GetLevel() >= 24 then
            eq.SelfCast(486)
        elseif e.other:GetLevel() >= 14 then
            eq.SelfCast(485)
        end
        -- CR
        --  14 - Endure Cold [225]
        --  39 - Resist Cold [61]
        if e.other:GetLevel() >= 39 then
            eq.SelfCast(61)
        elseif e.other:GetLevel() >= 14 then
            eq.SelfCast(225)
        end
        -- FR
        --  9 - Endure Fire [224]
        --  34 - Resist Fire [60]
        if e.other:GetLevel() >= 34 then
            eq.SelfCast(60)
        elseif e.other:GetLevel() >= 9 then
            eq.SelfCast(224)
        end
        -- DR
        --  14 - Endure Disease [226]
        --  39 - Resist Disease [63]
        if e.other:GetLevel() >= 39 then
            eq.SelfCast(63)
        elseif e.other:GetLevel() >= 14 then
            eq.SelfCast(226)
        end
        -- PR
        --  9 - Endure Poison [227]
        --  34 - Resist Poison [62]
        if e.other:GetLevel() >= 34 then
            eq.SelfCast(62)
        elseif e.other:GetLevel() >= 9 then
            eq.SelfCast(227)
        end
        -- MR
        --  19 - Endure Magic [228]
        --  44 - Resist Magic [64]
        if e.other:GetLevel() >= 44 then
            eq.SelfCast(64)
        elseif e.other:GetLevel() >= 19 then
            eq.SelfCast(228)
        end
    elseif (e.message:findi("bind")) then
		e.other:Message(MT.Say, "Binding your soul. You will return here when you die.");
		e.self:CastSpell(2049,e.other:GetID(),0,1); -- Spell: Bind Affinity
    else
        local plat = guildmaster.BuffCalculateCost(e.other)
        if plat > 0 then
            e.other:Message(MT.Say, "As a cleric guildmaster, for a fee of " .. plat .. " platinum pieces, I can provide you with [" .. eq.say_link("buffs", true) .. "] to assist you in your adventures.")
        else
            e.other:Message(MT.Say, "As a cleric guildmaster, for no fee, I can provide you with [" .. eq.say_link("buffs", true) .. "] to assist you in your adventures.")
        end
    end
end

---@param e NPCEventSay
function guildmaster.OnSayDruid(e)
    local antonica_zones = {}
    antonica_zones["Lavastorm Mountains"] = 534
    antonica_zones["Misty Thicket"] = 538
    antonica_zones["North Karana"] = 530
    antonica_zones["South Ro"] = 535
    if (eq.is_the_scars_of_velious_enabled()) then
        antonica_zones["Surefall Glade"] = 2021 -- Velious Only
    end
    antonica_zones["The Feerott"] = 536
    antonica_zones["Western Commonlands"] = 531
    local faydwer_zones = {}
    faydwer_zones["Butcherblock Mountains"] = 532
    faydwer_zones["Steamfont Mountains"] = 537
    faydwer_zones["Surefall Glade"] = 2021
    local odus_zones = {}
    odus_zones["Toxxulia Forest"] = 533
    local kunark_zones = {} -- Kunark Only
    local planar_zones = {}
    if (eq.is_the_ruins_of_kunark_enabled()) then
        kunark_zones["Dreadlands"] = 1326
        kunark_zones["Emerald Jungle"] = 1737
        kunark_zones["Skyfire Mountains"] = 1736
    end
    local velious_zones = {} -- Velious Only
    if (eq.is_the_scars_of_velious_enabled()) then
        velious_zones["Cobalt Scar"] = 2031
        velious_zones["Iceclad Ocean"] = 1433
        velious_zones["The Great Divide"] = 2029
        velious_zones["Wakening Lands"] = 2030
    end
    local luclin_zones = {} -- Luclin Only
    if (eq.is_the_shadows_of_luclin_enabled()) then
        luclin_zones["Grimling Forest"] = 2417
        luclin_zones["Twilight Sea"] = 2422
        luclin_zones["Dawnshroud Peaks"] = 2427
        luclin_zones["Nexus"] = 2433
    end
    if (eq.is_the_planes_of_power_enabled()) then
        planar_zones["Plane of Knowledge"] = 3182
    end
    local god_zones = {} -- Gates of Discord Only
    if (eq.is_gates_of_discord_enabled()) then
        god_zones["Natimbi"] = 4967
        god_zones["Barindu"] = 5733
    end
    local oow_zones = {} -- Omens of War Only
    if (eq.is_omens_of_war_enabled()) then
        oow_zones["Wall of Slaughter"] = 6180
        oow_zones["Bloodfields"] = 6185
    end

    local dodh_zones = {} -- Depths of Darkhollow Only
    if (eq.is_depths_of_darkhollow_enabled()) then
        dodh_zones["Undershore"] = 8237
    end

    local por_zones = {} -- Prophecy of Ro Only
    if (eq.is_prophecy_of_ro_enabled()) then
        por_zones["Arcstone"] = 8967
    end

    local tss_zones = {} -- The Serpent's Spine Only
    if (eq.is_the_serpents_spine_enabled()) then
        tss_zones["Direwind"] = 9952
        tss_zones["Steppes"] = 9955
        tss_zones["Blightfire"] = 9958
    end

    local tbs_zones = {} -- The Buried Sea Only
    if (eq.is_the_buried_sea_enabled()) then
        tbs_zones["Buried Sea"] = 11982
    end

    local sof_zones = {} -- Secrets of Faydwer Only
    if (eq.is_secrets_of_faydwer_enabled()) then
        sof_zones["Loping Plains"] = 15888
    end

    local hot_zones = {} -- House of Thule Only
    if (eq.is_house_of_thule_enabled()) then
        hot_zones["The Grounds"] = 17882
    end

    local uf_zones = {} -- Underfoot Only
    if (eq.is_underfoot_enabled()) then
        uf_zones["Brell's Rest"] = 21986
    end

    local voa_zones = {} -- Veil of Alaris Only
    if (eq.is_veil_of_alaris_enabled()) then
        voa_zones["Beast's Domain"] = 28996
        voa_zones["Pillars of Alra"] = 28999
    end

    if (e.message:findi("buffs")) then
        if (guildmaster.BuffTakeMoney(e.other) ~= true) then
            e.other:Message(MT.Say, "I'm sorry, I cannot buff you unless you have sufficient money.")
            return
        end
        -- HP Type 1
        --  1 - Skin Like Wood  [26]
        --  14 - Skin Like Rock [263]
        --  24 - Skin Like Steel [421]
        --  39 - Skin Like Diamond [422]
        --  49 - Skin Like Nature [423]
        --  57 - Natureskin [1559]
        --  60 - Protection of the Glades [1442] -- Velious Only
        if (eq.is_the_scars_of_velious_enabled() and e.other:GetLevel() >= 60) then -- Velious Only
            eq.SelfCast(1442)
        elseif e.other:GetLevel() >= 57 then
            eq.SelfCast(1559)
        elseif e.other:GetLevel() >= 49 then
            eq.SelfCast(423)
        elseif e.other:GetLevel() >= 39 then
            eq.SelfCast(422)
        elseif e.other:GetLevel() >= 24 then
            eq.SelfCast(421)
        elseif e.other:GetLevel() >= 14 then
            eq.SelfCast(263)
        else
            eq.SelfCast(26)
        end
        -- STR
        --  9 - Strength of Earth [268]
        --  34 - Strength of Stone [429]
        --  44 - Storm Strength [430]
        --  55 - Girdle of Karana [1557]
        if e.other:GetLevel() >= 55 then
            eq.SelfCast(1557)
        elseif e.other:GetLevel() >= 44 then
            eq.SelfCast(430)
        elseif e.other:GetLevel() >= 34 then
            eq.SelfCast(429)
        elseif e.other:GetLevel() >= 9 then
            eq.SelfCast(268)
        end
        -- Regen
        --  34 - Regeneration [144]
        --  44 - Chloroplast [145]
        --  54 - Regrowth [1568]
        if e.other:GetLevel() >= 54 then
            eq.SelfCast(1568)
        elseif e.other:GetLevel() >= 44 then
            eq.SelfCast(145)
        elseif e.other:GetLevel() >= 34 then
            eq.SelfCast(144)
        end
        -- Damage Shield
        --  9 - Shield of Thistles [256]
        --  19 - Shield of Barbs [273]
        --  29 - Shield of Brambles [129]
        --  39 - Shield of Spikes [432]
        --  49 - Shield of Thorns [356]
        --  58 - Shield of Blades [1560]
        if e.other:GetLevel() >= 58 then
            eq.SelfCast(1560)
        elseif e.other:GetLevel() >= 49 then
            eq.SelfCast(356)
        elseif e.other:GetLevel() >= 39 then
            eq.SelfCast(432)
        elseif e.other:GetLevel() >= 29 then
            eq.SelfCast(129)
        elseif e.other:GetLevel() >= 19 then
            eq.SelfCast(273)
        elseif e.other:GetLevel() >= 9 then
            eq.SelfCast(256)
        end
        -- SoW
        --  14 - Spirit of Wolf [278]
        if e.other:GetLevel() >= 14 then
            eq.SelfCast(278)
        -- CR
        --  9 - Endure Cold [225]
        --  34 - Resist Cold [61]
        if e.other:GetLevel() >= 34 then
            eq.SelfCast(61)
        elseif e.other:GetLevel() >= 9 then
            eq.SelfCast(225)
        end
        -- FR
        --  1 - Endure Fire [224]
        --  24 - Resist Fire [60]
        if e.other:GetLevel() >= 24 then
            eq.SelfCast(60)
        else
            eq.SelfCast(224)
        end
        -- DR
        --  19 - Endure Disease [226]
        --  44 - Resist Disease [63]
        if e.other:GetLevel() >= 44 then
            eq.SelfCast(63)
        elseif e.other:GetLevel() >= 19 then
            eq.SelfCast(226)
        end
        -- PR
        --  19 - Endure Poison [227]
        --  44 - Resist Poison [62]
        if e.other:GetLevel() >= 44 then
            eq.SelfCast(62)
        elseif e.other:GetLevel() >= 19 then
            eq.SelfCast(227)
        end
        -- MR
        --  34 - Endure Magic [228]
        --  49 - Resist Magic [64]
        if e.other:GetLevel() >= 49 then
            eq.SelfCast(64)
        elseif e.other:GetLevel() >= 34 then
            eq.SelfCast(228)
        end
    end
    elseif (e.message:findi("teleport")) then
        e.other:Message(MT.Say, "I can teleport you to the following continents: " .. guildmaster.BuildSayLinks(continents))
    elseif (e.message:findi("antonica")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(antonica_zones))
    elseif (e.message:findi("faydwer")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(faydwer_zones))
    elseif (e.message:findi("odus")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(odus_zones))
    elseif (e.message:findi("planar")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(planar_zones))
    elseif (e.message:findi("kunark")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(kunark_zones))
    elseif (e.message:findi("velious")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(velious_zones))
    elseif (e.message:findi("luclin")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(luclin_zones))
    elseif (e.message:findi("gates")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(god_zones))
    elseif (e.message:findi("omens")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(oow_zones))
    elseif (e.message:findi("depths")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(dodh_zones))
    elseif (e.message:findi("prophecy")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(por_zones))
    elseif (e.message:findi("serpents")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(tss_zones))
    elseif (e.message:findi("buried")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(tbs_zones))
    elseif (e.message:findi("secret")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(sof_zones))
    elseif (e.message:findi("house")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(hot_zones))
    elseif (e.message:findi("underfoot")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(uf_zones))
    elseif (e.message:findi("veil")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(voa_zones))
    elseif (e.message:findi("bind")) then
		e.other:Message(MT.Say, "Binding your soul. You will return here when you die.");
		e.self:CastSpell(2049,e.other:GetID(),0,1); -- Spell: Bind Affinity
    else
        local all_zones = {}
        guildmaster.MergeTables(all_zones, antonica_zones, faydwer_zones, odus_zones, kunark_zones, velious_zones, luclin_zones, planar_zones, god_zones, oow_zones, dodh_zones, por_zones, tss_zones, tbs_zones, sof_zones, hot_zones, uf_zones, voa_zones)
        for k, v in pairs(all_zones) do
            if (e.message:findi(k)) then
                if (guildmaster.PortTakeMoney(e.other)) then
                    eq.SelfCast(v)
                else
                    e.other:Message(MT.Say, "I'm sorry, I cannot teleport you unless you have sufficient money.")
                end
                return
            end
        end

        local plat = guildmaster.PortCalculateCost(e.other)
        if plat > 0 then
            e.other:Message(MT.Say, string.format("As a druid guildmaster, I can %s you for a fee of %d platinum pieces.", eq.say_link("teleport", true), plat))
        else
			e.other:Message(MT.Say, string.format("As a druid guildmaster, I can %s you for no fee up to level 10.", eq.say_link("teleport", true)))
        end

		local plat = guildmaster.PortCalculateCost(e.other)
        if plat > 0 then
            e.other:Message(MT.Say, string.format("I can %s you for %d platinum pieces.", eq.say_link("buff", true), plat))
        else
            e.other:Message(MT.Say, string.format("I can %s you for no fee.", eq.say_link("buff", true)))
        end

		e.other:Message(MT.Say, string.format("I can %s your soul.", eq.say_link("bind", true)))
    end
end

---@param e NPCEventSay
function guildmaster.OnSayEnchanter(e)
    if (e.message:findi("buffs")) then
        if (guildmaster.BuffTakeMoney(e.other) ~= true) then
            e.other:Message(MT.Say, "I'm sorry, I cannot buff you unless you have sufficient money.")
            return
        end
        -- Haste
        --  16 - Quickness [39]
        --  24 - Alacrity [170]
        --  29 - Augmentation [10]
        --  39 - Celerity [171] (skip)
        --  49 - Swift Like The Wind [172] (skip)
        --  53 - Anya's Quickening [1708] (skip)
        --  56 - Augment [1729]
        --  57 - Wonderous Rapidity [1709] (skip)
        --  60 - Visions of Grandeur [1710]
        if e.other:GetLevel() >= 60 then
            eq.SelfCast(1710)
        elseif e.other:GetLevel() >= 56 then
            eq.SelfCast(1729)
        elseif e.other:GetLevel() >= 29 then
            eq.SelfCast(10)
        elseif e.other:GetLevel() >= 24 then
            eq.SelfCast(170)
        elseif e.other:GetLevel() >= 16 then
            eq.SelfCast(39)
        end
        -- Clarity
        --  16 - Breeze [697] -- Kunark Only
        --  29 - Clarity [174]
        --  54 - Clarity II [1693]
        if e.other:GetLevel() >= 54 then
            eq.SelfCast(1693)
        elseif e.other:GetLevel() >= 29 then
            eq.SelfCast(174)
        elseif (e.other:GetLevel() >= 16 and eq.is_the_ruins_of_kunark_enabled()) then -- Kunark Only
            eq.SelfCast(697)
        end
        -- INT/WIS
        --  39 - Insight [175]
        --  44 - Brilliance [33]
        --  57 - Enlightenment [1688]
        if e.other:GetLevel() >= 57 then
            eq.SelfCast(1688)
        else
            if e.other:GetLevel() >= 44 then
                eq.SelfCast(33)
            end
            if e.other:GetLevel() >= 39 then
                eq.SelfCast(175)
            end
        end
        -- Mana
        --  34 - Gift of Magic [1408] -- Velious Only
        --  55 - Gift of Insight [1409] -- Velious Only
        --  60 - Gift of Brilliance [1410] -- Velious Only
        if eq.is_the_scars_of_velious_enabled() then
            if e.other:GetLevel() >= 60 then -- Velious Only
                eq.SelfCast(1410)
            elseif e.other:GetLevel() >= 55 then -- Velious Only
                eq.SelfCast(1409)
            elseif e.other:GetLevel() >= 34 then -- Velious Only
                eq.SelfCast(1408)
            end
        end
		return
	end
    if (e.message:findi("bind")) then
		e.other:Message(MT.Say, "Binding your soul. You will return here when you die.");
		e.self:CastSpell(2049,e.other:GetID(),0,1); -- Spell: Bind Affinity
		return
	end

	local plat = guildmaster.BuffCalculateCost(e.other)
	if plat > 0 then
		e.other:Message(MT.Say, "As an enchanter guildmaster, for a fee of " .. plat .. " platinum pieces, I can provide you with [" .. eq.say_link("buffs", true) .. "] to assist you in your adventures.")
	else
		e.other:Message(MT.Say, "As a enchanter guildmaster, for no fee, I can provide you with [" .. eq.say_link("buffs", true) .. "] to assist you in your adventures.")
	end
	e.other:Message(MT.Say, string.format("I can %s your soul.", eq.say_link("bind", true)))
end

---@param e NPCEventSay
function guildmaster.OnSayShaman(e)
    if (e.message:findi("buffs")) then
        if (guildmaster.BuffTakeMoney(e.other) ~= true) then
            e.other:Message(MT.Say, "I'm sorry, I cannot buff you unless you have sufficient money.")
            return
        end
        -- Talisman
        --  34 - Talisman of Tnarg [167]
        --  44 - Talisman of Altuna [168]
        --  55 - Talisman of Kragg [1585]
        if e.other:GetLevel() >= 55 then
            eq.SelfCast(1585)
        elseif e.other:GetLevel() >= 44 then
            eq.SelfCast(168)
        elseif e.other:GetLevel() >= 34 then
            eq.SelfCast(167)
        end
        -- AC
        --  5 - Scale Skin [274]
        --  14 - Turtle Skin [283]
        --  24 - Protect [649]
        --  34 - Shifting Shield [431]
        --  44 - Guardian [389]
        --  54 - Shroud of the Spirits [1584]
        if e.other:GetLevel() >= 54 then
            eq.SelfCast(1584)
        elseif e.other:GetLevel() >= 44 then
            eq.SelfCast(389)
        elseif e.other:GetLevel() >= 34 then
            eq.SelfCast(431)
        elseif e.other:GetLevel() >= 24 then
            eq.SelfCast(649)
        elseif e.other:GetLevel() >= 14 then
            eq.SelfCast(283)
        elseif e.other:GetLevel() >= 5 then
            eq.SelfCast(274)
        end
        -- STR
        --  1 - Strengthen [40]
        --  19 - Spirit Strength [147]
        --  29 - Raging Strength [151]
        --  39 - Furious Strength [153]
        --  49 - Strength [159]
        --  57 - Maniacal Strength [1593]
        if e.other:GetLevel() >= 57 then
            eq.SelfCast(1593)
        elseif e.other:GetLevel() >= 49 then
            eq.SelfCast(159)
        elseif e.other:GetLevel() >= 39 then
            eq.SelfCast(153)
        elseif e.other:GetLevel() >= 29 then
            eq.SelfCast(151)
        elseif e.other:GetLevel() >= 19 then
            eq.SelfCast(147)
        else
            eq.SelfCast(40)
        end
        -- STA
        --  9 - Spirit of Bear [279]
        --  14 - Spirit of Ox [149]
        --  34 - Health [161]
        --  44 - Stamina [158]
        --  54 - Riotous Health [1595]
        if e.other:GetLevel() >= 54 then
            eq.SelfCast(1595)
        elseif e.other:GetLevel() >= 44 then
            eq.SelfCast(158)
        elseif e.other:GetLevel() >= 34 then
            eq.SelfCast(161)
        elseif e.other:GetLevel() >= 14 then
            eq.SelfCast(149)
        elseif e.other:GetLevel() >= 9 then
            eq.SelfCast(279)
        end
        -- DEX
        --  1 - Dexterous Aura [266]
        --  24 - Spirit of Monkey [146]
        --  29 - Rising Dexterity [349]
        --  39 - Deftness [152]
        --  49 - Dexterity [157]
        --  58 - Mortal Deftness [1596]
        if e.other:GetLevel() >= 58 then
            eq.SelfCast(1596)
        elseif e.other:GetLevel() >= 49 then
            eq.SelfCast(157)
        elseif e.other:GetLevel() >= 39 then
            eq.SelfCast(152)
        elseif e.other:GetLevel() >= 29 then
            eq.SelfCast(349)
        elseif e.other:GetLevel() >= 24 then
            eq.SelfCast(146)
        else
            eq.SelfCast(266)
        end
        -- AGI
        --  5 - Feet like Cat [269]
        --  19 - Spirit of Cat [148]
        --  44 - Agility [154]
        --  53 - Deliriously Nimble [1594]
        if e.other:GetLevel() >= 53 then
            eq.SelfCast(1594)
        elseif e.other:GetLevel() >= 44 then
            eq.SelfCast(154)
        elseif e.other:GetLevel() >= 19 then
            eq.SelfCast(148)
        elseif e.other:GetLevel() >= 5 then
            eq.SelfCast(269)
        end
        -- CHA
        --  14 - Spirit of Snake [284]
        --  39 - Glamour [155]
        --  49 - Charisma [156]
        --  59 - Unfailing Reverence [1597]
        if e.other:GetLevel() >= 59 then
            eq.SelfCast(1597)
        elseif e.other:GetLevel() >= 49 then
            eq.SelfCast(156)
        elseif e.other:GetLevel() >= 39 then
            eq.SelfCast(155)
        elseif e.other:GetLevel() >= 14 then
            eq.SelfCast(284)
        end
        -- Haste
        --  29 - Quickness [39]
        --  44 - Alacrity [170]
        --  56 - Celerity [171]
        if e.other:GetLevel() >= 56 then
            eq.SelfCast(171)
        elseif e.other:GetLevel() >= 44 then
            eq.SelfCast(170)
        elseif e.other:GetLevel() >= 29 then
            eq.SelfCast(39)
        end
        -- Regen
        --  24 - Regeneration [144]
        --  39 - Chloroplast [145]
        --  52 - Regrowth [1568]
        if e.other:GetLevel() >= 52 then
            eq.SelfCast(1568)
        elseif e.other:GetLevel() >= 39 then
            eq.SelfCast(145)
        elseif e.other:GetLevel() >= 24 then
            eq.SelfCast(144)
        end
        -- SoW
        --  9 - Spirit of Wolf [278]
        if e.other:GetLevel() >= 9 then
            eq.SelfCast(278)
        end
        -- CR
        --  1 - Endure Cold [225]
        --  24 - Resist Cold [61]
        if e.other:GetLevel() >= 24 then
            eq.SelfCast(61)
        else
            eq.SelfCast(225)
        end
        -- FR
        --  5 - Endure Fire [224]
        --  29 - Resist Fire [60]
        if e.other:GetLevel() >= 29 then
            eq.SelfCast(60)
        elseif e.other:GetLevel() >= 5 then
            eq.SelfCast(224)
        end
        -- DR
        --  9 - Endure Disease [226]
        --  34 - Resist Disease [63]
        if e.other:GetLevel() >= 34 then
            eq.SelfCast(63)
        elseif e.other:GetLevel() >= 9 then
            eq.SelfCast(226)
        end
        -- PR
        --  14 - Endure Poison [227]
        --  39 - Resist Poison [62]
        if e.other:GetLevel() >= 39 then
            eq.SelfCast(62)
        elseif e.other:GetLevel() >= 14 then
            eq.SelfCast(227)
        end
        -- MR
        --  19 - Endure Magic [228]
        --  44 - Resist Magic [64]
        if e.other:GetLevel() >= 44 then
            eq.SelfCast(64)
        elseif e.other:GetLevel() >= 19 then
            eq.SelfCast(228)
        end
        -- HP
        --  1 - Inner Fire [267]
        --  60 - Focus of Spirit [1432] -- Velious Only
        if (e.other:GetLevel() >= 60 and eq.is_the_scars_of_velious_enabled()) then -- Velious Only
            eq.SelfCast(1432)
        else
            eq.SelfCast(267)
        end
		return
	end
    if (e.message:findi("bind")) then
		e.other:Message(MT.Say, "Binding your soul. You will return here when you die.");
		e.self:CastSpell(2049,e.other:GetID(),0,1); -- Spell: Bind Affinity
		return
	end
	local plat = guildmaster.BuffCalculateCost(e.other)
	if plat > 0 then
		e.other:Message(MT.Say, "As a shaman guildmaster, for a fee of " .. plat .. " platinum pieces, I can provide you with [" .. eq.say_link("buffs", true) .. "]  to assist you in your adventures.")
	else
		e.other:Message(MT.Say, "As a shaman guildmaster, for no fee, I can provide you with [" .. eq.say_link("buffs", true) .. "] to assist you in your adventures.")
	end
	e.other:Message(MT.Say, string.format("I can %s your soul.", eq.say_link("bind", true)))
end

---@param e NPCEventSay
function guildmaster.OnSayWizard(e)
    local antonica_zones = {}
    antonica_zones["Cazic Thule"] = 546
    antonica_zones["Nektulos Forest"] = 545
    antonica_zones["North Ro"] = 547
    antonica_zones["Western Commonlands"] = 544
    antonica_zones["Western Karana"] = 548
    local faydwer_zones = {}
    faydwer_zones["Greater Faydark"] = 543
    local odus_zones = {}
    odus_zones["Toxxulia Forest"] = 541
    local planar_zones = {}
    planar_zones["Plane of Hate"] = 666
    planar_zones["Plane of Sky"] = 674
    local kunark_zones = {} -- Kunark Only
    if (eq.is_the_ruins_of_kunark_enabled()) then
        kunark_zones["Dreadlands"] = 1325
        kunark_zones["Emerald Jungle"] = 1739
        kunark_zones["Skyfire Mountains"] = 1738
    end
    local velious_zones = {} -- Velious Only
    if (eq.is_the_scars_of_velious_enabled()) then
        velious_zones["Cobalt Scar"] = 2028
        velious_zones["Iceclad Ocean"] = 1417
        velious_zones["The Great Divide"] = 2026
        velious_zones["Wakening Lands"] = 2027
    end

    local luclin_zones = {} -- Luclin Only
    if (eq.is_the_shadows_of_luclin_enabled()) then
        luclin_zones["Grimling Forest"] = 2418
        luclin_zones["Twilight Sea"] = 2423
        luclin_zones["Dawnshroud Peaks"] = 2428
        luclin_zones["Nexus"] = 2945
    end

    if (eq.is_the_planes_of_power_enabled()) then
        planar_zones["Plane of Knowledge"] = 3183
    end


    local god_zones = {} -- Gates of Discord Only
    if (eq.is_gates_of_discord_enabled()) then
        god_zones["Natimbi"] = 4963
        god_zones["Barindu"] = 5734
    end

    local oow_zones = {} -- Omens of War Only
    if (eq.is_omens_of_war_enabled()) then
        oow_zones["Bloodfields"] = 6181
        oow_zones["Wall of Slaughter"] = 6176
    end

    local dodh_zones = {} -- Depths of Darkhollow Only
    if (eq.is_depths_of_darkhollow_enabled()) then
        dodh_zones["Undershore"] = 8238
    end

    local por_zones = {} -- Prophecy of Ro Only
    if (eq.is_prophecy_of_ro_enabled()) then
        por_zones["Arcstone"] = 8968
    end

    local tss_zones = {} -- The Serpent's Spine Only
    if (eq.is_the_serpents_spine_enabled()) then
        tss_zones["Icefall Glacier"] = 10876
        tss_zones["Sunderock Springs"] = 10879
        tss_zones["Blightfire Moores"] = 10882
    end

    local tbs_zones = {} -- The Buried Sea Only
    if (eq.is_the_buried_sea_enabled()) then
        tbs_zones["Katta Castrum"] = 11985
    end

    local sof_zones = {} -- Secrets of Faydwer Only
    if (eq.is_secrets_of_faydwer_enabled()) then
        sof_zones["Dragonscale Hills"] = 15891
    end

    local hot_zones = {} -- House of Thule Only
    if (eq.is_house_of_thule_enabled()) then
        hot_zones["Grounds"] = 17885
	end

    if (e.message:findi("teleport")) then
        e.other:Message(MT.Say, "I can teleport you to the following continents: " .. guildmaster.BuildSayLinks(continents))
		return
	end
    if (e.message:findi("antonica")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(antonica_zones))
		return
	end
    if (e.message:findi("faydwer")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(faydwer_zones))
		return
	end
    if (e.message:findi("odus")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(odus_zones))
		return
	end
    if (e.message:findi("planar")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(planar_zones))
		return
	end
	if (e.message:findi("kunark")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(kunark_zones))
		return
	end
	if (e.message:findi("velious")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(velious_zones))
		return
	end
	if (e.message:findi("luclin")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(luclin_zones))
    end
	if (e.message:findi("gates")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(god_zones))
		return
	end
	if (e.message:findi("omens")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(oow_zones))
		return
	end
	if (e.message:findi("depths")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(dodh_zones))
		return
	end
	if (e.message:findi("prophecy")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(por_zones))
		return
	end
	if (e.message:findi("serpents")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(tss_zones))
		return
	end
	if (e.message:findi("buried")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(tbs_zones))
		return
	end
	if (e.message:findi("secret")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(sof_zones))
		return
	end
	if (e.message:findi("house")) then
        e.other:Message(MT.Say, "I can teleport you to the following zones: " .. guildmaster.BuildSayLinks(hot_zones))
		return
	end
	if (e.message:findi("bind")) then
		e.other:Message(MT.Say, "Binding your soul. You will return here when you die.");
		e.self:CastSpell(2049,e.other:GetID(),0,1); -- Spell: Bind Affinity
		return
	end

	local all_zones = {}
	guildmaster.MergeTables(all_zones, antonica_zones, faydwer_zones, odus_zones, planar_zones, kunark_zones, velious_zones, luclin_zones, god_zones, oow_zones, dodh_zones, por_zones, tss_zones, tbs_zones, sof_zones, hot_zones)
	for k, v in pairs(all_zones) do
		if (e.message:findi(k)) then
			if k == "Plane of Hate" or k == "Plane of Sky" then
				if (e.other:GetLevel() < 46) then
					e.other:Message(MT.Say, "I'm sorry, I cannot teleport you unless you are level 46 or higher.")
					return
				end
				if e.other:IsGrouped() then
					e.other:Message(MT.Say, "I'm sorry, I cannot teleport you unless you are not in a group.")
					return
				end
			end
			if (guildmaster.PortTakeMoney(e.other)) then
				eq.SelfCast(v)
				return
			end
			e.other:Message(MT.Say, "I'm sorry, I cannot teleport you unless you have sufficient money.")
			return
		end
	end

	local plat = guildmaster.PortCalculateCost(e.other)
	if plat > 0 then
		e.other:Message(MT.Say, "As a wizard guildmaster, for a fee of " .. plat .. " platinum pieces, I can [" .. eq.say_link("teleport", true) .. "] you.")
	else
		e.other:Message(MT.Say, "As a wizard guildmaster, for no fee, I can [" .. eq.say_link("teleport", true) .. "] you.")
	end
	e.other:Message(MT.Say, string.format("I can %s your soul.", eq.say_link("bind", true)))
end

-- Helper functions
function guildmaster.PairsByKeys(t, f)
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

function guildmaster.MergeTables(t1, ...)
    local tables = {...}
    for _, tbl in ipairs(tables) do
        for k, v in pairs(tbl) do
            t1[k] = v
        end
    end
end

function guildmaster.BuildSayLinks(t)
    local buff_links = ""
    for k, v in guildmaster.PairsByKeys(t) do
        buff_links = buff_links .. "[" .. eq.say_link(k) .. "] "
    end

    return buff_links
end

return guildmaster