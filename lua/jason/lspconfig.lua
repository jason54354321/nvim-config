local nvim_lsp = require('lspconfig')
local servers = { 'tsserver', 'vimls', 'clangd', 'pyright' }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<Bslash>f', vim.lsp.buf.format, bufopts)
	vim.keymap.set('n', 'm', [[<cmd>lua require('lsp-selection-range').trigger()<CR>]], bufopts)
	vim.keymap.set('v', 'm', [[<cmd>lua require('lsp-selection-range').expand()<CR>]], bufopts)

	-- formatting
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_command [[augroup Format]]
		vim.api.nvim_command [[autocmd! * <buffer>]]
		vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
		vim.api.nvim_command [[augroup END]]
	end
end

on_attach_go = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<Bslash>f', "<Plug>(go-fmt)", bufopts)
	vim.keymap.set('n', 'm', [[<cmd>lua require('lsp-selection-range').trigger()<CR>]], bufopts)
	vim.keymap.set('v', 'm', [[<cmd>lua require('lsp-selection-range').expand()<CR>]], bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities = require('lsp-selection-range').update_capabilities(capabilities)
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

nvim_lsp['lua_ls'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

nvim_lsp['gopls'].setup {
	on_attach = on_attach_go,
	capabilities = capabilities,
}

vim.diagnostic.config({
	virtual_text = {
		prefix = '●', -- Could be '●', '▎', 'x'
	}
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- To setting individually
-- nvim_lsp.tsserver.setup{}
