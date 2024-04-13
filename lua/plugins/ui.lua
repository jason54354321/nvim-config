return {
  "everblush/nvim",
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
}
