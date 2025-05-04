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
					
					-- Open files in new tabs
					local function open_in_tab()
						api.node.open.tab_drop()
					end
					
					vim.keymap.set('n', '<CR>', open_in_tab, opts('Open: New Tab'))
					vim.keymap.set('n', 'o', open_in_tab, opts('Open: New Tab'))
					vim.keymap.set('n', '<2-LeftMouse>', open_in_tab, opts('Open: New Tab'))
				end,
			}

			-- Toggle with Alt+F
			vim.api.nvim_set_keymap('n', '<A-f>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
		end,
	},
	{
		'akinsho/bufferline.nvim', 
		version = "*", 
		dependencies = 'nvim-tree/nvim-web-devicons'
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
		'AlexvZyl/nordic.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('nordic').load()
		end
	}
})
