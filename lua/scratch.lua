vim.api.nvim_create_user_command("Scratch", function()
	buf = vim.api.nvim_create_buf(true, true)
	vim.api.nvim_set_current_buf(buf)
end, {})
