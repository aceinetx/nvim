arrow_keys = false -- I usually enable this when i'm in termux, i wouldn't recommend you enabling it tho

vim.opt.runtimepath:prepend("~/.config/nvim/lua/lazy")
vim.opt.runtimepath:prepend("~/.config/nvim/lua/")

local lspconfig = require('lspconfig')
require("macros")

lspconfig.clangd.setup{}
lspconfig.gopls.setup{}
lspconfig.omnisharp.setup{
	cmd = { "dotnet", "/usr/lib/omnisharp-roslyn/OmniSharp.dll" },
}

vim.cmd [[
	let g:OmniSharp_server_path = '/usr/bin/OmniSharp'
	call plug#begin()
	Plug 'OmniSharp/omnisharp-vim'
	call plug#end()

	call plug#begin('~/.local/share/nvim/plugged')
	Plug 'morhetz/gruvbox'
	call plug#end()

	set relativenumber
]]

vim.o.background = 'dark'
vim.g.gruvbox_contrast_dark = 'soft'
vim.cmd('colorscheme gruvbox')

require('lazy').setup({
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
		opts = {},
	},
	{
		'stevearc/conform.nvim',
		opts = {},
	},
	{
		'numToStr/Comment.nvim',
		opts = {
		}
	},
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",	-- LSP source
			"hrsh7th/cmp-buffer",		 -- Buffer source
			"hrsh7th/cmp-path",			 -- Path source
			"saadparwaiz1/cmp_luasnip", -- Snippet source
			"L3MON4D3/LuaSnip",			 -- Snippet engine
		},
		opts = {}
	},
	{
		"rachartier/tiny-glimmer.nvim",
		event = "VeryLazy",
		priority = 10, -- Needs to be a really low priority, to catch others plugins keybindings.
		opts = {
		},
	},
	{
		{'akinsho/toggleterm.nvim', version = "*", 
			opts = {
				open_mapping = [[<A-t>]],
				direction = 'horizontal',
			}
		}
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {}
			vim.api.nvim_set_keymap('n', '<A-f>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

		end,
	},
	{
		'akinsho/bufferline.nvim', 
		version = "*", 
		dependencies = 'nvim-tree/nvim-web-devicons'
	}
})

require("conform").setup({
	formatters_by_ft = {
		cpp = { "clang-format" },
		c = { "clang-format" },
	},
	format_on_save = {
		timeout_ms = 1500,
		lsp_format = "fallback",
	},
})

local cmp = require("cmp")

vim.keymap.set("n", "<space>f", ":Telescope file_browser<CR>")

vim.keymap.set("n", "<space>f", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

vim.keymap.set("n", "<space>f", function()
	require("telescope").extensions.file_browser.file_browser()
end)

vim.cmd [[
	syntax enable
	set autoindent
	set noexpandtab
	set background=dark
	set clipboard=unnamedplus
	set number
	set tabstop=2
	set shiftwidth=2

	highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
	set cursorline
]]

vim.cmd [[
	augroup PythonIndentation
		autocmd!
		autocmd FileType python setlocal noexpandtab tabstop=2 shiftwidth=2
	augroup END
]]

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For luasnip users.
		end,
	},
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item(), -- Down
		["<C-p>"] = cmp.mapping.select_prev_item(), -- Up
		["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion
		["<C-e>"] = cmp.mapping.close(), -- Close completion
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "luasnip" },
	},
})

if not arrow_keys then
	vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', {noremap = true, silent = true})

	vim.api.nvim_set_keymap('v', '<Up>', '<Nop>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('v', '<Down>', '<Nop>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('v', '<Left>', '<Nop>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('v', '<Right>', '<Nop>', {noremap = true, silent = true})

	vim.api.nvim_set_keymap('i', '<Up>', '<Nop>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('i', '<Down>', '<Nop>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('i', '<Left>', '<Nop>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('i', '<Right>', '<Nop>', {noremap = true, silent = true})
end
