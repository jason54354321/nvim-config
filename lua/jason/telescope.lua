local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		layout_config = {
			horizontal = {
				preview_cutoff = 0,
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
				["<C-s>"] = actions.select_vertical,
      },
			n = {
				["<C-s>"] = actions.select_vertical,
			}
    },
	},
})

-- Key mappings
local keymap = vim.keymap.set
keymap("n", "<leader>p", "<cmd>Telescope find_files prompt_prefix=🔍<CR>", { silent = true })
keymap("n", "<leader>vp", "<cmd>Telescope live_grep prompt_prefix=🔍<CR>", { silent = true })
keymap("n", "<leader>o", "<cmd>Telescope oldfiles prompt_prefix=🔍<CR>", { silent = true })

--Flutter extension
require("telescope").load_extension("flutter")
keymap("n", "<leader>f", "<cmd>Telescope flutter commands<CR>", { silent = true })

