local p = require('everblush.palette')

require('everblush').setup({

	-- Override the default highlights using Everblush or other colors
	override = {
		TelescopeSelection = { fg = p.background, bg = p.color3 },
		TelescopeBorder = { fg = p.color3 },
		TelescopeNormal = { fg = p.foreground },
		["@Comment"] = { fg = "#717e83" },
		["@Exception"] = { fg = "#717e83" },
		["@Float"] = { fg = "#717e83" },

	},
	-- Set transparent background
	transparent_background = true,

	-- Set contrast for nvim-tree highlights
	nvim_tree = {
		contrast = true,
	},
})
