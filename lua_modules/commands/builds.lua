local builds_pkg = require("builds")

---@param e PlayerEventCommand
local function builds(e)
	if #e.args == 0 then
		builds_pkg.OnBuildCommand(e)
		return
	end

	local subcommand = e.args[1]
	if subcommand == "reset" then
		builds_pkg.OnBuildResetCommand(e)
		return
	end

	e.self:Message(MT.Red, "Unknown #builds subcommand: " .. subcommand)
end

return builds
