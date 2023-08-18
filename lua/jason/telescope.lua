local actions = require("telescope.actions")

local fb_actions = require "telescope".extensions.file_browser.actions

require("telescope").setup({
	defaults = {
		layout_config = {
			horizontal = {
				width = { 0.5, max = 70, min = 123 },
				preview_cutoff = 0,
				preview_width = 0.5,
			},
		},
		vimgrep_arguments = {
			"rg",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--trim" -- add this value
		},
		mappings = {
			i = {
				["<Esc>"] = actions.close,
				["<leader>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-s>"] = actions.select_vertical,
				["<C-u>"] = function() vim.cmd('normal vbd') end,
			},
			n = {
				["<C-s>"] = actions.select_vertical,
			}
		},
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				-- your custom insert mode mappings
				["i"] = {
					["<C-u>"] = function() vim.cmd('normal vbd') end,
					["<C-l>"] = fb_actions.create,
					["<C-r>"] = fb_actions.rename,
					["<C-d>"] = fb_actions.remove,
					["<C-h>"] = fb_actions.goto_parent_dir,
				},
				["n"] = {
					-- your custom normal mode mappings
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["/"] = function()
						vim.cmd('startinsert')
					end
				},
			},
		},
	}
})

-- Key mappings
local keymap = vim.keymap.set
keymap("n", "<leader>i", "<cmd>Telescope find_files prompt_prefix=🔍 hidden=true<CR>", { silent = true })
keymap("n", "<leader>o", "<cmd>Telescope oldfiles prompt_prefix=🔍<CR>", { silent = true })
keymap("n", "<leader>p", "<cmd>Telescope live_grep prompt_prefix=🔍<CR>", { silent = true })
keymap("n", "<leader>l", ":Telescope file_browser path=%:p:h select_buffer=true hidden=true<CR>", { silent = true })

--Flutter extension
require("telescope").load_extension("file_browser")
require("telescope").load_extension("flutter")
keymap("n", "<leader>f", "<cmd>Telescope flutter commands<CR>", { silent = true })
