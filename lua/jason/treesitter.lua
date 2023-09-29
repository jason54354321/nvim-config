if vim.fn.has('win32') == 1 then
	require 'nvim-treesitter.install'.compilers = { "clang" }
end

require 'nvim-treesitter.configs'.setup {
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = false,
		disable = {},
	},
	ensure_installed = {
		"vim",
		"lua",
		"c",
		"cpp",
		"tsx",
		"java",
		"javascript",
		"yaml",
		"html",
		"json",
		"go",
		"dart",
		"vue",
		"markdown",
		"markdown_inline",
	}
}
