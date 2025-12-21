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

	augroup PythonIndentation
		autocmd!
		autocmd FileType python setlocal noexpandtab tabstop=2 shiftwidth=2
	augroup END

	colorscheme vscode
]]
