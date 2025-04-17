local builds = require("builds")

---@param e ModHealDamage
function HealDamage(e)
	builds.OnModHealDamage(e)
end

---@param e ModCommonDamage
function CommonDamage(e)
	local dt_spells = {
        982, -- cazic touch
        1948, -- Destroy
        2156, -- Deadly Curse of Noqufiel
        7599, -- Gargoyle Glance
        8436, -- Touch of Terror
        8999, -- Runic Backlash
        9019, -- Backlash of Rage
        9272, -- Avalanche's Torrent of Ice
        9273, -- Glacial Assault
        9376, -- Touch of the Phantom Effect
        12465, -- Infinite Pain
        13031, -- Boom
        13318, -- Harvest Fungus Patch Doom
        17816, -- Scalding Steam Blast
        17832, -- Whirring Copter Blades
        21761, -- Focused Rage
        27522, -- Barrier of Insanity
        27939, -- Battle Orb Explosion
        32450, -- Soul Shatter
        32531, -- Corruptive Crud Direct Damage
        32974, -- Stab of Chaos
        37550, -- Icerain Explosion
        39055, -- Frozen Dread
        39066, -- Fright Force II
        39083, -- Cazic's Displeasure
        39103, -- Eruption
        39180, -- Death Touch
        39224, -- Cold Shock
        42046, -- Bleeding Out
        42049, -- Dehydrated
        42050, -- Demoralized
        42071, -- Raging Tempest
        42161, -- Blazebeam
    }

    for _, v in pairs(dt_spells) do
        if e.spell_id == v and e.self:IsClient() then
			local damage = 1
			damage = damage * e.self:GetLevel()
            if e.self:GetLevel() < 20 then
                damage = damage * 5
            elseif e.self:GetLevel() < 40 then
                damage = damage * 20
            elseif e.self:GetLevel() < 60 then
                damage = damage * 30
			else
				damage = damage * 40
            end

            e.self:Message(MT.Say, string.format("%s just tried to death touch you, but RebuildEQ nerfed it to %d damage.", e.attacker:GetCleanName(), damage));
            e.return_value = 100
            e.ignore_default = true
            return e
        end
    end


	builds.OnModCommonDamage(e)

end

---@param e ModCheckHitChance
function CheckHitChance(e)
	builds.OnCheckHitChance(e)
end
