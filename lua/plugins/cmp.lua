return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
    "hrsh7th/cmp-path", -- nvim-cmp source for path words
    "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in LSP
    "saadparwaiz1/cmp_luasnip", -- nvim-cmp source for luasnip
    "hrsh7th/cmp-cmdline", -- nvim-cmp source for vim's cmdline

    {
      -- TODO: use luasnip, deprecate ultisnips
      "SirVer/ultisnips",
      dependencies = {
        'honza/vim-snippets',
      },
      config = function()
        -- UltiSnips
        vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
        vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
        vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
        vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
        vim.g.UltiSnipsRemoveSelectModeMappings = 0
        vim.g.UltiSnipsEditSplit = "vertical"
      end
    },

    {
      "onsails/lspkind-nvim",
      config = function()
        require("lspkind").init({
          preset = "default",
        })
      end,
    },
  },
  config = function()
    -- Setup nvim-cmp.
    local cmp = require('cmp')
    local cmp_theme = cmp.config.window and 'dark' or 'light'
    require('colors.cmp_hi').cmp_color_setup()

    local t = function(str)
      return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    cmp.setup({
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 25 })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = false })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"

          -- kind.kind = " " .. strings[1] .. " "
          -- kind.menu = "    (" .. strings[2] .. ")"

          return kind
        end,
      },
      window = {
        completion = {
          -- border = "rounded",
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          col_offset = -3,
          side_padding = 0,
          height = 20,
        },
        documentation = {
          border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
          border = "rounded",
          winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        },
      },
      experimental = {
        ghost_text = "true"
      },
      view = {
        entries = { name = 'custom', selection_order = 'near_cursor' }
      },
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },
      mapping = {
        ["<Tab>"] = cmp.mapping({
          c = function()
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            else
              cmp.complete()
            end
          end,
          i = function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
              vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
            else
              fallback()
            end
          end,
          s = function(fallback)
            if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
              vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
            else
              fallback()
            end
          end
        }),
        ["<S-Tab>"] = cmp.mapping({
          c = function()
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            else
              cmp.complete()
            end
          end,
          i = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
              return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), 'm', true)
            else
              fallback()
            end
          end,
          s = function(fallback)
            if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
              return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), 'm', true)
            else
              fallback()
            end
          end
        }),
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
        ['<C-j>'] = cmp.mapping({
          c = function()
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            else
              vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
            end
          end,
          i = function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end
        }),
        ['<C-k>'] = cmp.mapping({
          c = function()
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            else
              vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
            end
          end,
          i = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end
        }),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-p>'] = cmp.mapping({ i = cmp.mapping.complete(), c = cmp.mapping.complete() }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        -- ... Your other configuration ...
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp',               max_item_count = 10 },
        { name = 'ultisnips',              max_item_count = 10 },
        { name = 'nvim_lsp_signature_help' },
      }, {
        { name = 'buffer', max_item_count = 10 },
      })

    })


    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end
}
