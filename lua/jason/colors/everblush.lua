local p = require('everblush.palette')

require('everblush').setup({

	-- Override the default highlights using Everblush or other colors
	override = {
		TelescopeSelection = { fg = p.background, bg = p.color10 },
		-- TelescopeBorder = {},
		-- TelescopeNormal = {},
		-- TelescopeSelection = {},
		TelescopeBorder = { fg = p.color0, bg = background },
		TelescopeNormal = { fg = p.foreground, bg = background },

	},
	-- Set transparent background
	transparent_background = true,

	-- Set contrast for nvim-tree highlights
	nvim_tree = {
		contrast = true,
	},
})
