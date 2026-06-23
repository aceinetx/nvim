vim.cmd [[
	let g:OmniSharp_server_path = '/usr/bin/OmniSharp'
	call plug#begin()
	Plug 'OmniSharp/omnisharp-vim'
	Plug 'andweeb/presence.nvim'
	call plug#end()

	set relativenumber
	set termguicolors
]]
