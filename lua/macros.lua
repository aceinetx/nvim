local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

vim.fn.setreg("o", "0f<xi\"" .. esc .. "f>xa\"" .. esc .. "0")
vim.fn.setreg("p", "0f\"xi<" .. esc .. "f\"xa>" .. esc .. "0")
