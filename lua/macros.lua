local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

vim.fn.setreg("o", "0f<xi\"" .. esc .. "$a " .. esc .. "0f>xi\"" .. esc .. "$x0")
vim.fn.setreg("p", "0f\"xi<" .. esc .. "$a " .. esc .. "0f\"xi>" .. esc .. "$x0")
