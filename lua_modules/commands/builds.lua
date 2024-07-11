local builds_pkg = require("builds")
local ability_db = require("ability_db")

---@param e PlayerEventCommand
local function builds(e)
	if #e.args == 0 then
		builds_pkg.OnBuildCommand(e)
		return
	end

	local subcommand = e.args[1]
	local subsubcommand = e.args[2]
	if subsubcommand == nil then
		subsubcommand = ""
	end

	if subcommand == "reset" then
		builds_pkg.OnBuildResetCommand(e)
		return
	end
	if subcommand == "debug" then
		if subsubcommand == "off" then
			e.self:SetBucket("build_debug", string.rep("0", 53))
			e.self:Message(MT.White, "Build debug messages disabled.")
			return
		end
		if subsubcommand == "on" then
			e.self:SetBucket("build_debug", string.rep("1", 53))
			e.self:Message(MT.White, "Build debug messages enabled.")
			return
		end
		local debug_string = e.self:GetBucket("build_debug")
		if debug_string == "" then
			e.self:Message(MT.White, "Build debug messages disabled. Use #builds debug on to enable.")
			return
		end

		return
	end

	local guide_flag = 50
	local admin_flag = 80

	if(guide_flag > e.self:Admin()) then
		e.self:Message(MT.Red, "Unknown #builds subcommand: " .. subcommand)
		e.self:Message(MT.White, "Usage: #builds [reset, debug]")
		return
	end

	-- guide flags

	if subcommand == "inspect" then
		builds_pkg.OnBuildInspectCommand(e)
		return
	end

	if subcommand == "target" then
		if subsubcommand == "reset" then
			builds_pkg.OnBuildTargetResetCommand(e)
			return
		end
		e.self:Message(MT.White, "Usage: #builds target [reset, debug]")
		return
	end

	if admin_flag > e.self:Admin() then
		e.self:Message(MT.Red, "Unknown #builds subcommand: " .. subcommand)
		e.self:Message(MT.White, "Usage: #builds [target, inspect, reset]")
		return
	end
	-- admin flags

	if subcommand == "foo" then
		if e.self:GetTarget() ~= nil then
				ability_db.emit(e.self:GetTarget(), ability_db.EMIT_RED) -- BB
			return
		end
		ability_db.emit(e.self, 0x0000FFFF) -- BB
	end

	if subcommand == "set" then
		if subsubcommand == "" or subsubcommand == nil then
			e.self:Message(MT.Red, "Usage: #builds set <string>")
			return
		end
		for i = 1, 5 do
			if subsubcommand == tostring(i) then
				subsubcommand = string.rep(i, 53)
			end
		end

		if string.len(subsubcommand) ~= 53 then
			e.self:Message(MT.Red, "Usage: #builds set <string> (53 characters), or #builds set #, where # is 1 to 5 to set all to a skill level")
			return
		end
		e.self:SetBucket("build", subsubcommand)
		e.self:Message(MT.White, "Build set to: " .. subsubcommand)
	end
	e.self:Message(MT.White, "Usage: #builds [target, inspect, set, reset, debug]")
end

return builds
