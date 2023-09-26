require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
})

require('mason-tool-installer').setup {
		 ensure_installed = {
			-- lsp
			"clangd",
			"jdtls",
			"lua-language-server",
			"pyright",
			"typescript-language-server",
			"vim-language-server",
			-- dap
			"codelldb",
		}
}
