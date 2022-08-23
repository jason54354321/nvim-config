local nvim_lsp = require('lspconfig')
local servers = { 'tsserver' }

for _,lsp in ipairs(servers) do
	nvim_lsp[lsp].setup { }
end

-- To setting individually
-- nvim_lsp.tsserver.setup{}
