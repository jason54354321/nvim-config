local jdtls_dir = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local java_on_attach = function(client, bufnr)
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

	-- disable shit-like lsp hIghlight
	-- vim.api.nvim_set_hl(0, '@lsp.type.class', {})
	-- vim.api.nvim_set_hl(0, '@lsp.type.method', {})
	for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
		vim.api.nvim_set_hl(0, group, {})
	end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities = require('lsp-selection-range').update_capabilities(capabilities)

local config = {
	cmd = { jdtls_dir .. '/jdtls.cmd' },
	root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
	on_attach = java_on_attach,
	capabilities = capabilities,
}
require('jdtls').start_or_attach(config)
