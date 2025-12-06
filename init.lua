vim.opt.runtimepath:prepend("~/.config/nvim/lua/lazy")
vim.opt.runtimepath:prepend("~/.config/nvim/lua/")

vim.g.mapleader = ' '

require("macros")
require("keys")
require("lsp_cfg")
require("lazy_cfg")
require("lualine_cfg")
require("conform_cfg")
require("cmp_cfg")
require("vim_cmd")
require("plug")
require("presence_cfg")
require("colorizer_cfg")
