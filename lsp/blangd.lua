return {
	cmd = { 'blangd' },
	filetypes = { 'b' },
	root_markers = { },

	on_attach = function(client, bufnr)
		print("blangd attach")
	end
}
