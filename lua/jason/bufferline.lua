require("bufferline").setup({
	options = {
		show_buffer_close_icon = false,
		show_close_icon = false,
    diagnostics = "nvim_lsp",
				indicator = {
				icon = '▎', -- this should be omitted if indicator style is not 'icon'
				style = 'icon',
		},
	}
})
