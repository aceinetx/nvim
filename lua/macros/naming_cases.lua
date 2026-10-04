local function camel_to_snake(text)
  text = text:gsub("(%u+)(%u%l)", "%1_%2")
  text = text:gsub("(%l%d)(%u)", "%1_%2")
  text = text:gsub("(%l)(%u)", "%1_%2")
  return text:lower()
end

local function convert_selection_to_snake_case()
  local start_row, start_col = unpack(vim.api.nvim_buf_get_mark(0, "<"))
  local end_row, end_col = unpack(vim.api.nvim_buf_get_mark(0, ">"))

  start_row = start_row - 1
  end_row = end_row - 1

  local lines = vim.api.nvim_buf_get_text(
    0,
    start_row,
    start_col,
    end_row,
    end_col + 1,
    {}
  )

  local text = table.concat(lines, "\n")
  local converted = camel_to_snake(text)
  local replacement = vim.split(converted, "\n", { plain = true })

  vim.api.nvim_buf_set_text(
    0,
    start_row,
    start_col,
    end_row,
    end_col + 1,
    replacement
  )
end

vim.keymap.set("x", "<leader>cs", convert_selection_to_snake_case, {
  desc = "Convert selection from CamelCase to snake_case",
})
