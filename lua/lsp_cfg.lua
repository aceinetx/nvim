local lspconfig = require('lspconfig')

lspconfig.clangd.setup{}
lspconfig.gopls.setup{}
lspconfig.ts_ls.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.omnisharp.setup{
	cmd = { "omnisharp" },
}
vim.diagnostic.enable = true
vim.diagnostic.config({
	virtual_lines = true,
})

lspconfig.gdscript.setup {
	name = 'godot',
	cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
}
