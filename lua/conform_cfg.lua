require("conform").setup({
	formatters_by_ft = {
		nix = { "nixfmt" },
		hs = { "ormolu" }
	},
	format_on_save = {
		timeout_ms = 1500,
		lsp_format = "fallback",
	},
})
