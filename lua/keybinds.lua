local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<A-z>', ':BufferClose!<CR>',         opts)
vim.api.nvim_set_keymap('n', '<A-a>', ':BufferPrevious<CR>',       opts)
vim.api.nvim_set_keymap('n', '<A-d>', ':BufferNext<CR>',           opts)
vim.api.nvim_set_keymap('n', '<A-q>', ':BufferMovePrev<CR>',       opts)
vim.api.nvim_set_keymap('n', '<A-e>', ':BufferMoveNext<CR>',       opts)
vim.api.nvim_set_keymap('n', '<A-g>', ':terminal<CR>',             opts)
vim.api.nvim_set_keymap('n', '<A-s>', ':Scratch<CR>',              opts)
vim.api.nvim_set_keymap('n', '<A-c>', ':Telescope find_files<CR>', opts)
