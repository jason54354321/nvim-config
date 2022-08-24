local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		layout_config = {
			horizontal = {
				preview_cutoff = 0,
			},
		},
		mappings = {
      i = {
        ["<esc>"] = actions.close,
				["<C-s>"] = actions.select_vertical,
      },
			n = {
				["<C-s>"] = actions.select_vertical,
			}
    },
		vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim" -- add this value
    }
	},
})

local keymap = vim.keymap.set
keymap("n", "<leader>p", "<cmd>Telescope find_files prompt_prefix=🔍<CR>", { silent = true })
keymap("n", "<leader>vp", "<cmd>Telescope live_grep prompt_prefix=🔍<CR>", { silent = true })

