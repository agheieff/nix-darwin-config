local constants = require("constants")

local ram = sbar.add("item", constants.items.RAM, {
	position = "right",
	update_freq = 3,
	icon = {
		string = "󰍛",
		padding_left = 8,
		padding_right = 4,
		font = {
		}
	},
})

ram:subscribe({ "forced", "routine" }, function(env)
	local cmd = [[
	vm_stat | awk -v total=$(sysctl -n hw.memsize) '
        /page size of/ {
            page_size = $8
        }
        /Pages free/ {
            free = $3
        }
        /Pages active/ {
            active = $3
        }
        /Pages wired/ {
            wired = $4
        }
        END {
            # Convert to GB
            used = (active + wired) * page_size / 1024 / 1024 / 1024
            printf "%.1fG/%.0fG", used, total / 1024 / 1024 / 1024
        }'
    ]]
	local handle = io.popen(cmd)
	local ram_info = handle:read("*a")
	handle:close()

	ram:set({
		label = ram_info:gsub("\n", "")
	})
end)
