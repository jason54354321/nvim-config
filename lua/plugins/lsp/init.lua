local function lsp_related_ui_adjust()
  vim.diagnostic.config({
    virtual_text = {
      prefix = '●', -- Could be '●', '▎', 'x'
    }
  })

  local signs = { Error = "", Warn = "", Hint = "", Info = "" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    -- vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    vim.fn.sign_define(hl, { text = '', texthl = hl, numhl = '' })
  end
end

local function on_attach_default(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', '<Bslash>f', vim.lsp.buf.format, bufopts)
  vim.keymap.set('n', 'm', [[<cmd>lua require('lsp-selection-range').trigger()<CR>]], bufopts)
  vim.keymap.set('x', 'm', [[<cmd>lua require('lsp-selection-range').expand()<CR>]], bufopts)

  -- disable shit-like lsp highlight
  for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
  end
end

local servers = { 'tsserver',
	'vimls',
	'clangd',
	'pyright',
	'dockerls',
	'docker_compose_language_service',
	'vuels',
	'bashls',
	'kotlin_language_server',
}

return {
  -- configuration for nvim lsp
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- managing tool
      { "williamboman/mason.nvim" },

      -- bridges mason with the lspconfig
      { "williamboman/mason-lspconfig.nvim" },

      -- nvim-cmp source for neovim's built-in LSP
      { "hrsh7th/cmp-nvim-lsp" },

      -- for expend selection
      { "camilledejoye/nvim-lsp-selection-range" },
    },
    config = function()
      local nvim_lsp = require('lspconfig')

      local on_attach = function(client, bufnr)
        on_attach_default(client, bufnr)
      end


      -- TODO: fix this
      --[[
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities = require('lsp-selection-range').update_capabilities(capabilities)
      for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      end
      ]]--

    end,
  },
}
