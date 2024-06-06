local builds = {}

local builds_path = "lua_modules/builds/"

local skills = {
	war = {
		jarringstrike = { ID = 0 },
	},
	shd = {
		lifesap = { ID = 0 },
		gougingskin = { ID = 2 },
	}
}

function builds.Init()
	for className, skillEntry in pairs(skills) do
		for skillName, skill in pairs(skillEntry) do
			local skill_path = className .. "/" .. skillName
			skill.Event = require(builds_path .. skill_path)
			if type(_G[skill.Event.CommonDamage]) == "function" then
				skill.CommonDamage = _G[skill.Event.CommonDamage]
			end
		end

	end
end

---@param e ModCommonDamage
function builds.OnModCommonDamage(e)
	if not e.self.valid or not e.attacker.valid then
		return e
	end
	-- builds require at least one client for build related triggers
	if not e.self:IsClient() and not e.attacker:IsClient() then
		return e
	end

	for className, skillEntry in pairs(skills) do
		if e.self:IsClient() and className == e.self:GetClassName() then
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(e.self, skill.ID)
				if rank > 0 and skill.CommonDamage then
					skill.CommonDamage(e, true, rank)
				end
			end
		end
		if e.attacker:IsClient() and className == e.attacker:GetClassName() then
			for skillName, skill in pairs(skillEntry) do
				local rank = builds.Rank(e.attacker, skill.ID)
				if rank > 0 and skill.CommonDamage then
					skill.CommonDamage(e, false, rank)
				end
			end
		end
	end
end

---@param self Mob
---@param skillID integer
---@return integer
function builds.Rank(self, skillID)
	if not self:IsClient() then
		return 0
	end

	local build = self:GetBucket("build")
	if skillID > string.len(build) then
		return 0
	end

	local rank = tonumber(string.sub(build, skillID, skillID))
	if rank then
		return rank
	end
	return 0
end


return builds
