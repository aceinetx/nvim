vim.lsp.enable('ts_ls')

vim.lsp.enable('clangd')

vim.lsp.enable('pyrefly')

vim.lsp.enable('nil_ls')

vim.lsp.enable('hls')

vim.lsp.enable('omnisharp')

vim.lsp.enable('rust_analyzer')

vim.lsp.enable('blangd')

vim.lsp.enable('zls')

vim.lsp.config('vtsls', vim.lsp.config["vtsls"])

vim.lsp.enable('vue_ls')

vim.lsp.config("jdtls", {
	settings = {
		java = {
			import = {
				gradle = {
					enabled = true,
					offline = {
						enabled = false,
					},
					wrapper = {
						enabled = true,
					},
				},
			},

			configuration = {
				updateBuildConfiguration = "automatic",
			},

			project = {
				referencedLibraries = {},
			},
		},
	},
})

vim.lsp.enable("jdtls")

vim.lsp.enable("teal_ls")

vim.diagnostic.enable = true
vim.diagnostic.config({
	virtual_lines = true,
})

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>ca', function()
	vim.cmd("lua vim.lsp.buf.code_action()")
end, {})

vim.keymap.set('n', '<leader>rn', function()
	vim.cmd("lua vim.lsp.buf.rename()")
end, {})

vim.api.nvim_create_user_command("LspDisableAll", function()
	for _, config in ipairs(vim.lsp.get_configs()) do
		vim.cmd("lsp disable " .. config["name"])
	end
end, {})

vim.api.nvim_create_user_command("LspEnableAll", function()
	for _, config in ipairs(vim.lsp.get_configs()) do
		vim.cmd("lsp enable " .. config["name"])
	end
end, {})
