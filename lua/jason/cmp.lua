local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

require('lspkind').init({
    -- override preset symbols
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})

-- Setup nvim-cmp.
local cmp = require('cmp')
local cmp_theme = cmp.config.window and 'dark' or 'light'

cmp.setup({
	formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 20 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. strings[1] .. " "
      kind.menu = "    (" .. strings[2] .. ")"

      return kind
    end,
  },
	window = {
		completion = {
			-- border = "rounded",
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
		documentation = {
			--border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
			border = "rounded",
			winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
		},
  },
	--window = {
	--	documentation = {
	--		--border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
	--		border = "rounded",
	--		winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
	--	},
	--	completion = {
	--		border = (cmp_theme == 'dark' and {'╭', '─', '╮', '│', '╯', '─', '╰', '│' } or nil),
	--		winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
	--		col_offset = -4,
	--		side_padding = 0,
	--	},
	--},
	view = {                                                        
		entries = {name = 'custom', selection_order = 'near_cursor' } 
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
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
									return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
							else
									fallback()
							end
					end,
					s = function(fallback)
							if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
									return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
							else
									fallback()
							end
					end
			}),
			['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
			['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
			['<C-n>'] = cmp.mapping({
					c = function()
							if cmp.visible() then
									cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
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
			['<C-p>'] = cmp.mapping({
					c = function()
							if cmp.visible() then
									cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
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
			['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
			['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
			['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
			['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
			['<CR>'] = cmp.mapping.confirm({ select = true }),
			-- ... Your other configuration ...
	},

	-- mapping = cmp.mapping.preset.insert({
	-- 	['<C-b>'] = cmp.mapping.scroll_docs(-4),
	-- 	['<C-f>'] = cmp.mapping.scroll_docs(4),
	-- 	['<C-Space>'] = cmp.mapping.complete(),
	-- 	['<C-e>'] = cmp.mapping.abort(),
	-- 	['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	-- 	["<Tab>"] = cmp.mapping(function(fallback)
      -- if cmp.visible() then
        -- cmp.select_next_item()
      -- elseif has_words_before() then
        -- cmp.complete()
      -- else
        -- fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      -- end
    -- end, { "i", "s" }),

    -- ["<S-Tab>"] = cmp.mapping(function()
      -- if cmp.visible() then
        -- cmp.select_prev_item()
      -- end
    -- end, { "i", "s" }),
	-- }),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		{ name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
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
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

