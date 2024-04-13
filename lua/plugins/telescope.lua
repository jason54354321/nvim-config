local function find_files()
  local opts = {
    -- no_ignore = true,
    hidden = true,
  }

  require("telescope.builtin").find_files(opts)
end

local function old_files()
  local opts = {
    --
  }

  require("telescope.builtin").oldfiles(opts)
end

local function live_grep()
  local opts = {
    --
  }

  require("telescope.builtin").live_grep(opts)
end

local function file_browser()
  local opts = {
    --
    path = "%:p:h",
    select_buffer = true,
    hidden = true,
  }

  require("telescope").extensions.file_browser.file_browser(opts)
end

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

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim' ,
    'nvim-telescope/telescope-file-browser.nvim',
    'barrett-ruth/telescope-http.nvim'
  },
  cmd = "Telescope",
  keys = {
    {"<leader>i", find_files, mode = "n", desc = "Find Files"},
    {"<leader>o", old_files, mode = "n", desc = "Old Files"},
    {"<leader>p", live_grep, mode = "n", desc = "Live Grep"},
    {"<leader>l", file_browser, mode = "n", desc = "File Browser"},

    -- Git
    {"<Bslash>g", "<cmd>Telescope git_commits<CR>", mode = "n", desc = "Commits"},
    {"<Bslash>b", "<cmd>Telescope git_bcommits<CR>", mode = "n", desc = "Buffer's Commits"},

    -- Lsp
    {"gd", lsp_definitions, mode = "n", desc = "Buffer's Commits"},
    {"gr", lsp_references, mode = "n", desc = "Buffer's Commits"},
    {"gu", lsp_implementations, mode = "n", desc = "Buffer's Commits"},
    {"ga", lsp_incoming_calls, mode = "n", desc = "Buffer's Commits"},
    -- Flutter
    {"<leader>f", "<cmd>Telescope flutter commands<CR>", mode = "n", desc = "Flutter Commands"},
    -- Http status code
    {"<Bslash>h", "<cmd>Telescope http list<CR>", mode = "n", desc = "HTTP Codes"},
  },
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
        entry_prefix = "     ",
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

    -- Load extension
    -- TODO: install dependencies
    -- require("telescope").load_extension("harpoon")
    require("telescope").load_extension("file_browser")
    -- require("telescope").load_extension("flutter")
    require("telescope").load_extension("http")
  end
}
