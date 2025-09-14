local km = vim.keymap vim.g.mapleader = " " km.set("n", "<leader>q", "<cmd>q<cr>", { desc = "quit active buffer" })
km.set("n", "<leader>Q", "<cmd>qa<cr>", { desc = "exit nvim" })
km.set("n", "<leader>w", "<cmd>w<cr>", { desc = "save active buffer" })
km.set("n", "<leader>W", "<cmd>wa<cr>", { desc = "save all buffers" })
km.set("n", "<leader>vs", "<cmd>vsplit<cr>", { desc = "split window vertically" })
km.set("n", "<leader>yf", 'ggvG"+y', { desc = "yank file to clipboard" })
km.set("n", "<C-h>", "<c-w>h", { desc = "goto left split"})
km.set("n", "<C-l>", "<c-w>l", { desc = "goto right split"})
km.set("n", "j", "jzz", { desc = "move down and center"})
km.set("n", "k", "kzz", { desc = "move up and center"})
km.set("n", "G", "Gzz", { desc = "goto last line and center"})
km.set("n", "<leader>ec", "<cmd>e ~/.config/nvim/<cr>", { desc = "explore config"})
km.set("n", "<leader>nt", "<cmd>tabnew<cr>", { desc = "open new tab" })
km.set("n", "<leader>nT", function()
  local found_terminal = false

  -- loop through all tabpages
  for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
    -- get the current window of the tab
    local win = vim.api.nvim_tabpage_get_win(tab)
    local buf = vim.api.nvim_win_get_buf(win)
    local buftype = vim.api.nvim_buf_get_option(buf, "buftype")

    if buftype == "terminal" then
      -- switch to that tab
      vim.api.nvim_set_current_tabpage(tab)
      found_terminal = true
      break
    end
  end

  if not found_terminal then
    -- no terminal tab found → open one
    vim.cmd("tabnew | terminal")
  end
end, { desc = "goto terminal tab or open new terminal" })
km.set("n", "<A-l>", "<cmd>tabnext<cr>", { desc = "goto next tab" })
km.set("n", "<A-h>", "<cmd>tabprevious<cr>", { desc = "goto previous tab" })
km.set("t", "<A-l>", "<C-\\><C-n><cmd>tabnext<cr>", { desc = "exit terminal and goto next tab" })
km.set("t", "<A-h>", "<C-\\><C-n><cmd>tabprevious<cr>", { desc = "exit terminal and goto previous tab" })
km.set("t", "<esc>", "<C-\\><C-n>", { desc = "exit terminal mode" })
