local actions = require("telescope.actions")

local fb_actions = require "telescope".extensions.file_browser.actions

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
	extensions = {
		file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
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
keymap("n", "<leader>p", "<cmd>Telescope find_files prompt_prefix=🔍<CR>", { silent = true })
keymap("n", "<leader>vp", "<cmd>Telescope live_grep prompt_prefix=🔍<CR>", { silent = true })
keymap("n", "<leader>o", "<cmd>Telescope oldfiles prompt_prefix=🔍<CR>", { silent = true })

--Flutter extension
require("telescope").load_extension("file_browser")
require("telescope").load_extension("flutter")
keymap("n", "<leader>f", "<cmd>Telescope flutter commands<CR>", { silent = true })

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

-- vim.keymap.set("n", "sf", function()
--   require("telescope").extensions.file_browser.file_browser({
--     path = "%:p:h",
--     cwd = telescope_buffer_dir(),
--     respect_gitignore = false,
--     hidden = true,
--     grouped = true,
--     previewer = false,
--     initial_mode = "normal",
--     layout_config = { height = 40 }
--   })
-- end)


