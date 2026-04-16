vim.lsp.enable('clangd')

vim.lsp.enable('gopls')

vim.lsp.enable('ts_ls')

vim.lsp.enable('rust_analyzer')

vim.lsp.config('gdscript', {
	name = 'godot',
	cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
})
vim.lsp.enable('gdscript')

vim.lsp.enable('zls')

vim.diagnostic.enable = true
vim.diagnostic.config({
	virtual_lines = true,
})
