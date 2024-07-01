local builds_pkg = require("builds")

---@param e PlayerEventCommand
local function builds(e)
	if #e.args == 0 then
		builds_pkg.OnBuildCommand(e)
		return
	end

	local subcommand = e.args[1]
	local subsubcommand = e.args[2]
	if subcommand == "reset" then
		builds_pkg.OnBuildResetCommand(e)
		return
	end

	local guide_flag = 50
	local admin_flag = 80

	if(guide_flag <= e.self:Admin()) then
		e.self:Message(MT.Red, "Unknown #builds subcommand: " .. subcommand)
		e.self:Message(MT.White, "Usage: #builds [reset]")
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
		e.self:Message(MT.White, "Usage: #builds target [reset]")
		return
	end

	if admin_flag > e.self:Admin() then
		e.self:Message(MT.Red, "Unknown #builds subcommand: " .. subcommand)
		e.self:Message(MT.White, "Usage: #builds [target, inspect, reset]")
		return
	end
	-- admin flags

	if subcommand == "set" then
		if subsubcommand == "" or subsubcommand == nil then
			e.self:Message(MT.Red, "Usage: #builds set <string>")
			return
		end
		if string.len(subsubcommand) ~= 53 then
			e.self:Message(MT.Red, "Usage: #builds set <string> (53 characters)")
			return
		end
		e.self:SetBucket("build", subsubcommand)
		e.self:Message(MT.White, "Build set to: " .. subsubcommand)
	end
	e.self:Message(MT.White, "Usage: #builds [target, inspect, set, reset]")
end

return builds
