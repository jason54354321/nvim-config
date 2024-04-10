return {
  "ggandor/leap.nvim",
  keys = { "s" },
  config = function()
    require('leap').add_default_mappings()

    local keymap = vim.keymap.set
    local function leap_prefix()
      require('leap').leap({
        target_windows = { vim.fn.win_getid() }
      })
    end

    keymap("n", "s", leap_prefix, { silent = true })
    keymap("v", "s", leap_prefix, { silent = true })
    vim.api.nvim_set_hl(0, 'LeapBackdrop', { fg = '#777777' })
    -- The below settings make Leap's highlighting closer to what you've been
    -- used to in Lightspeed.

    vim.api.nvim_set_hl(0, 'LeapMatch', {
      -- For light themes, set to 'black' or similar.
      link = 'Normal',
      bold = true,
      nocombine = true,
    })

    local cp = require('jason.colors.palette')
    -- Lightspeed colors
    -- primary labels: bg = "#f02077" (light theme) or "#ff2f87"  (dark theme)
    -- secondary labels: bg = "#399d9f" (light theme) or "#99ddff" (dark theme)
    -- shortcuts: bg = "#f00077", fg = "white"
    -- You might want to use either the primary label or the shortcut colors
    -- for Leap primary labels, depending on your taste.
    vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
      fg = cp.visual_fg, bg = cp.visual_bg, bold = true, nocombine = true,
    })
    -- Color is untuned
    vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {
      fg = '#f02077', bold = true, nocombine = true,
    })

    -- Try it without this setting first, you might find you don't even miss it.
    require('leap').opts.highlight_unlabeled_phase_one_targets = true
  end
}
