require('leap').add_default_mappings()

local keymap = vim.keymap.set
local function leap_prefix()
	require('leap').leap({
		target_windows = { vim.fn.win_getid() }
	})
end

keymap("n", "s", leap_prefix, { silent = true })
