local lspconfig = require('lspconfig')

lspconfig.clangd.setup{}
lspconfig.gopls.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.omnisharp.setup{
	cmd = { "dotnet", "/usr/lib/omnisharp-roslyn/OmniSharp.dll" },
}
vim.diagnostic.enable = true
vim.diagnostic.config({
	virtual_lines = true,
})
