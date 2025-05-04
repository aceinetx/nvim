arrow_keys = false -- I usually enable this when i'm in termux, i wouldn't recommend you enabling it tho

if not arrow_keys then
	vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', {noremap = true, silent = true})

	vim.api.nvim_set_keymap('v', '<Up>', '<Nop>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('v', '<Down>', '<Nop>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('v', '<Left>', '<Nop>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('v', '<Right>', '<Nop>', {noremap = true, silent = true})

	vim.api.nvim_set_keymap('i', '<Up>', '<Nop>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('i', '<Down>', '<Nop>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('i', '<Left>', '<Nop>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('i', '<Right>', '<Nop>', {noremap = true, silent = true})
end

vim.api.nvim_set_keymap('n', '<A-a>', ':tabprevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-d>', ':tabnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-z>', ':tabclose<CR>', {noremap = true, silent = true})
