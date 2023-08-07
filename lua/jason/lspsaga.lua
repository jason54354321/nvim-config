local saga = require('lspsaga')

saga.setup({
	ui = {
		-- Currently, only the round theme exists
		theme = "round",
		-- This option only works in Neovim 0.9
		title = true,
		-- Border type can be single, double, rounded, solid, shadow.
		border = "rounded",
		winblend = 0,
		expand = "",
		collapse = "",
		preview = " ",
		code_action = "💡",
		diagnostic = "🐞",
		hover = ' ',
		kind = {},
	},
	finder = {
		--percentage
		max_height = 0.5,
		force_max_height = false,
		keys = {
			jump_to = 'p',
			edit = { 'o', '<CR>' },
			vsplit = 's',
			split = 'i',
			tabe = 't',
			tabnew = 'r',
			quit = { 'q', '<ESC>' },
			close_in_preview = 'q',
		},
	},
	lightbulb = {
		enable = true,
		sign = false,
		debounce = 1000,
	},

})
-- saga.setup({
-- 	border_style = "rounded",
-- 	saga_winblend = 30,
-- 	diagnostic_header = { " ", " ", " ", "ﴞ " },
--   code_action_icon = "💡",
-- 	code_action_lightbulb = {
--     enable = false,
--     sign = false,
--     enable_in_insert = true,
--     sign_priority = 20,
--     virtual_text = true,
-- 	},
-- 	code_action_keys = {
--     quit = "<Esc>",
--     exec = "<CR>",
-- 	},
-- 	finder_icons = {
-- 		def = '  ',
-- 		ref = '諭 ',
-- 		imp = '諭 ',
-- 		link = '  ',
-- 	},
-- 	finder_action_keys = {
--     open = "o",
--     vsplit = "s",
--     split = "i",
--     tabe = "t",
--     quit = "<Esc>",
--     scroll_down = "<C-f>",
--     scroll_up = "<C-b>", -- quit can be a table
-- 	},
-- 	rename_action_quit = "<Esc>",
-- })

local keymap = vim.keymap.set
-- Lsp finder find the symbol definition implement reference
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })

-- Rename
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Go peek definition
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

-- Diagnsotic jump
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })

-- Only jump to error
keymap("n", "[D", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]D", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
keymap("n", "go", "<cmd>Lspsaga outline<CR>", { silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Signature help
keymap("n", "gs", "<Cmd>Lspsaga signature_help<CR>", { silent = true })
