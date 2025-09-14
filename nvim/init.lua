-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("configs.keymaps")
require("configs.opts")
require("configs.autocmds")
require("lazy-pm")
