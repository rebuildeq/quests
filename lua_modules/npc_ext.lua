local mob_ext_card = require("mob_ext_card")
local mob_ext_affinity = require("mob_ext_affinity")

function NPC:ForeachHateList(func, cond)
	cond = cond or function(ent, hate, damage, frenzy) return true end;
	local lst = self:GetHateList();
	for ent in lst.entries do
		local cv = cond(ent.ent, ent.hate, ent.damage, ent.frenzy);
		if(cv) then
			func(ent.ent, ent.hate, ent.damage, ent.frenzy);
		end
	end
end

function NPC:CountHateList(cond)
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

function NPC:RandomRoam(maxx,maxy,maxz,los)
	maxz = maxz or 15;
	los = los or 5;

	if not self:IsEngaged() then
		local curx = self:GetX();
		local cury = self:GetY();
		local origx = self:GetSpawnPointX() or 0;
		local origy = self:GetSpawnPointY() or 0;
		local origz = self:GetSpawnPointZ() or 0;
		local guardx = self:GetGuardPointX() or 0;
		local guardy = self:GetGuardPointY() or 0;

		if curx == guardx and cury == guardy then
			local randomx = math.random(maxx) + 1;
			local randomy = math.random(maxy) + 1;
			local posx = origx + randomx;
			local posy = origy + randomy;
			local negx = origx - randomx;
			local negy = origy - randomy;
			local newx, newy = 0;
			if posx > negx then -- Flip order
				newx = math.random(negx, posx);
			else
				newx = math.random(posx,negx);
			end

			if posy > negy then -- Flip order
				newy = math.random(negy, posy);
			else
				newy = math.random(posy,negy);
			end
			local newz = self:FindGroundZ(newx,newy, 5) + 1;

			if newz > -999999 and origz > (newz - maxz + 1) and origz < (newz + maxz - 1) then
				local loscheck = self:CheckLoSToLoc(newx, newy, newz, los);
				if loscheck then
					self:MoveTo(newx,newy,newz,-1,true);
				end
			end
		end
	end
end

function NPC:CastedSpellFinished(spell_id, target) -- note, we do have a server side function (not exported) called this too ...
	self:SendBeginCast(spell_id, 0);
	self:SpellFinished(spell_id, target);
end

function NPC:GetClientsInProximity(distance)
	local clients = {}
	local client_list = eq.get_entity_list():GetClientList()
	for client in client_list.entries do
		if client.valid and self:CalculateDistance(client:GetX(), client:GetY(), client:GetZ()) <= distance then
			clients[#clients+1] = client
		end
	end
	return clients
end


--- Returns a string of tags a NPC can drop
---@return string
function NPC:Tags()
	return mob_ext_card.Tags(self);
end

--- Returns an array of cards that this NPC can drop.
---@return RaceEntry[]
function NPC:CardDrops()
	return mob_ext_card.CardDrops(self);
end

--- Returns mob's affinity type name
---@param affinity_type number
---@return string
function NPC:AffinityName(affinity_type)
	return mob_ext_affinity.AffinityName(self, affinity_type);
end


--- Returns value multiplied by affinity modifiers against enemy
---@param value number # damage value
---@param enemy Mob # enemy mob
---@return number # modified damage value
function NPC:AffinityDamage(value, enemy)
	return mob_ext_affinity.AffinityDamage(self, value, enemy);
end

---@return number # 0: none, 1: spirit (magic), 2: fire, 3: water (cold), 4: (poison), 5: air (disease)
function NPC:AffinityDefense()
	return mob_ext_affinity.AffinityDefense(self);
end