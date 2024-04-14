return {
  "williamboman/mason.nvim",
  lazy = true,
  dependencies = {
    {"williamboman/mason-lspconfig.nvim"},

    {
      "WhoIsSethDaniel/mason-tool-installer",
      config = function()
        ensure_installed = {
          -- lsp
          "clangd",
          "jdtls",
          "lua-language-server",
          "pyright",
          "typescript-language-server",
          "vim-language-server",
          "bash-language-server",

          -- dap
          "codelldb",
        }
      end
    }
  },

  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      },
    })

    require("mason-lspconfig").setup()
  end
}
