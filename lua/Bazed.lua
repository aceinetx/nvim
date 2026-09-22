vim.cmd [[
	highlight clear
	if exists("syntax_on")
		syntax reset
	endif

	let g:colors_name = "Bazed"

	set background=dark

	hi Comment gui=italic guifg=#8C8780
	hi Constant guifg=#6EF3F3
	hi Directory guifg=#89b8c2
	hi EndOfBuffer guifg=#242940
	hi Whitespace guifg=#242940
	hi Function gui=bold guifg=#dddddd
	hi Ignore ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
	hi IncSearch cterm=reverse ctermfg=NONE gui=reverse guifg=NONE term=reverse
	hi PreProc guifg=#b4be82
	hi Question guifg=#b4be82
	hi Identifier guifg=white
	hi Special guifg=white
	hi SpecialKey guifg=#515e97
	hi Statement gui=bold guifg=#cccccc
	hi String guifg=#EB3462
	hi Title gui=NONE guifg=#e2a478
	hi Todo ctermbg=234 guibg=#45493e guifg=#b4be82
	hi Type gui=bold guifg=#7388A2
	hi Underlined cterm=underline gui=underline guifg=#84a0c6 term=underline
	hi DiredDirectoryName guifg=#84a0c6

	hi zigBuiltinFn guifg=#77DDFF
	hi @lsp.mod.declaration.zig guifg=#FF6161
	hi link @lsp.type.keywordLiteral.zig Statement
]]
