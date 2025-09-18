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

-- PLUGINS :)
vim.pack.add(
  { "https://github.com/lewis6991/gitsigns.nvim" }
)

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
