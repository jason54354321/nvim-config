local jdtls_dir = vim.fn.stdpath('data') .. '/mason/packages/jdtls'

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities = require('lsp-selection-range').update_capabilities(capabilities)

local config = {
	cmd = { jdtls_dir .. '/jdtls.cmd' },
	root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
	on_attach = on_attach,
	capabilities = capabilities,

}
require('jdtls').start_or_attach(config)
