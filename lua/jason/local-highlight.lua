require('local-highlight').setup({
	-- If this is given only attach to this
	-- file_types = { 'python', 'cpp' },
	-- OR attach to every filetype except:
	disable_file_types = { 'groovy', 'xml' },
	hlgroup = 'LocalHighLight',
	cw_hlgroup = 'LocalHighLight',
})

-- vim.api.nvim_set_hl(0, 'LocalHighLight', { fg = "#282b30", bg = "#acadb1" })
vim.api.nvim_set_hl(0, 'LocalHighLight', { bg = "#373b40" })
