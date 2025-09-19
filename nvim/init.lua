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
opt.splitright = true

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
set_km("<leader>vs", "<cmd>vsplit<cr>", "open a new vertical split")
set_km("<leader>hs", "<cmd>split<cr>", "open a new horizontal split")
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
  { src = "https://github.com/ibhagwan/fzf-lua" }, 
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
require("nvim-tree").setup({
  view = {
    width = 25, 
    number = true,
    relativenumber = true
  }, 
  renderer = {
    full_name = true,

    indent_markers = {
      enable = true
    },

    icons = {
      web_devicons = { 
        folder = { enable = true }, 
      }
    },
  }, 
  modified = { enable = true }
})

set_km("<leader>eo", "<cmd>NvimTreeToggle<cr>", "toggle file explorer")

-- fzf-lua 
local fzf = require("fzf-lua")

fzf.setup({
  file_icon_padding = " ", 
  
  winopts = {
    fullscreen = true, 

    preview = { 
      layout = "vertical",  
      vertical = "up:45%"
    }
  }, 
  actions = {
    files = { 
      [ "ctrl-o" ] = fzf.actions.file_edit_or_qf, 
      [ "ctrl-l" ] = fzf.actions.file_vsplit
    }
  }
})

-- files/buffers
set_km("<leader>ff", fzf.files, "find files on current dir")
set_km("<leader>fC", function() fzf.files({ cwd = "~/.config/" }) end, "find config files")
set_km("<leader>lb", fzf.buffers, "list buffers")

-- grep
set_km("<leader>fp", fzf.grep, "grep pattern")
set_km("<leader>fc", fzf.grep_cword, "grep pattern under cursor")

set_km("<leader>lh", fzf.git_hunks, "list hunks")
set_km("<leader>lm", fzf.git_commits, "list project commits")
