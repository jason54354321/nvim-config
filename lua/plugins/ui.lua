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
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    config = function()
      local on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        -- Navigation using parentheses
        map('n', ')', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        map('n', '(', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        -- Actions
        map('n', '<leader>hs', gs.stage_hunk)
        map('n', '<leader>hr', gs.reset_hunk)
        map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('n', '<leader>hS', gs.stage_buffer)
        map('n', '<leader>hu', gs.undo_stage_hunk)
        map('n', '<leader>hR', gs.reset_buffer)

        map('n', '+', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line { full = true } end)
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)

        -- idk what this do
        map('n', '<leader>hD', function() gs.diffthis('~') end)
        map('n', '<leader>td', gs.toggle_deleted)

        -- do `vih`, aka `visual in hunk`
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end

      require('gitsigns').setup {
        on_attach = on_attach,
      }
    end
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  {
    "tzachar/local-highlight.nvim",
    event = "BufEnter",
    config = function()
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
    end
  }
}
