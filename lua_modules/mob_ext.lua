local mob_ext_card = require("mob_ext_card")
local mob_ext_affinity = require("mob_ext_affinity")

function Mob:ForeachHateList(func, cond)
	cond = cond or function(ent, hate, damage, frenzy) return true end;
	local lst = self:GetHateList();
	for ent in lst.entries do
		local cv = cond(ent.ent, ent.hate, ent.damage, ent.frenzy);
		if(cv) then
			func(ent.ent, ent.hate, ent.damage, ent.frenzy);
		end
	end
end

function Mob:CountHateList(cond)
	cond = cond or function(ent, hate, damage, frenzy) return true end;
	local lst = self:GetHateList();
	local ret = 0;
	for ent in lst.entries do
		local cv = cond(ent.ent, ent.hate, ent.damage, ent.frenzy);
		if(cv) then
			ret = ret + 1;
		end
	end

	return ret;
end

function Mob:CastedSpellFinished(spell_id, target) -- note, we do have a server side function (not exported) called this too ...
	self:SendBeginCast(spell_id, 0);
	self:SpellFinished(spell_id, target);
end


--- Returns a string of tags a NPC can drop
---@return string
function Mob:Tags()
	return mob_ext_card.Tags(self);
end

--- Returns an array of cards that this NPC can drop.
---@return RaceEntry[]
function Mob:CardDrops()
	return mob_ext_card.CardDrops(self);
end

--- Returns mob's affinity type name
---@param affinity_type number
---@return string
function Mob:AffinityName(affinity_type)
	return mob_ext_affinity.AffinityName(self, affinity_type);
end


--- Returns value multiplied by affinity modifiers against enemy
---@param value number # damage value
---@param enemy Mob # enemy mob
---@return number # modified damage value
function Mob:AffinityDamage(value, enemy)
	return mob_ext_affinity.AffinityDamage(self, value, enemy);
end

---@return number # 0: none, 1: spirit (magic), 2: fire, 3: water (cold), 4: (poison), 5: air (disease)
function Mob:AffinityDefense()
	return mob_ext_affinity.AffinityDefense(self);
end