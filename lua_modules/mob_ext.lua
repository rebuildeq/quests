local mob_ext_card = require("mob_ext_card")

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

---@return string
function Mob:GetClassShortName()
	if self:GetClass() == 1 then return "war" end
	if self:GetClass() == 2 then return "clr" end
	if self:GetClass() == 3 then return "pal" end
	if self:GetClass() == 4 then return "rng" end
	if self:GetClass() == 5 then return "shd" end
	if self:GetClass() == 6 then return "dru" end
	if self:GetClass() == 7 then return "mnk" end
	if self:GetClass() == 8 then return "brd" end
	if self:GetClass() == 9 then return "rog" end
	if self:GetClass() == 10 then return "shm" end
	if self:GetClass() == 11 then return "nec" end
	if self:GetClass() == 12 then return "wiz" end
	if self:GetClass() == 13 then return "mag" end
	if self:GetClass() == 14 then return "enc" end
	if self:GetClass() == 15 then return "bst" end
	if self:GetClass() == 16 then return "ber" end
end

--- Sets a bucket value that is scoped to an specific entity
---@param base_key string
---@param value string
function Mob:SetEntityBucket(base_key, value)
	local key = string.format("%s_%d_%d_%d", base_key, eq.get_zone_id(), eq.get_zone_instance_id(), self:GetID());
	self:SetBucket(key, value);
end

--- Gets a bucket value that is scoped to an specific entity
---@param base_key string
---@return string
function Mob:GetEntityBucket(base_key)
	local key = string.format("%s_%d_%d_%d", base_key, eq.get_zone_id(), eq.get_zone_instance_id(), self:GetID());
	return self:GetBucket(key);
end

--- Deletes a bucket value that is scoped to an specific entity
---@param base_key string
function Mob:DeleteEntityBucket(base_key)
	local key = string.format("%s_%d_%d_%d", base_key, eq.get_zone_id(), eq.get_zone_instance_id(), self:GetID());
	self:DeleteBucket(key);
end
