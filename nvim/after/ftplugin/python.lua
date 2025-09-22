vim.bo.expandtab = true
vim.bo.autoindent = true
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.softtabstop = 2

vim.keymap.set(
  { "n", "x" },
  "<leader>r",
  [[:!python3 %<CR>]],
  { buffer = true, desc = "Run the file or region through the interpreter" }
)
