local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{
		'stevearc/conform.nvim',
		opts = {},
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
			local api = require("nvim-tree.api")

			require("nvim-tree").setup {
				filters = {
					dotfiles = false,
					custom = {},
				},
				git = {
					ignore = false,
				},
				view = {
					-- width = 30, -- Set a fixed width for the tree
					side = "right", 					
					-- preserve_window_proportions = true,
				},
				renderer = {
					group_empty = true
				},
				actions = {
					open_file = {
						quit_on_open = true,
						window_picker = {
							enable = false,
						},
					},
				},
				on_attach = function(bufnr)
					local function opts(desc)
						return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
					end
					
					-- Default mappings
					api.config.mappings.default_on_attach(bufnr)
				end,
			}

			-- Toggle with Alt+F
			vim.api.nvim_set_keymap('n', '<A-f>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
		end,
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
			'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_end = true,
			-- …etc.
		},
		version = '^1.0.0', -- optional: only update when a new 1.x version is released
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
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {
			-- cfg options
		},
	},
	{
		'nvim-flutter/flutter-tools.nvim',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		config = true,
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
		"blazkowolf/gruber-darker.nvim" 
	}
})
