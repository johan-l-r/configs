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

-- buffers
set_km("<A-h>", "<cmd>bprevious<cr>", "goto prev buffer")
set_km("<A-l>", "<cmd>bnext<cr>", "goto next buffer")
