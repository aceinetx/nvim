return {
	{ 
		"blazkowolf/gruber-darker.nvim" 
	},
	{
		{
			'akinsho/toggleterm.nvim',
			version = "*", 
			opts = {
				open_mapping = [[<A-t>]],
				direction = 'horizontal',
			}
		}
	},
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim',
			'nvim-tree/nvim-web-devicons',
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
		},
		version = '^1.0.0',
	},
	{
		"m4xshen/hardtime.nvim",
		lazy = false,
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			disable_keys_time = 3000,	-- Disable keys for 3 seconds
		},
	},
	{
		"folke/snacks.nvim",
		opts = {
			input = {},
			notifier = {},
			indent = {},
		}
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"hrsh7th/nvim-cmp",
		version = false, 
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		opts = {}
	},
	{
		"alvgaona/dired.nvim"
	}
}
