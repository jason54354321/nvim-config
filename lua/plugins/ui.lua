return {
  {
    "everblush/nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      local p = require('everblush.palette')
      local cp = require('colors.palette')

      require('everblush').setup({

        -- Override the default highlights using Everblush or other colors
        override = {
          TelescopeSelection = { fg = p.background, bg = p.color9 },
          TelescopeMatching = { fg = p.color10 },
          TelescopeBorder = { fg = p.color11 },
          TelescopeNormal = { fg = p.foreground },
          Comment = { fg = cp.comment_gray },
          ["@Comment"] = { fg = cp.comment_gray },
          ["@Exception"] = { fg = cp.comment_gray },
          ["@Float"] = { fg = cp.comment_gray },
          -- Visual = { fg = p.foreground, bg = cp.visual },
          Visual = { fg = cp.visual_fg, bg = cp.visual_bg },
          TermCursor = { bg = p.foreground },
          TermCursorNC = { bg = p.foreground },

        },
        -- Set transparent background
        transparent_background = true,

        -- Set contrast for nvim-tree highlights
        nvim_tree = {
          contrast = true,
        },
      })

      -- load theme
      vim.cmd([[colorscheme everblush]])
      -- post-load config
      vim.cmd("hi clear SignColumn")
      vim.cmd([[
      set cursorline
      hi LineNr guibg=none guifg=#959895
      hi CursorLineNr guibg=none guifg=#959895
      hi link Comment NormalComment
      ]])
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end
  }
}
