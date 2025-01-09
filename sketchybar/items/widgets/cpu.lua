local constants = require("constants")

local cpu = sbar.add("item", constants.items.CPU, {
	position = "right",
	update_freq = 3,
	icon = {
		string = "󰻠",
		padding_left = 8,
		padding_right = 4,
		font = {
			family = "JetBrainsMono Nerd Font",
			style = "Regular",
			size = 14.0
		}
	},
})

cpu:subscribe({ "forced", "routine" }, function(env)
	local cmd = [[
	ps -A -o %cpu | awk '{s+=$1} END {printf "%.0f%%", s/8}'
	]]
	local handle = io.popen(cmd)
	local cpu_usage = handle:read("*a")
	handle:close()

	cpu:set({
		label = cpu_usage:gsub("\n", "")
	})
end)
