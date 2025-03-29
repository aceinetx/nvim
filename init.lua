vim.opt.runtimepath:prepend("~/.config/nvim/lua/lazy")
require'lspconfig'.clangd.setup{}

require('lazy').setup({
	{ "thimc/gruber-darker.nvim", config = function()
		require('gruber-darker').setup({
			transparent = true,
			underline = false,
		}) 
		vim.cmd.colorscheme('gruber-darker')
	end,},
	{
			"nvim-telescope/telescope-file-browser.nvim",
			dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
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
      "hrsh7th/cmp-nvim-lsp",  -- LSP source
      "hrsh7th/cmp-buffer",     -- Buffer source
      "hrsh7th/cmp-path",       -- Path source
      "saadparwaiz1/cmp_luasnip", -- Snippet source
      "L3MON4D3/LuaSnip",       -- Snippet engine
		},
		opts = {}
	},
	{
		"rachartier/tiny-glimmer.nvim",
		event = "VeryLazy",
		priority = 10, -- Needs to be a really low priority, to catch others plugins keybindings.
		opts = {
		},
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

	map <Up> <Nop>
	map <Left> <Nop>
	map <Right> <Nop>
	map <Down> <Nop>

	highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
	set cursorline
]]

vim.cmd [[
	augroup PythonIndentation
		autocmd!
		autocmd FileType python setlocal noexpandtab tabstop=2 shiftwidth=2
	augroup END
]]

local cmp = require("cmp")

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
