require 'nvim-treesitter.configs'.setup {
	textobjects = {
		swap = {
			enable = true,
			swap_next = {
				["<leader>k"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>j"] = "@parameter.inner",
			},
		},
	},
}
