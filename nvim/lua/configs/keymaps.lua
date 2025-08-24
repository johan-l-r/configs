local km = vim.keymap 

vim.g.mapleader = " "

km.set("n", "<leader>q", "<cmd>q<cr>", { desc = "quit active buffer" })
km.set("n", "<leader>Q", "<cmd>qa<cr>", { desc = "exit nvim" })
km.set("n", "<leader>w", "<cmd>w<cr>", { desc = "save active buffer" })
km.set("n", "<leader>W", "<cmd>wa<cr>", { desc = "save all buffers" })
km.set("n", "<leader>vs", "<cmd>vsplit<cr>", { desc = "split window vertically" })
km.set("n", "<leader>yf", 'vG"+y', { desc = "yank file to clipboard" })
