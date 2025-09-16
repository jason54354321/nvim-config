return {
  "williamboman/mason.nvim",
  lazy = true,
  dependencies = {
    {"williamboman/mason-lspconfig.nvim"},

    {
      "WhoIsSethDaniel/mason-tool-installer",
      config = function()
        require("mason-tool-installer").setup({
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
          },
          auto_update = true, -- 可選：每次啟動自動更新工具
          run_on_start = true, -- 啟動 Neovim 時自動安裝缺少的工具
        })
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
