vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "

require("configs.opts")
require("configs.keymaps")


-- PLUGINS :)
vim.pack.add({
  { src = "https://github.com/lewis6991/gitsigns.nvim" }, 
  { src = "https://github.com/nvim-tree/nvim-tree.lua" }, 
  { src = "https://github.com/nvim-tree/nvim-web-devicons" }, 
  { src = "https://github.com/bluz71/vim-moonfly-colors" }, 
  { src = "https://github.com/ibhagwan/fzf-lua" }, 
  { src = "https://github.com/Saghen/blink.cmp" }, 
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

-- blink.cmp
local blink = require("blink.cmp")
blink.setup({
  keymap = { 
    preset = "super-tab", 

    [ "<C-k>" ] = { "select_prev", "fallback" },
    [ "<C-j>" ] = { "select_next", "fallback" }
  }, 
  fuzzy = { implementation = "lua" },
  signature = { enabled = true }
})

-- LSP 
local servers = { "lua_ls", "pyright" }
local capabilities = require('blink.cmp').get_lsp_capabilities()
local opts = { settings = { capabilities = capabilities } }

for _, server in ipairs(servers) do
  vim.lsp.config(server, opts)
  vim.lsp.enable(server)
end
