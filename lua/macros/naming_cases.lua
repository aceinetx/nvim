local util = require("util")

local function camel_to_snake(text)
	text = text:gsub("(%u+)(%u%l)", "%1_%2")
	text = text:gsub("(%l%d)(%u)", "%1_%2")
	text = text:gsub("(%l)(%u)", "%1_%2")
	return text:lower()
end

local function snake_to_camel(text)
	return table.concat(
		util.map(
			util.split(text, "_"), 
			function(x) return x:gsub("^%l", string.upper) end
		),
		""
	)
end

local function get_visual_selection()
	local pos1 = vim.fn.getpos("v")
	local pos2 = vim.fn.getpos(".")
	
	local opts = {type = "v"}

	local region = vim.fn.getregion(pos1, pos2, opts)
	
	return region[1]
end

local function convert_selection_to_snake_case()
	local text = get_visual_selection()
	local converted = camel_to_snake(text)
	vim.api.nvim_paste(converted, false, -1)
end

local function convert_selection_to_camel_case()
	local text = get_visual_selection()
	local converted = snake_to_camel(text)
	vim.api.nvim_paste(converted, false, -1)
end

vim.keymap.set("v", "<leader>cs", convert_selection_to_snake_case, {
	desc = "Convert selection from CamelCase to snake_case",
})

vim.keymap.set("v", "<leader>sc", convert_selection_to_camel_case, {
	desc = "Convert selection from snake_case to CamelCase",
})
