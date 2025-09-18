vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "

-- OPTIONS
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.shiftwidth = 2
opt.cursorline = true
opt.tabstop = 2 
opt.expandtab = true
opt.colorcolumn = "100"
opt.autoindent = true

-- KEYMAPS 
function set_km(keys, action, desc, mode)
  -- set default values to function arguments
  desc = desc or ""
  mode = mode or "n"

  vim.keymap.set(mode, keys, action, { desc = desc })
end

-- movement 
set_km("G", "Gzz", "goto end of file and center the cursor")
set_km("j", "jzz", "go down one line and center the cursor")
set_km("k", "kzz", "go up one line and center the cursor")

-- shortcuts
set_km("<leader>q", "<cmd>q<cr>", "quit active buffer")
set_km("<leader>w", "<cmd>w<cr>", "write active buffer")

-- splits
set_km("<C-h>", "<C-W>h", "move to left split")
set_km("<C-j>", "<C-W>j", "move to top split")
set_km("<C-k>", "<C-W>k", "move to bottom split")
set_km("<C-l>", "<C-W>l", "move to right split")

-- PLUGINS :)
vim.pack.add({
  { src = "https://github.com/lewis6991/gitsigns.nvim" }, 
  { src = "https://github.com/nvim-tree/nvim-tree.lua" }, 
  { src = "https://github.com/nvim-tree/nvim-web-devicons" }, 
  { src = "https://github.com/bluz71/vim-moonfly-colors" }, 
})

-- theme
vim.cmd("colorscheme moonfly")
-- gitsigns
local signs = require("gitsigns")

signs.setup({
  numhl = true,

  on_attach = function(bufnr)
    set_km("[c", function() signs.nav_hunk("next") end, "goto next change")
    set_km("]c", function() signs.nav_hunk("prev") end, "goto previous change")

    set_km("<leader>sh", signs.stage_hunk, "stage hunk under cursor")
    set_km("<leader>rh", signs.reset_hunk, "reset hunk under cursor to git index state")
    set_km("<leader>sb", signs.stage_buffer, "stage buffer")
    set_km("<leader>rb", signs.reset_buffer, "reset buffer to git index state")

    set_km("<leader>ph", signs.preview_hunk, "show changes under cursor")
  end
})

-- nvimtree
require("nvim-tree").setup()

set_km("<leader>eo", "<cmd>NvimTreeToggle<cr>", "toggle file explorer")


