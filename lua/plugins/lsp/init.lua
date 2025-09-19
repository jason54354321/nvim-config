local servers = { 'ts_ls',
	'vimls',
	'clangd',
	'pyright',
	'dockerls',
	'docker_compose_language_service',
	'vuels',
	'bashls',
	'kotlin_language_server',
  'robotframework_ls',
  'lua_ls',
  'gopls',
}

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

local function lsp_related_ui_adjust()
  -- vim.diagnostic.config({
  --   virtual_text = {
  --     prefix = '●', -- Could be '●', '▎', 'x'
  --   }
  -- })
  
  -- Disable virtual_text since it's redundant due to lsp_lines.
  vim.diagnostic.config({
    virtual_text = false,
  })

  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.INFO] = "",
        [vim.diagnostic.severity.HINT] = "󰠠",
      },
    },
  })
end

local function on_attach_default(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', '<Bslash>f', vim.lsp.buf.format, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)
  vim.keymap.set('n', 'm', [[<cmd>lua require('lsp-selection-range').trigger()<CR>]], bufopts)
  vim.keymap.set('x', 'm', [[<cmd>lua require('lsp-selection-range').expand()<CR>]], bufopts)
  -- Lsp
  vim.keymap.set('n', 'gd', lsp_definitions, bufopts)
  vim.keymap.set('n', 'gr', lsp_references, bufopts)
  vim.keymap.set('n', 'gu', lsp_implementations, bufopts)
  vim.keymap.set('n', 'ga', lsp_incoming_calls, bufopts)

  lsp_related_ui_adjust()

  -- disable shit-like lsp highlight
  for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
  end
end

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

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities = require('lsp-selection-range').update_capabilities(capabilities)
      for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      end

    end,
  },
}
