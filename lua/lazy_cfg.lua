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
			local api = require("nvim-tree.api")

			require("nvim-tree").setup {
				filters = {
					dotfiles = false,	-- show hidden files/folders; adjust as needed
					custom = {},			 -- add any custom filter strings here
				},
				git = {
					ignore = false,		-- display files/folders even if they're in .gitignore
				},
				view = {
					width = 30, -- Set a fixed width for the tree
					side = "left", -- Always show on the left side
					preserve_window_proportions = true,
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

					--[[
					
					-- Open files in new tabs
					local function open_in_tab()
						api.node.open.tab_drop()
					end
					
					vim.keymap.set('n', '<CR>', open_in_tab, opts('Open: New Tab'))
					vim.keymap.set('n', 'o', open_in_tab, opts('Open: New Tab'))
					vim.keymap.set('n', '<2-LeftMouse>', open_in_tab, opts('Open: New Tab'))

					--]]
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
	{'romgrk/barbar.nvim',
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
			disable_keys_time = 3000,  -- Disable keys for 3 seconds
		},
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = false,
		opts = {
			prompt_func_return_type = {
				cpp = true,
				c = true,
			},
			prompt_func_param_type = {
				cpp = true,
				c = true,
			}
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
		"Mythos-404/xmake.nvim",
		version = "^3",
		lazy = true,
		event = "BufReadPost",
		config = true,
	},
	{
		"nickkadutskyi/jb.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
		-- require("jb").setup({transparent = true})
		vim.cmd("colorscheme jb")
		end,
	}
})
