local builds_pkg = require("builds")
local ability_db = require("ability_db")

---@param e PlayerEventCommand
local function builds(e)
	if #e.args == 0 then
		e.self:Message(MT.White, "Usage: #builds [debug]")
		return
	end

	local subcommand = e.args[1]
	local subsubcommand = e.args[2]
	if subsubcommand == nil then
		subsubcommand = ""
	end

	if subcommand == "debug" then
		if subsubcommand == "off" then

			build_ids = builds_pkg.BuildIDs(e.self)
			for _, build_id in ipairs(build_ids) do
				e.self:SetBucket("build_debug_" .. build_id, "0")
			end

			e.self:Message(MT.White, "Build debug messages disabled.")
			return
		end
		if subsubcommand == "on" then
			build_ids = builds_pkg.BuildIDs(e.self)
			for _, build_id in ipairs(build_ids) do
				e.self:SetBucket("build_debug_" .. build_id, "1")
			end

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

	if subcommand == "reset" then
		builds_pkg.OnBuildResetCommand(e)
		return
	end


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
		return
	end

	if subcommand == "vitality" then
		eq.debug("sending vitality packet")
		local pack = Packet(0x2CC6, 32, true) -- 28 bytes
		pack:WriteInt64(50) -- curVitality
		pack:WriteInt64(100) -- maxVitality
		pack:WriteInt64(25) -- curAAVitality
		pack:WriteInt64(100) -- maxAAVitality
		e.self:QueuePacket(pack) -- send packet
		return
	end

	if subcommand == "compass" then
		eq.debug("sending compass packet")
		local pack = Packet(0x3e0e, 28, true) -- 28 bytes
		pack:WriteInt32(e.self:GetID()) -- client_id
		pack:WriteInt32(1) -- 1 entry
		pack:WriteInt16(eq.get_zone_id()) -- dz_zone_id is current ID
		pack:WriteInt16(0) -- dz_instance_id
		pack:WriteInt32(5) -- quest (green)
		pack:WriteFloat(0.0) -- y
		pack:WriteFloat(0.0) -- x
		pack:WriteFloat(0.0) -- z
		e.self:QueuePacket(pack) -- send packet
		return
	end

	if subcommand == "compassoff" then
		eq.debug("sending compass packet")
		local pack = Packet(0x3e0e, 28, true) -- 28 bytes
		pack:WriteInt32(e.self:GetID()) -- client_id
		pack:WriteInt32(0) -- 1 entry
		e.self:QueuePacket(pack) -- send packet
		return
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
		return
	end
	e.self:Message(MT.White, "Usage: #builds [target, inspect, set, reset, debug]")
end

return builds
