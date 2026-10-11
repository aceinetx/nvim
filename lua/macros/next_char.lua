local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

vim.fn.setreg("c", ":execute 'normal! r' . nr2char(char2nr(matchstr(getline('.'), '\\%' . col('.') . 'c.')) + 1)\n")
