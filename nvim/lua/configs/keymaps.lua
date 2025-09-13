local km = vim.keymap 

vim.g.mapleader = " "

km.set("n", "<leader>q", "<cmd>q<cr>", { desc = "quit active buffer" })
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
km.set("n", "<A-l>", "<cmd>tabnext<cr>", { desc = "goto next tab" })
km.set("n", "<A-h>", "<cmd>tabprevious<cr>", { desc = "goto previous tab" })
km.set("n", "<A-h>", "<C-\\><C-n><cmd>tabprevious<cr>", { desc = "goto previous tab" })
km.set("t", "<A-h>", "<C-\\><C-n><cmd>tabprevious<cr>", { desc = "goto previous tab" })
km.set("t", "<esc>", "<C-\\><C-n>", { desc = "exit terminal mode" })
