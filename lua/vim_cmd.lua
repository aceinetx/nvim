vim.cmd [[
	syntax enable
	set autoindent
	set noexpandtab
	set background=dark
	set clipboard+=unnamedplus
	set number
	set tabstop=2
	set shiftwidth=2

	highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
	set cursorline

	colorscheme gruber-darker
]]
