local lspconfig = require('lspconfig')

lspconfig.clangd.setup{}
lspconfig.gopls.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.omnisharp.setup{
	cmd = { "omnisharp" },
}
vim.diagnostic.enable = true
vim.diagnostic.config({
	virtual_lines = true,
})
