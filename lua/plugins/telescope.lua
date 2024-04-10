return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local actions = require("telescope.actions")

    local fb_actions = require "telescope".extensions.file_browser.actions

    require("telescope").setup({
      defaults = {
        path_display = function(opts, path)
          local tail = require("telescope.utils").path_tail(path)
          return string.format("%s  (%s)", tail, path)
        end,
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "   ",
        results_title = "",
        sorting_strategy = "ascending",
        layout_strategy = 'vertical',
        layout_config = {
          vertical = {
            preview_cutoff = 25,
            prompt_position = "top",
            preview_height = 0.45,
          },
          -- horizontal = {
          -- 	width = { 0.5, max = 70, min = 123 },
          -- 	preview_cutoff = 0,
          -- 	preview_width = 0.5,
          -- },
        },
        file_ignore_patterns = {
          "^.git/*",
          "./.git/*",
          "target/",
          "docs/",
          "vendor/*",
          "%.lock",
          "__pycache__/*",
          "%.sqlite3",
          "%.ipynb",
          "node_modules/*",
          "%.svg",
          "%.otf",
          "%.ttf",
          "%.webp",
          ".dart_tool/",
          ".github/",
          ".gradle/",
          ".idea/",
          ".settings/",
          ".vscode/",
          "__pycache__/",
          "build/",
          "gradle/",
          "node_modules/",
          "%.pdb",
          "%.dll",
          "%.class",
          "%.exe",
          "%.cache",
          "%.ico",
          "%.pdf",
          "%.dylib",
          "%.jar",
          "%.docx",
          "%.met",
          "smalljre_*/*",
          ".vale/",
          "%.burp",
          "%.mp4",
          "%.mkv",
          "%.rar",
          "%.zip",
          "%.7z",
          "%.tar",
          "%.bz2",
          "%.epub",
          "%.flac",
          "%.tar.gz",
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
            -- ["<leader>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-s>"] = actions.select_vertical,
          },
          n = {
            ["<C-s>"] = actions.select_vertical,
          }
        },
      },
      extensions = {
        file_browser = {
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          path_display = { "smart" },
          mappings = {
            -- your custom insert mode mappings
            ["i"] = {
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


    local function lsp_definitions()
      require("telescope.builtin").lsp_definitions({
        show_line = false,
      })
    end

    local function lsp_references()
      require("telescope.builtin").lsp_references({
        show_line = false,
      })
    end

    local function lsp_implementations()
      require("telescope.builtin").lsp_implementations({
        show_line = false,
      })
    end

    local function lsp_incoming_calls()
      require("telescope.builtin").lsp_incoming_calls({
        show_line = false,
      })
    end


    -- Key mappings
    local keymap = vim.keymap.set
    keymap("n", "<leader>i", "<cmd>Telescope find_files hidden=true<CR>", { silent = true })
    keymap("n", "<leader>o", "<cmd>Telescope oldfiles<CR>", { silent = true })
    keymap("n", "<leader>p", "<cmd>Telescope live_grep<CR>", { silent = true })
    keymap("n", "<leader>l", ":Telescope file_browser path=%:p:h select_buffer=true hidden=true<CR>", { silent = true })
    keymap("n", "<Bslash>g", "<cmd>Telescope git_commits<CR>", { silent = true })
    keymap("n", "<Bslash>b", "<cmd>Telescope git_bcommits<CR>", { silent = true })
    keymap("n", "gd", lsp_definitions, { silent = true })
    keymap("n", "gr", lsp_references, { silent = true })
    keymap("n", "gu", lsp_implementations, { silent = true })
    keymap("n", "ga", lsp_incoming_calls, { silent = true })

    -- Flutter
    keymap("n", "<leader>f", "<cmd>Telescope flutter commands<CR>", { silent = true })
    -- Http status code
    keymap("n", "<Bslash>h", "<cmd>Telescope http list<CR>")

    -- Load extension
    require("telescope").load_extension("harpoon")
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("flutter")
    require("telescope").load_extension("http")
  end
}
